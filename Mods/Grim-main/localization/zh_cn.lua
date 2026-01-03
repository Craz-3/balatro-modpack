return {
    descriptions = {
        Skill = {
            sk_grm_chime_1 = {
                name = "鸣钟 I",
                text = {
                    "{C:attention}习得{}时，底注 {C:attention}-1{}",
                }
            },
            sk_grm_chime_2 = {
                name = "鸣钟 II",
                text = {
                    "每经过 {C:attention}4{} 个底注，",
                    "底注 {C:attention}-1{}",
                    "{C:inactive}（每底注仅一次）{}"
                }
            },
            sk_grm_chime_3 = {
                name = "鸣钟 III",
                text = {
                    "每经过 {C:attention}3{} 个底注，",
                    "底注 {C:attention}-1{}",
                    "{C:blue}-1{} 出牌次数",
                    "{C:inactive}（每底注仅一次）{}"
                },
                unlock = {
                    "底注等级",
                    "达到 {E:1,C:attention}17"
                }
            },
            sk_grm_ease_1 = {
                name = "缓和 I",
                text = {
                    "盲注规模 {C:blue}x0.9{}",
                }
            },
            sk_grm_ease_2 = {
                name = "缓和 II",
                text = {
                    "盲注规模 {C:blue}x0.8{}",
                }
            },
            sk_grm_mystical_1 = {
                name = "神秘 I",
                text = {
                    "所有{C:tarot}秘仪包{}额外获得",
                    "{C:attention}+1{} 选项和选择机会"
                }
            },
            sk_grm_mystical_2 = {
                name = "神秘 II",
                text = {
                    "所有{C:tarot}秘仪包{}和{C:tarot}塔罗牌{}免费。"
                }
            },
            sk_grm_mystical_3 = {
                name = "神秘 III",
                text = {
                    "使用{C:tarot}塔罗牌{}时，有 {C:green}30%{} 几率",
                    "创建一张{C:dark_edition}负片{}版本{C:tarot}愚者{}",
                    "{C:inactive}（{C:tarot}愚者{C:inactive}除外）"
                }
            },
            sk_grm_hexahedron_1 = {
                name = "六面体 I",
                text = {
                    "刷新成本",
                    "减少 {C:money}$1{}"
                }
            },
            sk_grm_ocean_1 = {
                name = "海洋 I",
                text = {
                    "{C:attention}+1{} 手牌上限",
                }
            },
            sk_grm_strike_1 = {
                name = "打击 I",
                text = {
                    "每经过一个{C:attention}底注{}，",
                    "获得 {C:red}+2{} 基础倍率"
                }
            },
            sk_grm_strike_2 = {
                name = "打击 II",
                text = {
                    "{C:blue}+50{} 基础筹码",
                }
            },
            sk_grm_strike_3 = {
                name = "打击 III",
                text = {
                    "平衡基础{C:blue}筹码{}和基础{C:red}倍率{}",
                    "盲注规模 {C:red}X1.2{}",
                },
                unlock = {
                    "将任意{C:attention}牌组牌型{}等级",
                    "提升至 {C:attention}40{} 或更高"
                }
            },
            sk_grm_hexahedron_2 = {
                name = "六面体 II",
                text = {
                    "每间商店提供 {C:attention}2{} 次",
                    "免费{C:attention}刷新{}"
                }
            },
            sk_grm_hexahedron_3 = {
                name = "六面体 III",
                text = {
                    "在商店中每花费 {C:money}$7{} 进行{C:green}刷新{}，",
                    "获得 {C:attention}+1{} 次免费{C:green}刷新{}",
                },
                unlock = {
                    "在{C:attention}商店{}中{C:green}刷新{}",
                    "{C:attention}15{} 次或更多"
                }
            },
            sk_grm_ocean_2 = {
                name = "海洋 II",
                text = {
                    "在{C:attention}最后一次弃牌{}后，",
                    "获得 {C:blue}+1{} 出牌次数"
                }
            },
            sk_grm_ocean_3 = {
                name = "海洋 III",
                text = {
                    "在{C:attention}第一手牌{}时，",
                    "额外获得 {C:red}+2{} 弃牌次数"
                },
                unlock = {
                    "拥有 {C:red}10{} 次或更多",
                    "弃牌次数"
                }
            },
            sk_grm_stake_1 = {
                name = "筹码 I",
                text = {
                    "{C:attention}+1{} 胜利底注要求",
                    "{C:attention}+1{} 手牌上限"
                }
            },
            sk_grm_stake_2 = {
                name = "筹码 II",
                text = {
                    "{C:attention}+2{} 胜利底注要求",
                    "{C:attention}+1{} 小丑槽位"
                }
            },
            sk_grm_skillful_1 = {
                name = "熟练 I",
                text = {
                    "{C:attention}回合{}结束时获得",
                    "{C:purple}+30{} XP"
                }
            },
            sk_grm_skillful_2 = {
                name = "熟练 II",
                text = {
                    "打出{C:attention}牌组牌型{}时，将该牌组",
                    "的等级数加到 XP 中",
                    "{C:inactive}（最高 {C:purple}40{C:inactive}）{}",
                }
            },
            sk_grm_skillful_3 = {
                name = "熟练 III",
                text = {
                    "所有 XP 来源",
                    "获得 {X:purple,C:white} X2 {} 倍率",
                }
            },
            sk_grm_stake_3 = {
                name = "筹码 III",
                text = {
                    "每个{C:attention}底注{}使盲注规模",
                    "变为原来的 {C:blue}x1.3{} 倍。",
                    "{C:attention}+3{} 小丑槽位",
                    "{C:inactive}（当前 {C:blue}#1#{C:inactive}）{}",
                }
            },
            sk_grm_ease_3 = {
                name = "缓和 III",
                text = {
                    "如果得分至少达到所需筹码的",
                    "{C:attention}75%{}，则防止死亡",
                }
            },
            sk_grm_motley_1 = {
                name = "杂色 I",
                text = {
                    "{C:attention}万能牌{}不会",
                    "被{C:attention}削弱{}"
                }
            },
            sk_grm_fortunate_1 = {
                name = "幸运 I",
                text = {
                    "{C:attention}幸运大轮盘{}可以创建",
                    "{C:dark_edition}负片{}版本"
                }
            },
            sk_grm_fortunate_2 = {
                name = "幸运 II",
                text = {
                    "{C:attention}幸运大轮盘{}不会创建",
                    "{C:dark_edition}闪箔{}版本"
                },
                unlock = {
                    "使用{C:attention}幸运大轮盘{}",
                    "为一个{C:attention}小丑牌{}添加{C:dark_edition}负片{}版本",
                }
            },
            sk_grm_fortunate_3 = {
                name = "幸运 III",
                text = {
                    "{C:attention}幸运大轮盘{} {C:green}必定{}会应用",
                    "一个{C:attention}版本效果{}"
                }
            },
            sk_grm_motley_2 = {
                name = "杂色 II",
                text = {
                    "{C:tarot}秘仪包{}中必定包含",
                    "{C:attention}1{} 张{C:tarot}恋人{}"
                }
            },
            sk_grm_motley_3 = {
                name = "杂色 III",
                text = {
                    "{C:attention}增强卡牌{}也被视为{C:attention}万能牌{}",
                    "所有{C:tarot}秘仪包{}减少 {C:attention}-1{} 选项",
                }
            },
            sk_grm_scarce_1 = {
                name = "稀缺 I",
                text = {
                    "{C:attention}小丑牌{}和{C:attention}小丑包{}不会",
                    "在{C:attention}商店{}中出现"
                }
            },
            sk_grm_gravity_1 = {
                name = "引力 I",
                text = {
                    "所有{C:planet}天体包{}额外获得",
                    "{C:attention}+2{} 选项和 {C:attention}+1{} 选择机会"
                }
            },
            sk_grm_gravity_2 = {
                name = "引力 II",
                text = {
                    "打出你{C:attention}最常打出的{} {C:attention}牌组牌型{}时，",
                    "获得 {X:red,C:white} X2 {} 基础倍率"
                }
            },
            sk_grm_gravity_3 = {
                name = "引力 III",
                text = {
                    "{C:attention}重新触发{}已使用的",
                    "{C:planet}星球牌{}"
                }
            },
            sk_grm_ghost_1 = {
                name = "幽灵 I",
                text = {
                    "每赚取 {C:purple}200{} XP，创建一个",
                    "{C:spectral}光谱牌{}，同时 {C:red}-1{} 手牌上限",
                    "{C:inactive}（需有空位）"
                }
            },
            sk_grm_ghost_2 = {
                name = "幽灵 II",
                text = {
                    "商店结束时获得一个{C:attention}灵异标签{}，",
                    "{C:red}-2{} 手牌上限"
                }
            },
            sk_grm_ghost_3 = {
                name = "幽灵 III",
                text = {
                    "所有{C:spectral}光谱包{}额外获得",
                    "{C:attention}+4{} 选项和 {C:attention}+2{} 选择机会",
                    "所有 XP 来源获得 {X:purple,C:white} X0.5 {} 倍率",
                }
            },
            sk_grm_receipt_1 = {
                name = "收据 I",
                text = {
                    "每在{C:attention}结算奖金{}时获得 {C:money}$4{}，",
                    "额外赚取 {C:money}$1{}"
                }
            },
            sk_grm_receipt_2 = {
                name = "收据 II",
                text = {
                    "商店里的{C:attention}礼券{}和{C:attention}补给包{}",
                    "享有 {C:attention}7 折{}优惠"
                }
            },
            sk_grm_receipt_3 = {
                name = "收据 III",
                text = {
                    "允许负债高达 {C:red}-$25{}，",
                    "击败{C:attention}Boss盲注{}时消除所有{C:red}欠款{}"
                }
            },
            sk_grm_dash_1 = {
                name = "冲刺 I",
                text = {
                    "{C:attention}打出{}的卡牌返回",
                    "{C:attention}牌组{}"
                }
            },
            sk_grm_dash_2 = {
                name = "冲刺 II",
                text = {
                    "{C:dark_edition}+1{} 单次出牌上限",
                }
            },
            sk_grm_cl_hoarder = {
                name = "积攒者",
                text = {
                    "{C:red}-1{} 手牌上限",
                    "你可以{C:green}打包（Pack）{}卡牌。"
                },
                unlock = {
                    "拥有 {C:purple}2,000{} 或",
                    "更多 {C:attention}XP{}",
                }
            },
            sk_grm_cl_astronaut = {
                name = "宇航员",
                text = {
                    "{C:money}恒星卡（Stellar）{}和{C:blue}月球卡（Lunar）{}",
                    "可以出现在{C:planet}天体包{}中",
                },
                unlock = {
                    "习得",
                    "{C:planet}引力 III{}",
                }
            },
            sk_grm_orbit_1 = {
                name = "轨道 I",
                text = {
                    "{C:money}恒星卡（Stellar）{}和{C:blue}月球卡（Lunar）{}",
                    "可以出现在{C:attention}商店{}中",
                }
            },
            sk_grm_orbit_2 = {
                name = "轨道 II",
                text = {
                    "{C:attention}迪丝诺美亚（Dysnomia）{}和 {C:attention}LP 944-20{}",
                    "可以出现"
                }
            },
            sk_grm_cl_alchemist = {
                name = "炼金术师",
                text = {
                    "启用{C:attention}元素（Elements）{}和",
                    "{C:green}状态（Statuses）{}",
                },
                unlock = {
                    "牌组中至少拥有 {E:1,C:attention}52",
                    "张{E:1,C:attention}万能牌{}"
                }
            },
            sk_grm_cl_explorer = {
                name = "探险家",
                text = {
                    "击败每个{C:attention}Boss盲注{}后，获得一个",
                    "{C:attention}网格标签（Grid Tag）{}"
                },
                unlock = {
                    "习得 {C:attention}10 个技能{}的情况下赢得比赛",
                }
            },
            sk_grm_sticky_1 = {
                name = "粘性 I",
                text = {
                    "出售{C:attention}永恒小丑{}需花费",
                    "{C:purple}100 XP{}"
                }
            },
            sk_grm_sticky_2 = {
                name = "粘性 II",
                text = {
                    "{C:attention}易损小丑{}多持续",
                    "{C:attention}3{} 回合"
                }
            },
            sk_grm_sticky_3 = {
                name = "粘性 III",
                text = {
                    "{C:attention}租用小丑{}在回合结束时提供 {C:money}$3{}",
                    "而非扣除 {C:red}-$3{}"
                }
            },
            sk_grm_shelf_1 = {
                name = "置物架 I",
                text = {
                    "{C:red}-1{} 商店物品槽位",
                    "{C:attention}+2{} 补给包槽位"
                }
            },
            sk_grm_shelf_2 = {
                name = "置物架 II",
                text = {
                    "{C:attention}+2{} 商店物品槽位",
                    "除非购买了某样物品，",
                    "否则商店不会清空"
                }
            },
            sk_grm_shelf_3 = {
                name = "置物架 III",
                text = {
                    "{C:attention}+1{} 礼券槽位"
                }
            },
            sk_grm_prestige_1 = {
                name = "声望 I",
                text = {
                    "{C:attention}遗忘{}所有其他技能",
                    "{C:dark_edition}+1{} 传说代币",
                    "且本局中至少已花费 {C:purple}2,500{} XP",
                    "{C:inactive}（本局已花费 {C:purple}#1#{C:inactive} XP）"
                },
                unlock = {
                    "习得一个 {C:red}III 阶{}技能",
                }
            },
            sk_grm_prestige_2 = {
                name = "声望 II",
                text = {
                    "{C:attention}遗忘{}所有 {C:purple}非声望{} 技能，",
                    "所有{C:attention}技能{}的 {C:purple}XP{} 消耗减少 {C:attention}25%{}",
                    "{C:dark_edition}+1{} 传说代币",
                }
            },
            sk_grm_blind_breaker = {
                name = "盲注破坏者",
                text = {
                    "在{C:attention}主要计分{}后，本轮此前每打出的一手",
                    "{C:blue}牌{}都提供 {X:red,C:white} ^0.2 {} 倍率",
                    "{C:inactive}（当前 {X:red,C:white} ^#1# {C:inactive} 倍率）"
                }
            },
            sk_grm_spectral_shard = {
                name = "光谱碎片",
                text = {
                    "{C:legendary,E:1}传说小丑{} 可能会出现在",
                    "商店和补给包中",
                }
            },
            sk_grm_dexterity = {
                name = "敏捷",
                text = {
                    "选择{C:attention}盲注{}时，",
                    "每持有 {C:purple}100{} XP 获得 {C:blue}+1{} 出牌次数"
                }
            },
            sk_grm_holdover_1 = {
                name = "结转 I",
                text = {
                    "最多 {C:attention}3{} 次未使用的{C:red}弃牌次数{}",
                    "可结转至{C:attention}下一回合{}",
                    "每轮基础弃牌次数 {C:red}-1{}"
                }
            },
            sk_grm_holdover_2 = {
                name = "结转 II",
                text = {
                    "最多 {C:attention}2{} 次未使用的{C:blue}出牌次数{}",
                    "可结转至{C:attention}下一回合{}"
                }
            },
            sk_grm_holdover_3 = {
                name = "结转 III",
                text = {
                    "倍增所有{C:purple}结转（Holdover）{}技能",
                    "的上限"
                }
            },
            sk_cry_ace_1 = {
                name = "ACE I",
                text = {
                    "重选本局中 {C:cry_code,E:1}Crash{} 的有效载荷",
                }
            },
            sk_cry_ace_2 = {
                name = "ACE II",
                text = {
                    "{C:tarot}愚者{} 现在可以创建 {C:cry_code,E:1}代码牌{}",
                }
            },
            sk_cry_ace_3 = {
                name = "ACE III",
                text = {
                    "所有 {C:cry_code,E:1}程序包{} 都包含",
                    "{C:spectral}POINTER://{}",
                }
            },
            sk_cry_m_1 = {
                name = "M I",
                text = {
                    "本局中每打出一个{C:attention}对子{}，",
                    "获得 {C:blue}+3{} 基础筹码",
                    "{C:inactive}（当前 {C:blue}+#1#{C:inactive}）"
                }
            },
            sk_cry_m_2 = {
                name = "M II",
                text = {
                    "商店开始时，将一张 {C:attention}快乐小丑{} 放入商店",
                }
            },
            sk_cry_m_3 = {
                name = "M III",
                text = {
                    "创建一张 {C:attention}快乐吉姆球{}",
                    "{C:inactive}（需有空位）",
                }
            },
            sk_cry_sticky_4 = {
                name = "粘性 IV",
                text = {
                    "{C:attention}香蕉牌{} 在回合结束时",
                    "有 {C:green}1/8{} 几率进行复制"
                }
            },
            sk_poke_energetic_1 = {
                name = "活力 I",
                text = {
                    "{C:pink}+1{} 能量上限"
                },
            },
            sk_poke_energetic_2 = {
                name = "活力 II",
                text = {
                    "{C:attention}售出{}带有{C:attention}类型{}的{C:attention}小丑牌{}时，",
                    "创建对应的{C:pink}能量卡{}",
                    "{C:inactive}（需有空位）"
                },
            },
            sk_poke_energetic_3 = {
                name = "活力 III",
                text = {
                    "小丑牌在{C:pink}充能（Energized）{}时有 {C:green}#1#/5{} 几率",
                    "获得{C:dark_edition}多彩{}或{C:dark_edition}负片{}版本",
                },
            },
            sk_mf_painted_1 = {
                name = "着色 I",
                text = {
                    "{C:colourcard}颜色（Colour）{}牌引导时获得 {C:attention}2{}",
                    "回合寿命",
                },
            },
            sk_mf_painted_2 = {
                name = "着色 II",
                text = {
                    "击败{C:attention}Boss盲注{}后，{C:attention}升级{}一张",
                    "随机{C:colourcard}颜色（Colour）{}牌",
                },
            },
            sk_mf_painted_3 = {
                name = "着色 III",
                text = {
                    "{C:colourcard}颜色（Colour）{}牌可以",
                    "使用两次",
                },
            },
            sk_ortalab_decay_1 = {
                name = "衰变 I",
                text = {
                    "{C:planet}星球牌{}、{C:planet}天体包{}、",
                    "{C:tarot}塔罗牌{}和{C:tarot}秘仪包{}",
                    "不再出现在{C:attention}商店{}中"
                }
            },
            sk_ortalab_magica_1 = {
                name = "魔法 I",
                text = {
                    "{C:loteria}洛特里亚（Loteria）{}牌可以",
                    "出现在{C:tarot}秘仪{}包中",
                }
            },
            sk_ortalab_magica_2 = {
                name = "魔法 II",
                text = {
                    "所有 {C:loteria}窄船包（Chalupa Pack）{} 的选项、",
                    "选择机会和成本均翻倍 {X:attention,C:white} X2 ",
                }
            },
            sk_ortalab_magica_3 = {
                name = "魔法 III",
                text = {
                    "使用{C:loteria}公鸡{}时有 {C:green}80%{} 的几率",
                    "再创建一张{C:loteria}公鸡{}",
                    "{C:inactive}（需有空位）"
                }
            },
            sk_ortalab_starry_1 = {
                name = "星光 I",
                text = {
                    "回合结束时，每张未激活的{C:zodiac}黄道带（Zodiac）{}牌",
                    "永久获得 {C:attention}+1{} 临时等级",
                }
            },
            sk_ortalab_starry_2 = {
                name = "星光 II",
                text = {
                    "{C:zodiac}黄道带（Zodiac）{}牌可以",
                    "出现在{C:planet}天体包{}中",
                }
            },
            sk_ortalab_starry_3 = {
                name = "星光 III",
                text = {
                    "{C:zodiac}黄道带（Zodiac）{}永远不会衰减"
                }
            },
        },
        Other = {
            undiscovered_skill = {
                name = "未发现",
                text = {
                    "在无种子的局中",
                    "习得此技能以",
                    "了解其作用"
                }
            },
            undiscovered_area = {
                name = "未发现",
                text = {
                    "在无种子的局中",
                    "使用该卡牌以",
                    "了解其作用"
                }
            },
            undiscovered_lunar = {
                name = "未发现",
                text = {
                    "在无种子的局中",
                    "购买或使用此牌",
                    "以了解其作用"
                }
            },
            undiscovered_stellar = {
                name = "未发现",
                text = {
                    "在无种子的局中",
                    "购买或使用此牌",
                    "以了解其作用"
                }
            },
            undiscovered_elemental = {
                name = "未发现",
                text = {
                    "在无种子的局中",
                    "购买或使用此牌",
                    "以了解其作用"
                }
            },
            undiscovered_attack = {
                name = "未发现",
                text = {
                    "在无种子的局中",
                    "遭遇此攻击",
                    "以了解其作用"
                }
            },
            undiscovered_loot = {
                name = "未发现",
                text = {
                    "在无种子的局中",
                    "购买或使用此牌",
                    "以了解其作用"
                }
            },
            p_grm_loot_normal_1 = {
                name = "战利品包",
                text = {
                    "从最多 {C:attention}#2#{} 张 战利品（Loot）卡牌 中",
                    "选择 {C:attention}#1#{} 张立即使用"
                }
            },
            p_grm_ancient_normal_1 = {
                name = "远古包",
                text = {
                    "从最多 {C:attention}#2#{} 张 元素（Element）卡牌 中",
                    "选择 {C:attention}#1#{} 张立即使用"
                }
            },
            p_grm_ancient_normal_2 = {
                name = "远古包",
                text = {
                    "从最多 {C:attention}#2#{} 张 元素（Element）卡牌 中",
                    "选择 {C:attention}#1#{} 张立即使用"
                }
            },
            p_grm_ancient_jumbo_1 = {
                name = "巨型远古包",
                text = {
                    "从最多 {C:attention}#2#{} 张 元素（Element）卡牌 中",
                    "选择 {C:attention}#1#{} 张立即使用"
                }
            },
            p_grm_ancient_mega_1 = {
                name = "超级远古包",
                text = {
                    "从最多 {C:attention}#2#{} 张 元素（Element）卡牌 中",
                    "选择 {C:attention}#1#{} 张立即使用"
                }
            },
            p_grm_area_normal_1 = {
                name = "区域包",
                text = {
                    "从最多 {C:attention}#2#{} 个 区域（Area） 中",
                    "选择 {C:attention}#1#{} 个进入"
                }
            },
            grm_turbo_sticker = {
                name = "涡轮贴纸",
                text = {
                    "在{C:attention}涡轮筹码{}难度下",
                    "使用此小丑获胜"
                }
            },
            grm_bismuth_sticker = {
                name = "铋贴纸",
                text = {
                    "在{C:attention}铋筹码{}难度下",
                    "使用此小丑获胜"
                }
            },
            ch_m_force_stake_xp2 = {
                name = "",
                text = {
                    "{s:0.8,C:purple}#1#{s:0.8} XP 每底注"
                }
            },
            flint = {
                name = "打火石",
                text = {
                    "{C:attention}打出{}时获得 {C:red}+1{} 倍率，",
                    "{C:red}弃牌时失效！{}"
                }
            },
            subzero = {
                name = "低于零度",
                text = {
                    "{C:attention}打出{}此牌时，多抽 {C:attention}1{} 张卡牌",
                    "{C:red}得分后失效！{}"
                }
            },
            rocky = {
                name = "岩石",
                text = {
                    "{C:attention}得分{}卡牌永久获得 {C:blue}+3{} 筹码",
                    "{C:red}持在手中时失效！{}"
                }
            },
            gust = {
                name = "阵风",
                text = {
                    "{C:dark_edition}+1{} 单次出牌上限",
                    "{C:red}被削弱时失效！{}"
                }
            },
            aether = {
                name = "终极",
                text = {
                    "状态永远不会失效",
                }
            },
            nullified = {
                name = "已失效",
                text = {
                    "立即禁用效果",
                }
            },
            skill_req_heading = {
                text = {
                    "需求：",
                }
            },
            met_skill_req = {
                text = {
                    "{C:green}#1#{}",
                }
            },
            unmet_skill_req = {
                text = {
                    "{C:purple}#1#{}",
                }
            },
            xp_req = {
                text = {
                    "{C:purple}#1#{} XP",
                }
            },
            free_xp_req = {
                text = {
                    "{C:purple}0{} XP {C:inactive}(#1#){}",
                }
            },
            token_req = {
                text = {
                    "{C:dark_edition}#1#{} 传说代币",
                }
            },
            unknown_skill_ability = {
                text = {
                    "???"
                }
            },
            star_tooltip = {
                name = "恒星奖励",
                text = {
                    "{C:mult}+#2#{} 倍率 和",
                    "{C:chips}+#1#{} 筹码",
                }
            },
            ante_0_sticker = {
                name = "底注 0 横幅",
                text = {
                    "在{C:attention}底注 0{}时习得此技能",
                    "并获胜"
                }
            },
            ante_1_sticker = {
                name = "底注 1 横幅",
                text = {
                    "在{C:attention}底注 1{}时习得此技能",
                    "并获胜"
                }
            },
            ante_2_sticker = {
                name = "底注 2 横幅",
                text = {
                    "在{C:attention}底注 2{}时习得此技能",
                    "并获胜"
                }
            },
            ante_3_sticker = {
                name = "底注 3 横幅",
                text = {
                    "在{C:attention}底注 3{}时习得此技能",
                    "并获胜"
                }
            },
            ante_4_sticker = {
                name = "底注 4 横幅",
                text = {
                    "在{C:attention}底注 4{}时习得此技能",
                    "并获胜"
                }
            },
            ante_5_sticker = {
                name = "底注 5 横幅",
                text = {
                    "在{C:attention}底注 5{}时习得此技能",
                    "并获胜"
                }
            },
            ante_6_sticker = {
                name = "底注 6 横幅",
                text = {
                    "在{C:attention}底注 6{}时习得此技能",
                    "并获胜"
                }
            },
            ante_7_sticker = {
                name = "底注 7 横幅",
                text = {
                    "在{C:attention}底注 7{}时习得此技能",
                    "并获胜"
                }
            },
            ante_8_sticker = {
                name = "底注 8 横幅",
                text = {
                    "在{C:attention}底注 8{}时习得此技能",
                    "并获胜"
                }
            },
            ante_9_sticker = {
                name = "横幅",
                text = {
                    "习得此技能",
                    "并获胜"
                }
            },
            ["ante_-1_sticker"] = {
                name = "负片横幅",
                text = {
                    "在{C:attention}负数底注{}时习得此技能",
                    "并获胜"
                }
            },
            moon_level_desc = {
                text = {
                    "手中持有的被削弱卡牌",
                    "获得 +#1# 倍率",
                }
            },
            callisto_level_desc = {
                text = {
                    "牌面朝下的卡牌",
                    "在计分时提供 X#1# 倍率"
                }
            },
            deimos_level_desc = {
                text = {
                    "击败决战盲注时，完整牌组中",
                    "有 #1# 张牌被增强为",
                    "#2#效果"
                }
            },
            rhea_level_desc = {
                text = {
                    "不被允许的手牌平均",
                    "升级 #1# 次",
                }
            },
            oberon_level_desc = {
                text = {
                    "击败 Boss 盲注且得分在所需筹码的",
                    "#2#% 以内时，创建一个 #1#",
                }
            },
            proteus_level_desc = {
                text = {
                    "退还在 Boss 盲注期间损失的",
                    "金钱的 #1#%"
                }
            },
            dysnomia_level_desc = {
                text = {
                    "击败每个 Boss 盲注后，创建一个",
                    "可选的 {C:attention}#1#{} 张负片月球、恒星或星球牌",
                    "且其{C:attention}售价{}为 {C:money}$1{}"
                }
            },
            common_metal = {
                name = "普通",
                text = {
                    "带有普通金属增强效果的卡牌"
                }
            },
            precious_metal = {
                name = "珍贵",
                text = {
                    "带有珍贵金属增强效果的卡牌"
                }
            },
            modern_metal = {
                name = "现代",
                text = {
                    "带有现代金属增强效果的卡牌",
                }
            },
            rooster_alt = {
                name = "公鸡",
                text = {
                    "创建一张本局中使用过的",
                    "{C:loteria}洛特里亚{} 或 {C:Zodiac}黄道带{} 牌的副本",
                    "{s:0.8,C:inactive}公鸡除外"
                },

            }
        },
        Back = {
            b_grm_talent = {
                name = "天才牌组",
                text = {
                    "习得的{C:attention}第一个{}技能",
                    "消耗 {C:attention}0{} XP",
                }
            },
        },
        Stake = {
            stake_grm_turbo = {
                name = "涡轮筹码",
                text = {
                    "击败每个{C:attention}Boss盲注{}后，",
                    "赚取 {C:purple}+300{} XP"
                },
            },
            stake_grm_bismuth = {
                name = "铋筹码",
                text = {
                    "每个{C:attention}大盲注{}后，",
                    "不再出现商店"
                },
            }
        },
        Joker = {
            j_grm_jack_of_all_trades = {
                name = "杂事通",
                text = {
                    "{C:attention}售出{}此卡以",
                    "{C:attention}习得{}一个尚未习得的",
                    "{C:attention}职业技能{}"
                }
            },
            j_grm_cohesion = {
                name = "凝聚力",
                text = {
                    "如果手牌包含 {C:attention}#2#{} 张带有",
                    "相同{C:green}状态{}的计分牌，",
                    "获得 {C:red}+#1#{} 倍率"
                }
            },
            j_grm_absolute_zero = {
                name = "绝对零度",
                text = {
                    "{C:attention}低于零度{}状态的卡牌",
                    "会额外多抽一张牌",
                }
            },
            j_grm_precious_joker = {
                name = "珍贵小丑",
                text = {
                    "{C:attention}回合结束时{}，完整牌组中每有一张",
                    "{C:attention}珍贵卡牌{}，就赚取 {C:money}$#1#{}",
                    "{C:inactive}（当前 {C:money}$#2#{C:inactive}）",
                }
            },
            j_grm_hyperspace = {
                name = "超空间",
                text = {
                    "{X:red,C:white} X#1# {} 倍率"
                }
            },
            j_grm_tourist = {
                name = "游客",
                text = {
                    "每访问一个{C:attention}独特区域{}，",
                    "此小丑便获得 {X:mult,C:white} X#1# {} 倍率",
                    "{C:inactive}（当前 {X:mult,C:white} X#2# {C:inactive} 倍率）",
                }
            },
            j_grm_brochure = {
                name = "手册",
                text = {
                    "{C:attention}区域包{}中增加",
                    "{C:attention}+#1#{} 个选项",
                }
            },
            j_grm_energy_bar = {
                name = "能量棒",
                text = {
                    "{C:attention}回合结束时{}获得 {C:purple}+#1#{} XP，",
                    "每打出一手牌损失 {C:purple}#2#{} XP"
                }
            },
            j_grm_showdown = {
                name = "决战",
                text = {
                    "{C:green}打包（Packed）{}的卡牌也计入",
                    "所打出的{C:attention}牌组牌型{}中"
                }
            },
            j_grm_jolly_jimball = {
                name = "欢乐吉姆球",
                text = {
                    "每连续打出一手包含{C:attention}#2#{}的牌，",
                    "此小丑便获得 {X:mult,C:white} X#1# {} 倍率",
                    "{C:inactive}（当前 {X:mult,C:white} X#3# {C:inactive} 倍率）",
                },
            },
            j_grm_cosmic_credit = {
                name = "宇宙信用",
                text = {
                    "所有 XP 来源获得 {X:purple,C:white} X#1# {} 倍率，",
                    "{C:attention}回合结束时{}扣除 {C:red}-#2#{} XP",
                },
            },
            j_grm_apprentice = {
                name = "学徒",
                text = {
                    "{C:attention}回合结束时{}获得 {C:purple}+#1#{} XP",
                },
            },
        },
        Voucher = {
            v_grm_progress = {
                name = "进阶",
                text = {
                    "回合结束时，每持有 {C:purple}#2#{} XP，",
                    "便获得 {C:purple}+#1#{} XP 利息",
                    "{C:inactive}（最高 {C:purple}#3#{C:inactive} XP）"
                }
            },
            v_grm_complete = {
                name = "完成",
                text = {
                    "将每回合可赚取的 {C:purple}XP{} 利息",
                    "上限提升至 {C:purple}#1#{}"
                }
            },
        },
        Tarot = {
            c_grm_craft = {
                name = "工艺",
                text = {
                    "将 {C:attention}#1# 张选定牌",
                    "增强为 {C:attention}#2#（金属卡）"
                }
            }
        },
        Spectral = {
            c_grm_philosophy = {
                name = "哲学",
                text = {
                    "为所有{C:attention}手牌{}添加",
                    "一个随机{C:green}状态（Status）",
                }
            },
            c_grm_moon_x = {
                name = "月球 X",
                text = {
                    "将所有{C:legendary,E:1}月球等级{}",
                    "提升 {C:attention}1{} 级"
                }
            },
            c_grm_iron_core = {
                name = "铁芯",
                text = {
                    "{C:legendary,E:1}升级{}一个",
                    "{C:attention}随机花色{} {C:attention}3{} 级"
                }
            },
        },
        Lunar = {
            c_grm_moon = {
                name = "月亮",
                text = {
                    "等级 {C:attention}#1#{}",
                    "持在手中的{C:attention}被削弱{}卡牌",
                    "提供 {C:red}+#2#{} 倍率"
                }
            },
            c_grm_deimos = {
                name = "戴摩斯",
                text = {
                    "等级 {C:attention}#1#{}",
                    "击败{C:blue}决战盲注{}时，将完整牌组中",
                    "的 {C:attention}#2#{} 张牌增强为 {C:attention}#3#s"
                }
            },
            c_grm_callisto = {
                name = "卡利斯托",
                text = {
                    "等级 {C:attention}#1#{}",
                    "{C:attention}牌面朝下{}的卡牌在{C:attention}计分{}时",
                    "提供 {X:red,C:white} X#2# {} 倍率"
                }
            },
            c_grm_rhea = {
                name = "瑞亚",
                text = {
                    "等级 {C:attention}#1#{}",
                    "{C:attention}不被允许的{}牌组牌型有 ",
                    "{C:green}#2#/#3#{} 几率升级 {C:attention}#4#{} 级，",
                    "否则升级 {C:attention}#5#{} 级"
                }
            },
            c_grm_oberon = {
                name = "奥伯伦",
                text = {
                    "等级 {C:attention}#1#{}",
                    "击败{C:attention}Boss盲注{}且得分在所需筹码的",
                    "{C:attention}#3#%{} 以内时，创建一个 {C:attention}#2#{}"
                }
            },
            c_grm_proteus = {
                name = "普罗特斯",
                text = {
                    "等级 {C:attention}#1#{}",
                    "退还在{C:attention}Boss盲注{}期间损失的",
                    "{C:money}#2#%{} 金钱",
                    "{C:inactive}（向上取整）{}",
                }
            },
            c_grm_nix = {
                name = "尼克斯",
                text = {
                    "{C:red}废除（Nullify）{}一个随机",
                    "{C:attention}Boss盲注{}",
                }
            },
            c_grm_dysnomia = {
                name = "迪丝诺美亚",
                text = {
                    "等级 {C:attention}#1#{}",
                    "击败每个{C:attention}Boss盲注{}后，创建一个 {C:attention}#2#{} 张",
                    "{C:dark_edition}负片{}版本 {C:blue}月球{}、{C:money}恒星{} 或 {C:planet}星球{}牌，",
                    "且其{C:attention}售价{}为 {C:money}$1{}"
                }
            },
        },
        Stellar = {
            c_grm_sun = {
                name = "太阳",
                text = {
                    "{C:attention}升级{} {C:hearts}红桃{}，使其提供",
                    "{C:mult}+#3#{} 倍率 和 {C:chips}+#4#{} 筹码",
                    "{C:inactive}（当前每张牌：{C:red}+#5#{}, {C:blue}+#6#{C:inactive}）",
                    "{C:inactive}（等级 {C:attention}#2#{C:inactive}）",
                }
            },
            c_grm_sirius = {
                name = "天狼星",
                text = {
                    "{C:attention}升级{} {C:diamonds}方块{}，使其提供",
                    "{C:mult}+#3#{} 倍率 和 {C:chips}+#4#{} 筹码",
                    "{C:inactive}（当前每张牌：{C:red}+#5#{}, {C:blue}+#6#{C:inactive}）",
                    "{C:inactive}（等级 {C:attention}#2#{C:inactive}）",
                }
            },
            c_grm_canopus = {
                name = "老人星",
                text = {
                    "{C:attention}升级{} {C:spades}黑桃{}，使其提供",
                    "{C:mult}+#3#{} 倍率 和 {C:chips}+#4#{} 筹码",
                    "{C:inactive}（当前每张牌：{C:red}+#5#{}, {C:blue}+#6#{C:inactive}）",
                    "{C:inactive}（等级 {C:attention}#2#{C:inactive}）",
                }
            },
            c_grm_alpha = {
                name = "半人马座α",
                text = {
                    "{C:attention}升级{} {C:spades}黑桃{}，使其提供",
                    "{C:mult}+#3#{} 倍率 和 {C:chips}+#4#{} 筹码",
                    "{C:inactive}（当前每张牌：{C:red}+#5#{}, {C:blue}+#6#{C:inactive}）",
                    "{C:inactive}（等级 {C:attention}#2#{C:inactive}）",
                }
            },
            c_grm_arcturus = {
                name = "大角星",
                text = {
                    "{C:attention}升级{} {C:bunc_fleurons}梅花{}，使其提供",
                    "{C:mult}+#3#{} 倍率 和 {C:chips}+#4#{} 筹码",
                    "{C:inactive}（当前每张牌：{C:red}+#5#{}, {C:blue}+#6#{C:inactive}）",
                    "{C:inactive}（等级 {C:attention}#2#{C:inactive}）",
                }
            },
            c_grm_vega = {
                name = "织女星",
                text = {
                    "{C:attention}升级{} {C:bunc_halberds}戟牌{}，使其提供",
                    "{C:mult}+#3#{} 倍率 和 {C:chips}+#4#{} 筹码",
                    "{C:inactive}（当前每张牌：{C:red}+#5#{}, {C:blue}+#6#{C:inactive}）",
                    "{C:inactive}（等级 {C:attention}#2#{C:inactive}）",
                }
            },
            c_grm_lp_944_20 = {
                name = "LP 944-20",
                text = {
                    "{C:attention}升级{} {C:inactive}空无？{}，使其提供",
                    "{C:mult}+#3#{} 倍率 和 {C:chips}+#4#{} 筹码",
                    "{C:inactive}（当前每张牌：{C:red}+#5#{}, {C:blue}+#6#{C:inactive}）",
                    "{C:inactive}（等级 {C:attention}#2#{C:inactive}）",
                }
            },
        },
        Elemental = {
            c_grm_m_lead = {
                name = "铅",
                text = {
                    "将 {C:attention}#1#{} 张选定牌",
                    "增强为 {C:attention}铅卡（Lead Card）"
                }
            },
            c_grm_m_radium = {
                name = "镭",
                text = {
                    "将一张选定的 {C:attention}普通卡牌",
                    "增强为 {C:attention}镭卡（Radium Card）"
                }
            },
            c_grm_m_gold = {
                name = "金",
                text = {
                    "将一张选定的 {C:attention}普通卡牌",
                    "增强为 {C:attention}金卡（Gold Card）"
                }
            },
            c_grm_m_platinum = {
                name = "铂",
                text = {
                    "将一张选定的 {C:attention}普通卡牌",
                    "增强为 {C:attention}铂卡（Platinum Card）"
                }
            },
            c_grm_m_fire = {
                name = "火",
                text = {
                    "为一张{C:attention}选定卡牌{}添加",
                    "{C:attention}打火石（Flint）{C:green}状态"
                }
            },
            c_grm_m_water = {
                name = "水",
                text = {
                    "为一张{C:attention}选定卡牌{}添加",
                    "{C:attention}低于零度（Subzero）{C:green}状态"
                }
            },
            c_grm_m_rock = {
                name = "岩",
                text = {
                    "为一张{C:attention}选定卡牌{}添加",
                    "{C:attention}岩石（Rocky）{C:green}状态"
                }
            },
            c_grm_m_air = {
                name = "气",
                text = {
                    "为一张{C:attention}选定卡牌{}添加",
                    "{C:attention}阵风（Gust）{C:green}状态"
                }
            },
            c_grm_m_silver = {
                name = "银",
                text = {
                    "将一张选定的 {C:attention}普通卡牌",
                    "增强为 {C:attention}银卡（Silver Card）"
                }
            },
            c_grm_m_iron = {
                name = "铁",
                text = {
                    "将 {C:attention}#1#{} 张选定牌",
                    "增强为 {C:attention}铁卡（Iron Card）"
                }
            },
        },
        Area = {
            c_grm_classic = {
                name = "经典",
                text = {
                    "返回",
                    "普通游戏模式",
                }
            },
            c_grm_graveyard = {
                name = "坟场",
                text = {
                    "{C:spectral}光谱牌{} 可能会出现在商店中"
                }
            },
            c_grm_plains = {
                name = "平原",
                text = {
                    "回合结束时，每剩余一次{C:blue}出牌次数{}损失 {C:money}-$#1#{}，",
                    "每剩余一次{C:red}弃牌次数{}赚取 {C:money}+$#2#{}"
                }
            },
            c_grm_market = {
                name = "市场",
                text = {
                    "{C:attention}+#1#{} 商店物品槽位",
                    "商店中所有卡牌和补给包价格",
                    "上调 {C:attention}#2#%{}"
                }
            },
            c_grm_landfill = {
                name = "垃圾填埋场",
                text = {
                    "每轮 {C:red}+#1#{} 弃牌次数",
                    "每轮 {C:blue}-#2#{} 出牌次数",
                }
            },
            c_grm_metro = {
                name = "地铁",
                text = {
                    "额外赚取 {C:purple}#1#%{} XP",
                    "没有 {C:attention}商店{}"
                }
            },
            c_grm_ghost_town = {
                name = "鬼镇",
                text = {
                    "结算奖金时有 {C:green}#1#/#2#{} 几率",
                    "额外赚取 {C:money}$#3#{}",
                    "不可赚取 XP",
                }
            },
            c_grm_dungeon = {
                name = "地下城",
                text = {
                    "每个 {C:attention}Boss盲注{} 都是",
                    "一个 {C:attention}决战盲注（Showdown Blind）{}",
                }
            },
            c_grm_tunnel = {
                name = "隧道",
                text = {
                    "在单轮的{C:attention}第一手牌{}中，如果打出了你",
                    "{C:attention}最常打出的手牌{}，则将其{C:attention}升级{}",
                    "否则其等级{C:attention}减半{}"
                }
            },
            c_grm_toxic_waste = {
                name = "有毒废物",
                text = {
                    "每轮 {C:red}+#1#{} 弃牌次数",
                    "每次打出牌后，{C:red}-#2#{} 弃牌次数",
                }
            },
            c_grm_midnight = {
                name = "午夜",
                text = {
                    "抽牌时有 {C:green}30%{} 几率是{C:attention}牌面朝下{}的，",
                    "{C:attention}牌面朝下{}的牌在{C:attention}最后一手牌{}中",
                    "获得 {X:red,C:white} X#1# {} 倍率奖励",
                }
            },
            c_grm_aether = {
                name = "以太",
                text = {
                    "商店中所有卡牌和补给包",
                    "打 {C:attention}#1# 折{}，额外赚取 {C:purple}#2#%{} XP"
                }
            },
        },
        Attack = {
            c_grm_debuff = {
                name = "削弱者",
                text = {
                    "{C:red}削弱{}手中的卡牌"
                }
            },
            c_grm_hide = {
                name = "隐藏",
                text = {
                    "抽出的卡牌",
                    "{C:attention}牌面朝下{}"
                }
            },
            c_grm_up = {
                name = "上升",
                text = {
                    "提高",
                    "{C:attention}盲注规模{}"
                }
            },
            c_grm_ring = {
                name = "鸣响",
                text = {
                    "强制选中{C:attention}卡牌{}"
                }
            },
            c_grm_snatch = {
                name = "掠夺",
                text = {
                    "{C:red}弃掉{}手中的卡牌"
                }
            },
            c_grm_collapse = {
                name = "崩溃",
                text = {
                    "{C:red}降低{}一个",
                    "{C:attention}牌组牌型{}等级"
                }
            },
        },
        Loot = {
            c_grm_hand_refresh = {
                name = "出牌刷新",
                text = {
                    "刷新 {C:blue}出牌次数{}",
                }
            },
            c_grm_discard_refresh = {
                name = "弃牌刷新",
                text = {
                    "刷新 {C:red}弃牌次数{}",
                }
            },
            c_grm_dollar_gain = {
                name = "美金获取",
                text = {
                    "{C:money}+$#1#{}",
                }
            },
            c_grm_joker_create = {
                name = "小丑制造机",
                text = {
                    "创建一个",
                    "{C:green}不寻常{} {C:attention}小丑牌",
                    "{C:inactive}（需有空位）"
                }
            },
        },
        Blind = {
            bl_grm_monday = {
                name = '周一',
                text = { '每打出一手牌后，', '抽到的牌会被削弱' }
            },
            bl_grm_ganymede = {
                name = '盖尼米得',
                text = { '每次弃牌后，', '抽到的卡牌必定牌面朝上' }
            },
            bl_grm_titan = {
                name = '泰坦',
                text = { '仅允许打出', '最后一手牌' }
            },
            bl_grm_triton = {
                name = '特里同',
                text = { '执行弃牌会将', "金钱设为 $-100" }
            },
            bl_grm_coral_well = {
                name = '珊瑚井',
                text = { '将所有弃牌次数', '转为出牌次数' }
            },
            bl_grm_forgotten = {
                name = '被遗忘者',
                text = { '本轮中有 #1#/2 的技能', '会被削弱' }
            },
        },
        Enhanced = {
            m_grm_radium = {
                name = '镭卡',
                text = {
                    "回合结束时持在手中，有 {C:green}#2#/#3#{} ",
                    "几率摧毁此牌，否则获得 {C:purple}+#1#{} XP"
                }
            },
            m_grm_lead = {
                name = '铅卡',
                text = {
                    "在洗牌时往往会",
                    "排在牌组底部",
                }
            },
            m_grm_platinum = {
                name = '铂卡',
                text = {
                    "持在手中时提供",
                    "{C:blue}+#1#{} 筹码"
                }
            },
            m_grm_iron = {
                name = '铁卡',
                text = {
                    "{X:red,C:white} X#1# {} 倍率",
                }
            },
            m_grm_silver = {
                name = '银卡',
                text = {
                    "{C:money}+$#1#{}",
                }
            },
            m_grm_rpg = {
                name = 'RPG卡',
                text = {
                    "{C:purple}+#1#{} XP",
                }
            },
        },
        Tag = {
            tag_grm_philosopher = {
                name = "哲学家标签",
                text = {
                    "获得一个免费的",
                    "{C:attention}超级远古包"
                }
            },
            tag_grm_grid = {
                name = "网格标签",
                text = {
                    "获得一个免费的",
                    "{C:red}区域包"
                }
            },
            tag_grm_xp = {
                name = "XP 标签",
                text = {
                    "{C:purple}+#1#{} XP"
                }
            },
        }
    },
    misc = {
        dictionary = {
            k_area = "区域",
            b_area_cards = "区域卡",
            k_lunar = "月球卡",
            b_lunar_cards = "月球卡",
            k_stellar = "恒星卡",
            b_stellar_cards = "恒星卡",
            k_elemental = "元素卡",
            b_elemental_cards = "元素卡",
            k_attack = "攻击",
            b_attack_cards = "攻击卡",
            k_loot = "战利品",
            b_loot_cards = "战利品卡",
            b_learn = "习得",
            k_skill = "技能",
            k_class = "职业",
            k_inactive = "未激活",
            nullified = "已失效！",
            k_ex_expired = "已过期！",
            k_ex_decay = "已衰减！",
            lunar_stats = "月球统计",
            b_skill_tree_1 = "技能",
            b_skill_tree_2 = "树",
            b_other = "其他",
            b_skills = "技能",
            b_draw = "抽牌",
            b_pack = "打包",
            k_new_area = "新区域！",
            k_area_pack = "区域包",
            k_loot_pack = "战利品包",
            k_ancient_pack = "远古包",
            unknown_skill_name = "???????",
            b_hide_unavailiable_skills = "隐藏不可选技能",
            region_classic = "经典",
            region_metro = "大都会",
            region_spooky = "阴森",
            region_sewer = "下水道",
            region_aether = "以太",
            boss_blind = "Boss 盲注",
            showdown_blind = "决战盲注",
            k_skills_cap = "技能",
            ph_ease_3 = "被 缓和 III 救了一命",
        },
        v_text = {
            ch_c_no_hand_discard_reset = {"{C:blue}出牌次数{}和{C:red}弃牌次数{}不会自动重置。"},
            ch_c_blind_attack = {"盲注可能会使用{C:attention}攻击{}牌"},
            ch_c_astro_blinds = {"仅{C:attention}宇航员{}盲注会出现。"},
            ch_c_force_astronaut = {"你必须作为{C:attention}宇航员{}职业进行游戏。"},
            ch_c_loot_pack = {"每间商店都提供一个免费的{C:attention}战利品包{}。"},
            ch_m_force_stake_xp = {"每底注 {C:purple}#1#{} XP"},
            ch_c_all_rental = {"所有小丑牌都是租用的"},
            ch_c_rental_full_price = {"租用小丑牌的价格为{C:attention}全价{}"}
        },
        v_dictionary = {
            skill_xp = "XP: #1#",
            legendary_tokens = "传说代币: #1#",
            gain_xp = "+#1# XP",
            minus_xp = "-#1# XP",
            area_indicator = "区域: #1#",
            xp_interest = "每 #2# XP 获得 #1# 利息 (最高 #3#)"
        },
        challenge_names = {
            c_astro_dungeon = "天体地下城",
            c_bankruptcy = "破产",
            c_overflow = "溢出",
        },
        labels = {
            skill = "技能"
        }
    }
}