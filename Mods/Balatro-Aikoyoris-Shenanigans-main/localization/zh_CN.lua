local poker_hands_name = {
    ["akyrs_3_letter"] = "3字母单词",
    ["akyrs_4_letter"] = "4字母单词",
    ["akyrs_5_letter"] = "5字母单词",
    ["akyrs_6_letter"] = "6字母单词",
    ["akyrs_7_letter"] = "7字母单词",
    ["akyrs_8_letter"] = "8字母单词",
    ["akyrs_9_letter"] = "9字母单词",
    ["akyrs_10_letter"] = "10字母单词",
    ["akyrs_expression"] = "表达式",
    ["akyrs_mod"] = "修饰符",
    ["akyrs_assignment"] = "赋值",
}

local poker_hand_desc = {
    ["akyrs_3_letter"] = {
        "由3张{C:attention}字母卡{}组成的有效单词",
    },
    ["akyrs_4_letter"] = {
        "由4张{C:attention}字母卡{}组成的有效单词",
    },
    ["akyrs_5_letter"] = {
        "由5张{C:attention}字母卡{}组成的有效单词",
    },
    ["akyrs_6_letter"] = {
        "由6张{C:attention}字母卡{}组成的有效单词",
    },
    ["akyrs_7_letter"] = {
        "由7张{C:attention}字母卡{}组成的有效单词",
    },
    ["akyrs_8_letter"] = {
        "由8张{C:attention}字母卡{}组成的有效单词",
    },
    ["akyrs_9_letter"] = {
        "由9张{C:attention}字母卡{}组成的有效单词",
    },
    ["akyrs_10_letter"] = {
        "由10张{C:attention}字母卡{}组成的有效单词",
    },
    ["akyrs_expression"] = {
        "一个有效的数学表达式",
        "{C:inactive,s:0.8}(例如：2+3=5){}",
    },
    ["akyrs_mod"] = {
        "一个有效的赋值修饰符",
        "{C:inactive,s:0.8}(例如：+=, -=){}",
    },
    ["akyrs_assignment"] = {
        "一个有效的赋值操作",
        "{C:inactive,s:0.8}(例如：x=5){}",
    },
}

