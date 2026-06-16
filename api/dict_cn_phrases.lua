-- dict_cn_phrases.lua
-- Chinese (Simplified) → English PHRASE rules (ordered, applied before misc)
-- Ported from TranslateCN by Gangasrotogati
-- Format: { cn = "<pattern>", en = "<replacement>" }
-- Patterns are Lua string patterns (% escapes special chars).

dict_cn_phrases = {
    -- Door / portal
    { cn = "开门",         en = "Open the door" },
    { cn = "门开",         en = "Open the door" },
    -- LFG role requests
    { cn = "需要T",        en = "need tank" },
    { cn = "需要N",        en = "need healer" },
    { cn = "需要DPS",      en = "need dps" },
    { cn = "来T",          en = "need tank" },
    { cn = "来N",          en = "need healer" },
    { cn = "来DPS",        en = "need dps" },
    -- Group phrases
    { cn = "来的组我",     en = "group with me" },
    { cn = "一起刷",       en = "run together" },
    { cn = "组队",         en = "group up" },
    -- Guild recruitment
    { cn = "新建公会",     en = "New guild" },
    { cn = "其他也欢迎",   en = "others welcome" },
    -- GDKP
    { cn = "G团",          en = "GDKP" },
    { cn = "消费团",       en = "GDKP run" },
    -- Time patterns
    { cn = "晚7%-11",      en = "7 to 11 pm" },
    { cn = "晚7",          en = "7 pm" },
    { cn = "绝不加班",     en = "no overtime" },
    -- Misc common chat
    { cn = "我吃饱了",     en = "I'm full" },
    { cn = "号",           en = "" },
}

-- === Additional phrases added ===

-- Combat callouts
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "全力输出",     en = "full DPS" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "停止攻击",     en = "stop attacking" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "不要攻击",     en = "don't attack" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "打标记",       en = "mark the target" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "集火",         en = "focus fire" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "打星星",       en = "attack star" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "先杀",         en = "kill first" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "放技能",       en = "use cooldowns" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "别乱打",       en = "don't pull aggro" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "等我拉",       en = "wait for pull" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "我来拉",       en = "I'll pull" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "注意仇恨",     en = "watch your threat" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "躲开",         en = "get out of it" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "散开",         en = "spread out" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "站好位",       en = "get in position" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "站远点",       en = "stand back" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "近战站我身边", en = "melee stay close to me" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "我死了",       en = "I'm dead" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "我快死了",     en = "I'm almost dead" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "加我血",       en = "heal me" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "奶我",         en = "heal me" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "救我",         en = "save me" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "跑路",         en = "run away" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "全灭",         en = "wipe" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "推倒",         en = "boss down" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "打完了",       en = "done fighting" }

-- Ready checks / preparation
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "准备好了",     en = "ready" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "还没准备好",   en = "not ready yet" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "都准备好了吗", en = "is everyone ready?" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "等一下",       en = "wait a moment" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "稍等",         en = "hold on" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "先休息",       en = "rest first" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "吃东西",       en = "eating" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "加蓝",         en = "drinking" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "补给",         en = "restock" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "去卖东西",     en = "going to vendor" }

-- Group / LFG
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "有没有人",     en = "anyone want to" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "带我",         en = "carry me" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "有位置吗",     en = "any spots open?" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "还缺人吗",     en = "still need people?" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "我可以来",     en = "I can join" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "我来",         en = "I'll come" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "开始吧",       en = "let's start" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "走吧",         en = "let's go" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "走了",         en = "let's go" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "出发",         en = "move out" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "等人",         en = "waiting for people" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "快来",         en = "hurry up" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "在哪",         en = "where are you?" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "你在哪",       en = "where are you?" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "跟上",         en = "keep up" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "跟我",         en = "follow me" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "不去了",       en = "can't make it" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "我要下线",     en = "I'm logging off" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "下线了",       en = "logging off" }

-- Loot / trade
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "需要还是贪婪", en = "need or greed" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "可以需要",     en = "you can need it" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "别需要",       en = "don't need it" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "这是我的",     en = "that's mine" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "你先要",       en = "you take it" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "给我",         en = "give it to me" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "卖多少",       en = "how much?" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "多少金",       en = "how much gold?" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "可以便宜吗",   en = "can you go cheaper?" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "不卖",         en = "not for sale" }

-- Social / reactions
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "干得好",       en = "good job" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "打得好",       en = "well played" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "真厉害",       en = "impressive" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "新手",         en = "newbie" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "大佬",         en = "pro player" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "带我飞",       en = "carry me" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "没关系",       en = "it's fine" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "没事",         en = "no worries" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "我知道了",     en = "I understand" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "不知道",       en = "I don't know" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "你好",         en = "hello" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "再见",         en = "goodbye" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "晚安",         en = "good night" }
dict_cn_phrases[table.getn(dict_cn_phrases)+1] = { cn = "早上好",       en = "good morning" }