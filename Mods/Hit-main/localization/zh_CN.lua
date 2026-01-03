return {
    descriptions = {
        Back = {
            b_hit_aced = {
                name = "王牌牌组",
                text = {
                    "{C:attention}21点模式{}",
                    "开局时额外获得",
                    "{C:attention}4{}张{C:attention}A{}",
                }
            },
            b_hit_overload = {
                name = "超载牌组",
                text = {
                    "{C:attention}21点模式{}",
                    "{C:attention}+10{} 爆牌上限",
                }
            },
            b_hit_arcane = {
                name = "奥术牌组",
                text = {
                    "{C:attention}21点模式{}",
                    "{C:attention}反塔罗牌{}出现的",
                    "频率提高{C:attention}2{}倍",
                    "{C:red}-1{} 爆牌上限",
                }
            },
            b_hit_temporary = {
                name = "[牌组] ==",
                text = {
                    "{C:attention}21点模式{}",
                    "[{C:attention}小阿尔卡那{}] = 36"
                }
            },
            b_hit_mystic = {
                name = "神秘牌组",
                text = {
                    "{C:attention}21点模式{}",
                    "如果{C:attention}抽牌堆{}和{C:attention}手牌{}为空，",
                    "将{C:attention}弃牌堆{}洗入{C:attention}抽牌堆{}",
                    "每轮{C:red}0{}次弃牌机会"
                }
            }
        },
        Sleeve = {
            sleeve_hit_aced_sl = {
                name = "王牌卡套",
                text = { 
					"{C:attention}21点模式{}",
                    "开局时额外获得",
                    "{C:attention}4{}张{C:attention}A{}",
				}
            },
            sleeve_hit_aced_sl_alt = {
                name = "王牌卡套",
                text = { 
                    "开局时再额外获得",
                    "{C:attention}4{}张{C:attention}A{}",
				}
			},		
		},
        Other = {
            undiscovered_untarot = {
                name = "未发现",
                text = {
                    "在无种子的局中",
                    "购买或使用此牌",
                    "来了解它的作用"
                }
            },
            hit_hermit_indicator = {
                name = "提示",
                text = {
                    "洗入牌组底部",
                    "持续{C:attention}#1#{}轮",
                }
            },
            hit_moon_indicator = {
                name = "提示",
                text = {
                    "洗入牌组顶部",
                    "持续{C:attention}#1#{}轮",
                }
            },
            revert_base = {
                name = "提示",
                text = {
                    "在{C:attention}#3#{}轮内",
                    "恢复为{C:attention}#2#{}的",
                    "{C:attention}#1#{}"
                }
            },
            orig_suit = {
                name = "原花色",
                text = {
                    "{C:attention}#1#{}",
                }
            },
            mega_ace = {
                text = {
                    "巨大A",
                }
            },
            sun_two = {
                text = {
                    "太阳2",
                }
            },
            adrenalten = {
                text = {
                    "肾上腺素10",
                }
            },
            bottomless_pit = {
                text = {
                    "无底深渊",
                }
            },
            hydra = {
                text = {
                    "九头蛇",
                }
            },
            fleeting = {
                name = "转瞬即逝",
                text = {
                    "在{C:attention}回合{}结束时",
                    "{C:red}删除{}",
                },
            },
            perfect = {
                name = "完美",
                text = {
                    "{C:attention}手牌点数总和{}等于",
                    "{C:attention}爆牌上限{}",
                },
            },
            suitless = {
                name = "无花色",
                text = {
                    "没有花色",
                },
            },
            suits_map = {
                name = "对应花色",
                text = {
                    "{C:spades}黑桃{} > {C:hit_swords}宝剑",
                    "{C:hearts}红桃{} > {C:圣杯}圣杯",
                    "{C:clubs}梅花{} > {C:hit_wands}权杖",
                    "{C:diamonds}方块{} > {C:hit_pentacles}星币"
                },
            },
            hit_blue_seal = {
                name = '蓝蜡封',
                text = {
                    '当{C:attention}平局{}或{C:attention}输掉{}时，',
                    '{C:attention}升级{}手中持有的',
                    '{C:attention}牌组牌型{}'
                }
            }
        },
        Untarot = {
            c_hit_unfool = {
                name = "逆位-愚者",
                text = {
                    "向{C:attention}完整牌组{}中",
                    "添加一张{C:attention}#1#{}"
                },
            },
            c_hit_unmagician = {
                name = "逆位-魔术师",
                text = {
                    "将最多{C:attention}#1#{}张选定的牌",
                    "转变为{C:attention}#2#{}，",
                    "持续{C:attention}#3#{}轮"
                }
            },
            c_hit_unhigh_priestess = {
                name = "逆位-女祭司",
                text = {
                    "向{C:attention}完整牌组{}中添加1张你",
                    "打出最多的{C:attention}点数{}牌和1张你",
                    "打出最多的{C:attention}花色{}牌",
                    "{C:inactive}({C:attention}#1#{C:inactive}, {C:attention}#2#{C:inactive}){}"
                }
            },
            c_hit_unempress = {
                name = "逆位-皇后",
                text = {
                    "随机创建最多{C:attention}#1#{}张",
                    "{C:attention}反塔罗牌{}",
                    "{C:inactive}(需有空位)"
                }
            },
            c_hit_unemperor = {
                name = "逆位-皇帝",
                text = {
                    "将最多{C:attention}#1#{}张选定牌",
                    "转变为{C:attention}#2#{}",
                }
            },
            c_hit_unheirophant = {
                name = "逆位-教皇",
                text = {
                    "将所有{C:attention}选定{}的牌转变为",
                    "当前最多数的{C:attention}选定花色{}"
                }
            },
            c_hit_unlovers = {
                name = "逆位-恋人",
                text = {
                    "将{C:attention}#1#{}张选定的牌",
                    "转变为{C:attention}#2#{}",
                }
            },
            c_hit_unchariot = {
                name = "逆位-战车",
                text = {
                    "将最多{C:attention}#1#{}张选定的牌",
                    "转变为随机的",
                    "{C:attention}更高点数{}"
                }
            },
            c_hit_unjustice = {
                name = "逆位-正义",
                text = {
                    "失去{C:red}$#1#{}，将最多",
                    "{C:attention}#2#{}张选定牌的点数",
                    "增加{C:attention}2{}"

                }
            },
            c_hit_unhermit = {
                name = "逆位-隐士",
                text = {
                    "最多{C:attention}#1#{}张选定的牌将在",
                    "接下来的{C:attention}#2#{}轮开始时",
                    "被洗入牌组{C:attention}底部{}"
                }
            },
            c_hit_unwheel_of_fortune = {
                name = "逆位-命运之轮",
                text = {
                    "赚取{C:money}$#1#{}，有{C:green}#2#/#3#{}",
                    "几率向{C:attention}完整牌组{}",
                    "添加一张{C:attention}#4#{}"
                }
            },
            c_hit_unstrength = {
                name = "逆位-力量",
                text = {
                    "增强最多{C:attention}#1#{}张选定牌，",
                    "有{C:green}#2#/#3#{}几率",
                    "{C:red}削弱{}选定的牌"

                }
            },
            c_hit_unhanged_man = {
                name = "逆位-倒吊人",
                text = {
                    "向{C:attention}完整牌组{}添加",
                    "{C:attention}#1#{}张增强牌",
                }
            },
            c_hit_undeath = {
                name = "逆位-死亡",
                text = {
                    "将{C:attention}#1#{}张选定的牌",
                    "增强为",
                    "{C:attention}#2#{}"
                }
            },
            c_hit_untemperance = {
                name = "逆位-节制",
                text = {
                    "将最多{C:attention}#1#{}张选定牌转变为",
                    "{C:attention}#2#{}和{C:attention}人头牌{}"
                }
            },
            c_hit_undevil = {
                name = "逆位-恶魔",
                text = {
                    "将最多{C:attention}#1#{}张选定的牌",
                    "转化为被{C:red}削弱{}的{C:attention}#2#{}"
                }
            },
            c_hit_untower = {
                name = "逆位-高塔",
                text = {
                    "将最多{C:attention}#1#{}张选定牌增强为",
                    "{C:attention}#2#{}，并为每张牌",
                    "增加{C:red}+#3#{}额外倍率"
                }
            },
            c_hit_unstar = {
                name = "逆位-星星",
                text = {
                    "摧毁手中{C:attention}#1#{}张随机牌",
                }
            },
            c_hit_unmoon = {
                name = "逆位-月亮",
                text = {
                    "最多{C:attention}#1#{}张选定的牌将在",
                    "接下来的{C:attention}#2#{}轮开始时",
                    "被洗入牌组{C:attention}顶部{}"
                }
            },
            c_hit_unsun = {
                name = "逆位-太阳",
                text = {
                    "将最多{C:attention}#1#{}张选定的牌",
                    "转变为随机的",
                    "{C:attention}更低点数{}"
                }
            },
            c_hit_unjudgement = {
                name = "逆位-审判",
                text = {
                    "将最多{C:attention}#1#{}张选定牌转变为",
                    "手中{C:attention}最左边{}牌的{C:attention}点数{}"
                }
            },
            c_hit_unworld = {
                name = "逆位-世界",
                text = {
                    "将{C:attention}#1#{}张选定的牌",
                    "增强为",
                    "{C:attention}#2#{}"
                }
            },
        },
        Enhanced = {
            m_hit_blackjack = {
                name = '超级21点牌',
                text = {
                    "额外增加{C:attention}+1{}、{C:attention}2{}、",
                    "{C:attention}3{}或{C:attention}4{}点手牌总和"
                }
            },
            m_hit_nope = {
                name = '否定牌',
                text = {
                    "额外增加{C:attention}+13{}点手牌总和",
                }
            },
            m_hit_garnet = {
                name = '石榴石牌',
                text = {
                    "在{C:attention}停牌{}时，此牌",
                    "不会被{C:attention}弃掉{}",
                }
            },
            m_hit_degraded = {
                name = '退化牌',
                text = {
                    "没有花色",
                }
            },
            m_hit_osmium = {
                name = '锇金牌',
                text = {
                    "玩家{C:attention}停牌{}时，手牌总和{C:attention}+2{}",
                    "敌人{C:attention}停牌{}时，",
                    "敌人手牌总和{C:attention}+2{}"
                }
            },
            m_hit_perfect = {
                name = '完美牌',
                text = {
                    "无点数或花色",
                    "{C:blue}+#1#{} 筹码, {X:mult,C:white} X#2# {} 倍率",
                    "增加等同于{C:attention}爆牌上限{}",
                    "的{C:attention}手牌点数总和{}",
                }
            },
        },
        CustomCard = {
            mega_ace = {
                text = {
                    "{C:attention}A{}, {C:blue}+#1#{} 筹码",
                    "为手牌总和贡献",
                    "{C:attention}11{}或{C:attention}21{}点",
                }
            },
            sun_two = {
                text = {
                    "{C:attention}2{}, {C:attention}人头牌{}",
                    "在{C:attention}停牌{}时，所有{C:attention}未爆牌{}",
                    "的手牌总和被视为{C:attention}0{}",
                }
            },
            adrenalten = {
                text = {
                    "{C:attention}10{}, {C:hearts}#1#{}",
                    "在{C:attention}要牌{}时，获得{C:red}+1{} 倍率",
                    "{C:inactive}(当前 {C:red}+#3# {C:inactive}倍率){}",
                }
            },
            bottomless_pit = {
                text = {
                    "{C:attention}10{}, {C:blue}+#1#{} 筹码",
                    "在{C:attention}停牌{}时如果{C:attention}爆牌{}，",
                    "手牌价值变为{C:red}#2#{}",
                    "{C:inactive}(当前 {C:attention}#3# {C:inactive}手牌价值){}",
                }
            },
            hydra = {
                text = {
                    "{C:attention}3{}, {C:blue}+#1#{} 筹码, {C:attention}人头牌{}",
                    "在{C:attention}要牌{}时，创建一张",
                    "此牌的{C:attention}转瞬即逝{}副本",
                }
            },
        },
        Joker = {
            j_hit_social = {
                name = "社交小丑",
                text = {
                    "如果打出的手牌包含",
                    "{C:attention}#2#{}，",
                    "获得{C:red}+#1#{} 倍率"
                }
            },
            j_hit_manipulative = {
                name = "操控小丑",
                text = {
                    "如果打出的手牌包含",
                    "{C:attention}#2#{}，",
                    "获得{C:red}+#1#{} 倍率"
                }
            },
            j_hit_creative = {
                name = "创意小丑",
                text = {
                    "如果打出的手牌包含",
                    "{C:attention}#2#{}，",
                    "获得{C:red}+#1#{} 倍率"
                }
            },
            j_hit_merry = {
                name = "欢乐小丑",
                text = {
                    "如果打出的手牌包含",
                    "{C:attention}#2#{}，",
                    "获得{C:blue}+#1#{} 筹码"
                }
            },
            j_hit_secretive = {
                name = "神秘小丑",
                text = {
                    "如果打出的手牌包含",
                    "{C:attention}#2#{}，",
                    "获得{C:blue}+#1#{} 筹码"
                }
            },
            j_hit_hoarding = {
                name = "囤积小丑",
                text = {
                    "如果打出的手牌包含",
                    "{C:attention}#2#{}，",
                    "获得{C:blue}+#1#{} 筹码"
                }
            },
            j_hit_friends = {
                name = "朋友小丑",
                text = {
                    "如果打出的手牌包含",
                    "{C:attention}#2#{}，",
                    "获得{X:mult,C:white} X#1# {} 倍率"
                }
            },
            j_hit_pair = {
                name = "双人小丑",
                text = {
                    "如果打出的手牌包含",
                    "{C:attention}#2#{}，",
                    "获得{X:mult,C:white} X#1# {} 倍率"
                }
            },
            j_hit_bundle = {
                name = "捆绑小丑",
                text = {
                    "如果打出的手牌包含",
                    "{C:attention}#2#{}，",
                    "获得{X:mult,C:white} X#1# {} 倍率"
                }
            },
            j_hit_constructing_primes = {
                name = "构建素数",
                text = {
                    "每张打出的{C:attention}2{}、{C:attention}3{}、",
                    "{C:attention}5{}、{C:attention}7{}或{C:attention}A{}",
                    "在计分时给予{X:mult,C:white} X#1# {} 倍率",
                }
            },
            j_hit_tiebreaker = {
                name = "平局决胜",
                text = {
                    "发生{C:attention}平局{}时，",
                    "{C:attention}玩家{}获胜",
                }
            },
            j_hit_jackpot = {
                name = "大奖",
                text = {
                    "如果{C:attention}打出的手牌{}包含3张",
                    "{C:attention}7{}，向牌组添加一张",
                    "{C:attention}幸运7{}"
                }
            },
            j_hit_supernatural_stars = {
                name = "超自然之星",
                text = {
                    "赢得{C:green}停牌{}时，如果手牌",
                    "正好包含{C:attention}7{}张牌，",
                    "则创建一张{C:spectral}幽灵卡{}。"
                }
            },
            j_hit_perfect_crystal = {
                name = "完美水晶",
                text = {
                    "如果手牌是{C:attention}完美{}的，",
                    "且没有{C:attention}A{}，",
                    "获得{X:mult,C:white} X#1# {} 倍率"
                }
            },
            j_hit_big_chip = {
                name = "巨额筹码",
                text = {
                    "{C:attention}+#1#{} 爆牌上限",
                }
            }
        },
        MinorArcana = {
            ["Ace of hit_pentacles"] = {
                name = '星币A',
                text = {
                    "向手中添加一张{C:diamonds}方块A{}",
                    "，然后{C:red}弃牌{}"
                }
            },
            ["Ace of hit_cups"] = {
                name = '圣杯A',
                text = {
                    "移至牌组{C:attention}顶部{}，",
                    "然后将牌组中某种",
                    "{C:attention}随机花色{}的所有牌",
                    "移至牌组{C:attention}顶部{}"
                }
            },
            ["Ace of hit_swords"] = {
                name = '宝剑A',
                text = {
                    "向牌组洗入{C:attention}4张转瞬即逝的超级{}",
                    "{C:attention}21点0点牌{}，然后{C:red}弃牌{}"
                }
            },
            ["Ace of hit_wands"] = {
                name = '权杖A',
                text = {
                    "{C:attention}要牌{}，{C:green}停牌{}，然后在任一",
                    "{C:attention}计分{}结束时获得{X:mult,C:white} X2 {}",
                    "倍率"
                }
            },
            ["2 of hit_pentacles"] = {
                name = '星币2',
                text = {
                    "向牌组洗入1张{C:attention}转瞬即逝的2{}",
                    "以及1张{C:attention}转瞬即逝的A{}",
                    "（皆为{C:diamonds}方块{}），然后{C:red}弃牌{}"
                }
            },
            ["2 of hit_cups"] = {
                name = '圣杯2',
                text = {
                    "从牌堆中抽一张{C:hearts}红桃皇后{}",
                    "或{C:hearts}红桃国王{}",
                }
            },
            ["2 of hit_swords"] = {
                name = '宝剑2',
                text = {
                    "向牌组洗入{C:attention}2张转瞬即逝{}的{C:dark_edition}闪箔{C:attention}石头牌{}",
                    "然后{C:attention}跟进{}，接着{C:red}弃牌{}",
                }
            },
            ["2 of hit_wands"] = {
                name = '权杖2',
                text = {
                    "揭示牌组顶部的{C:attention}2{}张牌的",
                    "{C:attention}点数{}和{C:attention}花色{}，然后{C:red}弃牌{}"
                }
            },
            ["3 of hit_pentacles"] = {
                name = '星币3',
                text = {
                    "向{C:attention}手中{}添加一张{C:attention}转瞬即逝{}的牌，",
                    "如果存在能使手牌变{C:attention}完美{}的",
                    "{C:attention}点数{}。然后{C:red}弃牌{}"
                }
            },
            ["3 of hit_cups"] = {
                name = '圣杯3',
                text = {
                    "将手中{C:attention}3{}张牌转换为",
                    "单一种类的随机{C:attention}花色{}，",
                    "然后{C:green}停牌{}",
                },
            },
            ["3 of hit_swords"] = {
                name = '宝剑3',
                text = {
                    "在接下来的{C:attention}3{}次{C:green}停牌{}中",
                    "{C:red}削弱敌人{}的增强牌，",
                    "然后{C:red}弃牌{}",
                }
            },
            ["3 of hit_wands"] = {
                name = '权杖3',
                text = {
                    "如果{C:attention}爆牌{}，弃掉{C:attention}1{}",
                    "张选定的牌，然后",
                    "{C:attention}要牌{}，最后{C:green}停牌{}"
                }
            },
            ["4 of hit_pentacles"] = {
                name = '星币4',
                text = {
                    "将{C:attention}完整牌组{}中所有的{C:attention}A{}",
                    "洗入牌堆，",
                    "然后{C:red}弃牌{}"
                }
            },
            ["4 of hit_cups"] = {
                name = '圣杯4',
                text = {
                    "锁定得分为{C:attention}0{}",
                    "直到抽到{C:attention}4{}种花色为止",
                    "{C:inactive}({C:attention}#1#{C:inactive}/{C:attention}4{C:inactive}){}"
                }
            },
            ["4 of hit_swords"] = {
                name = '宝剑4',
                text = {
                    "向{C:attention}牌组{}洗入{C:attention}14张转瞬即逝的奖励{}",
                    "{C:attention}牌{}，然后{C:red}弃牌{}",
                }
            },
            ["4 of hit_wands"] = {
                name = '权杖4',
                text = {
                    "将{C:attention}弃牌堆{}顶部的牌放回手中，",
                    "在本{C:attention}回合{}使用{C:attention}4{}次后{C:red}弃置{}",
                    "{C:inactive}({C:attention}#1#{C:inactive}/{C:attention}4{C:inactive}, {C:attention}#2#{C:inactive}){}",
                }
            },
            ["5 of hit_pentacles"] = {
                name = '星币5',
                text = {
                    "{C:red}弃掉{}牌组中所有的{C:attention}人头牌{}",
                    "包含这张{C:attention}牌{}本身",
                }
            },
            ["5 of hit_cups"] = {
                name = '圣杯5',
                text = {
                    "将手中所有牌标记为",
                    "{C:attention}无花色{}并将它们的{C:attention}点数{}",
                    "降低{C:attention}1{}。然后",
                    "{C:green}停牌{}并{C:red}弃牌{}"
                }
            },
            ["5 of hit_swords"] = {
                name = '宝剑5',
                text = {
                    "{C:red}弃掉{}手中所有牌，然后",
                    "向手中添加一张{C:attention}完美牌{}，",
                    "接着{C:green}停牌{}并{C:red}弃牌{}"
                }
            },
            ["5 of hit_wands"] = {
                name = '权杖5',
                text = {
                    "本手牌{C:attention}+5{} 爆牌上限，",
                    "然后{C:attention}要牌{}两次",
                    "{C:inactive}(当前 {C:attention}#1#{C:inactive} 爆牌上限){}",
                }
            },
            ["6 of hit_pentacles"] = {
                name = '星币6',
                text = {
                    "失去{C:red}-$2{}，将最多{C:attention}1{}张",
                    "选定牌的点数增加{C:attention}1{}，",
                    "然后{C:green}停牌{}"
                }
            },
            ["6 of hit_cups"] = {
                name = '圣杯6',
                text = {
                    "本轮你的{C:attention}游戏牌{}，",
                    "也将被视为其{C:attention}原始{}花色，",
                    "然后{C:red}弃牌{}"
                }
            },
            ["6 of hit_swords"] = {
                name = '宝剑6',
                text = {
                    "将手中{C:attention}1张增强{}牌",
                    "转变为{C:attention}玻璃牌{}，",
                    "然后{C:red}弃牌{}"
                }
            },
            ["6 of hit_wands"] = {
                name = '权杖6',
                text = {
                    "如果手牌是{C:attention}完美{}的，将",
                    "出牌次数设为{C:blue}6{}，然后{C:attention}要牌{}",
                }
            },
            ["7 of hit_pentacles"] = {
                name = '星币7',
                text = {
                    "向{C:attention}完整牌组{}洗入{C:attention}#1#张7{}，",
                    "然后摧毁此牌",
                    "{C:inactive, s:0.8}(点数和数量每轮都会变化){}"
                }
            },
            ["7 of hit_cups"] = {
                name = '圣杯7',
                text = {
                    "有{C:green}1/4{}几率将手中最多",
                    "{C:attention}3{}张牌转变为其对应的",
                    "{C:attention}小阿尔卡那{}花色，持续{C:attention}2{}轮",
                    "然后{C:red}弃牌{}，否则直接{C:green}停牌{}"
                }
            },
        },
        Spectral = {
            c_hit_trance = {
                name = "入迷",
                text = {
                    "为手中{C:attention}1{}张选定牌",
                    "添加{C:blue}蓝蜡封{}"
                }
            },
            c_hit_ectoplasm = {
                name = "外质",
                text = {
                    "为随机{C:attention}小丑牌{}添加{C:dark_edition}负片{}，",
                    "向{C:attention}完整牌组{}添加{C:red}+#1#{}张",
                    "{C:attention}随机{}牌"
                }
            },
        }
    },
    misc = {
        dictionary = {
            k_blindeffect = "盲注效果",
            b_blindeffect_cards = "盲注效果",
            b_loot = "掠夺",
            b_common_loot = "普通",
            b_uncommon_loot = "罕见",
            b_rare_loot = "稀有",
            b_hit = "要牌",
            b_stand = "停牌",
            ph_blackjack_lost = "你输了",
            b_choose_cards = "选择卡牌",
            b_exit = "退出",
            ph_test_memory = "测试你的记忆力！",
            b_enemy_deck = "敌人牌组",
            k_untarot = "反塔罗",
            b_untarot_cards = "反塔罗牌",
            k_unarcana_pack = "反秘术包",
            ow_ex = "哎哟！",
            k_lucky_ex = "大奖",
            k_minorarcana_pack = "小阿尔卡那包",
            stands_on = "停牌于 #1#",
        },
        v_text = {
            ch_c_ante_hand_discard_reset = {"{C:blue}出牌次数{}和{C:red}弃牌次数{}仅在每个{C:attention}底注{}重置。"},
            ch_c_dungeon = {"{C:attention}21点模式{}"},
        },
        v_dictionary = {
            stands_on = "停牌于 #1#"
        },
        challenge_names = {
            c_blackjack = "21点"
        },
        labels = {
            hit_blue_seal = "蓝蜡封"
        },
        ranks = {
            hit_0 = '0',
            hit_Page = '侍从',
            hit_Knight = '骑士',
        },
        suits_singular = {
            hit_pentacles = "星币",
            hit_cups = "圣杯",
            hit_swords = "宝剑",
            hit_wands = "权杖",
        },
        suits_plural = {
            hit_pentacles = "星币",
            hit_cups = "圣杯",
            hit_swords = "宝剑",
            hit_wands = "权杖",
        },
        poker_hands = {
            ["hit_High Card0"] = "高牌",
            ["hit_Court"] = "廷臣",
            ["hit_Duo"] = "二重奏",
            ["hit_Batch"] = "一批",
            ["hit_Blackjack"] = "21点",
            ["hit_Duo+"] = "二重奏+",
            ["hit_Batch+"] = "一批+",
            ["hit_Blackjack Batch"] = "21点批次",
            ["hit_Supreme"] = "至尊",
        },
        poker_hand_descriptions = {
            ["hit_High Card0"] = {
                "如果打出的手牌不属于上述",
                "任何一种牌型，则仅计算点数最大的牌"
            },
            ["hit_Court"] = {
                "2张人头牌。",
            },
            ["hit_Duo"] = {
                "2张相同点数的牌和",
                "另1张不同点数的牌。",
            },
            ["hit_Batch"] = {
                "3张相同花色的牌。",
            },
            ["hit_Blackjack"] = {
                "手牌总和等于",
                "爆牌上限的牌"
            },
            ["hit_Duo+"] = {
                "3张或更多相同点数的牌和",
                "另1张不同点数的牌。",
            },
            ["hit_Batch+"] = {
                "4张或更多相同花色的牌。",
            },
            ["hit_Blackjack Batch"] = {
                "3张或更多同花色的牌且",
                "手牌总和等于爆牌上限"
            },
            ["hit_Supreme"] = {
                "6张或更多有点数的牌"
            },
        }
    }
}