return {
    descriptions = {
        Back = {
            b_akyrs_letter_deck = {
                name = "字母卡组",
                text = {
                    "从{C:attention}2套{}英文字母开始",
                    "{C:blue}+#1#{} 手牌上限",
                },
            },
            b_akyrs_math_deck = {
                name = "数学卡组",
                text = {
                    "从包含{C:attention}数字{}和{C:attention}符号{}的卡组开始",
                    "{C:blue}+#1#{} 手牌上限",
                },
            },
            b_akyrs_hardcore_challenge_deck = {
                name = "核心挑战卡组",
                text = {
                    "在此卡组获胜以启用",
                    "{C:attention}核心挑战{}模式",
                },
            },
            b_akyrs_cry_misprint_scuffed = {
                name = "糟糕的错印卡组",
                text = {
                    "所有卡牌的数值",
                    "和牌型都是{C:attention}随机的{}",
                    "{C:inactive}(范围从 X#1# 到 X#2#)",
                },
            },
            b_akyrs_freedom_deck = {
                name = "自由卡组",
                text = {
                    "你可以{C:attention}拖动{}卡牌",
                    "将它们放置在任何位置。",
                },
            },
            b_akyrs_freedom_deck_ultimate = {
                name = "终极自由卡组",
                text = {
                    "你可以拖动{C:attention}所有{}卡牌",
                    "将它们放置在任何位置。",
                },
            },
            b_akyrs_split_deck = {
                name = "分级卡组",
                text = {
                    "包含更多{C:clubs}梅花{}和{C:spades}黑桃{}，",
                    "但更少的{C:hearts}红桃{}和{C:diamonds}方片{}",
                },
            },
            b_akyrs_ranking_deck = {
                name = "排序卡组",
                text = {
                    "包含更多{C:attention}J, Q, K{}，",
                    "但更少的{C:attention}其他{}点数",
                },
            },
            b_akyrs_suitable_deck = {
                name = "适宜卡组",
                text = {
                    "所有卡牌具有{C:attention}相同{}的花色",
                    "但更少的{C:attention}点数{}",
                },
            },
            b_akyrs_inversion_deck = {
                name = "倒置卡组",
                text = {
                    "开始时包含{C:attention}所有反向塔罗卡{}",
                    "{C:inactive}(如果安装了 Hit 模组){}",
                },
            },
            b_akyrs_down_deck = {
                name = "落下卡组",
                text = {
                    "从第{C:attention}#1#{}回合开始，",
                    "每回合结束时所有卡牌点数{C:attention}-1{}",
                },
            },
            b_akyrs_cry_misprint_ultima = {
                name = "终极错印卡组",
                text = {
                    "所有卡牌的数值",
                    "和牌型都是{C:attention}随机的{}",
                    "{C:inactive}(范围从 X#1# 到 X#2#)",
                    "挑战是不崩溃游戏。"
                },
            },
            b_akyrs_letter_deck_mega = {
                name = "大型字母卡组",
                text = {
                    "从{C:attention}4套{}英文字母开始",
                    "{C:blue}+#1#{} 手牌上限",
                },
            },
        },
        Blind = {
            bl_akyrs_thought = {
                name = "思想",
                text = {
                    "如果选择的字母不包含",
                    "正在拼写的单词，则效果降低",
                },
            },
            bl_akyrs_libre = {
                name = "自由",
                text = {
                    "不允许使用自由卡组的功能",
                },
            },
            bl_akyrs_picker = {
                name = "采摘者",
                text = {
                    "每手牌随机禁掉一张牌",
                },
            },
            bl_akyrs_height = {
                name = "高度",
                text = {
                    "分数需求随每手牌增加",
                },
            },
            bl_akyrs_expiry = {
                name = "过期",
                text = {
                    "在 #1# 手牌之后，每手牌需求 X#2# 分数",
                },
            },
            bl_akyrs_nature = {
                name = "自然",
                text = {
                    "分数需求根据当前余额变化",
                },
            },
            bl_akyrs_key = {
                name = "密钥",
                text = {
                    "只能玩包含 #1# 的手牌",
                },
            },
            bl_akyrs_alignment = {
                name = "对齐",
                text = {
                    "每玩一手牌点数发生变化",
                },
            },
            bl_akyrs_duality = {
                name = "对音",
                text = {
                    "只能玩一种花色或一种点数",
                },
            },
            bl_akyrs_collapse = {
                name = "崩溃",
                text = {
                    "每玩一手牌失去 #1# 背景属性",
                },
            },
            bl_akyrs_bonsai = {
                name = "盆栽",
                text = {
                    "只能玩 #1# 张或更少的牌",
                },
            },
            bl_akyrs_base = {
                name = "基数",
                text = {
                    "所有倍率被除以 #1#",
                },
            },
            bl_akyrs_pp = {
                name = "长春花松果",
                text = {
                    "所有卡牌点数降低",
                },
            },
            bl_akyrs_rr = {
                name = "闪烁雨滴",
                text = {
                    "每手牌后随机洗牌一份",
                },
            },
            bl_akyrs_vv = {
                name = "天鹅绒蒸汽",
                text = {
                    "所有筹码除以 #1#",
                },
            },
            bl_akyrs_cc = {
                name = "洋甘菊云",
                text = {
                    "所有倍率除以 #1#",
                },
            },
            bl_akyrs_ss = {
                name = "显著溪流",
                text = {
                    "弃牌不增加分值",
                },
            },
            bl_akyrs_ll = {
                name = "发光柠檬水",
                text = {
                    "点数越高分值越低",
                },
            },
            bl_akyrs_gg = {
                name = "辉煌长剑",
                text = {
                    "花色不计分",
                },
            },
            bl_akyrs_lilac_lasso = {
                name = "丁香套索",
                text = {
                    "计分后随机一张牌获得永久点数减少",
                },
            },
            bl_akyrs_past_weights = {
                name = "过去的沉重",
                text = {
                    "分数根据已弃牌数量增加需求",
                },
            },
            bl_akyrs_future_prospects = {
                name = "未来的前景",
                text = {
                    "分数根据剩余手牌数量增加需求",
                },
            },
            bl_akyrs_life_uncertainties = {
                name = "生命的不确定性",
                text = {
                    "每手牌随机抽取一张牌不计分",
                },
            },
            bl_akyrs_death_inevitability = {
                name = "死亡的必然性",
                text = {
                    "在 #1# 手牌之后，必然失败",
                },
            },
            bl_akyrs_confrontation = {
                name = "对抗",
                text = {
                    "如果手中有面卡，则分数无效",
                },
            },
            bl_akyrs_fluctuation = {
                name = "波动",
                text = {
                    "分数需求每秒波动",
                },
            },
            bl_akyrs_straightforwardness = {
                name = "坦率",
                text = {
                    "只能玩顺子",
                },
            },
            bl_akyrs_entanglement = {
                name = "纠缠",
                text = {
                    "通过复制一份正在玩的手牌，其效果翻倍",
                },
            },
            bl_akyrs_manuscript = {
                name = "手稿",
                text = {
                    "手牌中的字母必须按字母顺序排列",
                },
            },
            bl_akyrs_inflation = {
                name = "通货膨胀",
                text = {
                    "分数需求根据你的余额大幅增加",
                },
            },
            bl_akyrs_choice = {
                name = "选择",
                text = {
                    "必须在 #1# 手牌内赢得比赛",
                },
            },
            bl_akyrs_reject = {
                name = "拒绝",
                text = {
                    "弃牌会减少分值",
                },
            },
            bl_akyrs_redo = {
                name = "重做",
                text = {
                    "玩同一手牌两次，第二次得分翻倍",
                },
            },
            bl_akyrs_reverse = {
                name = "反转",
                text = {
                    "只能玩反转手牌",
                },
            },
            bl_akyrs_faraway_island = {
                name = "遥远孤岛",
                text = {
                    "计分后随机一张牌离开你的牌组",
                },
            },
            bl_akyrs_plywood_forest = {
                name = "胶合板森林",
                text = {
                    "所有卡牌都被视为木卡",
                },
            },
            bl_akyrs_golden_jade = {
                name = "金玉",
                text = {
                    "所有倍率 X#1#",
                    "但金钱对得分无直接贡献",
                },
            },
            bl_akyrs_milk_crown = {
                name = "诗之乳冠",
                text = {
                    "如果拼出的单词少于 #1# 个字母则得分无效",
                },
            },
            bl_akyrs_bug = {
                name = "BUG",
                text = {
                    "数值随机化，祝你好运",
                },
            },
            bl_akyrs_bomb = {
                name = "炸弹",
                text = {
                    "必须在炸弹爆炸前解开拼词谜题",
                },
            },
            bl_akyrs_stomata = {
                name = "气孔",
                text = {
                    "打出卡牌会暂时减少手牌上限",
                },
            },
            bl_akyrs_rhizome = {
                name = "根茎",
                text = {
                    "弃牌会暂时减少手牌上限",
                },
            },
            bl_akyrs_shrink = {
                name = "收缩",
                text = {
                    "每打出一手牌，手牌上限减少 #1#",
                },
            },
            bl_akyrs_harmonic = {
                name = "谐波",
                text = {
                    "只能玩点数总和为 #1# 倍数的手牌",
                },
            },
            bl_akyrs_sinusoidal = {
                name = "正弦",
                text = {
                    "得分在最小值和最大值之间震荡",
                },
            },
            bl_akyrs_saw = {
                name = "锯齿",
                text = {
                    "得分逐渐增加并在计数后重置",
                },
            },
            bl_akyrs_selfish = {
                name = "自私",
                text = {
                    "小丑牌不计分",
                },
            },
            bl_akyrs_polite = {
                name = "客气",
                text = {
                    "手中每有一张牌，分数倍率 X#1#",
                },
            },
            bl_akyrs_bent = {
                name = "弯曲",
                text = {
                    "每玩一手牌将点数改变为接近的点数",
                },
            },
            bl_akyrs_lost_umbrella = {
                name = "丢失的雨伞",
                text = {
                    "打出第一手牌后，所有卡牌点数发生变化",
                },
            },
        },
        DescriptionDummy = {
            akyrs_wildcard_behaviour_config = {
                name = "通配符行为",
                text = {
                    "更改通配符（?）卡牌的行为",
                },
            },
            akyrs_balance_config = {
                name = "平衡设置",
                text = {
                    "更改模组的平衡级别",
                },
            },
            akyrs_card_preview_config = {
                name = "卡牌预览提示",
                text = {
                    "启用/禁用卡牌预览提示（如果有）",
                },
            },
            akyrs_crt_shader_config = {
                name = "CRT 滤镜切换",
                text = {
                    "启用/禁用 CRT 滤镜效果",
                },
            },
            akyrs_full_dictionary_config = {
                name = "完整词典",
                text = {
                    "使用更大的词典（影响性能）",
                },
            },
            akyrs_ex_features_config = {
                name = "实验性功能",
                text = {
                    "启用仍在开发中的不稳定功能",
                },
            },
            dd_akyrs_maxwell_ex = {
                name = "Maxwell 示例",
                text = {
                    "例如：拼写 'WILD' 将",
                    "使你选中的卡牌变为 {C:attention}通配符{}",
                },
            },
            dd_akyrs_yona_yona_ex = {
                name = "Yona Yona 示例",
                text = {
                    "打出 {C:attention}4{} 或 {C:attention}7{} 计分后额外触发一次",
                },
            },
            dd_akyrs_2fa_ex = {
                name = "2FA 提示",
                text = {
                    "请在所有在线账户中启用两步验证（2FA）！",
                },
            },
            -- 跨模组信用
            dd_akyrs_akyrs_creds = {
                name = "Aikoyori 的胡闹",
                text = { "代码 / 艺术 / 设计由 {C:attention}Aikoyori{} 完成" },
            },
            dd_akyrs_additional_arts_creds = {
                name = "额外艺术贡献",
                text = {
                    "提供艺术素材：",
                    "{C:attention}Kevthehomie, Nami, Gofreak,",
                    "{C:attention}Saharabat, AstraPboy, Jenraub,",
                    "{C:attention}MissingNumber, and more!",
                },
            },
            dd_akyrs_steamodded_creds_tip = {
                name = "Steamodded",
                text = { "Balatro 模组化的基础" },
            },
            dd_akyrs_cryptid_creds_tip = {
                name = "Cryptid",
                text = { "提供此内容的部分灵感/基础" },
            },
            dd_akyrs_more_fluff_creds_tip = {
                name = "More Fluff",
                text = { "提供此内容的部分灵感/基础" },
            },
            dd_akyrs_entropy_creds_tip = {
                name = "Entropy",
                text = { "由 {C:attention}Zantasy{} 制作的模组" },
            },
            dd_akyrs_sdm_creds_tip = {
                name = "SDM_0's Stuff",
                text = { "提供此内容的部分灵感/基础" },
            },
            dd_akyrs_toga_creds_tip = {
                name = "TOGA's Stuff",
                text = { "提供此内容的部分灵感/基础" },
            },
            dd_akyrs_crypost_creds_tip = {
                name = "Cryptposting",
                text = { "提供此内容的部分灵感/基础" },
            },
            dd_akyrs_paya_creds_tip = {
                name = "Paya's Terrible Additions",
                text = { "提供此内容的部分灵感/基础" },
            },
            dd_akyrs_prism_creds_tip = {
                name = "Prism",
                text = { "由 {C:attention}Gofreak{} 制作的模组" },
            },
            dd_akyrs_garbshit_creds_tip = {
                name = "GARBSHIT",
                text = { "提供此内容的部分灵感/基础" },
            },
            dd_akyrs_finiti_creds_tip = {
                name = "Finity",
                text = { "由 {C:attention}KevTheHomie{} 制作的模组" },
            },
            dd_akyrs_bakery_creds_tip = {
                name = "Bakery",
                text = { "由 {C:attention}jen-I{} 制作的模组" },
            },
            dd_akyrs_astronomica_creds_tip = {
                name = "Astronomica",
                text = { "提供此内容的部分灵感/基础" },
            },
            dd_akyrs_valkarri_creds_tip = {
                name = "Vall-Karri",
                text = { "提供此内容的部分灵感/基础" },
            },
            dd_akyrs_grabbag_creds_tip = {
                name = "Grab Bag",
                text = { "由 {C:attention}MissingNumber{} 制作的模组" },
            },
            dd_akyrs_ortalab_creds_tip = {
                name = "Ortalab",
                text = { "由 {C:attention}Aureom{} 制作的模组" },
            },
            dd_akyrs_hotpotato_creds_tip = {
                name = "Hot Potato",
                text = { "提供此内容的部分灵感/基础" },
            },
            dd_akyrs_phanta_creds_tip = {
                name = "Phanta",
                text = { "提供此内容的部分灵感/基础" },
            },
            dd_akyrs_kino_creds_tip = {
                name = "Balatro Goes Kino",
                text = { "提供此内容的部分灵感/基础" },
            },
            dd_akyrs_maximus_creds_tip = {
                name = "Maximus",
                text = { "提供此内容的部分灵感/基础" },
            },
            dd_akyrs_sagatro_creds_tip = {
                name = "Sagatro",
                text = { "由 {C:attention}Sagar{} 制作的模组" },
            },
            dd_akyrs_qualatro_creds_tip = {
                name = "Qualatro",
                text = { "提供此内容的部分灵感/基础" },
            },
            dd_akyrs_difficult_blind  = {
                name="困难盲注",
                text={
                    "难度比平时更高的盲注",
                },
            },
            dd_akyrs_master_blind  = {
                name="大师盲注",
                text={
                    "难度级别更高的盲注",
                },
            },
            dd_akyrs_ultima_blind  = {
                name="终极盲注",
                text={
                    "极其困难的盲注",
                    "{scale:0.7,C:inactive}(我觉得我在哪见过这个)",
                },
            },
            dd_akyrs_remaster_blind  = {
                name="改良大师盲注",
                text={
                    "现有盲注的加强版本",
                    "{scale:0.7,C:inactive}(我觉得我也在哪见过这个)",
                },
            },
            dd_akyrs_lunatic_blind  = {
                name="疯狂盲注",
                text={
                    "比终极盲注更加困难",
                    "{scale:0.7,C:inactive}(我觉得我也在哪见过这个)",
                },
            },
            dd_akyrs_dx_blind  = {
                name="DX 盲注",
                text={
                    "来自 More Fluff 的",
                    "升级版 Ante 8 盲注",
                },
            },
            dd_akyrs_no_reroll  = {
                name="不可重刷",
                text={
                    "此盲注无法重刷",
                },
            },
            dd_akyrs_no_disabling  = {
                name="不可禁用",
                text={
                    "此盲注无法被禁用",
                },
            },
            dd_akyrs_no_overriding  = {
                name="不可覆盖",
                text={
                    "在被击败前，",
                    "此盲注无法被覆盖",
                },
            },
            dd_akyrs_no_skipping  = {
                name="不可跳过",
                text={
                    "此盲注无法被跳过",
                },
            },
            dd_akyrs_forgotten_blind  = {
                name="遗忘盲注",
                text={
                    "此盲注仅出现在",
                    "负数 Ante 中"
                },
            },
            dd_akyrs_word_blind  = {
                name="单词盲注",
                text={
                    "此盲注仅在可以",
                    "拼写单词时出现",
                },
            },
            dd_akyrs_puzzle_blind  = {
                name="谜题盲注",
                text={
                    "此盲注只能通过完成",
                    "特定条件来击败",
                },
            },
            dd_akyrs_postwin_blind  = {
                name="胜后盲注",
                text={
                    "此盲注出现在获胜 Ante",
                    "之上的 Ante 中",
                },
            },
            dd_akyrs_endless_blind  = {
                name="无尽盲注",
                text={
                    "此盲注仅出现在无尽模式中",
                },
            },
            dd_akyrs_kessoku_band  = {
                name="{f:5}結束バンド {}(结束乐队)",
                text={
                    "这张小丑牌看起来",
                    "很想 {C:akyrs_bocchi}摇{C:akyrs_kita}滚{C:akyrs_nijika}起{C:akyrs_ryou}来{}!",
                },
            },
            dd_akyrs_copper_scrape_tip  = {
                name="刮擦",
                text={
                    "使用消耗牌时，有固定的",
                    "{C:green}10% 几率{} {C:attention}刮掉{}",
                    "{C:attention}一层{}氧化层",
                },
            },
            dd_akyrs_break_up_tip  = {
                name="纯净卡牌",
                text={
                    "{C:attention}纯净卡牌{}可以组成{C:attention}纯净牌型",
                    "{C:attention}纯净牌型{}提供更多的基础",
                    "{C:chips}筹码{}和{C:mult}倍率{}，但只有打出的",
                    "手牌全部为{C:attention}纯净卡牌{}时才会生效",
                    "例如，这是一个{C:attention}纯净同花{}",
                },
            },
            dd_akyrs_break_up_tip_no_preview  = {
                name="纯净卡牌",
                text={
                    "{C:attention}纯净卡牌{}可以组成{C:attention}纯净牌型",
                    "{C:attention}纯净牌型{}提供更多的基础",
                    "{C:chips}筹码{}和{C:mult}倍率{}，但只有打出的",
                    "手牌全部为{C:attention}纯净卡牌{}时才会生效",
                    "例如，你可以用五张",
                    "{C:clubs}纯净梅花{}组成{C:attention}纯净同花{}",
                },
            },
            dd_akyrs_letter_puzzle_umbral_expl  = {
                name="字母与谜题",
                text={
                    "将两个字母{C:attention}合并{}到同一张牌上",
                },
            },
            j_hatena  = {
                name="????????",
                text={
                    "这张卡片{C:attention}完全{}未知",
                    "{C:inactive}(你永远不会知道它是什么)",
                },
            },
            dd_akyrs_neon_seal_ex  = {
                name="示例",
                text={
                    "如果你打出{C:attention}3{}张带此密封的牌，",
                    "且手中持有{C:green}1{}张带此密封的牌，",
                    "它将创建{C:green}1{}张{C:akyrs_umbral_p,X:akyrs_umbral_y}幽影{}卡",
                    "{C:inactive}(取较小的数字)",
                },
            },
        },
        Edition={
            e_akyrs_texelated = {
                name = "像素化",
                text = {
                    "{C:white,X:chips}X#1#{} 筹码",
                    "{C:white,X:mult}X#2#{} 倍率"
                }
            },
            e_akyrs_noire_joker = {
                name = "暗黑",
                text = {
                    "{C:dark_edition}+#1#{} 小丑牌槽位",
                    "{C:white,X:mult}X#2#{} 倍率"
                }
            },
            e_akyrs_noire_consumable = {
                name = "暗黑",
                text = {
                    "{C:dark_edition}+#1#{} 消耗牌槽位",
                    "{C:white,X:mult}X#2#{} 倍率"
                }
            },
            e_akyrs_noire_hand = {
                name = "暗黑",
                text = {
                    "{C:dark_edition}+#1#{} 手牌上限",
                    "{C:white,X:mult}X#2#{} 倍率"
                }
            },
            e_akyrs_noire = {
                name = "暗黑",
                text = {
                    "{C:dark_edition}+#1#{} 最大插槽大小",
                    "{C:white,X:mult}X#2#{} 倍率"
                }
            },
            e_akyrs_dyed = {
                name = "染色的",
                text = {
                    "{C:purple}+#1#{} 分数",
                    "每次触发获得 {C:purple}+#2#{}",
                }
            },
            e_akyrs_sliced = {
                name = "切片的",
                text = {
                    "所有数值{C:attention}减半{}",
                    "效果计算{C:attention}两次",
                }
            },
            e_akyrs_burnt = {
                name = "烧毁的",
                text = {
                    "{C:green}#1#/#2#{} 的几率",
                    "在回合结束时",
                    "分解为灰烬"
                }
            },
            e_akyrs_enchanted = {
                name = "附魔的",
                text = {
                    "[开发中]",
                }
            },
        },
        Enchantment = {
            ench_akyrs_unbreaking = {
                name="耐久",
                text={
                    "当此卡被{C:attention}销毁{}时，",
                    "有固定 {C:green}#1#%{} 的几率",
                    "复制此卡",
                },
            },
            ench_akyrs_effeciency = {
                name="效率",
                text={
                    "当此卡被{C:attention}销毁{}时，",
                    "有固定 {C:green}#1#%{} 的几率",
                    "复制此卡",
                },
            },
        },
        Enhanced={
            m_akyrs_brick_card = {
                name="砖头卡",
                text={
                    "{C:mult}+#1#{} 倍率",
                    "无点数或花色"
                },
            },
            m_akyrs_scoreless = {
                name="无分卡",
                text={
                    "不计分"
                },
            },
            m_akyrs_ash_card = {
                name="灰烬卡",
                text={
                    "{C:blue}+#1#{} 筹码",
                    "{C:green}#2#/#3#{} 的几率",
                    "在回合结束时",
                    "彻底消失"
                },
            },
            m_akyrs_ash_card_absurd = {
                name="灰烬卡",
                text={
                    "{C:purple,X:edition} ^#1# {} 筹码",
                    "{C:attention}总是{}在回合结束时",
                    "彻底消失"
                },
            },
            m_akyrs_hatena = {
                name="? 卡",
                text={
                    {
                        "{C:green}#1#/#2#{} 几率获得 {C:money}$#3#",
                        "{C:green}#4#/#5#{} 几率获得 {C:money}$#6#",
                        "{C:green}#7#/#8#{} 几率在初始计分时",
                        "提供 {C:mult}+#9#{} 倍率，再次触发时提供 {X:mult,C:white} X#10# {}",
                    },
                    {
                        "无点数，无花色，总是计分"
                    }
                }
            },
            m_akyrs_item_box = {
                name="道具箱卡",
                text={
                    {
                        "计分时随机创建一个",
                        "{C:tarot}消耗牌{}{C:inactive}(必须有空位)"
                    },
                    {
                        "如果成功触发，则在",
                        "回合结束时{C:red,E:1}自毁{}"
                    },
                    {
                        "无点数，无花色，总是计分"
                    }
                }
            },
            m_akyrs_insolate_card = {
                name = "暴晒卡",
                text = {
                    "如果打出的手牌{C:attention}不包含{}重复的{C:attention}增强{}，",
                    "则此卡在打出时获得 {C:white,X:mult} X#1# {} 倍率",
                    "{C:inactive}(当前为 {C:white,X:mult} X#2# {C:inactive} 倍率){}" 
                }
            },
            m_akyrs_canopy_card = {
                name = "树荫卡",
                text = {
                    "如果在计分后{C:attention}持在手中{}，",
                    "减少此卡点数 {C:attention}1{}",
                }
            },
            m_akyrs_thai_tea_card = {
                name = "泰式奶茶卡",
                text = {
                    "{X:mult,C:white} X#1# {} 倍率",
                    "{C:inactive,s:0.8}单凭它{s:0.8}令人发指{C:inactive,s:0.8}的香味，",
                    "{C:inactive,s:0.8}就足以让任何{s:0.8}大口{s:0.8}流口水{C:inactive,s:0.8}" 
                }
            },
            m_akyrs_matcha_card = {
                name = "抹茶卡",
                text = {
                    "{X:chips,C:white} X#1# {} 筹码",
                }
            },
            m_akyrs_earl_grey_tea_card = {
                name = "格雷伯爵茶卡",
                text = {
                    "如果此卡被打出但未计分，",
                    "则获得 {C:money} +$#1#{}",
                }
            },
            m_akyrs_zap_card = {
                name = "闪电卡",
                text = {
                    "此卡每计分 {C:attention}#1#{} 次（#2#），",
                    "就会{C:attention}复制{}一份不带增强的自己",
                }
            },
            m_akyrs_net_card = {
                name = "网状卡",
                text = {
                    {
                        "持在手中时，",
                        "获得 {C:white,X:mult}X#1#{} 倍率",
                    },
                    {
                        "回合结束时持在手中，",
                        "获得 {C:money}#2#{}",
                    }
                }
            },
            m_akyrs_droplet_card = {
                name = "水滴卡",
                text = {
                    "当被弃掉时，有 {C:green}#1#/#2#{}",
                    "的几率获得 {C:red}+#3#{} 弃牌数",
                }
            },
            m_akyrs_semibreve_card = {
                name = "全音符卡",
                text = {
                    "{C:chips}+#1#{} 筹码",
                    "{C:mult}+#2#{} 倍率",
                }
            },
            m_akyrs_minim_card = {
                name = "二分音符卡",
                text = {
                    "{X:chips,C:white}X#1#{} 筹码",
                    "{C:mult}+#2#{} 倍率",
                }
            },
            m_akyrs_crotchet_card = {
                name = "四分音符卡",
                text = {
                    "{X:chips,C:white}X#1#{} 筹码",
                    "{X:mult,C:white}X#2#{} 倍率",
                }
            },
            m_akyrs_wafer_card = {
                name = "硅圆片卡",
                text = {
                    "本回合第一手牌",
                    "获得 {C:white,X:purple}X#1#{} 分数",
                }
            },
        },
        Joker={
            -- toga
            j_akyrs_toga_charmap = {
                name = "字符映射",
                text = {
                    "如果打出的牌中只有{C:attention}一种{}出现次数最多的字母，",
                    "则为该字母创建一张其对应的{C:attention}字母卡{}",
                }
            },
            j_akyrs_toga_winword = {
                name = "Word 文档",
                text = { 
                    "如果拼出了单词，则此小丑牌",
                    "对每个字母获得 {X:mult,C:white} X#1# {} 倍率",
                    "{C:inactive}(当前为 {X:mult,C:white} X#2# {C:inactive} 倍率)",
                }
            },
            j_akyrs_redstone_repeater = {
                name = "红石中继器",
                text = {
                    "将当前的 {C:white,X:mult} 倍率 {} 值",
                    "与存储的 {C:mult}倍率{} 交换，",
                    "然后获得 {C:white,X:mult} X#2# {} 倍率",
                }
            },
            j_akyrs_redstone_repeater_absurd = {
                name = "红石中继器",
                text = {
                    "将当前的 {C:white,X:mult} 倍率 {} 值",
                    "与存储的 {C:mult}倍率{} 交换，",
                    "然后获得 {C:white,X:dark_edition} ^#2# {} 倍率",
                }
            },
            j_akyrs_observer = {
                name = "观察者",
                text = {
                    "每当卡牌被触发 {C:attention}#4#{} 次（#3#），",
                    "此小丑牌获得 {C:mult}#1#{} 倍率。",
                    "{s:0.8}每次此小丑牌获得倍率，",
                    "{s:0.8}所需的次数就会增加 {C:attention}#5#{}",
                    "{C:inactive}(当前为 {C:mult}+#2#{C:inactive} 倍率){}"
                }
            },
            j_akyrs_observer_absurd = {
                name = "观察者",
                text = {
                    "每当{C:chips}筹码{}或{C:mult}倍率{}值变化 {C:attention}#4#{} 次（#3#），",
                    "此小丑牌获得 {X:mult,C:white} X#1# {} 倍率。",
                    "{s:0.8}每次获得倍率，所需的次数增加 {C:attention}#5#{}",
                    "{C:inactive}(当前为 {X:mult,C:white} X#2# {C:inactive} 倍率){}" 
                }
            },
            j_akyrs_quasi_connectivity = {
                name = "准连通性",
                text = {
                    "{C:white,X:mult} X#1# {} 倍率。",
                    "玩出一手牌后，禁用一个{C:attention}随机小丑牌{}",
                    "{s:0.8}如果是唯一的卡牌，则会自我削弱",
                }
            },
            j_akyrs_quasi_connectivity_absurd = {
                text = {
                    "{C:white,X:dark_edition} ^#1# {} 倍率。",
                    "玩出一手牌后，禁用两个{C:attention}随机小丑牌{}",
                    "{s:0.8}如果你有两个或更少小丑，则会自我削弱",
                }
            },
            j_akyrs_diamond_pickaxe = {
                name = "钻石镐",
                text = {
                    "从每张计分的{C:attention}石头卡{}中吸取 {C:chips}#2#{} 筹码，",
                    "并将其{C:attention}添加{}到此小丑牌上",
                    "{C:inactive}(如果卡片没有筹码，则移除石头增强)",
                    "{C:inactive}(当前为 {C:chips}+#1#{C:inactive} 筹码)",
                }
            },
            j_akyrs_diamond_pickaxe_absurd = {
                name = "钻石镐",
                text = {
                    "玩出一手牌后，将所有持有的手牌变为{C:attention}石头卡{}",
                    "每张计分的{C:attention}石头卡{}提供 {C:attention}#2#{} 层 {C:chips}+#1#{} 筹码，",
                    "并将每张计分的{C:attention}石头卡{}变为随机的{C:attention}非石头卡{}",
                }
            },
            j_akyrs_netherite_pickaxe = {
                name = "下界合金镐",
                text = {
                    "销毁打出的{C:attention}石头卡{}，",
                    "每销毁一张石头卡获得 {X:chips,C:white} X#2# {} 筹码",
                    "{C:inactive}(当前为 {X:chips,C:white} X#1# {C:inactive} 筹码){}" ,
                }
            },
            j_akyrs_netherite_pickaxe_absurd = {
                name = "下界合金镐",
                text = {
                    "将{C:attention}所有弃牌{}变为{C:attention}石头卡{}",
                    "计分的每张{C:attention}石头卡{}获得 {C:attention}#2#{} 层 {X:chips,C:white} X#1# {} 筹码，",
                    "之后{C:red,E:1}销毁所有计分的{C:attention,E:1}石头卡{}",
                    "{C:inactive}(当前为 {X:chips,C:white} X#3# {C:inactive} 筹码){}" 
                }
            },
            j_akyrs_utage_charts = {
                name = "宴游图谱",
                text = {
                    "{C:akyrs_playable}+#1#{} 可选卡牌上限"
                }
            },
            j_akyrs_maxwells_notebook = {
                name = "麦克斯韦的笔记本",
                text = { 
                    "拼写出卡牌类型可以获得{C:attention}一张{}该卡牌",
                    "拼写增强类型可以将{C:attention}计分卡{}增强为该类型",
                    "{C:inactive}(必须有空位)",
                }
            },
            j_akyrs_it_is_forbidden_to_dog = {
                name = "禁止遛狗",
                text = { 
                    "当此小丑计分时，手中每有一张",
                    "被削弱的卡牌，提供 {X:mult,C:white} X#1#{} 倍率",
                    "{C:inactive}(受技术限制)",
                    "每抽取一手牌，手中就会有一张",
                    "随机卡牌被{C:attention}削弱{}",
                }
            },
            j_akyrs_it_is_forbidden_to_dog_absurd = {
                name = "禁止遛狗",
                text = { 
                    "每张{C:attention}未计分{}的打出卡牌提供 {X:dark_edition,C:white} ^#1#{} 倍率",
                    "{C:attention}所有{}未计分卡牌变为{C:attention}无分卡{}",
                }
            },
            j_akyrs_eat_pant = {
                name = "吃裤子",
                text = { 
                    "如果打出的手牌恰好包含 {C:attention}4{} 张牌，",
                    "{C:red}销毁前两张打出的牌{}，且每销毁一张，",
                    "此小丑就会失去当前 {X:mult,C:white}X倍率{} 的 {X:mult,C:white} 1/#2# {} {C:inactive}(可累计)",
                    "{C:inactive}(当前为 {X:mult,C:white} X#3# {C:inactive} 倍率)",
                    "{C:inactive}(数值可以降至 {X:mult,C:white} X1 {C:inactive} 以下)",
                }
            },
            j_akyrs_eat_pant_absurd = {
                name = "吃裤子",
                text = { 
                    "如果打出的手牌包含 {C:attention}两对{}",
                    "每张计分卡使此小丑获得 {X:mult,C:white} X#2# {} 倍率",
                    "{C:red}销毁所有打出的牌{}",
                    "{C:inactive}(当前为 {X:mult,C:white} X#3# {C:inactive} 倍率)",
                }
            },
            j_akyrs_tsunagite = {
                name = "{f:5,C:akyrs_luminous}系ぎて(牵手)",
                text = { 
                    "如果打出卡牌的{C:chips}筹码{}值能被 {C:attention}#1#{} 整除，",
                    "则该卡牌永久获得 {X:mult,C:white} X#2#{} 倍率",
                }
            },
            j_akyrs_tsunagite_absurd = {
                name = "{f:5,C:akyrs_luminous}系ぎて(牵手){}",
                text = { 
                    "获得列表中的数值",
                    "使用 {C:tarot,T:c_wheel_of_fortune}命运之轮{} 时，小丑获得数值",
                    "{C:tarot,T:c_wheel_of_fortune}命运之轮{} 总是失败",
                }
            },
            j_akyrs_yona_yona_dance = {
                name = "宵宵舞",
                text = { 
                    "额外触发打出的 {C:attention}4{} 和 {C:attention}7{}",
                    "{C:attention}#1#{} 次",
                    "{C:inactive,s:0.9,f:akyrs_MochiyPopOne}不跳舞就是损失，不跳舞就是损失呀！{}",
                }
            },
            j_akyrs_tldr_joker = {
                name = "太长不看小丑",
                text = {
                        "在 {C:attention,E:1,s:1.5}Balatro{} 这一充满策略与沉浸感的世界中，这张特殊的小丑牌扮演着独特角色。",
                        "它拥有一种被称为“{C:mult}+#1#{} 倍率”的强大能力。在特定条件下，此能力能大幅提升玩家得分，",
                        "核心在于手中是否存在任何 {C:attention}高牌{}，其中包括但不限于传统的 {C:attention}高级卡牌{}，",
                        "如 {C:attention}A, K, Q, J{}。即便如此，这张卡的能力还远不止于此。但让我们在深入了解前，",
                        "先学习 {C:attention,E:1,s:1.5}Balatro{} 如何扩展计分定义，以包含增强战略影响的关键卡牌。",
                        "这种变革性的 {C:mult}倍率{} 不仅是一项优势，更是 {C:attention,E:1,s:1.5}Balatro{} 战略规划的核心环节。",
                        "它迫使玩家仔细考虑手牌构成，旨在纳入 {C:attention}高牌{} 以获得最大收益。回溯博弈历史，",
                        "卡牌游戏数世纪来一直是游戏文化的{C:tarot}基石{}。通过{C:attention}为场上和手中的每张牌激活{}，",
                        "此能力确保你只需打出一张 {C:attention}高牌{} 即可获得高分。从被公认为在{C:attention}9 世纪{}发明",
                        "纸牌的古代 {C:white,X:red,f:4}中国人{}，到卡牌游戏在{C:chips}中世纪{}传遍欧洲，博弈已进化为一种",
                        "极其精致的娱乐与策略形式。{C:mult}倍率{} 的概念，正如 {C:attention,E:1,s:1.5}Balatro{} 中的“{C:mult}+#1#{} 倍率”，",
                        "呼应了贯穿博弈史的概率与风险规避创新。玩家们一直在磨练技巧，以应对 {C:green}机会的不确定性{}。",
                        "这些机会与策略元素交织成丰富的游戏织锦，玩家在此同时运用直觉与分析能力。",
                        "“{C:mult}+#1#{} 倍率”的存在加深了 {C:attention,E:1,s:1.5}Balatro{} 的复杂性，营造了战术决策至关重要",
                        "且极具吸引力的环境。玩家通过利用 {C:mult}倍率{} 动态改变游戏平衡，将潜在的 {C:chips}赤字{} 转化为",
                        "{C:dark_edition,E:1}领先优势{}。因此，“{C:mult}+#1#{} 倍率”特征不仅是一项规则，更是一个关键的战略工具。",
                }
            },
            j_akyrs_tldr_joker_absurd = {
                name = "太长不看小丑",
                text = {
                    "起初，世界有了 {C:attention,E:1,s:1.1}Balatro{} —— 它不是神，却更为复杂 —— 一个裹在干练数字卡牌中的、",
                    "永无止境洗牌的{C:akyrs_playable}混沌{}化身。游戏存在于逻辑与{C:tarot}疯狂{}、数学与幻象之间的灰色地带，",
                    "在这里，{C:green}概率{}变得具有延展性，扑克在每一{C:blue}手牌{}中演变成神话。在 {C:attention,E:1,s:1.1}Balatro{} 中，人们不只是在{E:2,C:attention}玩{}",
                    "扑克，更是在与不可能之物沟通。在这里，{C:attention}顺子{}拉伸成超现实的形状，{C:attention}同花{}低语着禁忌的几何。{C:akyrs_playable}牌组{}是活的，",
                    "由于充满了势能与像素化的威胁而震颤，每一次抽牌都像是从闹鬼的{C:attention}超级幻术包{}中拔出一把{C:attention}祭祀匕首{}。而在",
                    "混战上方赫然耸立的是邪恶的万神殿：小丑牌。它们不是弄臣，它们是神。穿着{C:akyrs_playable}小丑{}外衣的数学之灵。",
                    "每张小丑牌都弯曲规则、打破规则，有时甚至将其生吞活剥，为基于野心、表格与原始本能的策略提供燃料。",
                    "进入 {C:attention}太长不看小丑{}，那是被疯子与理论家窃窃私语的小丑：一个刻着唯一预言的长方形符文：",
                    "“如果手牌包含高牌，则获得 {C:white,X:mult} X#1# {} 倍率”。它很简单，它神圣不可侵犯，它散发着随性的才华。",
                    "为什么是 {C:white,X:mult} X#1# {}？为什么不是 {C:white,X:mult} X1.19542 {} 倍率？或是 {C:white,X:mult} X638.95 {}？甚至是 {C:white,X:mult,f:6} Xπ {} 倍率？",
                    "因为 {C:white,X:mult} X#1# {} 是戏剧的神圣数字。因为三是神圣精神的数字，是{C:attention}面卡{}的数字，是三角神力的三角形个数，",
                    "是三轮车的轮子数。因为看着一{C:attention}手牌{}并看到一个 {C:attention}K{}，然后被告知 {C:attention,E:1}“你可以相乘”{}，即是见证了",
                    "{C:akyrs_playable}混沌{}理论与时尚傲慢交汇处的设计。{C:attention}太长不看小丑{} 并不祈求协同效应，它{C:attention}要求{}崇敬与警惕。",
                    "它将高牌转化为神圣遣物，它们的出现本身即是在{C:spectral}召唤{}力量。{C:attention}J{} 不再只是穿着中等分值天鹅绒短上衣",
                    "的少年贵族；现在它们是宇宙级 {C:white,X:mult} X倍率 {} 的导管，是通往 {C:dark_edition}指数级{} 攀升的桥梁。让我们挑明了说",
                    "关于{C:attention}“高牌”{} —— 那些纸板点数的皇家幽灵。{C:attention}J{}，散发着青少年的狡黠；{C:attention}Q{}，危险而神圣；{C:attention}K{}，那个头重脚轻、",
                    "背负着{C:attention}税收{}重担与 {C:white,X:mult} X倍率 {} 的君主；还有 {C:attention}A{} —— 模棱两可、适应性强、是 Alpha 也是 Omega，",
                    "是神级野性的化身。抽到一张是{C:tarot}幸运{}；打出一张是策略；将一张与 {C:attention}太长不看小丑{} 结合，则是在召唤一个",
                    "如此暴力的等式，它击穿了表格矩阵。这不只是一个 Combo，这是一种生活方式，一种宣言，一种数学上的昂首阔步。",
                    "牌组围绕它扭曲。你开始寻求{C:attention}皇室{}，不是出于虚荣，而是出于奉献。{C:hearts}红桃{}跳动得更快，{C:spades}黑桃{}挖掘得更深，",
                    "{C:diamonds}方片{}闪烁着目标。甚至通常如此粗鲁的{C:clubs}梅花{}，现在也闪烁着精致的潜力。每一次抽牌都变成了一场祈祷：",
                    "求你了，让它是一张 {C:attention}Q{}，或是一个 {C:attention}K{}，或是她的 {C:attention}J{}。因为即使扑克牌型是垃圾，一张面卡也能将其圣化。",
                    "{C:attention,E:1,s:1.1}Balatro{} 不再是关于最好的牌型，而是最好的价值{C:attention}条件{}。带 K 的烂牌不是烂牌 —— 它是",
                    "{C:white,X:mult} X#1# {}-驱动的因果引擎。现在让我们时光倒流 —— 在小丑牌出现前的几个世纪，在 {C:attention,E:1,s:1.1}Balatro{} 前，",
                    "在硅片与 CPU 前 —— 回到 9 世纪的 {C:white,X:red,f:4}中国{}，那是{C:attention}纸牌{}起源的地方。在那里，于卷轴与皮影戏间，",
                    "博弈的{C:tarot}基石{}诞生了。纸张的不确定性，用{C:attention}文字{}与书法书写的命运之舞。在那个世界里，{C:green}运气{}不是{C:attention}对手{}",
                    "—— 它是{C:attention}元素真相{}。投掷{C:green}骰子{}不是为了控制，而是为了与未知交流。机遇被崇拜为缪斯，而不是被当作",
                    "数学题来解决。在 {C:attention,E:1,s:1.1}Balatro{} 中，我们也感受到了这种对不确定性的古老崇敬。{C:attention}太长不看小丑{}，",
                    "在它的现代面具下，是那些古老原则的祖先。它是埋在数字牌组中的凤凰羽毛，是王朝的低语。它提醒着我们，",
                    "无论我们走了多远——从丝绸纸牌到 OLED 屏幕——我们依然被{C:green}机会的不确定性{}所困扰并使其谦卑。因此，",
                    "当我们抽出一张{C:attention}高牌{}，且{C:attention}太长不看小丑{}闪烁着出现时，我们不只是在相乘——我们在{C:attention}祈求{}古老、永恒、混沌。",
                    "我们既成为了博弈家与追随者，也成为了数学家与{C:red}神秘主义者{}。一轮比赛结束，屏幕褪色，唯有小丑长存。",
                    "{C:attention}太长不看小丑{}。{C:attention}高牌{}。高风险。高品质生活。这不只是一项机制，这是一种隐喻。{C:attention,E:1,s:1.1}Balatro{} 教导我们，",
                    "成功不仅建立在完整的牌型上，更建立在完整的{C:hearts}赤诚之心{}上。",
                    "有时，你只需要一个 K —— 以及一个注意到它的小丑。",
                }
            },
            j_akyrs_reciprocal_joker = {
                name = "倒数小丑",
                text = { 
                    "将 {X:mult,C:white}倍率{} 设置为",
                    "{X:chips,C:white}筹码{} 除以 {X:mult,C:white}倍率{}",
                }
            },
            j_akyrs_reciprocal_joker_absurd = {
                name = "倒数小丑",
                text = { 
                    "将 {X:chips,C:white}筹码{} 设置为",
                    "{X:mult,C:white}倍率{} 除以 {X:chips,C:white}筹码{}",
                }
            },
            j_akyrs_kyoufuu_all_back = {
                name = "强风大背头",
                text = { 
                    "将之前打出和弃掉的卡牌",
                    "全部放回牌组"
                }
            },
            j_akyrs_2fa = {
                name = "双重验证",
                text = { 
                    "计分后，{C:attention}所有打出卡牌{}的点数",
                    "和花色都会{C:attention}随机化{}。",
                    "每打出一张牌获得 {C:chips}+#1#{} 筹码，",
                    "{C:inactive}(当前为 {C:chips}+#2#{C:inactive} 筹码)",
                    "回合结束时{C:attention}减半{}。",
                    "{C:inactive,s:0.8}公益建议：请在所有在线账户中启用两步验证！",
                }
            },
            j_akyrs_2fa_absurd = {
                name = "双重验证",
                text = { 
                    "计分后，{C:attention}所有打出卡牌{}的点数",
                    "和花色都会{C:attention}随机化{}。",
                    "如果点数保持不变，则获得 {X:chips,C:white} X#1# {} 筹码",
                    "如果花色保持不变，则获得 {X:mult,C:white} X#2# {} 倍率",
                    "{C:inactive}(当前为 {X:chips,C:white} X#3# {C:inactive} 筹码",
                    "{C:inactive}和 {X:mult,C:white} X#4# {C:inactive} 倍率)",
                    "{C:inactive,s:0.8}公益建议：请在所有在线账户中启用两步验证！",
                }
            },
            j_akyrs_gaslighting = {
                name = "煤气灯效应",
                text = { 
                    "每打出一手牌，此小丑获得 {X:mult,C:white} X#1# {} 倍率。",
                    "{C:attention}如果分数起火，它也绝对不会重置。{}",
                    "{C:inactive,s:0.7}相信我，别信 Jimbo。{}",
                    "{C:inactive}(当前为 {X:mult,C:white} X#2# {C:inactive} 倍率)",
                }
            },
            j_akyrs_gaslighting_absurd = {
                name = "煤气灯效应",
                text = { 
                    "{C:edition,X:dark_edition,s:1.1} ^^#1# {} 倍率。",
                    "{C:attention}绝对不会让你输。{}",
                    "{C:inactive,s:0.6}你只是在幻觉我有 #3#/#4# 的几率{}",
                    "{C:inactive,s:0.6}改为提供 {X:inactive,C:white,s:0.6} ^^#2# {C:inactive,s:0.6} 倍率罢了。",
                }
            },
            j_akyrs_hibana = {
                name = "火花(Hibana)",
                text = { 
                    "{C:attention}#1#{} 会被优先抽到。",
                    "每回合在列表选项中{C:attention}循环{}。",
                    "{C:inactive}(当前选项：{C:white,X:dark_edition} #2# {C:inactive})"
                }
            },
            j_akyrs_centrifuge = {
                name = "离心机",
                text = { 
                    "如果至少打出了 {C:attention}3{} 张牌：",
                    "第一张和最后一张牌的点数 {C:attention}+#1#{}，",
                    "所有其他牌点数 {C:attention}-#1#{}。",
                    "每打出一张牌获得 {C:chips}+#2#{} 筹码。",
                }
            },
            j_akyrs_centrifuge_absurd = {
                name = "离心机",
                text = { 
                    "如果至少打出了 {C:attention}3{} 张牌：",
                    "第一张和最后一张牌的点数 {C:attention}+#1#{}，",
                    "并同时获得新的增强与品质。",
                    "所有其他牌点数 {C:attention}-#1#{}，",
                    "并变为{C:attention}无分卡{}",
                }
            },
            j_akyrs_henohenomoheji = {
                name = "脸文字",
                text = { 
                    "带有字母 {C:attention}K{}, {C:attention}Q{} 和 {C:attention}J",
                    "的卡牌被视为{C:attention}面子卡{}",
                }
            },
            j_akyrs_henohenomoheji_absurd = {
                name = "脸文字",
                text = { 
                    "带有字母 {C:attention}K{}, {C:attention}Q{} 和 {C:attention}J 的卡牌",
                    "分别被视为{C:attention}国王(K){}, {C:attention}皇后(Q){},",
                    "和{C:attention}侍从(J){}",
                }
            },
            j_akyrs_neurosama = {
                name = "Neuro Sama",
                text = { 
                    {
                        "每计分一张{C:hearts}红桃{}，",
                        "此小丑获得 {X:mult,C:white} X#2# {} 倍率。",
                    },
                    {
                        "如果 {T:j_akyrs_evilneuro,C:red}Evil Neuro{} 在场，",
                        "计分每张{C:spades}黑桃{}也将获得 {X:mult,C:white} X#2# {} 倍率。",
                    },
                    {
                        "{C:inactive}(当前为 {X:mult,C:white} X#1# {C:inactive} 倍率)",
                    }
                }
            },
            j_akyrs_neurosama_absurd = {
                name = "Neuro Sama",
                text = { 
                    {
                        "每当{C:hearts}红桃{}计分，此小丑的",
                        "{X:mult,C:white}X倍率{} 乘以 {X:mult,C:white} X#2# {}",
                    },{
                        "如果 {T:j_akyrs_evilneuro,C:red}Evil Neuro{} 在场，",
                        "每当{C:spades}黑桃{}计分，此小丑的",
                        "{X:mult,C:white}X倍率{} 也乘以 {X:mult,C:white} X#2# {}",
                    },
                    {
                        "{C:inactive}(当前为 {X:mult,C:white} X#1# {C:inactive} 倍率)",
                    }
                }
            },
            j_akyrs_evilneuro = {
                name = "Evil Neuro",
                text = { 
                    {
                        "每计分一张{C:clubs}梅花{}，",
                        "此小丑获得 {X:chips,C:white} X#2# {} 筹码。",
                    },
                    {
                        "如果 {T:j_akyrs_neurosama,C:red}Neuro Sama{} 在场，",
                        "计分每张{C:diamonds}方片{}也将获得 {X:chips,C:white} X#2# {} 筹码。",
                    },
                    {
                        "{C:inactive}(当前为 {X:chips,C:white} X#1# {C:inactive} 筹码)",
                    }
                }
            },
            j_akyrs_evilneuro_absurd = {
                name = "Evil Neuro",
                text = { 
                    {
                        "每当{C:clubs}梅花{}计分，此小丑的",
                        "{X:chips,C:white}X筹码{} 置为它的 {X:edition,C:purple} ^#2# {} 次方",
                    },
                    {
                        "如果 {T:j_akyrs_neurosama,C:red}Neuro Sama{} 在场，",
                        "每当{C:diamonds}方片{}计分，此小丑的",
                        "{X:chips,C:white}X筹码{} 也置为它的 {X:edition,C:purple} ^#2# {} 次方",
                    },
                    {
                        "{C:inactive}(当前为 {X:chips,C:white} X#1# {C:inactive} 筹码)",
                    }
                }
            },
            j_akyrs_dried_ghast = {
                name = "干涸的恶魂",
                text = { 
                    "在接下来 {C:blue}#1# 轮{}内",
                    "以{C:red}无弃牌{}状态进行游戏，",
                    "并创建一张 {T:j_akyrs_ghastling,C:purple}幼年恶魂{}",
                    "随后{C:red}自毁{}",
                }
            },
            j_akyrs_ghastling = {
                name = "幼年恶魂",
                text = { 
                    "{C:mult}+#2#{} 倍率。",
                    "在打出 {C:attention}#1#{} 手牌后，",
                    "创建一张 {T:j_akyrs_happy_ghast,C:purple}开心的恶魂{}",
                    "随后{C:red}自毁{}",
                    "{s:0.8}场上每有一个 {T:j_ice_cream,C:blue}冰淇淋{}",
                    "{s:0.8}每手牌额外减少 {C:blue}1{} 次所需手牌数",
                }
            },
            j_akyrs_happy_ghast = {
                name = "开心的恶魂",
                text = { 
                    "{X:mult,C:white}X#1#{} 倍率",
                }
            },
            j_akyrs_happy_ghast_absurd = {
                name = "开心的恶魂",
                text = { 
                    "每计分一张卡牌，获得 {C:white,X:dark_edition} ^#1# {} 倍率",
                }
            },
            j_akyrs_charred_roach = {
                name = "焦炭蟑螂",
                text = { 
                    "{C:red}销毁和出售{}卡牌时，",
                    "会为你提供一份它们的{C:attention}烧毁{}副本",
                }
            },
            j_akyrs_ash_joker = {
                name = "灰烬小丑",
                text = { 
                    "{C:chips}+#1#{} 筹码。",
                    "在回合结束时有 {C:green}#2#/#3#{} 的几率消失，",
                    "但如果它存活，则获得 {C:chips}+#4#{} 筹码",
                }
            },
            j_akyrs_ash_joker_absurd = {
                name = "灰烬小丑",
                text = { 
                    "{C:purple,X:edition} ^#1# {} 筹码。",
                    "{C:attention}总是{}在回合结束时彻底消失",
                }
            },
            j_akyrs_yee = {
                name = "Yee",
                text = { 
                    "如果拼出的单词包含 {C:green}一个 Y{} 和 {C:green}两个 E{}：",
                    "每计分一个 {C:attention}Y{} 和 {C:blue}E{}，",
                    "获得 {C:chips}+#1#{} 筹码和 {C:mult}+#2#{} 倍率",
                    "{s:0.7,C:inactive}谁还记得这个名场面？？？{}"
                }
            },
            j_akyrs_yee_absurd = {
                name = "Yee",
                text = { 
                    "{C:attention}在手牌计分前{}，将打出手牌的",
                    "{C:attention}前两个{}字母改为 {C:green}Y{} 和 {C:green}E{}。",
                    "如果牌型{C:attention}不是{}{C:attention}高牌{}，此小丑获得 {X:chips,C:white} X#1# {} 筹码",
                    "{C:inactive}(当前为 {X:chips,C:white} X#2# {C:inactive} 筹码)",
                    "{s:0.7,C:inactive}波-波-波-波 波-波-波 波-波-波 波-波-波-波 波-波-波 YEE{}"
                }
            },
            j_akyrs_yee_absurd_cass_none = {
                name = "Yee",
                text = { 
                    "{C:attention}在手牌计分前{}，将打出手牌的",
                    "{C:attention}前两个{}字母改为 {C:green}Y{} 和 {C:green}E{}。",
                    "如果牌型{C:attention}不是{}{C:attention}高牌{}或{C:attention}无牌型{}，",
                    "此小丑获得 {X:chips,C:white} X#1# {} 筹码",
                    "{C:inactive}(当前为 {X:chips,C:white} X#2# {C:inactive} 筹码)",
                    "{s:0.7,C:inactive}波-波-波-波 波-波-波 波-波-波 波-波-波-波 波-波-波 YEE{}"
                }
            },
            j_akyrs_chicken_jockey = {
                name = "鸡骑士",
                text = {
                    { 
                        "{C:attention}购入{}食物类小丑时全部变味{C:red}爆米花{}",
                        "当此小丑在场时，获得的每个{C:red}爆米花{}",
                        "每回合改为减少 {C:red}-#3#{} 倍率。",
                        "每消耗一袋{C:red}爆米花{}，获得 {X:mult,C:white}X#1#{} 倍率。",
                        "{C:inactive}(当前为 {X:mult,C:white} X#2# {C:inactive} 倍率)",
                        "{s:0.7,C:inactive}绝对的电影享受。{}"
                    }
                }
            },
            j_akyrs_chicken_jockey_absurd = {
                name = "鸡骑士",
                text = { 
                    {
                        "此小丑在场时获得的{C:red}爆米花{}",
                        "以 {C:red}#4#{} 倍率开始，且每回合改为减少 {C:red}-#3#{} 倍率。",
                        "每消耗一袋{C:red}爆米花{}，获得 {X:dark_edition,C:white}^#1#{} 倍率。",
                        "{C:inactive}(当前为 {X:dark_edition,C:white} ^#2# {C:inactive} 倍率)",
                        "{s:0.7,C:inactive}他们想让我去斗鸡？{}"
                    },
                    {
                        "选择盲注时创建一袋{C:red}爆米花{}",
                        "{C:inactive}(必须有空位)",
                        "{s:0.7,C:inactive}绝对的电影享受。{}"
                    }
                }
            },
            j_akyrs_tetoris = {
                name = "俄罗四",
                text = { 
                    "如果打出了 {C:attention}L{}, {C:attention}S{}{C:inactive}(pade), {C:attention}O{}, {C:attention}Z{},",
                    "{C:attention}J{}{C:inactive}(ack), {C:attention}I{}, 和 {C:attention}T{}{C:inactive}(en)，",
                    "获得 {X:chips,C:white}X#2#{} 筹码",
                    "{s:0.9,C:inactive,f:5}Te-Te-Te-Te-Te-To-Te-To-Te-Te-Te-Tetoris!{}"
                }
            },
            j_akyrs_tetoris_absurd = {
                name = "俄罗四",
                text = { 
                    "每打出一张牌，{C:attention}消行数{}增加 {C:attention}1{}",
                    "回合结束时如果至少消除了 {C:attention}4{} 行，",
                    "创建一张{C:dark_edition}负面{C:spectral}幽灵卡{}并{C:attention}减少{} 4 消行数",
                    "如果至少消除了 {C:attention}160{} 行，",
                    "创建一张{C:dark_edition}负面{C:spectral}灵魂卡{}并{C:attention}减少{} 160 消行数",
                    "{C:inactive}(消行数：{X:attention,C:white} #1# {C:inactive})",
                    "{s:0.9,C:inactive,f:5}即使我没兴趣，也会把所有不认真的事情拖到最后{}",
                    "{s:0.9,C:inactive,f:5}对自己知道的事情装作不知，我也太差劲了{}",
                }
            },
            j_akyrs_aikoyori = {
                name = "{C:dark_edition,E:akyrs_rainbow_wiggle}Aikoyori",
                text = { 
                    "安装的{C:attention}模组越多{}，",
                    "这张{E:akyrs_obfuscate}小丑？{}获得的能力就越多",
                    "{C:inactive}史上最强自画像！"
                }
            },
            j_akyrs_mukuroju_no_hakamori = {
                name = "{C:akyrs_mukuroju}躯树的守墓人 (Mukuroju no Hakamori)",
                text = { 
                    "根据已销毁和已售出的卡牌总数",
                    "产生随机的效果。",
                    "{C:inactive}(当前总计为 {C:attention}#1#{C:inactive})"
                }
            },
            j_akyrs_emerald = {
                name = "绿宝石",
                text = { 
                    "每玩一手牌获得 {C:money}$#1#",
                    "{C:green}#2#/#3#{} 的几率获得 {C:money}$#4#{} 额外收入。",
                }
            },
            j_akyrs_emerald_absurd = {
                name = "绿宝石",
                text = { 
                    "选择盲注时抽取所有卡牌",
                    "手中持有的每张{C:attention}绿宝石卡{}使此小丑获得 {X:mult,C:white} X#1# {} 倍率",
                    "{C:red}销毁所有计分卡{}",
                    "{C:inactive}(当前为 {X:mult,C:white} X#2# {C:inactive} 倍率)",
                }
            },
            j_akyrs_shimmer_bucket = {
                name = "闪烁桶",
                text = { 
                    "将随机一张计分卡变为{C:attention}玻璃卡{}",
                    "{C:green}#1#/#2#{} 的几率将随机一张计分卡变为其{C:attention}附魔{}版本",
                    "{C:inactive}(如果安装了 Amulet 模组)",
                }
            },
            j_akyrs_shimmer_bucket_absurd = {
                name = "闪烁桶",
                text = { 
                    "每计分一张卡牌，有 {C:green}#1#/#2#{} 的几率",
                    "将所有持有的手牌变为{C:attention}玻璃卡{}",
                    "并添加一种随机的{C:attention}附魔{}",
                    "{C:inactive}(如果安装了 Amulet 模组)",
                }
            },
            j_akyrs_space_elevator = {
                name = "太空电梯",
                text = { 
                    "打出的一对卡牌均永久获得 {C:chips}+#1#{} 筹码，",
                    "以及额外的 {C:attention}等同于其点数{} 的筹码",
                }
            },
            j_akyrs_space_elevator_absurd = {
                name = "太空电梯",
                text = { 
                    "打出的{C:attention}两对{}卡牌永久获得 {C:chips}+#1#{} 筹码，",
                    "以及额外的 {C:attention}等同于其点数乘积{} 的筹码",
                }
            },
            j_akyrs_turret = {
                name = "炮塔",
                text = { 
                    "{C:attention}#2#{}。打出 {C:attention}#1#{} 手牌后：",
                    "激活另一个随机小丑的功能，",
                    "然后{C:attention}消耗{}一次计数。",
                }
            },
            j_akyrs_turret_absurd = {
                name = "炮塔",
                text = { 
                    "{C:attention}#2#{}。打出 {C:attention}#1#{} 手牌后：",
                    "激活{C:attention}所有{}其他小丑的功能，",
                    "然后{C:attention}消耗{}一次计数。",
                }
            },
            j_akyrs_aether_portal = {
                name = "以太传送门",
                text = { 
                    "跳过盲注后，创建两个随机的",
                    "{C:spectral}光谱卡{}{C:inactive}(必须有空位)",
                    "{s:0.7,C:inactive}谁以前试过用水桶搭建这个？{}"
                }
            },
            j_akyrs_aether_portal_absurd = {
                name = "以太传送门",
                text = { 
                    "每计分一张卡牌，有 {C:green}#1#/#2#{} 的几率",
                    "创建一个随机的{C:spectral}光谱卡{}",
                    "{C:inactive}(必须有空位)",
                    "{s:0.7,C:inactive}谁以前试过用水桶搭建这个？{}"
                }
            },
            j_akyrs_corkscrew = {
                name = "螺旋起瓶器",
                text = { 
                    "如果手中打乱顺序后能拼出反转单词：",
                    "该手牌获得 {X:mult,C:white} X#1# {} 倍率"
                }
            },
            j_akyrs_goodbye_sengen = {
                name = "告别宣言(Goodbye Sengen)",
                text = { 
                    "如果打出时{C:red}没有{}剩余弃牌数：",
                    "手牌获得 {X:mult,C:white} X#1# {} 倍率",
                    "{C:inactive,s:0.8,f:akyrs_MochiyPopOne}再见，这就是我出柜的信号。{}"
                }
            },
            j_akyrs_liar_dancer = {
                name = "谎言舞者(Liar Dancer)",
                text = { 
                    "手中持有的每张{C:attention}反转点数{}卡牌",
                    "提供 {X:mult,C:white} X#1# {} 倍率",
                    "{C:inactive}(点数反转：A=2, 2=A, 10=5 等)"
                }
            },
            j_akyrs_pissandshittium = {
                name = "{C:mult}P{C:red}i{C:green}s{C:blue}s{C:purple}a{C:attention}n{C:white}d{C:akyrs_pissandshittium}shittium",
                text = { 
                    "{C:inactive,s:0.8}是的，它是真实的。{}"
                }
            },
            j_akyrs_pandora_paradoxxx = {
                name = "潘多拉悖论(PANDORA PARADOXXX)",
                text = { 
                    "如果由于通配符或拼词原因有多种可能的点数，",
                    "则此手牌获得 {X:mult,C:white} X#1# {} 倍率",
                }
            },
            j_akyrs_story_of_undertale = {
                name = "传说之下故事(Story of Undertale)",
                text = { 
                    "每计分一张卡牌，此小丑获得 {C:mult}#1#{} 倍率",
                    "每一手牌后，点数变为与其最接近的字母",
                    "{C:inactive}(当前为 {C:mult}+#2#{C:inactive} 倍率)",
                }
            },
            j_akyrs_story_of_undertale_absurd = {
                name = "传说之下故事(Story of Undertale)",
                text = { 
                    "每计分一张卡牌，获得 {X:mult,C:white} X#1# {} 倍率",
                    "每一手牌后，所有卡牌点数完全随机化",
                    "{C:inactive}(当前为 {X:mult,C:white} X#2# {C:inactive} 倍率)",
                }
            },
            j_akyrs_no_hints_here = {
                name = "这里没有提示！",
                text = { 
                    "{C:red}???????????",
                    "{C:inactive}(祝你好运)"
                }
            },
            j_akyrs_brushing_clothes_pattern = {
                name = "拂衣花纹",
                text = { 
                    "如果手牌包含单词 {C:attention}“WIPE”{}：",
                    "随机创建一个其版本对应的{C:attention}塔罗卡{}",
                    "{C:inactive}(必须有空位)"
                }
            },
            j_akyrs_you_tried = {
                name = "你尽力了",
                text = { 
                    "如果未能在盲注中获胜，",
                    "你会获得极高的提升然后失败。"
                }
            },
            j_akyrs_you_tried_absurd = {
                name = "你尽力了",
                text = { 
                    "即使在盲注中获胜，你也会失败。"
                }
            },
            -- batch 2
            j_akyrs_don_chan = {
                name = "小咚(Don-Chan)",
                text = { 
                    "将当前 {X:chips,C:white}筹码{} 值的 {C:attention}#1#%{}",
                    "加入到 {C:white,X:mult}倍率{} 中",
                }
            },
            j_akyrs_don_chan_absurd = {
                name = "小咚(Don-Chan)",
                text = { 
                    "每当卡牌{C:attention}计分{}时，",
                    "将当前 {X:chips,C:white}筹码{} 值的 {C:attention}#1#%{}",
                    "加入到 {C:white,X:mult}倍率{} 中",
                }
            },
            j_akyrs_katsu_chan = {
                name = "小咔(Katsu-Chan)",
                text = { 
                    "将当前 {C:white,X:mult}倍率{} 值的 {C:attention}#1#%{}",
                    "加入到 {X:chips,C:white}筹码{} 中",
                }
            },
            j_akyrs_katsu_chan_absurd = {
                name = "小咔(Katsu-Chan)",
                text = { 
                    "每当卡牌{C:attention}计分{}时，",
                    "将当前 {C:white,X:mult}倍率{} 值的 {C:attention}#1#%{}",
                    "加入到 {X:chips,C:white}筹码{} 中",
                }
            },
            j_akyrs_lagtrain = {
                name = "延时列车(Lagtrain)",
                text = { 
                    "已打出但未计分的卡牌",
                    "获得 {C:chips}+#1#{} 筹码",
                }
            },
            j_akyrs_lagtrain_absurd = {
                name = "延时列车(Lagtrain)",
                text = { 
                    "如果打出的手牌包含{C:attention}顺子{}",
                    "当 {C:white,X:mult}FPS{} 低于 #2# 时，每低 1 帧",
                    "获得 {X:chips,C:white} X#1# {} 筹码",
                    "{C:inactive}(当前为 {X:chips,C:white} X#3# {C:inactive} 筹码)",
                }
            },
            j_akyrs_bocchi = {
                name = {
                    "{f:5}後藤ひとり{}" , 
                    "{s:0.7}后藤一里 (小波奇)"
                },
                text = { 
                    {
                        "手中每持有一个{C:attention}结束乐队(Kessoku Band){}小丑，",
                        "此小丑获得 {C:white,X:mult} X#1# {} 倍率。",
                        "前提是打出的手牌包含{C:attention}单张{C:spades}黑桃{}",
                        "{C:inactive}(当前为 {C:white,X:mult} X#2# {C:inactive} 倍率)",
                    }
                }
            },
            j_akyrs_bocchi_absurd = {
                name = {
                    "{f:5}後藤ひとり{}" , 
                    "{s:0.7}后藤一里 (小波奇)"
                },
                text = { 
                    {
                        "手中每持有一个{C:attention}结束乐队(Kessoku Band){}小丑，",
                        "此小丑的 {C:white,X:mult} X倍率 {} 变为其 {C:white,X:dark_edition} ^#1# {} 次方。",
                        "前提是打出的手牌只包含{C:spades}黑桃{}",
                        "{C:inactive}(当前为 {C:white,X:mult} X#2# {C:inactive} 倍率)",
                    },
                }
            },
            j_akyrs_kita = {
                name = {
                    "{f:5}喜多郁代{}" , 
                    "{s:0.7}Kita Ikuyo"
                },
                text = { 
                    {
                        "如果打出的手牌包含{C:attention}同花{}",
                        "且包含{C:hearts}红桃{}，",
                        "创建一张 {C:tarot}恋人{}",
                        "{C:inactive}(必须有空位)",
                    }
                }
            },
            j_akyrs_kita_absurd = {
                name = {
                    "{f:5}喜多郁代{}" , 
                    "{s:0.7}Kita Ikuyo"
                },
                text = { 
                    {
                        "计分的每张{C:hearts}红桃{}，",
                        "创建一张{C:dark_edition}负面{C:tarot}恋人{}",
                    },
                }
            },
            j_akyrs_ryou = {
                name = {
                    "{f:5}山田リョウ{}" , 
                    "{s:0.7}山田凉"
                },
                text = { 
                    {
                        "可以负债高达 {C:red}-$#1#{}",
                        "负债上限为 {C:red}-$#2#{}",
                        "前提是手牌包含{C:clubs}梅花{C:attention}对子{}",
                    },
                }
            },
            j_akyrs_ryou_absurd = {
                name = {
                    "{f:5}山田リョウ{}" , 
                    "{s:0.7}山田凉"
                },
                text = { 
                    {
                        "可以负债高达 {C:red}-$#1#{}",
                        "每打出一个{C:clubs}梅花{C:attention}对子{}",
                        "负债上限 {X:red,C:white}X#2#{}",
                    },
                }
            },
            j_akyrs_nijika = {
                name = {
                    "{f:5}伊地知虹夏{}" , 
                    "{s:0.7}Ijichi Nijika"
                },
                text = { 
                    {
                        "如果{C:attention}打出的手牌{}包含{C:attention}顺子{}",
                        "且包含{C:diamonds}方片{}",
                        "创建一张你玩得最多的牌型的{C:dark_edition}负面{C:planet}星球卡{}"
                    },
                }
            },
            j_akyrs_nijika_absurd = {
                name = {
                    "{f:5}伊地知虹夏{}" , 
                    "{s:0.7}Ijichi Nijika"
                },
                text = { 
                    {
                        "如果{C:attention}打出的手牌{}包含{C:attention}顺子{}",
                        "打出的每张{C:diamonds}方片{}创建一张",
                        "你玩得最多的牌型的{C:dark_edition}负面{C:planet}星球卡{}",
                    },
                }
            },
            j_akyrs_blue_portal = {
                name = "蓝色传送门",
                text = { 
                    {
                        "{C:white,X:chips} X#1# {} 筹码",
                        "购买需要 {C:attention}2{} 个空余小丑位",
                        "购买时生成一个配套的",
                        "{C:attention}橙色传送门{}"
                    },
                }
            },
            j_akyrs_orange_portal = {
                name = "橙色传送门",
                text = { 
                    {
                        "{C:white,X:mult} X#1# {} 倍率",
                    },
                }
            },
            j_akyrs_g = {
                name = {
                    '一张超帅的自带蓝色火焰',
                    '的骷髅头背板，',
                    '且键盘上的“g”键正在发光',
                },
                text = {
                    '如果第一手牌拼出了单词',
                    '且以 {C:white,X:blue}g{} 开头',
                    '{E:akyrs_shrivel,C:red}销毁所有打出的牌{}',
                    '并将手牌中所有卡牌增强为 {C:blue}闪电卡{}'
                }
            },
            j_akyrs_d_se_dab = {
                name = "D 代表 Dab",
                text = {
                    '当打出至少 {C:attention}3 种不同{}的增强卡时',
                    '手牌和场上带有字母 {C:attention}D{} 的卡牌',
                    '永久{C:attention}获得{} {C:white,X:chips} X#1# {} 筹码',
                    '{C:inactive,s:0.8}酷衣服 + 态度 + 搞怪手势'
                }
            },
            j_akyrs_c = {
                name = "c",
                text = {
                    '带有字母 {C:attention}C{} 的卡牌',
                    '计分时每张提供 {C:chips}+#1#{} 筹码',
                    '{C:inactive,s:0.8}播放 Tobu - Cloud 9 中的 C 调'
                }
            },
            j_akyrs_koshitan = {
                name = {
                    "{f:5}虎视虎子",
                    "{s:0.7}Koshi Torako"
                },
                text = {
                    '选择盲注时',
                    '扣除 {C:money}$#1#{} 并',
                    '为该小丑的{C:money}售价{}转入 {C:money}$#2#{}',
                }
            },
            j_akyrs_nokotan = {
                name = {
                    "{f:5}鹿乃子乃子",
                    "{s:0.7}Shikanoko Noko"
                },
                text = {
                    '提供相当于其{C:attention}左右相邻{}小丑',
                    '{C:attention}合计售价{}之 {C:mult}#1#X{} 倍的倍率',
                    "{C:inactive}(当前为 {C:mult}+#2#{C:inactive} 倍率)",
                }
            },
            j_akyrs_koshian = {
                name = {
                    "{f:5}虎视馅子",
                    "{s:0.7}Koshi Anko"
                },
                text = {
                    '此小丑的{C:money}售价{}等于',
                    '基础几率 {C:attention}2 in 2{} 下',
                    '概率的{C:green}分子与分母之和{}',
                    "{C:inactive}(当前为 {C:green}#1# in #2#{C:inactive})",
                }
            },
            j_akyrs_bashame = {
                name = {
                    "{f:5}马车芽芽",
                    "{s:0.7}Bashame Meme"
                },
                text = {
                    '每当计分一张{C:attention}树荫卡{}时，',
                    '此小丑增加 {C:money}$#1#{} 的{C:attention}售价{}',
                }
            },
            j_akyrs_e = {
                name = "E",
                text = {
                    '带有字母 {C:attention}E{} 的卡牌',
                    '计分时每张提供 {C:mult}+#1#{} 倍率',
                    '{C:inactive,s:0.8}为什么他们要把 Markiplier 的脸贴在法克大人脸上？'
                }
            },
            j_akyrs_catchphrase = {
                name = "口头禅",
                text = {
                    '持在手中的字母 {C:attention}H{}',
                    '计分时每张提供 {C:mult}+#1#{} 倍率',
                    '{C:inactive,s:0.8}哈！哈哈哈！'
                }
            },
            j_akyrs_furina = {
                name = "芙宁娜，水神",
                text = {
                    '打出手牌时',
                    '获得 {C:red}+#1#{} 弃牌数'
                }
            },
            j_akyrs_gift_voucher = {
                name = "礼品券",
                text = {
                    '商店中 {C:attention}#1#{} 牌是免费的',
                    "回合结束时{C:attention}转变{}为不同的消耗牌类型",
                }
            },
            j_akyrs_press_f = {
                name = "按 {X:grey}F{} 表达敬意",
                text = {
                    "如果{C:attention}手牌{}包含",
                    "单张 {C:attention}F{}，销毁它并",
                    "创建一张 {C:akyrs_umbral_p,X:akyrs_umbral_y}幽影{}卡",
                    "{C:inactive}(必须有空位)",
                }
            },
            j_akyrs_ojisan_koubun = {
                name = {
                    "{f:5}大叔句式😁❗", 
                    "{s:0.7}Ojisan Koubun",
                },
                text = {
                    "如果打出手牌的{C:attention}第一个字母",
                    "与上一个打出{C:attention}单词{} (#1#)",
                    "的{C:attention}最后一个字母{}一致，",
                    "创建一张{C:attention}双倍标签(Double Tag)",
                }
            },
            j_akyrs_sushi = {
                name = {
                    "寿司",
                },
                text = {
                    "{C:chips}+#1#{} 筹码",
                    "从商店{C:attention}购买{}小丑时，",
                    "获得 {C:chips}#2#{} 筹码",
                }
            },
            j_akyrs_biochamber = {
                name = {
                    "生物舱",
                },
                text = {
                    "打出手牌时创建一个{C:attention}营养液",
                    "{C:inactive}(必须有空位)",
                }
            },
            j_akyrs_nutrient = {
                name = {
                    "营养液",
                },
                text = {
                    "{C:white,X:chips}X#1#{} 筹码",
                    "回合结束时变为",
                    "{C:white,X:chips}-X#2#{} 筹码",
                }
            },
            j_akyrs_shine_bright_like_a_diamond = {
                name = {
                    "像钻石一样闪耀",
                },
                text = {
                    "为每一手{C:attention}打出的{}手牌",
                    "添加一张永久的{C:attention}方片 A{}",
                }
            },
            j_akyrs_so_close = {
                name = {
                    "差一点！",
                },
                text = {
                    "如果手牌包含{C:attention}两对",
                    "手牌中持有的每张牌使分数增加",
                    "盲注需求的 {C:purple}#1#%{}",
                }
            },
            j_akyrs_snow_pea = {
                name = {
                    "寒冰射手",
                },
                text = {
                    "{C:white,X:purple}X#1#{} 分数",
                }
            },
        },
        Akyrs_Dialog = {
            akyrs_balance_dialog_intro = {
                name = "", 
                text = {
                    "你好！感谢并欢迎使用 {E:akyrs_rainbow_wiggle}Aikoyori 的胡闹{}",
                    "我是 {E:2,C:dark_edition}Aikoyori{}，我将引导你进行",
                    "一些必要的设置。我们开始吧！"
                }
            },
            akyrs_balance_dialog_intro_again = {
                name = "", 
                text = {
                    "又见面了！由于你之前的",
                    "{E:akyrs_rainbow_wiggle}Aikoyori 的胡闹{} 游戏记录，",
                    "我检测到了一些需要处理的 {E:1,C:attention}更改{}",
                    "让我们先把这些事情办完。"
                }
            },
            akyrs_balance_dialog_cryptid = {
                name = "", 
                text = {
                    "嗯……看来已安装 {E:2,C:blue}Cryptid{}。",
                    "我将自动应用 {E:1,C:red}荒谬 (Absurd){} 平衡设置。",
                    "如果你想将其更改为 {E:2,C:green}适度 (Adequate{})，",
                    "你可以随时在模组配置中更改。",
                }
            },
            akyrs_balance_dialog_playbook = {
                name = "", 
                text = {
                    "哇哦！看来已安装 {E:2,C:dark_edition}Playbook{}。",
                    "我将自动应用 {E:1,C:red}荒谬 (Absurd){} 平衡设置。",
                    "如果你想将其更改为 {E:2,C:green}适度 (Adequate{})，",
                    "你可以随时在模组配置中更改。",
                }
            },
            akyrs_balance_dialog_multiplayer_initialise = {
                name = "", 
                text = {
                    "咦？已安装 {E:2,C:dark_edition}Balatro Multiplayer{}。",
                    "出于平衡因素，我将把游戏设置为",
                    "{E:2,C:green}适度 (Adequate){} 平衡。",
                    "在 {E:2,C:dark_edition}Balatro Multiplayer{} 激活期间，",
                    "你将无法更改此项。部分内容也将{E:2,C:dark_edition}不可用{}。",
                }
            },
            akyrs_balance_dialog_multiplayer_start_from_already_set_profile = {
                name = "", 
                text = {
                    "看来在这个 {E:1,C:red}荒谬{} 的存档中，",
                    "曾经安装过 {E:2,C:dark_edition}Balatro Multiplayer{}。",
                    "出于平衡因素，我必须将游戏设置为",
                    "{E:2,C:green}适度 (Adequate){} 平衡。",
                    "在 {E:2,C:dark_edition}Balatro Multiplayer{} 激活期间，",
                    "你将无法更改此项。部分内容也将{E:2,C:dark_edition}不可用{}。",
                }
            },
            akyrs_balance_dialog_details = {
                name = "", 
                text = {
                    "此模组包含 {E:2,C:green}适度 (Adequate){} 平衡",
                    "和 {E:1,C:red}荒谬 (Absurd){} 平衡。",
                    "- {E:2,C:green}适度{} - 预期的游戏体验。",
                    "基于原版平衡，但更具独特性。",
                    "- {E:1,C:red}荒谬{} (需要 Talisman) - 更大的数字、",
                    "特殊能力、更疯狂的效果、更严重的后果。",
                    "{C:inactive}--------------------------------------------------------",
                    "你可以在模组设置中随时更改这些选项。"
                }
            },
        },
        Other={
            akyrs_self_destructs={
                name="自毁",
                text={
                    "在回合结束时",
                    "{C:red}自毁{}",
                },
            },
            akyrs_sigma={
                name="Sigma",
                text={
                    "{C:red}不可移除{}且",
                    "{C:red}不可摧毁{}",
                    "{C:inactive,s:0.8}我该怎么摆脱他？",
                },
            },
            akyrs_oxidising={
                name="氧化",
                text={
                    "{C:red}#1#%{} 几率不触发",
                    "在 {C:attention}#3#{} #4# 内变为",
                    "{C:attention}#2#{} {C:inactive}(+#5#%){}",
                },
            },
            akyrs_oxidising_full={
                name="氧化",
                text={
                    "{C:red}#1#%{} 几率不触发",
                },
            },
            akyrs_attention={
                name="注意",
                text={
                    "{C:red}无法弃掉{}",
                    "{C:attention}必须打出{}",
                    "打出后 {C:red}自毁{}",
                },
            },
            akyrs_concealed={
                name="隐藏",
                text={
                    "此卡的能力{C:red}始终隐藏{}",
                },
            },
            akyrs_crystalised={
                name="结晶",
                text={
                    "打出时手牌{C:red}不计分{}",
                    "{C:attention}打出后{}移除此贴纸",
                },
            },
            akyrs_latticed={
                name="晶格",
                text={
                    "{C:red}无法{}通过正常手段出售",
                },
            },
            akyrs_sus={
                name="Suspicious (可疑)",
                text={
                    "在回合结束时",
                    "{C:red}随机{}更改其",
                    "{C:attention}花色{}或{C:attention}点数{}",
                },
            },
            akyrs_sale={
                name="九折优惠 (90% Sale)",
                text={
                    "在回合结束时",
                    "失去 {C:money}$#1#{}",
                },
            },
            akyrs_carmine_seal={
                name="胭脂红密封",
                text={
                    "在回合的{C:attention}第一手牌{}中",
                    "始终不会被削弱 (Undebuffed)",
                },
            },
            akyrs_neon_seal={
                name="霓虹密封",
                text={
                    "打出手牌时，根据持有或打出的",
                    "带{C:attention}霓虹密封{}的卡牌数量（{C:attention}取较小值{}），",
                    "创建一张{C:akyrs_umbral_p,X:akyrs_umbral_y}幽影{}卡",
                    "{C:inactive}(必须有空位)",
                },
            },
            akyrs_twin_seal={
                name="孪生密封",
                text={
                    "计分时，复制一个{C:attention}随机{}小丑牌的",
                    "{C:attention}主要{}能力",
                    "{C:inactive}(不会复制针对单张卡牌的能力){}",
                },
            },
            akyrs_fault_seal={
                name="断层密封",
                text={
                    "如果打出的手牌全部带有{C:attention}断层密封{}，",
                    "则有 {C:green}基础 1 in x{C:green,E:akyrs_exponent,s:0.7}2{C:green} 几率{} 额外触发 {C:attention}x{} 次",
                    "其中 {C:attention}x{} 为打出的卡牌数量",
                    "{C:inactive}(当前为 {C:green}#1# in #2#{C:inactive} -> {C:attention}#3# {C:inactive}次)",
                },
            },
            akyrs_deformed_seal={
                name="畸变密封",
                text={
                    "打出此卡时，创建此卡的一张",
                    "{C:attention}自毁{}副本并加入到{C:attention}打出的手牌{}中",
                },
            },
            akyrs_chip_mult_xchip_xmult={
                name="提供",
                text={
                    "每张计分卡提供：",
                    "{C:chips}+#1#{} 筹码 {C:mult}+#2#{} 倍率",
                    "{X:chips,C:white} X#3# {} 筹码 {X:mult,C:white} X#4# {} 倍率",
                },
            },
            akyrs_gain_chip_mult_xchip_xmult={
                name="小丑获得",
                text={
                    "小丑获得：",
                    "{C:chips}+#1#{} 筹码 {C:mult}+#2#{} 倍率",
                    "{X:chips,C:white} X#3# {} 筹码 {X:mult,C:white} X#4# {} 倍率",
                },
            },
            akyrs_tsunagite_scores={
                name="总计",
                text={
                    "当前总计：",
                    "{s:1.2,C:attention}#1#{}",
                },
            },
            akyrs_tsunagite_name={
                name="小丑名称",
                text={
                    "{s:1.5}Tsunagite",
                    "{C:inactive,s:0.9}(系ぎて / 牵手)"
                },
            },
            akyrs_hardcore_challenge_locked = {
                name = "已锁定",
                text={
                    "赢得一场挑战赛以解锁",
                    "{C:attention}核心挑战{}模式",
                },
            },
            undiscovered_umbral = {
                name="未发现",
                text={
                    "在非种子跑局中",
                    "购买或使用此卡",
                    "以了解其功能",
                },
            },
            undiscovered_replicant = {
                name="未发现",
                text={
                    "在非种子跑局中",
                    "购买或使用此卡",
                    "以了解其功能",
                },
            },
            pinned_left={
                name="钉住",
                text={
                    "此卡将始终",
                    "固定在最左侧位置",
                },
            },
            akyrs_playing_card_suit={
                text={
                    "{V:1}#2#",
                },
            },
            akyrs_playing_card_rank={
                text={
                    "{C:light_black}#1#",
                },
            },
            akyrs_no_rank = {
                text = { "无点数" }
            },
            akyrs_no_suit = {
                text = { "无花色" }
            },
            
            akyrs_perma_score = {
                text = {
                    "{C:purple}#1#{} 分数",
                },
            },
            akyrs_perma_h_score = {
                text = {
                    "持在手中时：{C:purple}#1#{} 分数",
                },
            },
            akyrs_perma_xscore = {
                text = {
                    "{X:purple,C:white}X#1#{} 分数",
                },
            },
            akyrs_perma_h_xscore = {
                text = {
                    "持在手中时：{X:purple,C:white}X#1#{} 分数",
                },
            },
            -- booster packs
            p_akyrs_letter_pack_normal = { 
                name = "字母卡包",
                text={
                    "从多达 {C:attention}#2#{} 张{C:attention}字母卡{}中",
                    "选择 {C:attention}#1#{} 张保留使用",
                },
            },
            p_akyrs_letter_pack_jumbo = { 
                name = "巨型字母卡包",
                text={
                    "从多达 {C:attention}#2#{} 张{C:attention}字母卡{}中",
                    "选择 {C:attention}#1#{} 张保留使用",
                },
            },
            p_akyrs_letter_pack_mega = { 
                name = "超级字母卡包",
                text={
                    "从多达 {C:attention}#2#{} 张{C:attention}字母卡{}中",
                    "选择 {C:attention}#1#{} 张保留使用",
                },
            },
            p_akyrs_umbral_pack_normal = {
                name="幽影卡包",
                text={
                    "从多达 {C:attention}#2#{} 张{C:akyrs_umbral_p,X:akyrs_umbral_y}幽影{}卡中",
                    "选择 {C:attention}#1#{} 张即刻使用",
                },
            },
            p_akyrs_umbral_pack_jumbo = {
                name="巨型幽影卡包",
                text={
                    "从多达 {C:attention}#2#{} 张{C:akyrs_umbral_p,X:akyrs_umbral_y}幽影{}卡中",
                    "选择 {C:attention}#1#{} 张即刻使用",
                },
            },
            p_akyrs_umbral_pack_mega = {
                name="超级幽影卡包",
                text={
                    "从多达 {C:attention}#2#{} 张{C:akyrs_umbral_p,X:akyrs_umbral_y}幽影{}卡中",
                    "选择 {C:attention}#1#{} 张即刻使用",
                },
            },
            p_akyrs_replica_pack_normal = {
                name="复制卡包",
                text={
                    "从多达 {C:attention}#2#{} 张 {C:akyrs_replicant_o}复制人{}卡中",
                    "选择 {C:attention}#1#{} 张即刻使用",
                },
            },
            p_akyrs_replica_pack_jumbo = {
                name="巨型复制卡包",
                text={
                    "从多达 {C:attention}#2#{} 张 {C:akyrs_replicant_o}复制人{}卡中",
                    "选择 {C:attention}#1#{} 张即刻使用",
                },
            },
            p_akyrs_replica_pack_mega = {
                name="超级复制卡包",
                text={
                    "从多达 {C:attention}#2#{} 张 {C:akyrs_replicant_o}复制人{}卡中",
                    "选择 {C:attention}#1#{} 张即刻使用",
                },
            },
            akyrs_copper_sticker={
                name="铜注贴纸",
                text={
                    "使用此小丑并在",
                    "{C:attention}铜注 (Copper){} 难度下获胜",
                },
            },
            akyrs_inner_sticker={
                name="内注贴纸",
                text={
                    "使用此小丑并在",
                    "{C:attention}内注 (Inner){} 难度下获胜",
                },
            },
            akyrs_outer_sticker={
                name="外注贴纸",
                text={
                    "使用此小丑并在",
                    "{C:attention}外注 (Outer){} 难度下获胜",
                },
            },
            akyrs_lime_sticker={
                name="青柠贴纸",
                text={
                    "使用此小丑并在",
                    "{C:attention}青柠 (Lime){} 难度下获胜",
                },
            },
            akyrs_lemon_sticker={
                name="柠檬贴纸",
                text={
                    "使用此小丑并在",
                    "{C:attention}柠檬 (Lemon){} 难度下获胜",
                },
            },
            akyrs_turquoise_sticker={
                name="松石贴纸",
                text={
                    "使用此小丑并在",
                    "{C:attention}松石 (Turquoise){} 难度下获胜",
                },
            },
            akyrs_amethyst_sticker={
                name="紫晶贴纸",
                text={
                    "使用此小丑并在",
                    "{C:attention}紫晶 (Amethyst){} 难度下获胜",
                },
            },
            akyrs_wooden_sticker={
                name="木头贴纸",
                text={
                    "使用此小丑并在",
                    "{C:attention}木头 (Wooden){} 难度下获胜",
                },
            },
            akyrs_bismuth_sticker={
                name="铋注贴纸",
                text={
                    "使用此小丑并在",
                    "{C:attention}铋注 (Bismuth){} 难度下获胜",
                },
            },
            akyrs_high_contrast_sticker={
                name="高对比度贴纸",
                text={
                    "使用此小丑并在",
                    "{C:attention}高对比度 (High Contrast){} 难度下获胜",
                },
            },
            akyrs_hydrogel_sticker={
                name="水凝胶贴纸",
                text={
                    "使用此小丑并在",
                    "{C:attention}水凝胶 (Hydrogel){} 难度下获胜",
                },
            },
            akyrs_spotify_sticker={
                name="Spotify 贴纸",
                text={
                    "使用此小丑并在",
                    "{C:attention}Spotify{} 难度下获胜",
                },
            },
            akyrs_aluminium_sticker={
                name="铝注贴纸",
                text={
                    "使用此小丑并在",
                    "{C:attention}铝注 (Aluminium){} 难度下获胜",
                },
            },
            akyrs_steam_sticker={
                name="Steam 贴纸",
                text={
                    "使用此小丑并在",
                    "{C:attention}Steam{} 难度下获胜",
                },
            },
            akyrs_netherite_sticker={
                name="下界合金贴纸",
                text={
                    "使用此小丑并在",
                    "{C:attention}下界合金 (Netherite){} 难度下获胜",
                },
            },
            akyrs_doom_sticker={
                name="末日贴纸",
                text={
                    "使用此小丑并在",
                    "{C:attention}末日 (Doomsday){} 难度下获胜",
                },
            },
        },
        Planet={
            c_akyrs_p_ara={
                name="天坛座 (Ara)",
                text={
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} 提升",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} 倍率与",
                    "{C:chips}+#4#{} 筹码",
                },
            },
            c_akyrs_p_crux={
                name="南十字座 (Crux)",
                text={
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} 提升",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} 倍率与",
                    "{C:chips}+#4#{} 筹码",
                },
            },
            c_akyrs_p_indus={
                name="印第安座 (Indus)",
                text={
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} 提升",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} 倍率与",
                    "{C:chips}+#4#{} 筹码",
                },
            },
            c_akyrs_p_puppis={
                name="船尾座 (Puppis)",
                text={
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} 提升",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} 倍率与",
                    "{C:chips}+#4#{} 筹码",
                },
            },
            c_akyrs_p_lacerta={
                name="蝎虎座 (Lacerta)",
                text={
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} 提升",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} 倍率与",
                    "{C:chips}+#4#{} 筹码",
                },
            },
            c_akyrs_p_eridanus={
                name="波江座 (Eridanus)",
                text={
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} 提升",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} 倍率与",
                    "{C:chips}+#4#{} 筹码",
                },
            },
            c_akyrs_p_reticulum={
                name="网罟座 (Reticulum)",
                text={
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} 提升",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} 倍率与",
                    "{C:chips}+#4#{} 筹码",
                },
            },
            c_akyrs_p_horologium={
                name="时钟座 (Horologium)",
                text={
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} 提升",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} 倍率与",
                    "{C:chips}+#4#{} 筹码",
                },
            },
            c_akyrs_p_telescopium={
                name="望远镜座 (Telescopium)",
                text={
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} 提升",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} 倍率与",
                    "{C:chips}+#4#{} 筹码",
                },
            },
            c_akyrs_p_microscopium={
                name="显微镜座 (Microscopium)",
                text={
                    "{S:0.8}({S:0.8,C:red}lvl.???{S:0.8}){} 提升",
                    "{C:attention}#1#",
                    "和更长的单词牌型",
                },
            },
            c_akyrs_planet_bishop_ring = {
                name="主教环 (Bishop Ring)",
                text={
                    "{S:0.8}({S:0.8,C:red}lvl.#1#{S:0.8}){} 提升",
                    "{C:attention}纯净牌型",
                    "倍率因子：{C:mult}#2#{} + {C:attention}#3#",
                },
            }
        },
        Spectral={},
        Stake={
            stake_akyrs_copper = {
                name = "铜注 (Copper Stake)",
                text = {
                    "卡牌可能带有 {C:attention}氧化{} 贴纸",
                    "{s:0.8}应用白注效果",
                }
            },
            stake_akyrs_inner = {
                name = "内注 (Inner Stake)",
                text = {
                    "{C:blue}+1{} 手牌上限",
                }
            },
            stake_akyrs_outer = {
                name = "外注 (Outer Stake)",
                text = {
                    "{C:blue}+1{} 出手次数",
                }
            },
            stake_akyrs_lime = {
                name = "青柠注 (Lime Stake)",
                text = {
                    "{C:red}X1.5{} 盲注需求分数",
                    "{s:0.8}应用氧化注效果",
                }
            },
            stake_akyrs_lemon = {
                name = "柠檬注 (Lemon Stake)",
                text = {
                    "底注需求{C:attention}更快{}增长",
                    "{s:0.8}应用氧化注效果",
                }
            },
            stake_akyrs_turquoise = {
                name = "松石注 (Turquoise Stake)",
                text = {
                    "初始金钱增加 {C:money}$1{}",
                    "同时应用青柠注和柠檬注效果",
                }
            },
            stake_akyrs_amethyst = {
                name = "紫晶注 (Amethyst Stake)",
                text = {
                    "每回合随机一张游戏卡牌获得 {C:attention}结晶{} 贴纸",
                    "{S:0.8}(打出时不计分，打出后移除贴纸)",
                    "初始额外 {C:blue}+1{} 出手次数",
                    "{s:0.8}应用松石注效果",
                }
            },
            stake_akyrs_wooden = {
                name = "木头注 (Wooden Stake)",
                text = {
                    "选择盲注时，向牌组加入一张随机游戏卡牌",
                    "{s:0.8}应用紫晶注效果",
                }
            },
            stake_akyrs_bismuth = {
                name = "铋注 (Bismuth Stake)",
                text = {
                    "小丑牌可能带有 {C:attention}晶格{} 贴纸",
                    "{S:0.8}(无法通过正常手段出售)",
                    "{s:0.8}应用木头注效果",
                }
            },
            stake_akyrs_high_contrast = {
                name = "高对比度注 (High Contrast Stake)",
                text = {
                    "底注需求{C:attention}极速{}增长",
                    "{s:0.8}应用铋注效果",
                }
            },
            stake_akyrs_hydrogel = {
                name = "水凝胶注 (Hydrogel Stake)",
                text = {
                    "每回合随机一张游戏卡牌获得 {C:attention}Sus{} 贴纸",                    
                    "{s:0.8}(回合结束随机改变花色或点数)",
                    "{s:0.8}应用高对比度注效果",
                }
            },
            stake_akyrs_spotify = {
                name = "Spotify 注 (Spotify Stake)",
                text = {
                    "击败{C:attention}大牌盲注{}时，",
                    "随机一个小丑获得 {C:money}租用 (Rental){} 贴纸",
                    "{s:0.8}应用水凝胶注效果",
                }
            },
            stake_akyrs_aluminium = {
                name = "铝注 (Aluminium Stake)",
                text = {
                    "{C:red}+1{} 获胜底注目标",
                    "{s:0.8}应用 Spotify 注效果",
                }
            },
            stake_akyrs_steam = {
                name = "Steam 注 (Steam Stake)",
                text = {
                    "商店中许多卡牌带有 {C:red}九折 (Sale){} 贴纸",
                    "(回合结束失去 {C:money}$0.5{})",
                    "{s:0.8}应用铝注效果",
                }
            },
            stake_akyrs_netherite = {
                name = "下界合金注 (Netherite Stake)",
                text = {
                    "初始金钱增加 {C:money}$2{} 且 {C:red}+1{} 弃牌数",
                    "{s:0.8}同时应用 Steam 注和金注效果",
                }
            },
            stake_akyrs_doom = {
                name = "末日注 (Doomsday Stake)",
                text = {
                    "卡牌可能带有 {C:attention}自毁{} 贴纸",
                    "在回合结束时{C:red}自毁{}",
                    "{s:0.8}应用下界合金注效果",
                }
            },
        },
        Tag={
            tag_akyrs_spell_itself_tag={
                name="拼出 Tag 的标签",
                text={
                    "获得一个免费的",
                    "{C:blue}超级字母卡包",
                },
            },
            tag_akyrs_umbral_tag={
                name="幽影标签",
                text={
                    "获得一个免费的",
                    "{C:akyrs_umbral_p}超级幽影卡包",
                },
            },
        },
        Tarot={
            c_akyrs_wof_nopes = {
                name="命运之轮 (修改版)",
                text={
                    "毫无作用。",
                },
            },
        },
        Voucher={
            v_akyrs_alphabet_soup={
                name="字母汤",
                text={
                    "游戏卡牌上会出现{C:attention}字母{}",
                    "可以使用游戏卡牌来拼写单词",
                    "{C:akyrs_playable}+#1#{} 可选卡牌上限"
                },
            },
            v_akyrs_crossing_field={
                name="Crossing Field (交叉领域)",
                text={
                    "{C:attention}字母{}会根据它们的",
                    "{C:attention}拼字游戏分值{}提供 {C:mult}倍率{}",
                    "{C:akyrs_playable}+#1#{} 可选卡牌上限"
                },
            },
            v_akyrs_banquet={
                name="宴会",
                text={
                    "{C:akyrs_playable}+#1#{} 可选卡牌上限",
                    "{C:blue}+#1#{} 手牌上限",
                },
            },
            v_akyrs_worlds_end={
                name="世界尽头",
                text={
                    "{C:akyrs_playable}+#1#{} 可选卡牌上限",
                    "{C:blue}+#1#{} 手牌上限",
                },
            },
        },
        AikoyoriExtraBases={
            null_card = { name = '空', text = { '一张简单的空白卡','上面什么也没有'},},
            lettersMult = {name = '',text = { '{C:mult}+#2#{} 倍率'},},
            lettersXMult = {name = '',text = { '{C:white,X:mult}X#3#{} 倍率'},},
            letterCardFrequency = {name = '',text = { '频率：{C:attention}#4#'},},
            lettersWild = {name = '通配卡',text = { '可以设置为特定字母', '但没有计分效果'},},
            letters = {name = '字母卡',text = { '{s:1.4,C:attention}#1#','允许打出','单词牌型'},},
            symbols = {name = '符号卡',text = { '{s:1.4,C:attention}#1#','这些符号','在特定情况下使用'},},
            numbers = {name = '数字卡',text = { '{s:1.4,C:attention}#1#','允许创建','数学表达式'},},
        },
        Sleeve = {
            sleeve_akyrs_letter = {
                name = "字母卡套",
                text = { 
                    "开始时已启用{C:red}字母{}机制",
             }
            },
            sleeve_akyrs_letter_alt = {
                name = "字母卡套",
                text = { 
                    "开始时具有：",
                    "{C:white,X:dark_edition}X#1#{} 卡组大小",
                    "{C:red}+#2#{} 弃牌数",
                    "{C:blue}+#3#{} 手牌上限",
                    "{C:red}X#4#{} 基础盲注大小",
             }
            },
            sleeve_akyrs_letter_math_pro = {
                name = "数学卡组专业版",
                text = { 
                    "开始时额外获得",
                    "{C:attention}2{} 套{C:attention}英文字母{}",
                    "和 {C:attention}4{} 个等号",
                    "{C:blue}+#1#{} 额外出手次数",
                    "{C:attention}+#2#{} 额外手牌上限",
                    "{C:red}+#3#{} 额外弃牌数",
             }
            },
            sleeve_akyrs_freedom = {
                name = "自由卡套",
                text = { 
                    "开始时带有 {C:attention,T:b_akyrs_freedom_deck}自由卡组",
             }
            },
            sleeve_akyrs_freedom_ultimate = {
                name = "终极自由",
                text = { 
                    "开始时带有 {C:attention,T:b_akyrs_freedom_deck_ultimate}终极自由卡组",
             }
            },
            sleeve_akyrs_cry_misprint_ultima = {
                name = "终极错印卡套",
                text = { 
                    "开始时带有 {C:attention,T:b_akyrs_cry_misprint_ultima}终极错印卡组",
             }
            },
        },
        Umbral = {
            c_akyrs_umbral_graduate = {
                name="毕业生 (Graduate)",
                text = {
                    "创建本局跑局中使用的",
                    "上一张{C:akyrs_umbral_p,X:akyrs_umbral_y}幽影{}卡",
                    "{s:0.8,C:akyrs_umbral_p,X:akyrs_umbral_y}毕业生{s:0.8} 除外",
                },
            },
            c_akyrs_umbral_realist = {
                name="现实主义者 (Realist)",
                text = {
                    "将多达 {C:attention}#1#{} 张所选卡牌",
                    "增强为 {C:attention}曝晒卡 (Insolate Cards){}",
                },
            },
            c_akyrs_umbral_tribal = {
                name="部落 (Tribal)",
                text = {
                    "为所选的{C:attention}牌型{}创建一张{C:planet}星球卡{}",
                    "{C:inactive}(当前选中 {C:attention}#1#{C:inactive}，将创建 {C:attention}#2#{C:inactive})",
                },
            },
            c_akyrs_umbral_gambit = {
                name="弃兵 (Gambit)",
                text = {
                    "将手中多达 {C:attention}#1#{} 张随机卡牌",
                    "转换为 {C:attention}国王{}、{C:attention}王后{}或{C:attention}A{}",
                },
            },
            c_akyrs_umbral_kingpin = {
                name="主脑 (Kingpin)",
                text = {
                    "向手中添加 {C:attention}#1#{} 张带有密封的",
                    "{C:attention}钉住 (Pinned){} 国王",
                },
            },
            c_akyrs_umbral_tea_time = {
                name="茶歇时间 (Tea Time)",
                text={
                    "将 {C:attention}#1#{} 张所选卡牌增强为",
                    "一张{C:attention}随机茶卡 (Tea Cards){}",
                },
            },
            c_akyrs_umbral_break_up = {
                name="分手 (Break Up)",
                text={
                    "将 {C:attention}#1#{} 张所选卡牌拆分为",
                    "{C:attention}纯花色{}和{C:attention}纯点数{}卡牌",
                    "{C:inactive}(如果可能的话)"
                },
            },
            c_akyrs_umbral_public_transport = {
                name="公共交通 (Public Transport)",
                text={
                    "为 {C:attention}#2#{} 张所选卡牌创建",
                    "{C:attention}#1#{} 张点数{C:attention}连续{}的副本",
                    "{C:inactive}(可以按点数增减方向复制)",
                },
            },
            c_akyrs_umbral_corruption = {
                name="贪腐 (Corruption)",
                text={
                    "有 {C:green}50-50 几率{} 复制或",
                    "{C:red}销毁{} 手中 {C:attention}一半{} 的卡牌"
                },
            },
            c_akyrs_umbral_fomo = {
                name="错失恐惧 (FOMO)",
                text={
                    "以 {C:money}$#2#{} 随机赎回 #1# 个",
                    "曾在商店中出现但{C:attention}尚未兑换{}的{C:attention}代金券{}",
                },
            },
            c_akyrs_umbral_misfortune = {
                name="噩运 (Misfortune)",
                text={
                    {
                        "将 {C:attention}#1#{} 张所选卡牌",
                        "增强为 {C:attention}? 卡{}",
                    },
                    {
                        "如果该卡已经是 {C:attention}? 卡{}，",
                        "则增强为 {C:attention}项目箱卡 (Item Box Cards){}",
                    },
                }
            },
            c_akyrs_umbral_book_smart = {
                name="死读书 (Book Smart)",
                text={
                    "创建多达 {C:attention}#1#{} 张随机",
                    "{C:akyrs_umbral_p,X:akyrs_umbral_y}幽影{}卡",
                    "{C:inactive}(必须有空位){}"
                },
            },
            c_akyrs_umbral_prisoner = {
                name="阶下囚 (Prisoner)",
                text=
                {
                    "将 {C:attention}#1#{} 张所选卡牌",
                    "增强为 {C:attention}砖头卡 (Brick Cards){}",
                },
            },
            c_akyrs_umbral_overgrowth = {
                name="过度生长 (Overgrowth)",
                text=
                {
                    "将 {C:attention}#1#{} 张所选卡牌",
                    "增强为 {C:attention}树荫卡 (Canopy Cards){}",
                },
            },
            c_akyrs_umbral_intrusive_thoughts = {
                name="侵入性思维",
                text={
                    {
                        "获得 {X:money,C:black}$X#1#{}，但有{C:green}固定 #2#% 几率{}",
                        "{E:1,C:red}将金钱设为 #3#{}",
                    },
                    
                    {
                        "{C:attention}出售{}此卡以查看{C:attention}你是否原本会赔钱{}",
                    }
                    },
            },
            c_akyrs_umbral_intrusive_thoughts_absurd = {
                name="侵入性思维",
                text={
                    {
                        "获得 {X:akyrs_money_x,C:akyrs_money_c}$^#1#{}，但有{C:green}固定 #2#% 几率{}",
                        "{E:1,C:red}立即输掉本局游戏{}",
                    },
                    
                    {
                        "{C:attention}出售{}此卡以查看{C:attention}你是否原本会输掉{}",
                    }
                    },
            },
            c_akyrs_umbral_weeping_angel = {
                name="哭泣天使 (Weeping Angel)",
                text=
                {
                    "{C:attention}翻转{}当前手中的所有卡牌",
                    "翻转后每张{C:attention}背面向上{}的卡牌提供 {C:money}+$#1#{}",
                },
            },
            c_akyrs_umbral_bunker = {
                name="地堡 (Bunker)",
                text=
                {
                    "选择手中 {C:attention}#1#{} 张卡牌",
                    "赋予其随机的{C:attention}增强、版本和密封{}",
                    "但会{C:attention}强制选中{}该牌",
                },
            },
            c_akyrs_umbral_rock = {
                name="岩石 (Rock)",
                text=
                {
                    "为手中{C:attention}所有卡牌{}赋予",
                    "{C:chips}+#1# {} 筹码的{C:attention}永久{}奖励",
                },
            },
            c_akyrs_umbral_crust = {
                name="地壳 (Crust)",
                text=
                {
                    "为手中所有{C:clubs}梅花{}卡牌赋予",
                    "{X:mult,C:white} X#1# {} 倍率的{C:attention}永久{}奖励",
                },
            },
            c_akyrs_umbral_mantle = {
                name="地幔 (Mantle)",
                text=
                {
                    "为手中所有{C:spades}黑桃{}卡牌赋予",
                    "{X:chips,C:white} X#1# {} 筹码的{C:attention}永久{}奖励",
                },
            },
            c_akyrs_umbral_core = {
                name="地核 (Core)",
                text=
                {
                    "为手中所有{C:hearts}红桃{}卡牌赋予",
                    "{C:money}+$#1#{} 的{C:attention}永久{}奖励",
                },
            },
            c_akyrs_umbral_atmosphere = {
                name="大气层 (Atmosphere)",
                text=
                {
                    "为手中所有{C:diamonds}方片{}卡牌赋予",
                    "{C:purple}+#1#{} 分数的{C:attention}永久{}奖励",
                    "{C:inactive}(下次使用将提供 {C:purple}+#2#{C:inactive} 分数)"
                },
            },
            c_akyrs_umbral_nyctophobia = {
                name="黑暗恐惧 (Nyctophobia)",
                text=
                {
                    "创建 {C:attention}#1# {}张随机的",
                    "{C:dark_edition}负面{C:tarot}塔罗卡{}",
                },
            },
            c_akyrs_umbral_puzzle = {
                name="拼图 (Puzzle)",
                text=
                {
                    "选择 {C:attention}#1#{} 张卡，将{C:attention}右侧{}卡牌的",
                    "{C:attention}花色、版本和密封{}应用到{C:attention}左侧{}卡牌上",
                    "然后{C:red}销毁{}右侧的卡牌",
                    "{C:inactive}(拖动以重新排序)",
                },
            },
            c_akyrs_umbral_electrify= {
                name="电气化 (Electrify)",
                text=
                {
                    "将 {C:attention}#1#{} 张所选卡牌",
                    "增强为 {C:attention}闪电卡 (Zap Card){}",
                },
            },
            c_akyrs_umbral_d1 = {
                name="D1",
                text=
                {
                    "为所有几率的{C:green}分子{}增加 {C:green}#1#{}",
                    "且{C:green}分母{}增加 {C:green}#2#{} {C:inactive}(如果可能的话)",
                    "{C:inactive}(注：最后应用)",
                },
            },
            c_akyrs_umbral_bounce= {
                name="弹跳 (Bounce)",
                text=
                {
                    "将 {C:attention}#1#{} 张所选卡牌",
                    "增强为 {C:attention}网卡 (Net Card){}",
                },
            },
            c_akyrs_umbral_hydrate= {
                name="补水 (Hydrate)",
                text=
                {
                    "将 {C:attention}#1#{} 张所选卡牌",
                    "增强为 {C:attention}水滴卡 (Droplet Cards){}",
                },
            },
            c_akyrs_umbral_exit_plan = {
                name="退出计划 (Exit Plan)",
                text=
                {
                    "有 {C:green}#1# in #2#{} 的几率",
                    "{C:attention}禁用{}盲注效果",
                },
            },
            c_akyrs_umbral_exit_plan_mp = {
                name="退出计划 (Exit Plan)",
                text=
                {
                    "有 {C:green}#1# in #2#{} 的几率",
                    "获得当前{C:attention}基础盲注需求{}之",
                    "{C:purple}#3#%{} 作为{C:purple}分数{}",
                    "{C:inactive}(当前为 {C:purple}+#4#{C:inactive} 分数)",
                },
            },
            c_akyrs_umbral_free_will = {
                name="自由意志 (Free Will)",
                text=
                {
                    "{C:akyrs_playable}+#1#{} 可选卡牌上限",
                },
            },
        },
        Replicant= {
            c_akyrs_replicant_forecast = {
                name = "预报 (Forecast)",
                text = {
                    "获得多达 {C:attention}#1#{} 张",
                    "{C:akyrs_replicant_o}复制人 (Replicant){} 卡",
                    "{C:inactive}(必须考虑剩余空位)",
                }
            },
            c_akyrs_replicant_connection = {
                name = "连接 (Connection)",
                text = {
                    "允许选择多达 {C:attention}#1#{} 张卡牌",
                    "来制作 #2# 张{C:attention}花色和点数都不同{}于原件的副本",
                    "制作出的副本将带有{C:purple}结晶 (Crystalised){} 贴纸",
                }
            },
            c_akyrs_replicant_steganography = {
                name = "隐写术 (Steganography)",
                text = {
                    "获得多达 {C:attention}#1#{} 张",
                    "隐藏的{C:red}稀有{}小丑",
                    "{C:inactive}(必须考虑剩余空位)",
                }
            },
            c_akyrs_replicant_database = {
                name = "数据库 (Database)",
                text = {
                    "选择多达 {C:attention}#1#{} 张随机卡牌",
                    "将其{C:attention}返回{}到牌组",
                    "暂时获得 {C:red}+#2#{} 弃牌数"
                }
            },
            c_akyrs_replicant_short_form_content = {
                name = "短视频 (Short Form Content)",
                text = {
                    "立即开始一场随机的{C:attention}对决盲注 (Showdown Blind){}",
                    "如果将其{C:attention}击败{}，增加 {C:attention}#1#{} 底注上限",
                    "{C:inactive}(必须在选择盲注时使用)",
                }
            },
            c_akyrs_replicant_short_form_content_mp = {
                name = "短视频 (Short Form Content)",
                text = {
                    "立即开始一场随机的{C:attention}对决盲注 (Showdown Blind){}",
                    "如果将其{C:attention}击败{}，获得 {C:attention}+#1#{} 生命",
                    "{C:inactive}(必须在选择盲注时使用)",
                }
            },
            c_akyrs_replicant_smart_home = {
                name = "智能家居 (Smart Home)",
                text = {
                    "选择卡牌组成的{C:attention}牌型{}",
                    "将被{C:attention}升级{} #1# 次",
                    "然后为选中的牌贴上{C:attention}注意 (Attention){} 贴纸",
                    "{C:inactive}(当前选中 {C:attention}#1#{C:inactive})",
                }
            },
            c_akyrs_replicant_music_streaming = {
                name = "流媒体音乐 (Music Streaming)",
                text = {
                    "选择多达 {C:attention}#1#{} 个小丑",
                    "使其变为{C:attention}易损 (Perishable{})，",
                    "然后创建{C:attention}等量{}的{C:dark_edition}负面{C:spectral}光谱卡{}",
                }
            },
            c_akyrs_replicant_file_sharing = {
                name = "文件共享 (File Sharing)",
                text = {
                    "选择恰好 {C:attention}#1#{} 张卡牌",
                    "交换它们的位置",
                }
            },
            c_akyrs_replicant_ota = {
                name = "无线更新 (OTA)",
                text = {
                    "选择 {C:attention}#1#{} 个随机小丑",
                    "使其变为{C:attention}租用 (Rental{})，",
                    "然后创建{C:attention}等量{}的{C:dark_edition}负面{C:tarot}塔罗卡{}",
                }
            },
            c_akyrs_replicant_daw = {
                name = "音频工作站 (DAW)",
                text = {
                    "手中所有卡牌的增强状态",
                    "{C:attention}随机化{}为一种{C:attention}音符卡 (Note Cards){}",
                    "{C:inactive}(更大概率获得时值更长的音符)",
                }
            },
            c_akyrs_replicant_instant_messaging = {
                name = "即时通讯 (Instant Messaging)",
                text = {
                    "手中{C:attention}所有卡牌{}的",
                    "点数和花色都将被{C:attention}打乱{}",
                }
            },
            c_akyrs_replicant_enshittification = {
                name = "平台腐败 (Enshittification)",
                text = {
                    "创建一张{C:dark_edition}负面{C:money}租用{C:purple}永恒{}小丑",
                }
            },
            c_akyrs_replicant_digital_art = {
                name = "数字艺术 (Digital Art)",
                text = {
                    "放弃 {C:red}#1#{} 弃牌数上限",
                    "换取永久的 {C:attention}+#2#{} 手牌上限",
                }
            },
            c_akyrs_replicant_common_scam = {
                name = "常见诈骗 (Common Scam)",
                text = {
                    "放弃 {C:red}#1#{} 出手次数上限",
                    "换取永久的 {C:dark_edition}+#2#{} 小丑栏位",
                }
            },
            c_akyrs_replicant_third_party_cookies = {
                name = "第三方 Cookie",
                text = {
                    "用{C:purple}晶格 (Latticed){} 食物小丑",
                    "填满你的小丑栏位",
                }
            },
            c_akyrs_replicant_silicon_fabrication = {
                name = "硅片制造 (Silicon Fabrication)",
                text = {
                    "手中一张随机卡牌",
                    "转换为 {C:attention}威圆卡 (Wafer Card){}",
                    "手中另一张随机卡牌将",
                    "获得 {C:dark_edition}染色 (Dyed){} 效果",
                }
            },
        },
    },
        achievement_names={
            ach_akyrs_spell_aikoyori = "遗憾的是 Aikoyori 并非真实存在",
            ach_akyrs_repeater_into_another_one = "中继器锁定",
            ach_akyrs_happy_ghast_grown = "不安的联盟",
            ach_akyrs_both_pickaxe = "双持",
            ach_akyrs_win_klondike = "回归基础",
            ach_akyrs_spell_very_long_word = "超级无敌长单词之神",
            ach_akyrs_spell_long_word = "新潮流万岁",
            ach_akyrs_we_no_speak_americano = "我们不说美国话",
            ach_akyrs_resist_the_temptation = "抵制诱惑",
            ach_akyrs_thatll_be_5_wheat = "请给我 5 个小麦",
            ach_akyrs_literally_cryptid = "名副其实的 Cryptid",
            ach_akyrs_div_0_math = "除以零",
            ach_akyrs_average_daily_scrandle = "日常 Scrandle",
        },
        achievement_descriptions={
            ach_akyrs_spell_aikoyori = "拼出单词：Aikoyori",
            ach_akyrs_repeater_into_another_one = "将一个中继器的输出引导到另一个中继器中",
            ach_akyrs_happy_ghast_grown = "将干燥状态的恶魂培养成快乐恶魂",
            ach_akyrs_both_pickaxe = "同时获得两把镐子！",
            ach_akyrs_win_klondike = "赢得一场空当接龙 (Klondike)！",
            ach_akyrs_spell_very_long_word = "拼出一个有效的超长单词 (25+ 字母) (需要启用完整词典)",
            ach_akyrs_spell_long_word = "拼出一个有效的长单词 (12+ 字母)",
            ach_akyrs_we_no_speak_americano = "在使用字母卡组的情况下，不拼写任何单词并获胜",
            ach_akyrs_resist_the_temptation = "在使用自由卡组的情况下，不使用自由移动功能并获胜",
            ach_akyrs_thatll_be_5_wheat = "用绿宝石填满你的小丑栏位",
            ach_akyrs_literally_cryptid = "对没有点数的卡牌使用公共交通",
            ach_akyrs_div_0_math = "你觉得会发生什么？",
            ach_akyrs_average_daily_scrandle = "将一个食物小丑变为爆米花",
        },
        blind_states={},
        akyrs_balancing_wizard = {
        },
        challenge_names={
            c_akyrs_space_oddity = "太空奇遇 (Space Oddity)",
            c_akyrs_4_hibanas = "永恒的火花 (Hibana for Eternity)",
        },
        hardcore_challenge_names={
            hc_akyrs_spark = "火花",
            hc_akyrs_secured_two_factor = "双重身份验证 (2FA)",
            hc_akyrs_detroit = "底特律",
            hc_akyrs_detroit_2 = "底特律 II",
            hc_akyrs_detroit_3 = "底特律 III",
            hc_akyrs_detroit_4 = "底特律 IV",
            hc_akyrs_detroit_5 = "底特律：变人",
            hc_akyrs_half_life = "半条命",
            hc_akyrs_half_life_2 = "半条命 2",
            hc_akyrs_thin_yo_deck = "老兄，删点牌吧",
            hc_akyrs_thin_yo_deck_2 = "求你了，删点牌吧",
            hc_akyrs_national_debt = "国债",
            hc_akyrs_extra_defensive_bulwark = "额外的防御堡垒",
            hc_akyrs_no_hints_here = "知识测试",
            hc_akyrs_no_hints_here_gold_edition = "闭卷考试",
            hc_akyrs_wordle_galore = "思维导链",
            hc_akyrs_bomb_galore = "保持拼字，没人爆炸",
            hc_akyrs_hatena_jokers = "？？？？？？？？",
            hc_akyrs_hatena_everything = "？？？？？？？？？？？？？？？",
        },
        collabs={},
        dictionary={
            b_umbral_cards = "幽影卡",
            b_replicant_cards = "复制人卡",
            k_umbral = "幽影",
            k_replicant = "复制人",

            b_akyrs_alphabets="字母卡",
            k_aikoyoriextrabases = "额外基础",
            k_akyrs_alphabets = "字母",
            k_akyrs_current_req = "当前需求",
            k_akyrs_alphabets_pack = "字母卡包",
            k_alphabets = "字母卡包",
            k_created = "已创建！",
            k_akyrs_up_to_sel = "x",
            ph_aiko_beat_puzzle = "请解决以下谜题",
            ph_word_puzzle = "单词谜题",
            ph_aiko_defuse = "消除：",
            ph_aiko_bomb = "单词炸弹！",
            ph_akyrs_play_for = "打出以获得：",
            k_akyrs_random_played_hand = "随机已打出牌型",
            k_akyrs_must_pay_attention = "手中必须持有注意卡！",
            k_akyrs_must_contain_word = "手牌中必须包含单词！",
            ph_puzzle_clear = "谜题通关！",
            ph_akyrs_unknown = "？？？",
            k_akyrs_item_box_trigger = "？",


            akyrs_start_with = "开始于 ",
            akyrs_stored_open = "(当前：",
            akyrs_stored_close = ")",
            k_akyrs_reciprocaled = "倒数！",
            k_akyrs_centrifuged = "离心！",
            k_akyrs_drawn_discard = "全部召回！",
            k_akyrs_2fa_generate = "已生成！",
            k_akyrs_2fa_regen = "验证码已刷新！",
            k_akyrs_2fa_reset = "2FA 已重置！",
            k_akyrs_extinguish = "已熄灭...",
            k_akyrs_burn = "燃烧！",
            k_akyrs_constellation = "星座",
            k_words_long = "12+ 字母单词",
            k_akyrs_multiple_hands = "多种牌型",
            k_akyrs_hibana_change = "啦啦啦...",
            k_akyrs_gift_change = "新促销！",
            k_akyrs_with = "以及",
            k_akyrs_credits = "鸣谢",
            k_akyrs_created_by = "创作者",
            k_akyrs_additional_art_by = "美术设计",
            k_akyrs_additional_help_by = "额外协助",
            k_akyrs_drmonty_help = "协助平衡性调整",
            k_akyrs_special_thanks = "特别鸣谢",
            k_akyrs_cross_mods_creds = "跨模组美术鸣谢",
            k_akyrs_please_dont_kill_me = "请不要杀我请不要杀我请不要杀我",
            k_akyrs_sharetest_cred_1 = "所有参与游玩、协助测试、分享",
            k_akyrs_sharetest_cred_2 = "并为本模组创作内容的人",
            k_akyrs_thanks_you_for_playing = "以及你！",
            k_akyrs_difficult = "困难",
            k_akyrs_dried = "已干燥...",
            k_akyrs_moisture = "已湿润！",
            k_akyrs_growth = "生长！",
            k_akyrs_back = "倒转！",
            k_akyrs_cinema = "影院！",
            k_akyrs_received = "已收到",
            k_akyrs_sendoff = "发射！",
            k_akyrs_yee = "Yee！",
            k_akyrs_pissandshittium = "https://pissandshittium.org/",
            k_akyrs_pandora_give_tag = "重制 15 (Re:MASTER 15)",
            k_akyrs_downgrade_ex = "降级！",
            k_akyrs_woah_undertale = "喔噢..",
            k_akyrs_story_of_undertale = "传说之下的故事..",
            k_akyrs_value_up = "价值提升！",
            k_akyrs_ojisan = "已回复！",
            k_akyrs_gain_discard = "<水花>",
            
            k_akyrs_use_from_drag = "使用",
            k_akyrs_use_from_drag_2 = "[合乎道德地]",
            b_akyrs_normal_jokers = "普通小丑",
            b_akyrs_letter_jokers = "字母小丑",
            k_akyrs_ate_up = "被吃掉了！",
            b_akyrs_words = "单词",
            k_akyrs_check_word_check = "检查",


            k_akyrs_ryo_borrowed_money = "借来的钱...",
            k_akyrs_nijika_planet = ":D",

            k_akyrs_fps = " FPS",

            k_akyrs_random_letter = "随机选择的字母",
            k_akyrs_tsunagi_absurd_wheel_nope = "1 次失败！",
            k_akyrs_umbral_intrusive_would_die = "安全！",
            k_akyrs_umbral_intrusive_would_win = "错过了！",
            k_akyrs_solitaire = "空当接龙 (Klondike)",

            k_akyrs_cannot_be_disabled = "无法被禁用",
            k_akyrs_cannot_be_rerolled = "无法被重滚",
            k_akyrs_blind_difficult_expert = "专家级盲注",
            k_akyrs_blind_difficult_master = "大师级盲注",
            k_akyrs_blind_difficult_ultima = "极级盲注",
            k_akyrs_blind_difficult_remaster = "重制级盲注",

            k_akyrs_confrontation_has_face_in_hand_warning = "手中不能持有面牌",
            k_akyrs_crystalised_warning = "结晶化卡牌将导致手牌不计分！",

            k_akyrs_title = "Aikoyori 的胡闹",
            k_akyrs_join_akyrs_discord = "Discord (反馈与建议)",

            k_akyrs_hardcore_challenge_mode = "核心挑战模式",
            k_akyrs_hardcore_challenge_mode_flavour = "极具挑战性且完全可选的挑战",
            k_akyrs_hardcore_challenge_mode_flavour_2 = "特意设计为不公平且不平衡",
            k_akyrs_hardcore_challenge_mode_flavour_3  = "不适合胆小者尝试",
            k_akyrs_hardcore_challenge_mode_wish_1  = "如果你选择尝试这些挑战，",
            k_akyrs_hardcore_challenge_mode_wish_2  = "祝你好运。",
            k_akyrs_hardcore_challenge_mode_tip_1  = "这大概也是一种有趣的测试方法，",
            k_akyrs_hardcore_challenge_mode_tip_2  = "用来看看一个小丑到底能强到什么程度",
            b_akyrs_hc_challenges = "核心硬核",
            b_akyrs_hc_challenges_full_txt = "核心挑战",
            k_akyrs_hardcore_challenge_difficulty = "难度",

            k_akyrs_type_in_letter = "输入一个字母",
            k_akyrs_letter_btn_currently = "当前：",
            k_akyrs_word_check_init = "输入单词并点击“检查”！",
            k_akyrs_word_tab_reduced_tip_1 = "你认为这是个单词但它无效？",
            k_akyrs_word_tab_reduced_tip_2 = "尝试在配置中启用“完整词典”！",
            k_akyrs_word_tab_reduced_tip_3 = "(这会稍微消耗一些性能)",
            k_akyrs_letter_btn_unset = "取消设置",
            k_akyrs_letter_btn_auto = "自动",
            k_akyrs_letter_btn_set = "设置",
            k_akyrs_letter_btn_swap_case = "切换大小写",
            k_akyrs_you_tried = "你尽力了 :star:",
            k_akyrs_alphabetically = "字母",

            k_akyrs_textbox_notice = "由于游戏运行机制的原因，你需要",
            k_akyrs_textbox_notice_2 = "与文本框交互才能显示文本",

            k_akyrs_plus_alphabet = "+1 字母卡",
            k_akyrs_plus_umbral = "+1 幽影卡",
            k_akyrs_plus_replicant = "+1 复制人卡",

            k_akyrs_solitaire_redeal = "重新发牌",

            ph_akyrs_math_score_1 = "得分在 ",
            ph_akyrs_math_score_2 = "% 以内：",
            k_akyrs_power_ante = "底注次方",

            k_akyrs_score_mult_pre = "X",
            k_akyrs_score_mult_append = " 分数",

            k_akyrs_wild_card = "通配卡",
            k_akyrs_kitan = "Kita~n",

            k_akyrs_copper_oxidation_stage_1 = "未氧化",
            k_akyrs_copper_oxidation_stage_2 = "已暴露",
            k_akyrs_copper_oxidation_stage_3 = "已风化",
            k_akyrs_copper_oxidation_stage_4 = "已氧化",
            k_akyrs_oxidise_ex = "已氧化！",
            k_akyrs_scrape_ex = "刮擦！",
            k_akyrs_round_singular = "回合",
            k_akyrs_round_plural = "回合",

            k_akyrs_balance_dialog_intro_next = "下一步",
            k_akyrs_balance_dialog_cryptid_accept = "听起来不错。(结束)",
            k_akyrs_balance_dialog_cryptid_decline = "我想听更多！",
            k_akyrs_balance_dialog_details_next = "好吧，我选...",
            k_akyrs_balance_dialog_mp_accept = "确认 (结束)",
            k_akyrs_balance_dialog_finish_wizard = "出发！(结束)",

            k_akyrs_wildcard_behaviour_txt = "通配卡行为",
            k_akyrs_config_balance_txt = "平衡性",

            k_akyrs_wildcard_behaviours={
                '自动/Automatic',
                '强制设置/Force No Unset',
                '始终手动/Always Manual',
                '自动应用/Auto Set', 
            },
            
            k_akyrs_pure_hands = "纯净牌型",

            k_akyrs_wildcard_behaviours_description={
                {'对于未设置字母的通配卡，','自动为其寻找字母。 (默认)。'},
                {'如果你选中了未设置的通配卡，','打出按钮将被禁用。',} ,
                {'通配卡默认不分配字母。打出时，','不会尝试寻找字母。 (可提升性能)',} ,
                {'自动为通配卡寻找字母，并且','如果目标未设置，则自动将字母应用到目标。',} 
            },

            k_akyrs_balance_selects={
                '适度 (Adequate)',
                '荒谬 (Absurd)',
            },
            
            k_akyrs_balance_selects_no_talisman={
                '适度 (Adequate)',
            },
            
            k_akyrs_balance_dialog_adequate_text = "适度 (Adequate)",
            k_akyrs_balance_dialog_adequate_description = "更接近原版的平衡体验",
            k_akyrs_balance_dialog_absurd_text = "荒谬 (Absurd)",
            k_akyrs_balance_dialog_absurd_description = "(需要 Talisman) 更大的数字、更疯狂的效果、更严重的后果。",
            
            k_akyrs_card_preview = "启用卡牌预览",
            k_akyrs_toggle_crt = "启用 CRT 着色器",
            k_akyrs_restart_required = "* = 需要重启",
            k_akyrs_toggle_full_dictionary = "启用完整词典*",
            k_akyrs_toggle_experimental_feature = "启用实验性功能*",
            k_akyrs_emerald = "绿宝石",
            k_akyrs_supercommon = "超级普通",
            k_akyrs_unique = "唯一",
            k_akyrs_alphabet_pack = "字母卡包",
            k_akyrs_umbral_pack = "幽影卡包",
            k_akyrs_replica_pack = "复制卡包",
        },
        high_scores={},
        labels={
            akyrs_self_destructs="自毁",
            akyrs_sigma="Sigma",
            akyrs_oxidising="氧化",
            akyrs_attention="注意",
            akyrs_concealed="隐藏",
            akyrs_crystalised="结晶",
            akyrs_latticed="晶格",
            akyrs_sus="可疑",
            akyrs_sale="九折优惠",
            akyrs_carmine_seal="胭脂红密封",
            akyrs_neon_seal="霓虹密封",
            akyrs_twin_seal="孪生密封",
            akyrs_fault_seal="断层密封",
            akyrs_deformed_seal="畸变密封",
            akyrs_texelated = "像素化",
            akyrs_noire = "黑色",
            akyrs_sliced = "切片",
            akyrs_burnt = "烧焦",
            akyrs_dyed = "染色",
            akyrs_enchanted = "附魔",
            k_akyrs_emerald = "绿宝石",
            k_akyrs_supercommon = "超级普通",
            k_akyrs_unique = "唯一",
            umbral = "幽影",
            replicant = "复制人"
        },
        poker_hand_descriptions=poker_hand_desc,
        poker_hands=poker_hands_name,
        quips={},
        ranks={
            akyrs_non_playing = "同类"
        },
        suits_plural={
            akyrs_joker = "小丑",
            akyrs_consumable = "消耗品",
            akyrs_booster = "补充包",
            akyrs_voucher = "代金券",
            akyrs_thing = "某种东西"
        },
        suits_singular={
            akyrs_joker = "小丑",
            akyrs_consumable = "消耗品",
            akyrs_booster = "补充包",
            akyrs_voucher = "代金券",
            akyrs_thing = "某种东西"
        },
        tutorial={},
        v_dictionary={
            k_akyrs_pure="纯净 #1#",
            k_akyrs_score_add="+#1# 分数",
            k_akyrs_score_x="X#1# 分数",
            k_akyrs_score_exp="^#1# 分数",
            ph_akyrs_hand="#1# 牌型",
            ph_akyrs_hands="#1# 牌型",
            k_akyrs_score_minus="-#1# 分数",
            k_akyrs_word_check_valid="#1# 是一个有效单词！",
            k_akyrs_word_check_invalid="#1# 不是一个有效单词。",
        },
        v_text={
            ch_c_sliced_space={
                "开始时持有一个{C:dark_edition}切片{}空间小丑",
            },
            ch_c_akyrs_half_debuff={
                "每回合结束时，你{C:attention}一半{}的未削弱卡牌将永久被削弱",
            },
            ch_c_akyrs_half_self_destruct={
                "每回合结束时，你所拥有的{C:attention}所有东西的一半{}将获得{C:red,T:self_destructs}自毁贴纸{}",
            },
            ch_c_akyrs_no_tarot_except_twof={
                "除了{C:tarot,T:c_wheel_of_fortune}命运之轮{}以外，不会出现其他{C:tarot}塔罗卡{}",
            },
            ch_c_akyrs_no_tarot={
                "不会出现{C:tarot}塔罗卡{}",
            },
            ch_c_akyrs_no_planet={
                "不会出现{C:planet}星球卡{}",
            },
            ch_c_akyrs_no_jokers={
                "不会出现{C:red}小丑{}",
            },
            ch_c_akyrs_all_cards_are_stone={
                "所有卡牌都是{C:purple}石头卡{}",
            },
            ch_c_akyrs_allow_duplicates={
                "可以出现{C:attention}重复物品{}",
            },
            ch_c_akyrs_idea_by_astrapboy={
                "创意来自 {C:attention}astrapboy",
            },
            ch_c_akyrs_idea_by_missingnumber={
                "创意来自 {C:attention}missingnumber",
            },
            ch_c_akyrs_idea_by_saharabat={
                "创意来自 {C:attention}saharabat",
            },
            ch_c_akyrs_no_hints={
                "{C:attention}所有提示工具{}都将被{C:red}隐藏",
            },
            ch_c_akyrs_start_with_letter_deck={
                "使用{C:attention,T:b_akyrs_letter_deck}字母卡组{}游玩",
            },
            ch_c_akyrs_no_skips={
                "{C:attention}不允许跳过{}盲注",
            },
            ch_c_akyrs_all_blinds_are={
                "{C:attention}所有盲注{}均为{C:attention}#1#",
            },
            ch_c_akyrs_hatena_deck={
                "{C:attention}所有小丑{}均被{C:red}隐藏",
            },
            ch_c_akyrs_hatena_everything={
                "{C:attention}所有卡牌{}均被{C:red}隐藏",
            },
        },
    }