-- translate_cn.lua
-- Chinese (Simplified) → English translation pipeline for DifficultBulletinBoard
--
-- Pipeline (applied in order):
--   1. Phrase pass  – ordered rules from dict_cn_phrases
--   2. Misc pass    – greedy longest-match from dict_cn_misc
--
-- Dependencies loaded before this file (per TOC order):
--   api/utils.lua           – DBB2.api.ContainsCJK
--   api/dict_cn_phrases.lua
--   api/dict_cn_misc.lua

local string_gsub   = string.gsub
local string_len    = string.len
local string_byte   = string.byte
local string_sub    = string.sub
local table_getn    = table.getn
local table_insert  = table.insert
local table_sort    = table.sort
local table_concat  = table.concat

-- =====================================================
-- INTERNAL HELPERS
-- =====================================================

local function utf8_charlen(str, i)
  local b = string_byte(str, i)
  if not b       then return 1 end
  if b < 0x80    then return 1 end
  if b < 0xC0    then return 1 end
  if b < 0xE0    then return 2 end
  if b < 0xF0    then return 3 end
  return 4
end

local function utf8_chars(str)
  local chars = {}
  local i = 1
  local len = string_len(str)
  while i <= len do
    local clen = utf8_charlen(str, i)
    table_insert(chars, string_sub(str, i, i + clen - 1))
    i = i + clen
  end
  return chars
end

-- =====================================================
-- PHRASE PASS
-- =====================================================

local function apply_phrases(text)
  if not dict_cn_phrases then return text end
  local i = 1
  while i <= table_getn(dict_cn_phrases) do
    local rule = dict_cn_phrases[i]
    if rule.cn and rule.en then
      text = string_gsub(text, rule.cn, rule.en)
    end
    i = i + 1
  end
  return text
end

-- =====================================================
-- MISC PASS  (greedy longest-match, left-to-right)
-- =====================================================

local _misc_by_first = nil

local function build_misc_index()
  if _misc_by_first then return end
  _misc_by_first = {}
  if not dict_cn_misc then return end
  for cn, en in pairs(dict_cn_misc) do
    local chars = utf8_chars(cn)
    local first = chars[1]
    if first then
      if not _misc_by_first[first] then
        _misc_by_first[first] = {}
      end
      local bucket = _misc_by_first[first]
      table_insert(bucket, { cn = cn, en = en, len = table_getn(chars) })
    end
  end
  for _, bucket in pairs(_misc_by_first) do
    table_sort(bucket, function(a, b) return a.len > b.len end)
  end
end

local function apply_misc(text)
  if not dict_cn_misc then return text end
  build_misc_index()

  local chars = utf8_chars(text)
  local total = table_getn(chars)
  local out   = {}
  local i     = 1

  while i <= total do
    local ch     = chars[i]
    local bucket = _misc_by_first[ch]
    local matched = false

    if bucket then
      local b = 1
      while b <= table_getn(bucket) do
        local entry = bucket[b]
        local klen  = entry.len
        if i + klen - 1 <= total then
          local slice = ""
          local j = 0
          while j < klen do
            slice = slice .. chars[i + j]
            j = j + 1
          end
          if slice == entry.cn then
            table_insert(out, entry.en)
            i = i + klen
            matched = true
            break
          end
        end
        b = b + 1
      end
    end

    if not matched then
      table_insert(out, ch)
      i = i + 1
    end
  end

  return table_concat(out)
end

-- =====================================================
-- PUBLIC API
-- =====================================================

function DBB2.api.TranslateCN(message)
  if not message or message == "" then
    return message
  end
  if not DBB2.api.ContainsCJK(message) then
    return message
  end
  local result = apply_phrases(message)
  result = apply_misc(result)
  return result
end
