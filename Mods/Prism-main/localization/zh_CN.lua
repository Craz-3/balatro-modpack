return {
    descriptions = {
        Joker = {
            j_prism_exotic_card = {
                name = "异国卡",
                text = {"重新触发所有",
                    "打出的{C:attention}增强{}卡"
                },
            },
            j_prism_razor_blade = {
                name = "剃刀",
                text = {"完整牌组中每消失一个",
                    "{C:attention}点数{}，获得 {X:mult,C:white} X#1# {} 倍率",
                    "{C:inactive}（当前 {X:mult,C:white}X#2# {C:inactive}倍率）"
                },
            },
            j_prism_harlequin = {
                name = "丑角",
                text = {"每种{C:attention}花色{}的第一张",
                    "打出并计分的牌，会使此",
                    "小丑获得 {X:mult,C:white} X#1# {} 倍率",
                    "{C:inactive}（当前 {X:mult,C:white}X#2#{C:inactive}倍率）",
                },
                unlock= {
                "{E:1,s:1.3}?????",
                }
            },
            j_prism_rigoletto = {
                name = "里戈莱托",
                text = {"本轮中，在打出或弃牌后",
                    "{C:attention}+1{} 手牌上限",
                    "{C:inactive}（当前 {C:attention}+#2#{C:inactive} 手牌上限）",
                },
                unlock= {
                "{E:1,s:1.3}?????",
                }
            },
            j_prism_medusa = {
                name = "戈耳工",
                text = {"所有打出的{C:attention}人头牌{}",
                    "在计分时变为",
                    "{C:attention}石头牌{}",
                },
            },
            j_prism_rich_joker = {
                name = "富豪小丑",
                text = {"每{C:attention}售出{}一张卡牌，",
                    "都有 {C:green}#1#/#2#{} 几率赚取 {C:money}$#3#{}",
                },
            },
            j_prism_air_balloon = {
                name = "热气球",
                text = {"连续打出的每一手{C:attention}高牌{}",
                    "使此小丑获得 {C:red}+#2#{} 倍率",
                    "{C:inactive}（当前 {C:red}+#1#{C:inactive} 倍率）"
                },
            },
            j_prism_ghost = {
                name = "秘术师",
                text = {"本局游戏中每使用一张",
                    "{C:spectral}光谱牌{}，提供 {C:chips}+#1#{} 筹码",
                    "{C:inactive}（当前 {C:chips}+#2#{C:inactive} 筹码）",
                },
            },
            j_prism_prism = {
                name = "棱镜",
                text = {"{C:attention}数字牌{}",
                    "被视为所有花色"
                },
            },
            j_prism_minstrel = {
                name = "吟游诗人",
                text = {"选择{C:attention}小盲注{}或{C:attention}大盲注{}时",
                    "创建一张{C:myth_light}神话牌{}",
                    "{C:inactive}（需有空位）",
                },
            },
            j_prism_happily = {
                name = "美满结局",
                text = {"如果打出的手牌计分了",
                    "{C:attention}K{} 和 {C:attention}Q{}，创建一张",
                    "一张{C:myth_light}神话牌{}",
                    "{C:inactive}（需有空位）",
                },
            },
            j_prism_geo_hammer = {
                name = "地质学家之锤",
                text = {"回合开始时，将手牌中",
                    "一张随机卡牌转变为",
                    "{C:attention}水晶卡{}或{C:attention}石头牌{}",
                    "{C:inactive}（忽略已增强的卡牌）"
                },
            },
            j_prism_vaquero = {
                name = "牛仔",
                text = {"打出的{C:attention}万能牌{}",
                    "在计分时提供 {X:mult,C:white}X#1#{} 倍率"
                },
            },
            j_prism_promotion = {
                name = "晋升",
                text = {"如果回合中的{C:attention}第一手{}牌",
                    "只包含 {C:attention}1{} 张卡牌，",
                    "将其转变为一张 {C:attention}Q"
                },
            },
            j_prism_sculptor  = {
                name = "雕刻家",
                text = {"打出的每张{C:attention}石头牌{}",
                    "在计分时永久获得",
                    "{C:mult}+#1#{} 倍率"
                },
            },
            j_prism_motherboard = {
                name = "母板",
                text = {"当一张卡牌计分时，如果它没有任何",
                    "{C:attention}增强{}、{C:attention}蜡封{}或{C:dark_edition}版本{}，",
                    "则此小丑获得 {C:chips}+#1#{} 筹码，否则减少 {C:chips}-#1#{}",
                    "{C:inactive}（当前 {C:chips}+#2#{C:inactive} 筹码）",
                },
            },
            j_prism_reverse_card = {
                name = "反转卡",
                text = {"交换当前的",
                    "{C:chips}筹码{}和{C:mult}倍率"
                },
            },
            j_prism_vip_pass = {
                name = "VIP 通行证",
                text = {"{C:chips}普通 {C:attention}小丑牌",
                "不再出现",
                },
            },
            j_prism_plasma_lamp = {
                name = "等离子灯",
                text = {"如果{C:attention}牌组牌型{}是",
                    "{C:attention}#1#{} 或 {C:attention}#2#{}，",
                    "则平衡{C:chips}筹码{}和{C:mult}倍率{}",
                    "{s:0.8}要求牌型在每回合以及",
                    "{s:0.8}每次触发后变化"
                },
            },
            j_prism_hopscotch = {
                name = "跳房子",
                text = {"当打出的 {C:attention}#3#{} 计分时，",
                    "此小丑获得 {C:red}+#1#{} 倍率，且",
                    "点数要求增加 {C:attention}1",
                    "{C:inactive}（当前 {C:red}+#2#{C:inactive} 倍率）",
                },
            },
            j_prism_amethyst = {
                name = "紫水晶",
                text = {"回合结束时，手中持有的每张",
                    "{C:attention}水晶卡{}使此小丑获得 {X:mult,C:white} X#2# {} 倍率",
                    "{C:inactive}（当前 {X:mult,C:white}X#1# {C:inactive}倍率）",
                },
            },
            j_prism_aces_high = {
                name = "高点数A",
                text = {"如果牌组牌型包含一张{C:attention}A{}",
                    "和一个{C:attention}顺子{}，则创建一个",
                    "{C:green}不寻常标签{}或一个{C:rare}稀有标签{}",
                },
            },
            j_prism_elf = {
                name = "精灵",
                text = {"如果自{C:attention}上一回合{}结束以来",
                    "使用过一张{C:myth_light}神话牌{}，提供 {X:mult,C:white}X#1#{} 倍率",
                },
            },
            j_prism_cookie = {
                name = "幸运饼干",
                text = {"卖出此卡，使本轮所有",
                    "{C:green}概率{}变为{C:attention}必中{}"
                },
            },
            j_prism_pie = {
                name = "math.pie",
                text = {"当打出的 {C:attention}#1#{} 计分时，",
                    "提供 {X:mult,C:white}X#2#{} 倍率，且",
                    "点数要求变为 {C:attention}圆周率{} 的下一位",
                    "{C:inactive}（下5位是：#3#）",
                    "{C:inactive}（1 = A, 0 = 10）",
                },
            },
            j_prism_polydactyly = {
                name = "多指症",
                text = {"出牌和弃牌的上限",
                    "增加到 {C:attention}6{} 张卡牌"
                },
            },
            j_prism_solo_joker = {
                name = "单打小丑",
                text = {"如果打出的手牌仅包含",
                    "{C:attention}1{} 张卡牌，将其重新触发 {C:attention}#1#{} 次"
                },
            },
            j_prism_economics = {
                name = "经济学入门",
                text = {"选择{C:attention}盲注{}时，失去所有金钱，",
                    "每失去 {C:money}$#2#{} 使此小丑获得 {X:mult,C:white}X#1#{} 倍率",
                    "{C:inactive}（当前 {X:mult,C:white}X#3#{C:inactive}倍率）"
                },
            },
            j_prism_whiskey = {
                name = "威士忌",
                text = {"在计分了 {C:attention}#1#{} 张 J 后，",
                    "创建一个{C:attention}双倍标签{}",
                    "{C:inactive}（当前 {C:attention}#2#{C:inactive}/#1#）",
                    "{C:inactive}（每轮仅限一次）"
                },
            },
            j_prism_hit_record = {
                name = "热门唱片",
                text = {"打出的卡牌在计分后",
                    "{C:attention}返回{} 牌组"
                },
            },
            j_prism_patch = {
                name = "乐队补丁",
                text = {"如果打出的计分手牌恰好",
                    "包含 {C:attention}3{} 张 {C:attention}6{}，则创建一个",
                    "{C:dark_edition}负片标签{}",
                },
            },
            j_prism_day = {
                name = "白昼",
                text = {"如果打出的手牌仅包含",
                    "{C:hearts}红桃{}或{C:diamonds}方块{}，重触发所有卡牌",
                    "随后变为{C:attention}黑夜"
                },
            },
            j_prism_night = {
                name = "黑夜",
                text = {"如果打出的手牌仅包含",
                    "{C:clubs}梅花{}或{C:spades}黑桃{}，重触发所有卡牌",
                    "随后变为{C:attention}白昼"
                },
            },
            j_prism_metalhead = {
                name = "金属党",
                text = {"{C:attention}石头牌{}也被视为",
                    "{C:attention}钢制牌"
                },
            },
            j_prism_shork = {
                name = "鲨鱼毛绒玩具",
                text = {"所有未来的{C:spectral}版本{}",
                    "都会变为{C:dark_edition}多彩"
                },
            },
            j_prism_schrodinger = {
                name = "薛定谔的猫",
                text = {"打出的每张{C:attention}双倍牌{}都会重新触发，",
                    "重触发次数等同于该手牌中连续计分的",
                    "{C:attention}双倍牌{}数量"
                },
            },
            j_prism_hypercube = {
                name = "超立方体",
                text = {"如果手中持有一个",
                    "{C:attention}四条{}，获得 {X:dark_edition,C:white}^#1#{} 倍率"
                },
            },
            j_prism_pizza_cap = {
                name = "卡普里乔莎比萨",
                text = {"接下来的 {C:attention}#2#{} 张打出的",
                    "{C:spades}黑桃{}计分时额外提供 {C:chips}+#1#{} 筹码",
                    "{s:0.8}升级未来的比萨",

                },
            },
            j_prism_pizza_mar = {
                name = "玛格丽塔比萨",
                text = {"接下来的 {C:attention}#2#{} 张打出的",
                    "{C:hearts}红桃{}计分时提供 {X:red,C:white}X#1#{} 倍率",
                    "{s:0.8}升级未来的比萨",
                },
            },
            j_prism_pizza_for = {
                name = "四种奶酪比萨",
                text = {"接下来的 {C:attention}#2#{} 张计分的 {C:diamonds}方块{}",
                    "都有 {C:green}#3#/#4#{} 几率在计分时",
                    "赚取 {C:money}$#1#{}",
                    "{s:0.8}升级未来的比萨",

                },
            },
            j_prism_pizza_ruc = {
                name = "芝麻菜比萨",
                text = {"接下来的 {C:attention}#2#{} 张打出的",
                    "{C:clubs}梅花{}计分时提供 {C:red}+#1#{} 倍率",
                    "{s:0.8}升级未来的比萨",
                },
            },
            j_prism_pizza_haw = {
                name = "夏威夷比萨",
                text = {"接下来的 {C:attention}#3#{} 张打出的",
                    "{C:paperback_crowns}皇冠牌{}计分时赚取",
                    "{C:money}$#1#{} 到 {C:money}$#2#{} 之间的金钱",
                    "{s:0.8}升级未来的比萨",
                },
            },
            j_prism_pizza_det = {
                name = "底特律比萨",
                text = {"接下来的 {C:attention}#2#{} 张打出的",
                    "{C:paperback_stars}星星牌{}计分时提供 {X:chips,C:white}X#1#{} 筹码",
                    "{s:0.8}升级未来的比萨",
                },
            },
            j_prism_pizza_con = {
                name = "蛋筒比萨",
                text = {"接下来的 {C:attention}#2#{} 张打出的 {C:minty_3s}3{}",
                    "都有 {C:green}#3#/#4#{} 几率在计分时",
                    "提供 {X:red,C:white}X#1#{} 倍率",
                    "{s:0.8}升级未来的比萨",

                },
            },
            j_prism_murano = {
                name = "穆拉诺小丑",
                text = {"打出的{C:attention}玻璃牌{}有",
                    "{C:green}#1#/#2#{} 几率获得{C:dark_edition}闪箔{}、",
                    "{C:dark_edition}全息{}或{C:dark_edition}多彩{}版本",

                },
            },
            j_prism_romantic = {
                name = "浪漫战士",
                text = {"如果打出的手牌计分了",
                    "{C:hearts}红桃{}和{C:spades}黑桃{}，则创建一张本局",
                    "游戏中使用过的{C:attention}最后一张{C:myth_light}神话牌{}",
                },
            },
            j_prism_swiss = {
                name = "瑞士军刀",
                text = {"打出的牌计分时有 {C:green}#4#/#5#{} 几率",
                "永久性获得 {C:chips}+#1#{} 筹码、",
                "{C:mult}+#2#{} 倍率或 {X:red,C:white}X#3#{} 倍率，",
                "{C:attention}随机{}决定"
                },
            },
            j_prism_racecar = {
                name = "赛车",
                text = {"回合结束时，每剩余一次{C:attention}出牌次数{}",
                "获得 {C:chips}+#1#{} 筹码 和 {C:red}+#2#{} 倍率",
                "{C:inactive}（当前 {C:chips}+#3#{C:inactive} 筹码 和 {C:red}+#4#{C:inactive} 倍率）"
                },
            },
            j_prism_floppy = {
                name = "软盘",
                text = {"卖出此卡，将持有此卡期间打出的",
                    "{C:attention}最后一手牌{}的副本添加到",
                    "{C:attention}手牌{}中"
                },
            },
            j_prism_whale = {
                name = "星际旅行",
                text = {"击败{C:attention}Boss盲注{}时，",
                    "根据此底注中使用过的{C:attention}不同种类",
                    "{C:planet}星球牌{}数量，升级最常打出的手牌等级",
                    "{C:inactive}（当前已使用 #1# 种星球牌）"
                },
            },
            j_prism_monkey_paw = {
                name = "猴爪",
                text = {"击败{C:attention}Boss盲注{}后，",
                    "可以许愿创建一个{C:dark_edition}任何{C:spectral}光谱牌{}，",
                    "但永久减少 {C:red}-#1#{} 手牌上限",
                    "{C:inactive}（需有空位）"
                }
            },
            j_prism_scale = {
                name = "天平",
                text = {"右侧每有一个小丑，获得 {C:chips}+#1#{} 筹码",
                    "左侧每有一个小丑，获得 {C:red}+#2#{} 倍率",
                    "{C:inactive}（当前 {C:chips}+#3#{C:inactive} 筹码 和 {C:red}+#4#{C:inactive} 倍率）"
                }
            },
        },
        Back = {
            b_prism_purple = {
                name = "紫色牌组",
                text = {"可以交替使用{C:chips}出牌次数{}和",
                    "{C:red}弃牌次数{}",
                    "{C:inactive}（出牌次数用完时可用弃牌代替出牌，",
                    "{C:inactive}反之亦然）"
                },
            },
            b_prism_ancient = {
                name = "远古牌组",
                text = {"开局拥有",
                    "{C:myth_light,T:v_prism_myth_merchant}神话商人{}和",
                    "{C:attention,T:v_prism_booster_box}补给箱{}"
                },
            },
            b_prism_market = {
                name = "生产过剩牌组",
                text = {"开局拥有",
                    "{C:attention,T:v_overstock_norm}库存过剩{}和",
                    "{C:attention,T:v_reroll_surplus}刷新过剩{}"
                },
            },
            b_prism_alchemy = {
                name = "炼金术师牌组",
                text = {"每个{C:money}商店{}都有一个",
                    "额外的{C:myth_light,T:c_prism_myth_opus}杰作{}",
                },
            },
        },
        Sleeve = {
            sleeve_prism_purplesleeve = {
                name = "紫色卡套",
                text = {"可以交替使用{C:chips}出牌次数{}和",
                    "{C:red}弃牌次数{}",
                    "{C:inactive}（出牌次数用完时可用弃牌代替出牌，",
                    "{C:inactive}反之亦然）"
                },
            },
            sleeve_prism_purplesleeve_alt = {
                name = "紫色卡套",
                text = {"{C:attention}+1{} 手牌上限",
                },
            },
            sleeve_prism_ancientsleeve = {
                name = "远古卡套",
                text = {"开局拥有",
                    "{C:myth_light,T:v_prism_myth_merchant}神话商人{}和",
                    "{C:attention,T:v_prism_booster_box}补给箱{}"
                },
            },
            sleeve_prism_ancientsleeve_alt = {
                name = "远古卡套",
                text = {"商店里永远都有一个",
                    "{C:myth_light}传说包"
                },
            },
            sleeve_prism_marketsleeve = {
                name = "生产过剩卡套",
                text = {"开局拥有",
                    "{C:attention,T:v_overstock_norm}库存过剩{}和",
                    "{C:attention,T:v_reroll_surplus}刷新过剩{}"
                },
            },
            sleeve_prism_marketsleeve_alt = {
                name = "生产过剩卡套",
                text = {"开局拥有",
                    "{C:attention,T:v_prism_booster_box}补给箱{}"
                },
            },
            sleeve_prism_alchemysleeve = {
                name = "炼金术师卡套",
                text = {"每个{C:money}商店{}都有一个",
                    "额外的{C:myth_light,T:c_prism_myth_opus}杰作{}",
                },
            },
            sleeve_prism_alchemysleeve_alt = {
                name = "炼金术师卡套",
                text = {"开局拥有",
                    "{C:tarot,T:v_crystal_ball}水晶球{}"
                },
            },
        },
        Enhanced = {
            m_prism_crystal = {
                name = "水晶卡",
                text = {"{X:mult,C:white} X#1#{} 倍率",
                    "回合结束时持在手中，",
                    "获得 {X:mult,C:white} X#2#{} 倍率"
                }

            },
            m_prism_burnt = {
                name = "烧焦卡",
                text = {"此牌被{C:attention}弃掉{}后，",
                    "多抽 {C:attention}#1#{} 张牌"
                }
            },
            m_prism_ice = {
                name = "寒冰卡",
                text = {"本轮每打出一张牌，",
                    "获得 {C:chips}+#1#{} 筹码",
                    "{C:inactive}（当前 {C:chips}+#2#{C:inactive}）"
                }
            },
            m_prism_double = {
                name = "双倍卡",
                text = {"可以转变为",
                    "{C:attention}#1#{}"
                }
            },
            m_prism_echo = {
                name = "回声卡",
                text = {"每打出过一张其他",
                    "{C:attention}回声卡{}，就重新触发一次"
                }
            },
        },
        Edition = {
            e_prism_gold_foil = {
                name = "金箔",
                text = {
                    "触发 {C:attention}两次{}"
                }
            }
        },
        Myth = {
            c_prism_myth_druid = {
                name = "德鲁伊",
                text = {"选择 {C:attention}#1#{} 张牌，",
                    "将{C:attention}右侧{}牌的{C:enhanced}增强{}、",
                    "{C:dark_edition}版本{}和{C:attention}蜡封{}转移给{C:attention}左侧{}牌"
                }

            },
            c_prism_myth_dwarf = {
                name = "矮人",
                text = {"将最多 {C:attention}#1#{} 张选定牌",
                    "增强为 {C:attention}水晶卡"
                }
            },
            c_prism_myth_siren = {
                name = "塞壬",
                text = {"将最多 {C:attention}#1#{} 张选定牌",
                    "增强为 {C:attention}回声卡"
                }
            },
            c_prism_myth_yeti = {
                name = "雪人",
                text = {"将最多 {C:attention}#1#{} 张选定牌",
                    "增强为 {C:attention}寒冰卡"
                }
            },
            c_prism_myth_dragon = {
                name = "巨龙",
                text = {"将最多 {C:attention}#1#{} 张选定牌",
                    "增强为 {C:attention}烧焦卡"
                }
            },
            c_prism_myth_ghoul = {
                name = "食尸鬼",
                text={
                    "摧毁 {C:attention}#1#{} 张选定牌，",
                    "并将其点数数值的 {C:attention}#2# 倍{}",
                    "加到相邻卡牌的{C:chips}筹码{}上"
                },
            },
            c_prism_myth_wizard = {
                name = "巫师",
                text = {"将最多 {C:attention}#1#{} 张选定牌",
                    "的点数转变为{C:attention}右侧{}牌的点数"
                }
            },
            c_prism_myth_gnome = {
                name = "地精",
                text = {"创建一个{C:attention}储蓄标签"
                }
            },
            c_prism_myth_mirror = {
                name = "镜像",
                text = {"为手牌中一张随机卡牌",
                    "添加{C:dark_edition}负片{}版本"
                }
            },
            c_prism_myth_colossus = {
                name = "巨像",
                text = {"为手中 {C:attention}#1#{} 张选定牌",
                    "添加{C:moon}月之蜡封{}"
                }
            },
            c_prism_myth_beast = {
                name = "寻水兽",
                text = {"随机创建一张",
                    "{C:spectral}光谱牌{}",
                    "{C:inactive}（需有空位）"
                }
            },
            c_prism_myth_ooze = {
                name = "软泥怪",
                text = {"为手中 {C:attention}#1#{} 张选定牌",
                    "添加{C:green}绿蜡封{}"
                }
            },
            c_prism_myth_roc = {
                name = "大鹏",
                text = {"创建一个{C:attention}双倍标签"
                }
            },
            c_prism_myth_kraken = {
                name = "克拉肯",
                text = {"创建一个{C:attention}杂耍标签"
                }
            },
            c_prism_myth_treant = {
                name = "树精",
                text = {"将最多 {C:attention}#1#{} 张选定牌",
                    "的花色转变为{C:attention}右侧{}牌的花色"
                }
            },
            c_prism_myth_fae = {
                name = "小仙子",
                text = {"根据最高等级的{C:attention}牌组牌型{}",
                    "等级由于每级赚取 {C:money}$#1#{} {C:inactive}（最高金钱 $#2#{C:inactive}）",
                    "{C:inactive}（当前赚取 {C:money}$#3#{C:inactive}）",
                }
            },
            c_prism_myth_opus = {
                name = "杰作",
                text = {"将 {C:attention}#1#{} 张选定牌增强为",
                    "完整牌组中出现最多的",
                    "{C:enhanced}增强效果"
                }
            },
            c_prism_myth_egg = {
                name = "金蛋",
                text = {"失去 {C:money}$#3#{} 且有 {C:green}#1#/#2#{} 几率",
                    "为一张随机小丑添加 {C:dark_edition}金箔{} 版本",
                    "{C:inactive}（必须兼容）"
                }
            },
        },
        Spectral = {
            c_prism_spectral_djinn = {
                name = "灵怪",
                text = {"许愿创建一个{C:dark_edition}任何",
                    "{C:attention}小丑牌{}",
                    "{C:inactive}（不含传说小丑）"
                }
            },
        },
        Voucher = {
            v_prism_myth_merchant = {
                name = "神话商人",
                text = {
                    "{C:myth_light}神话牌{}在商店中",
                    "出现的频率增加 {C:attention}2{} 倍",
                },
            },
            v_prism_myth_tycoon = {
                name = "神话大亨",
                text = {
                    "{C:myth_light}神话牌{}在商店中",
                    "出现的频率增加 {C:attention}4{} 倍",
                },
            },
            v_prism_booster_box = {
                name = "补给箱",
                text = {
                    "商店中额外增加 {C:attention}+1{} 个",
                    "补给包位",
                },
            },
            v_prism_bonus_packs = {
                name = "赠送包",
                text = {
                    "开启{C:attention}补给包{}时",
                    "可以多选择 {C:attention}1{} 张卡牌",
                },
            },

        },
        Tag = {
            tag_prism_myth = {
                name = "曲目标签",
                text = {
                    "获得一个免费的",
                    "{C:myth_light}巨型传说包",
                },
            },
            tag_prism_gold_foil = {
                name = "金箔标签",
                text = {
                    "下个商店中兼容的基础版本",
                    "小丑牌将免费且带有 {C:dark_edition}金箔{} 版本"
                },
            },
            tag_prism_gnome = {
                name = "储蓄标签",
                text={
                    "击败 Boss 盲注后，",
                    "赚取 {C:money}$#1#",
                },
            },
        },
        Stake = {
            stake_prism_platinum = {
                name = "白金筹码",
                text = {
                    "每过 {C:attention}2 个底注{}，",
                    "所有价格增加 {C:money}$1{}",
                    "{s:0.8}囊括所有之前的筹码效果"
                }
            }
        },
        Partner={
            pnr_prism_blahaj={
                name = "宜家鲨",
                text = {"击败 {C:attention}Boss 盲注{} 后，",
                    "创建一个 {C:dark_edition,T:tag_foil}闪箔标签{}、",
                    "{C:dark_edition,T:tag_holo}全息标签{} 或",
                    "{C:dark_edition,T:tag_polychrome}多彩标签{}",
                },
                unlock={
                    "在{C:attention}金筹码{}难度下使用",
                    "{C:attention}鲨鱼毛绒玩具{}获得胜利",
                },
            },
            pnr_prism_blahaj_1={
                name = "宜家鲨",
                text = {"击败 {C:attention}盲注{} 后，",
                    "创建一个 {C:dark_edition,T:tag_foil}闪箔标签{}、",
                    "{C:dark_edition,T:tag_holo}全息标签{} 或",
                    "{C:dark_edition,T:tag_polychrome}多彩标签{}",
                },
                unlock={
                    "在{C:attention}金筹码{}难度下使用",
                    "{C:attention}鲨鱼毛绒玩具{}获得胜利",
                },
            },
            pnr_prism_scopa={
                name = "斯克帕",
                text = {"打出的{C:attention}增强卡牌{}",
                    "在计分时提供 {C:red}+#1#{} 倍率"
                },
                unlock={
                    "在{C:attention}金筹码{}难度下使用",
                    "{C:attention}异国卡{}获得胜利",
                },
            },
        },
        Other = {
            p_prism_small_myth_1 = {
                name = "传说包",
                text = {
                    "从最多 {C:attention}#2#{} 张 {C:myth_light}神话牌{} 中",
                    "选择 {C:attention}#1#{} 张使用",
                },
            },
            p_prism_small_myth_2 = {
                name = "传说包",
                text = {
                    "从最多 {C:attention}#2#{} 张 {C:myth_light}神话牌{} 中",
                    "选择 {C:attention}#1#{} 张使用",
                },
            },
            p_prism_mid_myth = {
                name = "巨型传说包",
                text = {
                    "从最多 {C:attention}#2#{} 张 {C:myth_light}神话牌{} 中",
                    "选择 {C:attention}#1#{} 张使用",
                },
            },
            p_prism_large_myth = {
                name = "大传说包",
                text = {
                    "从最多 {C:attention}#2#{} 张 {C:myth_light}神话牌{} 中",
                    "选择 {C:attention}#1#{} 张使用",
                },
            },
            prism_green_seal = {
                name = "绿蜡封",
                text = {"每轮{C:attention}第一次{}打出计分后",
                    "会{C:attention}返回{}手牌"
                }, 
            },
            prism_green_old_seal = {
                name = "绿蜡封",
                text = {"有 {C:green}1/2{} 几率在回合的",
                    "第一手牌中被抽中"
                },
            },
            prism_moon_seal = {
                name = "月之蜡封",
                text = {"打出计分时有 {C:green}#1#/#2#{} 几率",
                    "升级该{C:attention}牌组牌型{}等级"
                },
            },

            prism_platinum_sticker={
                name="白金贴纸",
                text={
                    "在{C:attention}白金筹码{}难度下",
                    "使用此小丑牌获胜",
                },
            },
            undiscovered_myth = {
                name = '未发现的神话牌',
                text = {
                    '在无种子的局中',
                    '发现此牌以了解其作用'
                }
            },
            remove_negative={
                name="n",
                text={
                    "{C:inactive,s:0.9}（从副本中移除 {C:dark_edition,s:0.9}负片{C:inactive,s:0.9} 和 {C:dark_edition,s:0.9}金箔{C:inactive,s:0.9}）",
                },
            },
        },
        Blind = {
            bl_prism_rose_club = {
                name = "玫瑰梅花",
                text = {
                    "打出一次 #1# 后，",
                    "削弱所有打出的牌"
                },
            },
            bl_prism_birch = {
                name = "桦木",
                text = {
                    "所有偶数点数的卡牌",
                    "都会被削弱"
                },
            },
            bl_prism_yew = {
                name = "紫杉",
                text = {
                    "所有奇数点数的卡牌",
                    "都会被削弱"
                },
            }
        },
        Mod = {
            Prism = {
                name = "Prism",
                text = {
                    "原汁原味的体验扩展模组。包含新的",
                    "小丑牌、消耗牌、牌组等等！",
                    " ",
                    "考虑加入我们的 {C:dark_edition}Discord 服务器{}",
                    " ",
                    "{s:1.5,C:attention,E:2}致谢",
                    "{C:dark_edition,E:2}SuperMao{} 和 {C:dark_edition,E:2}VisJoker{} - 中文本地化",
                    "{C:dark_edition,E:2}Franderman123{} 和 {C:dark_edition,E:2}Marffe{} - 西班牙语本地化",
                    "{C:dark_edition,E:2}Shinosan{} - 越南语本地化",
                    "{C:dark_edition,E:2}Alexandria Thurnherr{}、{C:dark_edition,E:2}juno_r1{} 以及 {C:dark_edition,E:2}其他人{} - 法语本地化",
                    " ",
                    "{s:1.5,C:attention,E:2}我的其他模组",
                    "{C:dark_edition}Unjankify{}、{C:dark_edition}Prism Darkside{} 和 {C:dark_edition}Resurgence{}",
                }
            }
        },
    },
    misc = {
        challenge_names={
            c_prism_aerial_warfare = "空战",
            c_prism_mvp = "最有价值球员",
        },
        dictionary = {
            k_myth = "神话牌",
            b_myth_cards = "神话牌",
            k_stone_ex = "石头牌",
            k_edition_ex = "版本",
            k_promoted = "已晋升！",
            k_prism_myth_pack = "传说包",
            k_uno_reverse = "反转",
            k_plus_uncommon = "不寻常",
            k_plus_rare = "稀有",
            k_plus_double = "双倍标签",
            k_plus_negative = "负片",
            k_inactive = "未激活",
            k_inactive_ex = "未激活！",
            k_another_card = "另一张牌",
            k_of = "的",
            k_sunset = "日落",
            k_sunrise = "日出",
            k_blahaj = "标签 :3",
            prism_create = "许愿",
            prism_cancel = "取消",
            prism_enter_card = "输入牌名",
            prism_invalid_card = "无效卡牌！",
            prism_switch = "切换",
            prism_jokers_enabled = "启用小丑牌",
            prism_myth_enabled = "启用神话牌",
            prism_enhance_enabled = "启用增强",
            prism_blinds_enabled = "启用 Boss 盲注",
            prism_legacy_green = "使用老版绿蜡封",
            prism_allow_neg_copy = "允许复制负片卡",
            prism_feature_enable = "选择功能：",
            prism_pizza_music = "比萨音乐",
            prism_requires_restart = "如果需要，游戏将自动重启",
            b_open_link = "在浏览器中打开",
        },
        v_dictionary = {
            a_handsize_plus="+#1# 手牌上限",
            a_prism_chips="+#1# 筹码",
            a_prism_chips_minus="-#1# 筹码",
        },
        labels = {
            prism_green_seal = "绿蜡封",
            prism_green_old_seal = "绿蜡封",
            prism_moon_seal = "月之蜡封",
            prism_gold_foil = "金箔"
        },
        quips = {
            pnr_prism_blahaj_1={
                "我们可以做到的，",
                "伙伴 :3"
            },
            pnr_prism_blahaj_2={
                "哇啊啊啊这个盲注",
                "太大了！！但是我们",
                "可以一起搞定它 :3"
            },
            pnr_prism_blahaj_3={
                ">33: 祝你好运"
            },
            pnr_prism_scopa_1={
                "瞧瞧，",
                "这些是什么牌？！"
            },
            pnr_prism_scopa_2={
                "这一局就看",
                "我的厉害了"
            },
            pnr_prism_scopa_3={
                "你有备而来的吗？",
                "如果没有，这儿",
                "可就要输精光了！"
            },
            pnr_prism_scopa_4={
                "这把赢定了，",
                "因为我们有杀手锏"
            },
        }
    },
}
