-- dict_cn_phrases.lua
-- Chinese (Simplified) → English PHRASE rules (ordered, applied before misc)
-- Ported from TranslateCN by Gangasrotogati
-- Format: { cn = "<pattern>", en = "<replacement>" }
-- Patterns are Lua string patterns (% escapes special chars).

dict_cn_phrases = {
    -- ============================================================================
    -- CRITICAL: Dungeon & Custom Zone Phrasing (Must be evaluated first!)
    -- ============================================================================
    { cn = "诺莫瑞根任务队", en = "Gnomeregan quest group " },
    { cn = "监狱任务队",     en = "Stockades quest group " },
    { cn = "霜鬃谷任务队",   en = "Frostmane Hollow quest group " },
    { cn = "新月来人",       en = "Crescent Grove LFG" },
    { cn = "翡翠圣地开团",   en = "Forming Emerald Sanctum" },
    { cn = "仇恨熔炉速刷",   en = "Hateforge Quarry speedrun" },
    { cn = "死矿任务(%d)=(%d)", en = "Deadmines quest LFM (Need %2 more) " },
    { cn = "死矿任务队",     en = "Deadmines quest group " },

    -- ============================================================================
    -- Standalone English / Number Guard Rules (Protects words from corruption)
    -- ============================================================================
    { cn = "%f[%a][eE][sS]%f[%A]", en = "Emerald Sanctum" }, -- Only matches standalone "es" / "ES"
    { cn = "%f[%a][tT]%f[%A]",     en = "Tank" },            -- Only matches standalone "t" / "T"
    { cn = "%f[%a][nN]%f[%A]",     en = "Healer" },          -- Only matches standalone "n" / "N"
    { cn = "%f[%a][gG]%f[%A]",     en = "Gold" },            -- Only matches standalone "g" / "G"
    { cn = "(%d+)[gG]%f[%W]",      en = "%1 Gold" },         -- Formats gold safely (e.g., 20g -> 20 Gold)
    { cn = "%f[%a][aA][hH]%f[%A]", en = "WC" },              -- Only swaps "AH" if it's a standalone group tag
    { cn = "%f[%w]6%f[%W]",        en = "nice" },            -- Matches standalone "6", leaves "60+" perfectly safe
    { cn = "%f[%a][nN][dD]%f[%A]", en = "Resto Druid" },     -- Only matches standalone "nd" / "ND"
    { cn = "%f[%a][sS][tT]%f[%A]", en = "Sunken Temple " },  -- Only matches standalone "st" / "ST"

    -- ============================================================================
    -- Air-Tight Standalone Guard Rules (Protects system text and English sentences)
    -- ============================================================================
    { cn = "%f[%a][sS][sS]%f[%A]", en = "Warlock" },
    { cn = "%f[%a][sS][mM]%f[%A]", en = "Shaman" },
    { cn = "%f[%a][aA][mM]%f[%A]", en = "Shadow Priest" },
    { cn = "%f[%a][nN][dD]%f[%A]", en = "Resto Druid" },
    { cn = "%f[%a][hH][cC]%f[%A]", en = "Hardcore" },
    { cn = "%f[%a][eE][yY]%f[%A]", en = "Dire Maul" },
    { cn = "%f[%a][iI][fF]%f[%A]", en = "Ironforge" },
    { cn = "%f[%a][mM][cC]%f[%A]", en = "Molten Core" },
    { cn = "%f[%a][aA][bB]%f[%A]", en = "Arathi Basin" },
    { cn = "%f[%a][aA][vV]%f[%A]", en = "Alterac Valley" },
    { cn = "%f[%a][sS][wW]%f[%A]", en = "Stormwind" },
    { cn = "%f[%a][uU][cC]%f[%A]", en = "Undercity" },
    { cn = "%f[%a][oO][rR][gG]%f[%A]", en = "Orgrimmar" },
    { cn = "%f[%a][tT][lL]%f[%A]", en = "Scholomance" },
    { cn = "%f[%a][yY][sS]%f[%A]", en = "need water" },
    { cn = "%f[%a][fF][sS]%f[%A]", en = "Mage" },
    { cn = "%f[%a][lL][rR]%f[%A]", en = "Hunter" },

    -- ============================================================================
    -- Advanced LFG Role Combos & Verbs
    -- ============================================================================
    { cn = "需来个DPS或者奶", en = "need DPS or healer" },
    { cn = "需来个T或者奶",   en = "need tank or healer" },
    { cn = "需来个T",         en = "need a tank" },
    { cn = "需来个N",         en = "need a healer" },
    { cn = "需来个奶",        en = "need a healer" },
    { cn = "需来个DPS",       en = "need a DPS" },
    { cn = "有没有T来",       en = "any tanks for" },
    { cn = "有没有N来",       en = "any healers for" },
    { cn = "来个T或者N",      en = "need tank or healer" },
    { cn = "T或者N",          en = "tank or healer" },
    { cn = "来T%s?N",         en = "need Tank or Healer " },
    { cn = "来个T%s?N",       en = "need Tank or Healer " },
    { cn = "来点DPS",         en = "need some DPS" },
    { cn = "来个能拉人的",    en = "need someone who can summon" },
    { cn = "有没有大佬带",    en = "any pros to carry me?" },
    { cn = "来(%d)个",        en = "need %1 more" },
    { cn = "来T来奶",        en = "need Tank and Healer " },
    { cn = "来奶",           en = "need healer " },

    -- ============================================================================
    -- Base LFG Role Requests
    -- ============================================================================
    { cn = "需要T",        en = "need tank" },
    { cn = "需要N",        en = "need healer" },
    { cn = "需要DPS",      en = "need dps" },
    { cn = "来个N",        en = "need a healer" },
    { cn = "来个T",        en = "need a tank" },
    { cn = "来个DPS",      en = "need a DPS" },
    { cn = "来个奶",       en = "need a healer" },
    { cn = "来T",          en = "need tank " },
    { cn = "来N",          en = "need healer " },
    { cn = "来DPS",        en = "need dps " },

    -- ============================================================================
    -- Original Base Phrases & Movements
    -- ============================================================================
    { cn = "开门",         en = "Open the door" },
    { cn = "门开",         en = "Open the door" },
    { cn = "来的组我",     en = "group with me" },
    { cn = "一起刷",       en = "run together" },
    { cn = "组队",         en = "group up" },
    { cn = "新建公会",     en = "New guild" },
    { cn = "其他也欢迎",   en = "others welcome" },
    { cn = "G团",          en = "GDKP" },
    { cn = "消费团",       en = "GDKP run" },
    { cn = "晚7%-11",      en = "7 to 11 pm" },
    { cn = "晚7",          en = "7 pm" },
    { cn = "绝不加班",     en = "no overtime" },
    { cn = "我吃饱了",     en = "I'm full" },
    { cn = "或者",         en = "or" },
    { cn = "号",           en = "" },

    -- ============================================================================
    -- Tactical & Combat Callouts
    -- ============================================================================
    { cn = "全力输出",     en = "full DPS" },
    { cn = "停止攻击",     en = "stop attacking" },
    { cn = "不要攻击",     en = "don't attack" },
    { cn = "打标记",       en = "mark the target" },
    { cn = "集火",         en = "focus fire" },
    { cn = "打星星",       en = "attack star" },
    { cn = "先杀",         en = "kill first" },
    { cn = "放技能",       en = "use cooldowns" },
    { cn = "别乱打",       en = "don't pull aggro" },
    { cn = "等我拉",       en = "wait for pull" },
    { cn = "我来拉",       en = "I'll pull" },
    { cn = "注意仇恨",     en = "watch your threat" },
    { cn = "躲开",         en = "get out of it" },
    { cn = "散开",         en = "spread out" },
    { cn = "站好位",       en = "get in position" },
    { cn = "站远点",       en = "stand back" },
    { cn = "近战站我身边", en = "melee stay close to me" },
    { cn = "我死了",       en = "I'm dead" },
    { cn = "我快死了",     en = "I'm almost dead" },
    { cn = "加我血",       en = "heal me" },
    { cn = "奶我",         en = "heal me" },
    { cn = "救我",         en = "save me" },
    { cn = "跑路",         en = "run away" },
    { cn = "全灭",         en = "wipe" },
    { cn = "推倒",         en = "boss down" },
    { cn = "打完了",       en = "done fighting" },

    -- ============================================================================
    -- Ready Checks & Preparation
    -- ============================================================================
    { cn = "准备好了",     en = "ready" },
    { cn = "还没准备好",   en = "not ready yet" },
    { cn = "都准备好了吗", en = "is everyone ready?" },
    { cn = "等一下",       en = "wait a moment" },
    { cn = "稍等",         en = "hold on" },
    { cn = "先休息",       en = "rest first" },
    { cn = "吃东西",       en = "eating" },
    { cn = "加蓝",         en = "drinking" },
    { cn = "补给",         en = "restock" },
    { cn = "去卖东西",     en = "going to vendor" },

    -- ============================================================================
    -- General Social Status / Group Coordination
    -- ============================================================================
    { cn = "有没有人",     en = "anyone want to" },
    { cn = "带我",         en = "carry me" },
    { cn = "有位置吗",     en = "any spots open?" },
    { cn = "还缺人吗",     en = "still need people?" },
    { cn = "我可以来",     en = "I can join" },
    { cn = "我来",         en = "I'll come" },
    { cn = "开始吧",       en = "let's start" },
    { cn = "走吧",         en = "let's go" },
    { cn = "走了",         en = "let's go" },
    { cn = "出发",         en = "move out" },
    { cn = "等人",         en = "waiting for people" },
    { cn = "快来",         en = "hurry up" },
    { cn = "在哪",         en = "where are you?" },
    { cn = "你在哪",       en = "where are you?" },
    { cn = "跟上",         en = "keep up" },
    { cn = "跟我",         en = "follow me" },
    { cn = "不去了",       en = "can't make it" },
    { cn = "我要下线",     en = "I'm logging off" },
    { cn = "下线了",       en = "logging off" },

    -- ============================================================================
    -- Loot Contexts & Trade
    -- ============================================================================
    { cn = "需要还是贪婪", en = "need or greed" },
    { cn = "可以需要",     en = "you can need it" },
    { cn = "别需要",       en = "don't need it" },
    { cn = "这是我的",     en = "that's mine" },
    { cn = "你先要",       en = "you take it" },
    { cn = "给我",         en = "give it to me" },
    { cn = "卖多少",       en = "how much?" },
    { cn = "多少金",       en = "how much gold?" },
    { cn = "可以便宜吗",   en = "can you go cheaper?" },
    { cn = "不卖",         en = "not for sale" },

    -- ============================================================================
    -- Social Reactions & Greetings
    -- ============================================================================
    { cn = "干得好",       en = "good job" },
    { cn = "打得好",       en = "well played" },
    { cn = "真厉害",       en = "impressive" },
    { cn = "新手",         en = "newbie" },
    { cn = "大佬",         en = "pro player" },
    { cn = "带我飞",       en = "carry me" },
    { cn = "没关系",       en = "it's fine" },
    { cn = "没事",         en = "no worries" },
    { cn = "我知道了",     en = "I understand" },
    { cn = "不知道",       en = "I don't know" },
    { cn = "你好",         en = "hello" },
    { cn = "再见",         en = "goodbye" },
    { cn = "晚安",         en = "good night" },
    { cn = "早上好",       en = "good morning" },

    -- ============================================================================
    -- Lockouts & Group Sizing Metrics
    -- ============================================================================
    { cn = "全程带",       en = "full carry" },
    { cn = "带飞",         en = "carry run" },
    { cn = "自己有本",     en = "have lockout" },
    { cn = "没有本",       en = "no lockout" },
    { cn = "没本",         en = "no lockout" },
    { cn = "满5",          en = "full 5/5" },
    { cn = "缺(%d)",       en = "need %1 more" },

    -- ============================================================================
    -- Hardcore Survival Warnings
    -- ============================================================================
    { cn = "HC模式注意安全", en = "HC mode, play safe" },
    { cn = "别引怪会害死人", en = "Don't ninja pull, you'll kill us" },
    { cn = "求稳不要求快",   en = "Safety first, don't rush" },

    -- ============================================================================
    -- Economy & Strategic Warnings
    -- ============================================================================
    { cn = "免费代工",     en = "Free crafting (your mats)" },
    { cn = "自带材料",     en = "Bring your own mats" },
    { cn = "代工做极品",   en = "Crafting high tier gear" },
    { cn = "看好拉怪路线", en = "Watch the pull path" },
    { cn = "治疗看好T",     en = "Healers focus the Tank" },
    { cn = "DPS别抢仇恨",   en = "DPS wait for aggro" },
    { cn = "各就各位",     en = "Everyone get in position" },
}