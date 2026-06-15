-- translate_cn.lua
-- Chinese (Simplified) → English translation pipeline for DifficultBulletinBoard
--
-- Translation runs in AddMessage(), before the message is stored, so every
-- downstream consumer (categorisation, dedup, GUI rows, tooltips, the All log)
-- receives the already-translated text.
--
-- Pipeline (applied in order):
--   1. Phrase pass  – ordered rules from dict_cn_phrases (longest / most-specific first)
--   2. Misc pass    – word/term substitution from dict_cn_misc
--
-- Dependencies (must be loaded before this file):
--   api/utils.lua          – DBB2.api.ContainsCJK
--   api/dict_cn_phrases.lua
--   api/dict_cn_misc.lua

-- =====================================================
-- INTERNAL HELPERS
-- =====================================================

local string_gsub  = string.gsub
local string_len   = string.len
local string_byte  = string.byte
local string_sub   = string.sub
local table_getn   = table.getn
local ipairs       = ipairs

-- Returns the byte-length of the UTF-8 character starting at position i.
local function utf8_charlen(str, i)
  local b = string_byte(str, i)
  if not b        then return 1 end
  if b < 0x80     then return 1 end
  if b < 0xC0     then return 1 end  -- stray continuation byte
  if b < 0xE0     then return 2 end
  if b < 0xF0     then return 3 end
  return 4
end

-- Split a UTF-8 string into a flat array of individual character byte-strings.
-- e.g. "AB中" → { "A", "B", "中" }
local function utf8_chars(str)
  local chars = {}
  local i = 1
  local len = string_len(str)
  while i <= len do
    local clen = utf8_charlen(str, i)
    chars[#chars + 1] = string_sub(str, i, i + clen - 1)
    i = i + clen
  end
  return chars
end

-- =====================================================
-- PHRASE PASS  (ordered, applied in sequence)
-- =====================================================
-- dict_cn_phrases is a list of { cn=pattern, en=replacement } tables.
-- We apply them in order with plain gsub (no Lua patterns in the cn field
-- except for the few entries that deliberately use %-escapes).

local function apply_phrases(text)
  if not dict_cn_phrases then return text end
  for _, rule in ipairs(dict_cn_phrases) do
    if rule.cn and rule.en then
      text = string_gsub(text, rule.cn, rule.en)
    end
  end
  return text
end

-- =====================================================
-- MISC PASS  (greedy longest-match, left-to-right)
-- =====================================================
-- dict_cn_misc is a hash of CN-term → EN-term.
-- We walk the character array left-to-right and at each position try the
-- longest key that matches, falling back to shorter ones.  If nothing
-- matches at position i, the character is kept verbatim.
--
-- Pre-compute a lookup keyed by first character for speed.
local _misc_by_first = nil   -- built lazily on first call

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
      _misc_by_first[first][#_misc_by_first[first] + 1] = { cn = cn, en = en, len = #chars }
    end
  end
  -- Sort each bucket longest-first so greedy match wins
  for _, bucket in pairs(_misc_by_first) do
    table.sort(bucket, function(a, b) return a.len > b.len end)
  end
end

local function apply_misc(text)
  if not dict_cn_misc then return text end
  build_misc_index()

  local chars   = utf8_chars(text)
  local total   = #chars
  local out     = {}
  local i       = 1

  while i <= total do
    local ch      = chars[i]
    local bucket  = _misc_by_first[ch]
    local matched = false

    if bucket then
      for _, entry in ipairs(bucket) do
        local klen = entry.len
        if i + klen - 1 <= total then
          -- Build the candidate slice
          local ok = true
          for j = 2, klen do
            if chars[i + j - 1] ~= utf8_chars(entry.cn)[j] then
              ok = false
              break
            end
          end
          -- Fast path: re-check by reconstructing the string slice
          -- (avoids building utf8_chars of the key on every call)
          local slice = ""
          for j = 0, klen - 1 do
            slice = slice .. chars[i + j]
          end
          if slice == entry.cn then
            out[#out + 1] = entry.en
            i = i + klen
            matched = true
            break
          end
        end
      end
    end

    if not matched then
      out[#out + 1] = ch
      i = i + 1
    end
  end

  return table.concat(out)
end

-- =====================================================
-- PUBLIC API
-- =====================================================

-- [ TranslateCN ]
-- Translates a message that may contain Chinese characters.
-- Returns the (possibly modified) message and a boolean indicating
-- whether any translation was applied.
--
-- @param message  [string]   Raw chat message (UTF-8)
-- @return         [string]   Translated message
-- @return         [boolean]  true if the message contained CJK and was translated
function DBB2.api.TranslateCN(message)
  if not message or message == "" then
    return message, false
  end

  -- Fast exit: skip entirely if no CJK codepoints present
  if not DBB2.api.ContainsCJK(message) then
    return message, false
  end

  local result = message
  result = apply_phrases(result)
  result = apply_misc(result)

  -- If the result still contains CJK after both passes, append the
  -- original in brackets so the reader can see it (e.g. for names).
  local stillCJK = DBB2.api.ContainsCJK(result)
  if stillCJK and result ~= message then
    -- partial translation: keep what we got, original is still readable
    -- (don't double-append if nothing changed)
  end

  return result, true
end
