return {
    descriptions = {
        Mod = {
            sdm0sstuff = {
                name = "SDM_0 的内容",
                text = {
                    "{C:attention,s:1.3}内容{s:1.3}模组，添加了新的{C:attention,s:1.3}小丑{s:1.3}、{C:tarot,s:1.3}消耗牌{s:1.3}、",
                    "{C:blue,s:1.3}优惠券{s:1.3}、{C:red,s:1.3}牌组{s:1.3}、{C:money,s:1.3}挑战{s:1.3}和{C:bakery,s:1.3}烘焙品{s:1.3}。",
                    " ",
                    "{E:2,C:gold,s:1.3}特别感谢{s:1.3} RattlingSnow、queen of stupid、FlameThrowerFIM、",
                    "Jamie、N'、Larswijn、Darthalex2014、PainKiller 和 Mysthaps 的帮助"
                }
            }
        },
        Joker = {
            j_sdm_burger = {
                name = "汉堡",
                text = {
                    "在接下来的{C:attention}#4#{}回合中，",
                    "给予{C:chips}+#3#{}筹码、{C:mult}+#2#{}倍率",
                    "以及{X:mult,C:white}X#1#{}倍率",
                }
            },
            j_sdm_bounciest_ball = {
                name = "最弹的球",
                text = {
                    "计分最多次打出的{C:attention}牌型{}时，",
                    "此小丑获得{C:chips}+#2#{}筹码",
                    "{C:inactive}(当前为{C:attention}#3#{C:inactive}, {C:chips}+#1#{C:inactive}筹码)"
                }
            },
            j_sdm_lucky_joker = {
                name = "幸运小丑",
                text = {
                    "额外{C:attention}重新触发{}",
                    "每张计分的{C:attention}7{}",
                    "{C:attention}#1#{}次"
                }
            },
            j_sdm_iconic_icon = {
                name = "标志性图标",
                text = {
                    "完整牌组中每有一张{C:attention}A{}",
                    "给予{C:mult}+#2#{}倍率，如果已被{C:attention}增强{}",
                    "则改为{C:mult}+#3#{}倍率",
                    "{C:inactive}(当前为{C:mult}+#1#{C:inactive}倍率)"
                }
            },
            j_sdm_mult_n_chips = {
                name = "倍率与筹码",
                text = {
                    "计分的{C:attention}奖励{}卡给予{C:mult}+#1#{}倍率，",
                    "计分的{C:attention}倍率{}卡给予{C:chips}+#2#{}筹码",
                }
            },
            j_sdm_moon_base = {
                name = "月球基地",
                text = {
                    "选择{C:attention}盲注{}时，",
                    "随机创建一张",
                    "{C:attention}太空{}小丑",
                    "{s:0.8,C:inactive}(无法创建月球基地)",
                    "{C:inactive}(必须有空间)"
                }
            },
            j_sdm_shareholder_joker = {
                name = "股东小丑",
                text = {
                    "在回合结束时",
                    "赢得{C:money}$#1#{}到{C:money}$#2#{}之间的金钱",
                }
            },
            j_sdm_magic_hands = {
                name = "魔术手",
                text = {
                    "{C:attention}三条{}或{C:attention}更高{}牌型",
                    "可以用少{C:attention}1{}张卡牌组成"
                }
            },
            j_sdm_tip_jar = {
                name = "小费罐",
                text = {
                    "回合结束时，赢得你持有金钱的",
                    "{C:attention}最高位数{}",
                    "{C:inactive}(例如：{C:money}$24{C:inactive} -> {C:money}$4{C:inactive})",
                }
            },
            j_sdm_wandering_star = {
                name = "流浪之星",
                text = {
                    "{C:green}重掷{}时，随机升级",
                    "一个{C:attention}牌型{}等级"
                }
            },
            j_sdm_ouija_board = {
                name = "通灵板",
                text = {
                    "持有{C:attention}#2#{}回合后，",
                    "出售此牌以创建一张{C:spectral}灵魂{}牌",
                    "{C:inactive}(必须有空间)",
                    "{C:inactive}(当前为{C:attention}#1#{C:inactive}/#2#)"
                }
            },
            j_sdm_la_revolution = {
                name = "革命",
                text = {
                    "升级在未打出{C:attention}人头牌{}",
                    "的情况下打出的{C:attention}获胜牌型{}",
                }
            },
            j_sdm_clown_bank = {
                name = "小丑银行",
                text = {
                    "选择{C:attention}盲注{}时，将{C:money}$#3#{}存入此",
                    "小丑的{C:attention}转售价值{}。额外转售价值中",
                    "每有{C:money}$#4#{}，就提供{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}(当前为{X:mult,C:white}X#1#{C:inactive}倍率)"
                }
            },
            j_sdm_furnace = {
                name = "熔炉",
                text = {
                    "回合开始时，",
                    "随机添加一张{C:attention}金卡{}或",
                    "{C:attention}钢卡{}",
                }
            },
            j_sdm_warehouse = {
                name = "仓库",
                text = {
                    "{C:attention}+#1#{}手牌大小，",
                    "其他卡牌无法售出",
                }
            },
            j_sdm_zombie_joker = {
                name = "僵尸小丑",
                text = {
                    "{C:attention}售出{}小丑牌时，有",
                    "{C:green}#1#/#2#{}几率创建一张{C:tarot}死亡{}牌",
                    "{C:inactive}(必须有空间)"
                }
            },
            j_sdm_mystery_joker = {
                name = "神秘小丑",
                text = {
                    "击败{C:attention}Boss盲注{}时，",
                    "创建一张{C:red}罕见{C:attention}标签{}",
                }
            },
            j_sdm_infinite_staircase = {
                name = "无限阶梯",
                text = {
                    "如果打出的牌型中包含不含{C:attention}A{}",
                    "的{C:attention}纯数字顺子{}，",
                    "给予{X:mult,C:white}X#1#{}倍率",
                }
            },
            j_sdm_ninja_joker = {
                name = "忍者小丑",
                text = {
                    "当一张{C:attention}计分牌{}被销毁时，",
                    "为此小丑{C:attention}相邻的小丑{}添加{C:dark_edition}负片{}",
                    "然后此小丑{S:1.1,C:red,E:2}自毁{}"
                }
            },
            j_sdm_reach_the_stars = {
                name = "触及星辰",
                text = {
                    "打出包含{C:attention}#1#{}和{C:attention}#2#{}的牌型时，",
                    "创建一张随机的{C:planet}星球{}牌",
                    "{s:0.8}等级每次触发后改变",
                    "{C:inactive}(必须有空间)",
                    "{C:inactive}(当前为{C:attention}#3#{C:inactive}#4# 和 {C:attention}#5#{C:inactive}#6#)"
                }
            },
            j_sdm_crooked_joker = {
                name = "弯曲小丑",
                text = {
                    "每当添加一个{C:attention}小丑{}时，",
                    "有几率将其{C:attention}翻倍{}或{C:red}销毁{}",
                    "{C:inactive}(必须有空间)"
                }
            },
            j_sdm_crooked_joker_cryptid = {
                name = "弯曲小丑",
                text = {
                    "每当添加一个{C:attention}小丑{}时，",
                    "有几率将其{C:attention}翻倍{}或{C:red}销毁{}",
                    "{C:inactive}(必须有空间)",
                    "{C:inactive}(无法被控制)"
                }
            },
            j_sdm_property_damage = {
                name = "财产损失",
                text = {
                    "丢弃的牌型包含{C:attention}葫芦{}时，",
                    "此小丑获得{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}(当前为{X:mult,C:white}X#1#{} {C:inactive}倍率)",
                }
            },
            j_sdm_rock_n_roll = {
                name = "摇滚",
                text = {
                    "额外{C:attention}重新触发{}所有打出的",
                    "{C:attention}增强{}牌",
                }
            },
            j_sdm_contract = {
                name = "合同",
                text = {
                    "回合结束时赢得{C:money}$#1#{}，",
                    "但盲注目标变为{C:red}#2#倍{}",
                }
            },
            j_sdm_cupidon = {
                name = "丘比特",
                text = {
                    "{C:blue}+#1#{}出牌次数，",
                    "{C:attention}+#2#{}手牌大小，",
                    "{C:red}-#3#{}弃牌次数",
                }
            },
            j_sdm_pizza = {
                name = "披萨",
                text = {
                    "选择{C:attention}盲注{}时，获得{C:blue}+#1#{}出牌次数",
                    "每打出一个回合，{C:blue}-#2#{}出牌次数"
                }
            },
            j_sdm_treasure_chest = {
                name = "宝箱",
                text = {
                    "出售此牌以赢得{C:money}$#1#",
                }
            },
            j_sdm_bullet_train = {
                name = "子弹头列车",
                text = {
                    "如果本回合没有使用过弃牌次数，",
                    "则在你的{C:attention}第一手牌{}中",
                    "给予{C:chips}+#1#{}筹码",
                }
            },
            j_sdm_chaos_theory = {
                name = "混沌理论",
                text = {
                    "将所有{C:attention}屏幕上的数字{}的{C:attention}双倍{}值",
                    "添加到筹码中",
                    "{C:inactive}(当前为{C:chips}+#2#{C:inactive}筹码)"
                }
            },
            j_sdm_jambo = {
                name = "詹伯",
                text = {
                    "随机将一张{C:attention}丢弃牌{}的",
                    "点数的{C:attention}两倍{}添加到倍率中",
                }
            },
            j_sdm_water_slide = {
                name = "滑水梯",
                text = {
                    "打出的{C:attention}9{}、{C:attention}7{}和{C:attention}6{}在",
                    "计分时变为{C:attention}奖励{}卡",
                }
            },
            j_sdm_joker_voucher = {
                name = "小丑优惠券",
                text = {
                    "本局游戏中每兑换过一张{C:attention}优惠券{}，",
                    "给予{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}(当前为{X:mult,C:white}X#2#{C:inactive}倍率)"
                }
            },
            j_sdm_free_pass = {
                name = "通行证",
                text = {
                    "每回合的第一手{C:blue}出牌{}或{C:red}弃牌{}",
                    "是{C:attention}免费{}的",
                }
            },
            j_sdm_legionary_joker = {
                name = "军团小丑",
                text = {
                    "手牌中每有一张{C:spades}#1#{}或{C:diamonds}#2#{}",
                    "给予{C:mult}+#3#{}倍率",
                },
            },
            j_sdm_jack_a_dit = {
                name = "杰克艾迪特",
                text = {
                    "如果牌型是{C:attention}#2#{}或{C:attention}#3#{}",
                    "且包含一张{C:attention}J{}，给予{C:red}+#1#{}倍率",
                    "{s:0.8}牌型每回合结束时改变",
                },
            },
            j_sdm_chain_reaction = {
                name = "连锁反应",
                text = {
                    "计分出{C:attention}X个相同点数{}时，",
                    "此小丑获得{C:mult}+X{}倍率",
                    "{C:inactive}(当前为{C:mult}+#1#{C:inactive}倍率)"
                }
            },
            j_sdm_consolation_prize = {
                name = "安慰奖",
                text = {
                    "回合结束时，如果你打出了",
                    "{C:attention}最后一手牌{}，随机创建一张{C:attention}标签{}",
                }
            },
            j_sdm_horoscopy = {
                name = "占星术",
                text = {
                    "使用一张{C:planet}星球{}牌时，有",
                    "{C:green}#1#/#2#{}几率创建一张随机{C:tarot}塔罗{}牌",
                    "{C:inactive}(必须有空间)"
                }
            },
            j_sdm_roulette = {
                name = "轮盘赌",
                text = {
                    "回合开始时，有{C:green}#1#/#2#{}几率",
                    "为一张随机的{C:attention}小丑{}或{C:attention}卡牌{}",
                    "添加{C:dark_edition}闪闪{}、{C:dark_edition}全息{}或{C:dark_edition}多彩{}版本",
                },
            },
            j_sdm_carcinization = {
                name = "蟹化",
                text = {
                    "选择{C:attention}盲注{}时，将左侧的小丑",
                    "转换为{C:attention}蟹化{}",
                    "每个{C:attention}蟹化{}给予{C:mult}+#1#{}倍率",
                    "{C:inactive}(当前为{C:mult}+#2#{C:inactive}倍率)"
                }
            },
            j_sdm_wormhole = {
                name = "虫洞",
                text = {
                    "升级等级的效果{C:attention}翻倍{}"
                }
            },
            j_sdm_child = {
                name = "孩子",
                text = {
                    "盲注目标分数需求{X:attention,C:white}X#1#{}",
                }
            },
            j_sdm_yo_yo = {
                name = "悠悠球",
                text = {
                    "每次{C:attention}打出手牌{}，在",
                    "{X:mult,C:white}X#1#{}和{X:mult,C:white}X#2#{}倍率之间切换",
                    "{C:inactive}(当前为{X:mult,C:white}X#3#{C:inactive}倍率)"
                }
            },
            j_sdm_ditto_joker = {
                name = "百变怪小丑",
                text = {
                    "选择{C:attention}盲注{}时，转变为一个随机的",
                    "已拥有{C:attention}小丑{}。每次选择时重置",
                    "{C:inactive}(百变怪小丑除外)"
                }
            },
            j_sdm_pastry_chef = {
                name = "面点师",
                text = {
                    "每消耗一个{C:bakery}烘焙品{}，",
                    "创建一个随机{C:bakery}烘焙品{}",
                    "{C:inactive}(必须有空间)"
                }
            },
            j_sdm_archibald = {
                name = "阿奇博尔德",
                text = {
                    "每层{C:attention}底注{}一次，在商店结束时",
                    "创建一个随机小丑的{C:dark_edition}负片{}副本",
                    "{C:inactive}(无法复制阿奇博尔德)",
                    "{C:inactive}(当前为{C:attention}#1#{C:inactive}#2#{C:inactive})"
                }
            },
            j_sdm_0 = {
                name = "SDM_0",
                text = {
                    "当一张{C:attention}2{}被销毁时，",
                    "{C:dark_edition}+#1#{}小丑槽位"
                }
            },
            j_sdm_skelton = {
                name = "斯凯尔顿",
                text = {
                    "如果得分牌型是单张{C:attention}J{}，此小丑销毁",
                    "所有{C:attention}未计分牌{}并根据销毁张数给予金钱",
                    "每张销毁的牌给予{C:money}$#2#{}",
                    "{C:inactive}(目前已获得{C:money}$#1#{C:inactive})"
                }
            },
            j_sdm_trance_the_devil = {
                name = "入迷恶魔",
                text = {
                    "回合结束时，此小丑{C:attention}销毁{}每个",
                    "{C:attention}原版{}消耗品，并获得{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}(当前为{X:mult,C:white}X#2#{C:inactive}倍率)"
                }
            },
            j_sdm_mishmash = {
                name = "大杂烩",
                text = {
                    "计分奖励卡给{C:mult}+#1#{}倍率，计分倍率卡给{C:chips}+#2#{}筹码，",
                    "持有的金卡给{X:mult,C:white}X#3#{}倍率，",
                    "持有的钢卡在回合结束时给{C:money}$#4#{}"
                }
            },
            j_sdm_ceo_joker = {
                name = "CEO小丑",
                text = {
                    "回合结束时赢得{C:money}$#1#{}到{C:money}$#2#{}之间的金钱",
                }
            },
            j_sdm_maglev_train = {
                name = "磁悬浮列车",
                text = {
                    "如果本回合没有使用过弃牌次数，",
                    "则在你的{C:attention}第一手牌{}中",
                    "给予{C:mult}+#1#{}倍率",
                }
            },
            j_sdm_joker_voucher_voucher = {
                name = "小丑优惠券优惠券",
                text = {
                    "销毁此牌以兑换",
                    "一个{C:attention}小丑优惠券优惠券{}"
                }
            },
        },
        Back = {
            b_sdm_0_s = {
                name = "SDM_0 的牌组",
                text = {
                    "{C:attention}SDM_0 的内容{}系列",
                    "小丑牌出现的几率",
                    "提高到 {C:attention}5{} 倍"
                },
            },
            b_sdm_bazaar = {
                name = "集市牌组",
                text = {
                    "每击败一个{C:attention}Boss盲注{}，",
                    "创建一张{C:attention}SDM_0 的内容{}消耗牌",
                    "{C:inactive}(必须有空间)"
                },
            },
            b_sdm_sandbox = {
                name = "沙盒牌组",
                text = {
                    "{C:attention}+#1#{}小丑槽位，",
                    "{C:red}+#2#{}获胜所需的底注",
                }
            },
            b_sdm_lucky_7 = {
                name = "幸运7牌组",
                text = {
                    "初始的{C:attention}7{}是{C:attention,T:m_lucky}幸运{}卡",
                    "{s:0.8}翻倍所有{C:attention,s:0.8}列出的{C:green,E:1,S:1.1,s:0.8}概率",
                    "{C:red}X#1#{}基础盲注大小"
                }
            },
            b_sdm_dna = {
                name = "DNA牌组",
                text = {
                    "来自{C:attention}获胜手牌{}的",
                    "最右侧的牌将被{C:blue}复制{}",
                }
            },
            b_sdm_hieroglyph = {
                name = "象形文字牌组",
                text = {
                    "{C:spectral}幻灵{}牌可能会在商店出现，",
                    "开始游戏时拥有一张{C:spectral,T:c_ankh}生命之符{}牌",
                }
            },
            b_sdm_xxl = {
                name = "XXL牌组",
                text = {
                    "以{C:attention}双倍{}的",
                    "初始牌组张数开始游戏",
                }
            },
            b_sdm_hoarder = {
                name = "囤积者牌组",
                text = {
                    "每回合结束时：",
                    "每个剩余的{C:red}弃牌次数{}给予{C:money}$#1#{}",
                    "额外的{C:blue}出牌次数{}不再获得金钱",
                    "回合结束时不再获得{C:attention}利息{}"
                }
            },
            b_sdm_modders = {
                name = "模组作者牌组",
                text = {
                    "{C:attention}原版{}小丑牌",
                    "不会在商店中出现",
                }
            },
            b_sdm_reverb = {
                name = "混响牌组",
                text = {
                    "所有小丑额外{C:attention}重新触发 #2#{}次，",
                    "但只有{C:red}#1#{}个小丑槽位",
                }
            },
            b_sdm_roguelike = {
                name = "Roguelike牌组",
                text = {
                    "开始游戏时拥有{C:attention,T:v_overstock_norm}#1#{}优惠券，",
                    "{C:attention}+#2#{}个扩展包槽位，",
                    "禁用{C:green}重掷{}"
                }
            },
            b_sdm_bakers = {
                name = "烘焙师牌组",
                text = {
                    "开始游戏时拥有{C:bakery,T:v_sdm_bakery_stall}#1#{}优惠券，",
                    "{C:attention}+#2#{}个消耗品槽位",
                }
            },
            b_sdm_deck_of_dreams = {
                name = "梦幻牌组",
                text = {
                    "结合了{C:attention}SDM_0 的内容{}牌组的",
                    "所有{C:green}正面{}效果"
                }
            },
            b_sdm_deck_of_nightmares = {
                name = "噩梦牌组",
                text = {
                    "结合了{C:attention}SDM_0 的内容{}牌组的",
                    "所有{C:red}负面{}效果"
                }
            },
            b_sdm_deck_of_stuff = {
                name = "大杂烩牌组",
                text = {
                    "结合了{C:attention}SDM_0 的内容{}的所有",
                    "牌组效果"
                }
            },
        },
        Tarot = {
            c_sdm_sphinx = {
                name = "斯芬克斯",
                text = {
                    "有{C:green}#1#/#2#{}几率向手牌中",
                    "选定的{C:attention}#3#{}张卡牌添加{C:dark_edition}闪闪{}、",
                    "{C:dark_edition}全息{}或{C:dark_edition}多彩{}效果"
                }
            },
            c_sdm_mother = {
                name = "慈母",
                text = {
                    "永久性地为手牌中选定的",
                    "最多{C:attention}#1#{}张卡牌给予{C:chips}+#2#{}筹码"
                }
            },
            c_sdm_baker = {
                name = "烘焙师",
                text = {
                    "随机创建{C:attention}#1#{}个",
                    "{C:bakery}烘焙品{}",
                    "{C:inactive}(必须有空间)"
                }
            }
        },
        Planet = {
            c_sdm_eggxoplanet = {
                name = "蛋外行星",
                text = {
                    "{S:0.8}({S:0.8,V:1}等级 #1#{S:0.8}){} 升级",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{}倍率 和",
                    "{C:chips}+#4#{}筹码"
                }
            },
        },
        Spectral = {
            c_sdm_sacrifice = {
                name = "祭献",
                text = {
                    "{C:attention}+#1#{}小丑槽位，",
                    "{C:red}-#2#{}出牌次数，",
                    "{C:red}-#3#{}弃牌次数"
                }
            },
            c_sdm_morph = {
                name = "变形",
                text = {
                    "失去{C:attention}#1#{}个项目，从列表中",
                    "获得另外项目的{C:attention}#2#{}个项"
                }
            },
            c_sdm_bind = {
                name = "捆绑",
                text = {
                    "为选定的小丑添加或移除{C:purple}永恒{}",
                    "{C:inactive}(必须兼容){}"
                }
            },
            c_sdm_doppelganger = {
                name = "分身",
                text = {
                    "用最左侧或最右侧的{C:attention}小丑{}",
                    "随机替换一张{C:attention}小丑{}",
                }
            },
            c_sdm_wedding_cake = {
                name = "婚礼蛋糕",
                text = {
                    "{C:dark_edition}+#1#{}小丑槽位，",
                    "{C:attention}+#1#{}消耗品槽位，",
                    "效果持续永久"
                }
            },
        },
        Bakery = {
            c_sdm_chocolate_truffles = {
                name = "松露巧克力",
                text = {
                    "赢得{C:money}$#1#{}，",
                    "效果持续{C:attention}#2#{}个回合",
                }
            },
            c_sdm_sourdough = {
                name = "酸面包",
                text = {
                    "{X:chips,C:white}X#1#{}筹码，",
                    "效果持续{C:attention}#2#{}手牌",
                }
            },
            c_sdm_baguette = {
                name = "法棍面包",
                text = {
                    "{X:mult,C:white}X#1#{}倍率，",
                    "效果持续{C:attention}#2#{}手牌",
                }
            },
            c_sdm_banana_bread = {
                name = "香蕉面包",
                text = {
                    "{X:mult,C:white}X#1#{}倍率，",
                    "每打出一手牌，有{C:green}#2#/#3#{}几率",
                    "此卡被销毁"
                }
            },
            c_sdm_breadsticks = {
                name = "面包棒",
                text = {
                    "{C:blue}+#1#{}出牌次数，",
                    "效果持续{C:attention}#2#{}个回合",
                }
            },
            c_sdm_croissant = {
                name = "可颂",
                text = {
                    "{C:red}+#1#{}弃牌次数，",
                    "效果持续{C:attention}#2#{}个回合",
                }
            },
            c_sdm_bread_loaf = {
                name = "切片面包",
                text = {
                    "{C:attention}+#1#{}手牌大小，",
                    "效果持续{C:attention}#2#{}个回合",
                }
            },
            c_sdm_sprinkle_donut = {
                name = "糖霜甜甜圈",
                text = {
                    "回合开始时，向手牌中一张随机的",
                    "{C:attention}计分牌{}添加{C:dark_edition}多彩{}版本，",
                    "效果持续{C:attention}#2#{}次触发",
                }
            },
            c_sdm_fortune_cookie = {
                name = "幸运饼干",
                text = {
                    "商店开始时，创建一个{C:green}免费{}的",
                    "{C:tarot}秘仪包{}，效果持续{C:attention}#2#{}次触发",
                    "{C:inactive}(不需要空间)"
                }
            },
            c_sdm_moon_cakes = {
                name = "月饼",
                text = {
                    "商店开始时，创建一个{C:green}免费{}的",
                    "{C:planet}星球包{}，效果持续{C:attention}#2#{}次触发",
                    "{C:inactive}(不需要空间)"
                }
            },
            c_sdm_bread_monster = {
                name = "面包怪物",
                text = {
                    "商店开始时，创建一个{C:green}免费{}的",
                    "{C:spectral}幻灵包{}，效果持续{C:attention}#2#{}次触发",
                    "{C:inactive}(不需要空间)"
                }
            },
            c_sdm_bread_bites = {
                name = "面包丁",
                text = {
                    "商店开始时，创建一个{C:green}免费{}的",
                    "{C:cry_code}代码包{}，效果持续{C:attention}#2#{}次触发",
                    "{C:inactive}(不需要空间)"
                }
            },
            c_sdm_sponge_cake = {
                name = "海绵蛋糕",
                text = {
                    "选择{C:attention}盲注{}时，创建一个{C:dark_edition}负片{}{C:attention}水花{}",
                    "效果持续{C:attention}#2#{}次触发",
                }
            },
            c_sdm_macarons = {
                name = "马卡龙",
                text = {
                    "商店开始时，创建一个{C:green}免费{}的",
                    "{C:colourcard}色彩包{}，效果持续{C:attention}#2#{}次触发",
                    "{C:inactive}(不需要空间)"
                }
            },
            c_sdm_king_cake = {
                name = "国王蛋糕",
                text = {
                    "商店开始时，创建一个{C:green}免费{}的",
                    "{C:paperback_minor_arcana}小秘仪包{}，效果持续{C:attention}#2#{}次触发",
                    "{C:inactive}(不需要空间)"
                }
            },
            c_sdm_ambrosia_bread = {
                name = "神馔面包",
                text = {
                    "商店开始时，创建一个{C:green}免费{}的",
                    "{C:myth_light}传说包{}，效果持续{C:attention}#2#{}次触发",
                    "{C:inactive}(不需要空间)"
                }
            },
            c_sdm_peremech = {
                name = "佩雷梅奇",
                text = {
                    "商店开始时，创建一个{C:green}免费{}的",
                    "{C:attention}TOGA 助力包{}，效果持续{C:attention}#2#{}次触发",
                    "{C:inactive}(不需要空间)"
                }
            },
            c_sdm_funnel_cake = {
                name = "漏斗蛋糕",
                text = {
                    "商店开始时，创建一个{C:green}免费{}的",
                    "{C:silly}愚蠢包{}，效果持续{C:attention}#2#{}次触发",
                    "{C:inactive}(不需要空间)"
                }
            },
            c_sdm_chiacchiere = {
                name = "恰基雷",
                text = {
                    "商店开始时，创建一个{C:green}免费{}的",
                    "{C:stamp}邮戳包{}，效果持续{C:attention}#2#{}次触发",
                    "{C:inactive}(不需要空间)"
                }
            }
        },
        Voucher = {
            v_sdm_shadow = {
                name = "暗影",
                text = {
                    "创建一个{C:dark_edition}负片标签{}",
                }
            },
            v_sdm_eclipse = {
                name = "日食",
                text = {
                    "击败{C:attention}Boss盲注{}时，",
                    "创建一个{C:dark_edition}负片标签{}"
                }
            },
            v_sdm_oblivion = {
                name = "遗忘",
                text = {
                    "击败{C:attention}盲注{}时，",
                    "创建一个{C:dark_edition}负片标签{}"
                }
            },
            v_sdm_drought = {
                name = "干旱",
                text = {
                    "商店中不再出现",
                    "{C:attention}标准包{}"
                }
            },
            v_sdm_famine = {
                name = "饥荒",
                text = {
                    "商店中不再出现",
                    "{C:attention}小丑包{}"
                }
            },
            v_sdm_desolation = {
                name = "荒凉",
                text = {
                    "商店中不再出现所有非",
                    "{C:attention}巨型扩展包{}"
                }
            },
            v_sdm_bakery_stall = {
                name = "烘焙摊",
                text = {
                    "{C:bakery}烘焙品{}可能会在商店出现"
                }
            },
            v_sdm_bakery_shop = {
                name = "烘焙店",
                text = {
                    "{C:bakery}烘焙品{}的持续时间翻倍",
                },
            },
            v_sdm_bakery_factory = {
                name = "烘焙工厂",
                text = {
                    "{C:bakery}烘焙品{}的效果翻倍"
                },
            },
            v_sdm_joker_voucher = {
                name = "小丑优惠券",
                text = {
                    "本局游戏中每兑换过一张{C:attention}优惠券{}，",
                    "给予{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}(当前为{X:mult,C:white}X#2#{C:inactive}倍率)"
                }
            }
        },
        Tag = {
            tag_sdm_flour = {
                name = "面粉标签",
                text = {
                    "给予一个免费的",
                    "{C:bakery}巨型烘焙包"
                }
            },
        },
        Other = {
            p_sdm_bakery_normal_1 = {
                name = "烘焙包",
                text = {
                    "从最多{C:attention}#2#{}个{C:bakery}烘焙品{}中",
                    "选择{C:attention}#1#{}个立即使用"
                }
            },
            p_sdm_bakery_normal_2 = {
                name = "烘焙包",
                text = {
                    "从最多{C:attention}#2#{}个{C:bakery}烘焙品{}中",
                    "选择{C:attention}#1#{}个立即使用"
                }
            },
            p_sdm_bakery_jumbo_1 = {
                name = "巨型烘焙包",
                text = {
                    "从最多{C:attention}#2#{}个{C:bakery}烘焙品{}中",
                    "选择{C:attention}#1#{}个立即使用"
                }
            },
            p_sdm_bakery_mega_1 = {
                name = "超大型烘焙包",
                text = {
                    "从最多{C:attention}#2#{}个{C:bakery}烘焙品{}中",
                    "选择{C:attention}#1#{}个立即使用"
                }
            },
            undiscovered_bakery = {
                name = "未发现烘焙品",
                text = {
                    "在非挑战模式或种子游戏中",
                    "发现此卡以了解其内容"
                }
            },
            space_jokers = {
                name = "太空小丑",
                text = {
                    "天文学家、星座、",
                    "火箭、卫星、",
                    "太空小丑、超新星等。",
                }
            },
            modified_card = {
                name = "已修改",
                text = {
                    "增强、印封、",
                    "版本"
                }
            },
            chaos_exceptions = {
                name = "例外",
                text = {
                    "回合分数、目标分数、",
                    "牌型等级和描述",
                }
            },
            perishable_no_debuff = {
                name = "易腐",
                text = {
                    "持有{C:attention}#1#{}个",
                    "回合后被削弱"
                }
            },
            morph_list = {
                name = "变形列表",
                text = {
                    "出牌次数、弃牌次数、手牌大小、",
                    "小丑槽位、消耗品槽位"
                }
            },
            undefined_standard_pack = {
                name = "标准包",
                text = {
                    "从中最多{C:attention}Y{}张{C:attention}游戏牌{}中",
                    "选择{C:attention}X{}张添加到你的牌组"
                }
            },
            undefined_buffoon_pack = {
                name = "小丑包",
                text = {
                    "从中最多{C:attention}Y{}张{C:joker}小丑牌{}中",
                    "选择{C:attention}X{}张"
                }
            },
            undefined_mega_pack = {
                name = "超大型助力包",
                text = {
                    "从最多{C:attention}5{}张{C:attention}X{}卡牌中",
                    "选择{C:attention}2{}张立即使用"
                }
            },
            vanilla_consumable = {
                name = "原版消耗品",
                text = {
                    "{C:tarot}塔罗{}、{C:planet}星球",
                    "和{C:spectral}幻灵{}牌"
                }
            },
            je_j_sdm_mult_n_chips = {
                name = "进化",
                text = {
                    "计分出{C:attention}#2#{}张倍率卡",
                    "和奖励卡",
                    "{C:inactive}({C:attention}#1#{C:inactive}/#2#)"
                }
            },
            je_j_sdm_shareholder_joker = {
                name = "进化",
                text = {
                    "售出{C:attention}#2#{}张{C:blue}普通",
                    "{C:attention}小丑{}牌",
                    "{C:inactive}({C:attention}#1#{C:inactive}/#2#)"
                }
            },
            je_j_sdm_bullet_train = {
                name = "进化",
                text = {
                    "仅用{C:attention}1{}手牌",
                    "赢得{C:attention}#2#{}个回合",
                    "{C:inactive}({C:attention}#1#{C:inactive}/#2#)"
                }
            },
            je_j_sdm_joker_voucher = {
                name = "进化",
                text = {
                    "在本局游戏中",
                    "购买{C:attention}#2#{}张优惠券",
                    "{C:inactive}({C:attention}#1#{C:inactive}/#2#)"
                }
            }
        },
        Sleeve = {
            sleeve_sdm_0_s = {
                name = "SDM_0 的牌套",
                text = {
                    "{C:attention}SDM_0 的内容{}系列",
                    "小丑牌出现的几率",
                    "提高到 {C:attention}5{} 倍"
                },
            },
            sleeve_sdm_bazaar = {
                name = "集市牌套",
                text = {
                    "每击败一个{C:attention}Boss盲注{}，",
                    "创建一张{C:attention}SDM_0 的内容{}消耗牌",
                    "{C:inactive}(必须有空间)"
                },
            },
            sleeve_sdm_sandbox = {
                name = "沙盒牌套",
                text = {
                    "{C:attention}+#1#{}小丑槽位，",
                    "{C:red}+#2#{}获胜所需的底注",
                }
            },
            sleeve_sdm_lucky_7 = {
                name = "幸运7牌套",
                text = {
                    "初始的{C:attention}7{}是{C:attention,T:m_lucky}幸运{}卡",
                    "{s:0.8}翻倍所有{C:attention,s:0.8}列出的{C:green,E:1,S:1.1,s:0.8}概率",
                    "{C:red}X#1#{}基础盲注大小"
                }
            },
            sleeve_sdm_lucky_7_alt_1 = {
                name = "幸运7牌套",
                text = {
                    "开始游戏时拥有一张{C:purple}永恒{}",
                    "{C:attention,T:j_sdm_lucky_joker}幸运小丑",
                }
            },
            sleeve_sdm_lucky_7_alt_2 = {
                name = "幸运7牌套",
                text = {
                    "开始游戏时拥有一张{C:purple}永恒{}",
                    "{C:attention,T:j_oops}哦！全是6",
                }
            },
            sleeve_sdm_dna = {
                name = "DNA牌套",
                text = {
                    "来自{C:attention}获胜手牌{}的",
                    "最右侧的牌将被{C:blue}复制{}",
                }
            },
            sleeve_sdm_hieroglyph = {
                name = "象形文字牌套",
                text = {
                    "{C:spectral}幻灵{}牌可能会在商店出现，",
                    "开始游戏时拥有一张{C:spectral,T:c_ankh}生命之符{}牌",
                }
            },
            sleeve_sdm_hieroglyph_ghost = {
                name = "象形文字牌套",
                text = {
                    "{C:spectral}幻灵{}牌在商店出现的几率翻倍",
                    "开始游戏时拥有一张{C:spectral,T:c_ankh}生命之符{}牌",
                }
            },
            sleeve_sdm_hieroglyph_alt = {
                name = "象形文字牌套",
                text = {
                    "{C:spectral}幻灵{}牌在商店出现的几率翻倍",
                    "{C:spectral}幻灵包{}拥有{C:attention}#1#{}个",
                    "额外可供选择的选项",
                }
            },
            sleeve_sdm_xxl = {
                name = "XXL牌套",
                text = {
                    "以{C:attention}双倍{}的",
                    "初始牌组张数开始游戏",
                }
            },
            sleeve_sdm_hoarder = {
                name = "囤积者牌套",
                text = {
                    "每回合结束时：",
                    "每个剩余的{C:red}弃牌次数{}给予{C:money}$#1#{}",
                    "额外的{C:blue}出牌次数{}不再获得金钱",
                    "回合结束时不再获得{C:attention}利息{}"
                }
            },
            sleeve_sdm_hoarder_alt = {
                name = "囤积者牌套",
                text = {
                    "每回合结束时：",
                    "每个剩余的{C:red}弃牌次数{}给予{C:money}$#1#{}",
                    "回合结束时不再获得{C:attention}利息{}"
                }
            },
            sleeve_sdm_modders = {
                name = "模组作者牌套",
                text = {
                    "{C:attention}原版{}小丑牌",
                    "不会在商店中出现",
                }
            },
            sleeve_sdm_modders_alt = {
                name = "模组作者牌套",
                text = {
                    "{C:attention}原版{}卡牌和优惠券",
                    "不会在商店中出现",
                }
            },
            sleeve_sdm_reverb = {
                name = "混响牌套",
                text = {
                    "所有小丑额外{C:attention}重新触发 #2#{}次，",
                    "但只有{C:red}#1#{}个小丑槽位",
                }
            },
            sleeve_sdm_reverb_alt = {
                name = "混响牌套",
                text = {
                    "所有小丑额外{C:attention}重新触发 #1#{}次",
                }
            },
            sleeve_sdm_roguelike = {
                name = "Roguelike牌套",
                text = {
                    "开始游戏时拥有{C:attention,T:v_overstock_norm}#1#{}优惠券，",
                    "{C:attention}+#2#{}个扩展包槽位，",
                    "禁用{C:green}重掷{}"
                }
            },
            sleeve_sdm_roguelike_alt = {
                name = "Roguelike牌套",
                text = {
                    "开始游戏时拥有{C:attention,T:v_overstock_plus}#1#{}优惠券，",
                    "{C:attention}+#2#{}个优惠券槽位",
                }
            },
            sleeve_sdm_bakers = {
                name = "烘焙师牌套",
                text = {
                    "开始游戏时拥有{C:bakery,T:v_sdm_bakery_stall}#1#{}优惠券，",
                    "{C:attention}+#2#{}个消耗品槽位",
                }
            },
            sleeve_sdm_bakers_alt = {
                name = "烘焙师牌套",
                text = {
                    "开始游戏时拥有{C:bakery,T:v_sdm_bakery_shop}#1#{}优惠券",
                }
            },
        },
        Partner = {
            pnr_sdm_lucky_joker = {
                name = "幸运",
                text = {
                    "额外重新触发",
                    "第一张计分的{C:attention}7{}",
                    "{C:attention}#1#{}次"
                },
                unlock={
                    "在{C:attention}金注{}难度下",
                    "使用{C:attention}幸运小丑{}获胜",
                },
            },
            pnr_sdm_shareholder_joker = {
                name = "大涨",
                text = {
                    "回合结束时赢得",
                    "{C:money}$#1#{}到{C:money}$#2#{}之间的金钱",
                },
                unlock={
                    "在{C:attention}金注{}难度下",
                    "使用{C:attention}股东小丑{}获胜",
                },
            },
            pnr_sdm_ouija_board = {
                name = "灵魂",
                text = {
                    "{C:attention}#1#{}回合后，创建",
                    "{C:attention}#2#{}张{C:red}罕见{C:attention}标签{}",
                    "{C:inactive}(当前为{C:attention}#3#{C:inactive}/#1#)"
                },
                unlock={
                    "在{C:attention}金注{}难度下",
                    "使用{C:attention}通灵板{}获胜",
                },
            },
            pnr_sdm_mystery_joker = {
                name = "扭蛋",
                text = {
                    "击败{C:attention}Boss盲注{}时，",
                    "创建{C:attention}#1#{}张{C:green}非凡{C:attention}标签{}",
                },
                unlock={
                    "在{C:attention}金注{}难度下",
                    "使用{C:attention}神秘小丑{}获胜",
                },
            },
            pnr_sdm_crooked_joker = {
                name = "反转",
                text = {
                    "商店开始时，增加或",
                    "减少{C:attention}#1#{}个卡牌槽位"
                },
                unlock={
                    "在{C:attention}金注{}难度下",
                    "使用{C:attention}弯曲小丑{}获胜",
                },
            },
            pnr_sdm_jambo = {
                name = "笑话",
                text = {
                    "当前最低的点数点数",
                    "提供{C:mult}+#1#{}倍率",
                    "{C:inactive}(当前为{C:mult}+#2#{C:inactive}倍率)"
                },
                unlock={
                    "在{C:attention}金注{}难度下",
                    "使用{C:attention}詹伯{}获胜",
                },
            },
            pnr_sdm_free_pass = {
                name = "票据",
                text = {
                    "在{C:attention}Boss盲注{}中，回合的第一手",
                    "{C:blue}出牌{}或{C:red}弃牌{}是{C:attention}免费{}的",
                },
                unlock={
                    "在{C:attention}金注{}难度下",
                    "使用{C:attention}通行证{}获胜",
                },
            },
            pnr_sdm_ditto_joker = {
                name = "粘液",
                text = {
                    "每隔{C:attention}2{}底注，转变为",
                    "一个随机的{C:attention}伙伴{}",
                },
                unlock={
                    "在{C:attention}金注{}难度下",
                    "使用{C:attention}通行证{}获胜",
                },
            },
        },
    },
    misc = {
        dictionary = {
            k_sdm_active = "激活",
            k_sdm_inactive = "未激活",
            k_halved_ex = "减半！",
            k_shared_ex = "分享！",
            k_plus_code = "+1 代码",
            k_plus_tag = "+1 标签",
            k_plus_pack = "+1 扩展包",
            k_crab_ex = "螃蟹！",
            k_bonus = "奖励",
            k_ditto_ex = "百变怪！",
            k_bakery = "烘焙品",
            b_bakery_cards = "烘焙商品",
            k_bakery_pack = "烘焙包",
            k_plus_bakery = "+1 烘焙品",
            k_plus_egg = "+1 蛋",
        },
        poker_hands = {
            ['sdm_Chicken Head'] = "鸡头",
        },
        poker_hand_descriptions = {
            ['sdm_Chicken Head'] = {
                "3张包含8、4和3的卡牌，",
                "可以与另外2张未计分牌一起打出"
            },
        },
        v_dictionary = {
            a_hand = "+#1# 出牌次数",
            a_hands = "+#1# 出牌次数",
            a_hand_minus = "-#1# 出牌次数",
            a_discard = "+#1# 弃牌次数",
            a_discard_minus = "-#1# 弃牌次数",
            a_joker_slot = "+#1# 小丑槽位",
            a_joker_slot_minus = "-#1# 小丑槽位",
            a_consumable_slot = "+#1# 消耗品槽位",
            a_consumable_slot_minus = "-#1# 消耗品槽位",
            a_shop_slot = "+#1# 商店槽位",
            a_shop_slot_minus = "-#1# 商店槽位"
        },
        v_text = {
            ch_c_no_shop_planets = {
                "{C:planet}星球牌{}不再出现在{C:attention}商店{}中"
            }
        },
        achievement_names = {
            ach_sdm_good_riddance = "总算摆脱了",
        },
        achievement_descriptions = {
            ach_sdm_good_riddance = '对一张模糊小丑使用 ://DELETE',
        },
        quips = {
            pnr_sdm_lucky_joker_1 = {
                "我们要去赌一把！"
            },
            pnr_sdm_lucky_joker_2 = {
                "7 将是我们的",
                "幸运数字"
            },
            pnr_sdm_lucky_joker_3 = {
                "祝你好运！",
            },
            pnr_sdm_shareholder_joker_1 = {
                "让我们大赚一笔",
            },
            pnr_sdm_shareholder_joker_2 = {
                "咔嚓！",
            },
            pnr_sdm_shareholder_joker_3 = {
                "如果你没拿到钱，",
                "别怪小丑，",
                "怪这游戏。"
            },
            pnr_sdm_mystery_joker_1 = {
                "我能变谁？",
                "等着瞧..."
            },
            pnr_sdm_mystery_joker_2 = {
                "谁不喜欢惊喜？"
            },
            pnr_sdm_mystery_joker_3 = {
                "我不能保证你会得到",
                "好的小丑..."
            },
            pnr_sdm_crooked_joker_1 = {
                "我希望你输掉 :P"
            },
            pnr_sdm_crooked_joker_2 = {
                "这里没有属于你的",
                "卡片！xD"
            },
            pnr_sdm_crooked_joker_3 = {
                "卡牌在我肚子里",
                "真好吃 :)"
            },
            pnr_sdm_jambo_1 = {
                "这个地方感觉",
                "莫名熟悉"
            },
            pnr_sdm_jambo_2 = {
                "我们要和神明",
                "对赌吗？"
            },
            pnr_sdm_jambo_3 = {
                "一个人的垃圾是",
                "另一个人的珍宝！"
            },
        }
    }
}
