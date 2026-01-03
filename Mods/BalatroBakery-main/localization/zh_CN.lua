-- KEEP_LITE
return {
    descriptions = {
        -- END_KEEP_LITE
        Joker = {
            j_Bakery_Tarmogoyf = {
                name = '塔莫耶夫',
                text = { '本{C:attention}回合{}每弃掉一种{C:attention}不同{}点数', '获得{C:red}+#1#{}倍率',
                    '{C:inactive}（当前{C:red}+#2#{C:inactive}倍率）' }
            },
            j_Bakery_Auctioneer = {
                name = '拍卖师',
                text = { "选择{C:attention}盲注{}时", "{C:money}出售{}右边的小丑",
                    "以{C:attention}#1#倍{}售价" }
            },
            j_Bakery_Don = {
                name = '唐',
                text = { "{X:mult,C:white}X#1#{}倍率", "每次出牌失去{C:money}$#2#{}" }
            },
            j_Bakery_Werewolf = {
                name = '狼人（白天）',
                text = {
                    "{X:mult,C:white}X#1#{}倍率",
                    "如果{C:attention}没有使用弃牌{}",
                    "回合结束时{C:attention}变身{}"
                }
            },
            j_Bakery_Werewolf_Back = {
                name = '狼人（夜晚）',
                text = { "{X:mult,C:white}X#1#{}倍率", "如果使用了{C:attention}2次或更多{}",
                    "{C:attention}弃牌{}", "回合结束时{C:attention}变身{}" }
            },
            j_Bakery_Spinner = {
                name = "转盘",
                text = { "提供{C:attention}底部{}的加成", "{C:attention}回合{}结束时",
                    "{C:attention}顺时针{}旋转" }
            },
            j_Bakery_Proxy = {
                name = "代理",
                text = {
                    "复制最近购买的",
                    "{C:attention}小丑{}的能力",
                    "{C:inactive}（当前{C:attention}#1#{C:inactive}）"
                },
                unlock = { "同时拥有", "{C:attention}#1#{}", "和{C:attention}#2#{}" }
            },
            j_Bakery_StickerSheet = {
                name = "贴纸页",
                text = { "每个带{C:attention}贴纸{}的小丑", "提供{X:mult,C:white}X#1#{}倍率" },
                unlock = { "拥有一个{C:attention}永恒{}", "{C:attention}租赁{}小丑" }
            },
            j_Bakery_PlayingCard = {
                name = "黑桃1",
                text = { "提供{C:attention}高牌{}的", "{C:mult}倍率{}和{C:chips}筹码{}" },
                unlock = { "将{C:attention}高牌{}", "升至{C:attention}#1#{}级" }
            },
            j_Bakery_PlayingCard11 = {
                name = "黑桃11",
                text = { "提供{C:attention}对子{}的", "{C:mult}倍率{}和{C:chips}筹码{}" },
                unlock = { "将{C:attention}对子{}", "升至{C:attention}#1#{}级" }
            },
            j_Bakery_EvilSteven = {
                name = "邪恶史蒂文",
                text = {
                    "{C:red}摧毁{}所有计分的",
                    "{C:attention}偶数{}点数牌",
                    "{C:inactive}（2、4、6、8、10）"
                }
            },
            j_Bakery_AwfulTodd = {
                name = "可怕托德",
                text = { "{C:red}摧毁{}所有计分的", "{C:attention}奇数{}点数牌",
                    "{C:inactive}（A、3、5、7、9）" }
            },
            j_Bakery_JokerAgainstHumanity = {
                name = "反人类小丑",
                text = {
                    "打出{C:attention}1级{}{C:attention}牌型{}时",
                    "获得{C:mult}+#1#{}倍率",
                    "{C:inactive}（当前{C:mult}+#2#{C:inactive}倍率）{}"
                }
            },
            j_Bakery_CardSleeve = {
                name = "卡套",
                text = { "{C:attention}存放{}一张", "游戏牌" }
            },
            j_Bakery_BongardProblem = {
                name = "邦加德问题",
                text = { "如果最左和最右的", "计分牌花色{C:attention}不同{}",
                    "则{X:mult,C:white}X#1#{}倍率" }
            },
            j_Bakery_CoinSlot = {
                name = "投币口",
                text = { "每投入{C:money}$#2#{}", "获得{C:mult}+#1#{}倍率",
                    "{C:inactive}（当前{C:mult}+#3#{C:inactive}倍率）" }
            },
            j_Bakery_Pyrite = {
                name = "黄铁矿",
                text = { "回合{C:attention}首次出牌{}时", "额外抽{C:attention}#1#{}张牌" }
            },
            j_Bakery_Snowball = {
                name = "雪球",
                text = { "选择{C:attention}盲注{}时", "获得{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（当前{X:mult,C:white}X#2#{C:inactive}倍率）" }
            },
            j_Bakery_GetOutOfJailFreeCard = {
                name = "免费出狱卡",
                text = {
                    "{C:attention}使用{}后{C:attention}一次出牌{}获得{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}可保留至需要时使用",
                    "{C:inactive}或出售"
                }
            },
            j_Bakery_TransparentBackBuffer = {
                name = "透明后缓冲",
                text = { "如果出牌{C:attention}红黑{}花色交替", "每张计分牌提供{C:mult}+#1#{}倍率" }
            },
            j_Bakery_TierList = {
                name = "等级列表",
                text = { "你的{C:attention}小丑{}中每种{C:attention}不同{}",
                    "{C:attention}稀有度{}提供{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（当前{X:mult,C:white}X#2#{C:inactive}倍率）" }
            },
            j_Bakery_Tag = {
                name = "标签",
                text = { "{C:attention}标签{}提供{X:mult,C:white}X#1#{}倍率" }
            },
            j_Bakery_GlassCannon = {
                name = "玻璃大炮",
                text = { "{X:mult,C:white}X#1#{}倍率", "之后如果倍率{C:attention}达到#2#{}",
                    "则{C:red}自毁{}" }
            },
            j_Bakery_3So = {
                name = "索子三",
                text = { "如果出牌包含{C:attention}#2#张顺子{}", "获得{C:mult}+#1#{}倍率", "{C:inactive}（当前{C:mult}+#3#{C:inactive}倍率）" }
            },
            j_Bakery_Weerewolf = {
                name = '二狼人（白天）',
                text = {
                    "{C:mult}+#1#{}倍率",
                    "如果计分牌包含{C:attention}2{}",
                    "回合结束时{C:attention}变身{}"
                }
            },
            j_Bakery_Weerewolf_Back = {
                name = '二狼人（夜晚）',
                text = { "{X:mult,C:white}X#1#{}倍率", "如果没有计分{C:attention}2{}",
                    "回合结束时{C:attention}变身{}" }
            },
            j_Bakery_Lua = {
                name = "Lua小丑",
                text = { "{X:mult,C:white}X#1#{}倍率，", '{X:mult,C:white}..\"#2#\"{}倍率' }
            }
        },
        Tag = {
            tag_Bakery_RetriggerTag = {
                name = '重触发标签',
                text = { "商店有一个免费的", "{C:dark_edition}重触发小丑{}" }
            },
            tag_Bakery_ChocolateTag = {
                name = "巧克力标签",
                text = {
                    "计分时获得{C:chips}+#1#筹码{}",
                    "和{C:mult}+#2#倍率{}",
                    "每次出牌{C:chips}-#3#筹码{}",
                    "和{C:mult}-#4#倍率{0}"
                }
            },
            tag_Bakery_PolyTag = {
                name = "多彩标签",
                text = { "计分时获得{X:mult,C:white}X#1#{}倍率", "持续{C:attention}1{}回合" }
            },
            tag_Bakery_PennyTag = {
                name = "便士标签",
                text = { "接下来{C:attention}#2#{}次出牌", "计分牌获得{C:money}$#1#{}" }
            },
            tag_Bakery_BlankTag = {
                name = "空白标签",
                text = { "{C:inactive}什么也不做？" }
            },
            tag_Bakery_AntiTag = {
                name = "反转标签",
                text = { "{C:dark_edition}+1{}小丑槽位" }
            },
            tag_Bakery_CharmTag = {
                name = "装备标签",
                text = { "在下一个商店", "添加两个{C:attention}护符{}" }
            },
            tag_Bakery_DownTag = {
                name = "向下标签",
                text = { "禁用下一个", "{C:attention}Boss盲注{}的效果" }
            },
            tag_Bakery_UpTag = {
                name = "向上标签",
                text = { "接下来{C:attention}#1#{}次出牌", "{C:attention}重触发{}所有计分牌" }
            },
            tag_Bakery_AlertTag = {
                name = "警报标签",
                text = { "将接下来{C:attention}#1#{}张", "计分牌增强为", "{C:attention}#2#{}" }
            },
            tag_Bakery_GoldTag = {
                name = "黄金标签",
                text = { "将接下来{C:attention}#1#{}张", "计分牌增强为", "{C:attention}#2#{}" }
            },
            tag_Bakery_BatteryTag = {
                name = "电池标签",
                text = { "将接下来{C:attention}#1#{}张", "计分牌增强为", "{C:attention}#2#{}" }
            },
            tag_Bakery_RockTag = {
                name = "岩石标签",
                text = { "将接下来{C:attention}#1#{}张", "计分牌增强为", "{C:attention}#2#{}" }
            },
            tag_Bakery_EqualTag = {
                name = "等号标签",
                text = { "将接下来{C:attention}#1#{}张", "计分牌增强为", "{C:attention}#2#{}" }
            },
            tag_Bakery_RouletteTag = {
                name = "轮盘标签",
                text = { "将接下来{C:attention}#1#{}张", "计分牌增强为", "{C:attention}#2#{}" }
            },
            tag_Bakery_BlueTag = {
                name = "蓝色标签",
                text = { "将接下来{C:attention}#1#{}张", "计分牌增强为", "{C:attention}#2#{}" }
            },
            tag_Bakery_RedTag = {
                name = "红色标签",
                text = { "将接下来{C:attention}#1#{}张", "计分牌增强为", "{C:attention}#2#{}" }
            },
            tag_Bakery_StrangeTag = {
                name = "奇异标签",
                text = {}
            },
            tag_Bakery_TopTag = {
                name = "顶部标签",
                text = { "牌组中每张牌", "获得{C:money}50¢{}", "{C:inactive}（将获得{C:money}$#1#{C:inactive}）" }
            },
            tag_Bakery_BottomTag = {
                name = "底部标签",
                text = { "每个空的小丑槽位", "获得{C:money}$10{}", "{C:inactive}（将获得{C:money}$#1#{C:inactive}）" }
            }
        },
        Back = {
            b_Bakery_Violet = {
                name = "紫罗兰牌组",
                text = { "提供{X:mult,C:white}X#1#{}倍率" },
                unlock = { "击败{C:purple}#1#{}" }
            },
            b_Bakery_House = {
                name = "赌场牌组",
                text = { "每张打出的牌有", "{C:green}#1#/#2#{}的概率",
                    "在计分后改变点数和花色" },
                unlock = { "使用{C:attention}#1#{}", "在任意难度下", "赢得一局" }
            },
            b_Bakery_Credit = {
                name = "信用牌组",
                text = { "开局额外{C:money}$#1#{}", "任何来源都{C:red}不获得金钱{}" },
                unlock = { "使用{C:attention}#1#{}", "在至少{V:1}#2#{}难度下", "赢得一局" }
            },
            b_Bakery_DN = {
                name = "D&D牌组",
                text = { "所有{C:green}概率{}", "以{C:attention}优势{}掷骰", "{C:inactive}（掷两次，取较好的结果）" }
            }
        },
        Sleeve = {
            sleeve_Bakery_Violet = {
                name = "紫罗兰护袖",
                text = { "提供{X:mult,C:white}X#1#{}倍率" }
            },
            sleeve_Bakery_House = {
                name = "赌场护袖",
                text = { "每张打出的牌有", "{C:green}#1#/#2#{}的概率",
                    "在计分后改变点数和花色" }
            },
            sleeve_Bakery_House_alt = {
                name = "赌场护袖",
                text = { "卡牌改变的概率", "{C:green}翻倍{}，", "并可能获得增强效果" }
            },
            sleeve_Bakery_Credit = {
                name = "信用护袖",
                text = { "开局额外{C:money}$#1#{}", "任何来源都{C:red}不获得金钱{}" }
            },
            sleeve_Bakery_Credit_alt = {
                name = "信用护袖",
                text = { "开局额外{C:money}$#1#{}", "每打出一张牌失去{C:red}$1{}" }
            },
            sleeve_Bakery_DN = {
                name = "D&D护袖",
                text = { "所有{C:green}概率{}", "以{C:attention}优势{}掷骰", "{C:inactive}（掷两次，取较好的结果）" }
            },
            sleeve_Bakery_DN_alt = {
                name = "5袖",
                text = { "所有{C:green}概率{}", "以{C:attention}双重优势{}掷骰", "{C:inactive}（掷三次，取最好的结果）" }
            }
        },
        Blind = {
            bl_Bakery_Aleph = {
                name = "领袖",
                text = { "-1出牌次数", "-1弃牌次数" }
            },
            bl_Bakery_Tsadi = {
                name = "消耗",
                text = { "计分前", "{C:red}-#1#{}倍率" }
            },
            bl_Bakery_He = {
                name = "独奏",
                text = { "只有{C:attention}一张{}", "牌计分" }
            },
            bl_Bakery_Qof = {
                name = "女巫",
                text = {
                    "向牌组添加",
                    "{C:attention}#1#{}张{C:purple}诅咒牌{}"
                }
            },
            bl_Bakery_Kaf = {
                name = "建造",
                text = { "无基础筹码" }
            },
            bl_Bakery_Samekh = {
                name = "统治者",
                text = {
                    "没有点数或花色的",
                    "牌失效"
                }
            },
            bl_Bakery_Lammed = {
                name = "禁欲者",
                text = { "护符失效" }
            }
        },
        Spectral = {
            c_Bakery_Astrology = {
                name = "占星术",
                text = { "{C:money}出售{}所有{C:attention}牌型等级{}", "每级获得{C:money}$#1#{}" }
            },
            c_Bakery_TimeMachine = {
                name = "时光机",
                text = {
                    "将{C:attention}#1#{}张选中的",
                    "牌增强为{C:attention}#2#{}"
                }
            },
            c_Bakery_Boids = {
                name = "群体",
                text = {
                    "将最多{C:attention}#1#{}张选中的",
                    "牌转换为{C:attention}相同的{}",
                    "随机{C:attention}花色{}和{C:attention}点数{}"
                }
            }
        },
        Tarot = {
            c_Bakery_Scribe = {
                name = "抄写员",
                text = { "创建{C:attention}#2#{}张选中的", "{C:attention}游戏牌{}或{C:attention}小丑{}的",
                    "{C:attention}#1#{}张{C:dark_edition}碳素{}副本", "{C:inactive}（需要有空位）",
                    "{C:inactive}（移除副本的{C:eternal}永恒{C:inactive}）" }
            }
        },
        Enhanced = {
            m_Bakery_TimeWalk = {
                name = "时间漫步",
                text = { "{C:blue}+#1#{}出牌次数", "无点数或花色" }
            },
            m_Bakery_Curse = {
                name = "诅咒",
                text = { "无点数或花色" }
            }
        },
        Edition = {
            e_Bakery_Carbon = {
                name = "碳素",
                text = { "计分后", "{C:red}自毁{}" }
            }
        },
        -- KEEP_LITE
        BakeryCharm = {
            -- END_KEEP_LITE
            BakeryCharm_Bakery_Palette = {
                name = "调色板",
                text = { "{C:attention}同花{}可由", "至少{C:attention}4种花色{}组成" },
                unlock = { "牌组中拥有至少", "{C:attention}#1#{}张相同", "{C:attention}花色{}的牌" }
            },
            BakeryCharm_Bakery_AnaglyphLens = {
                name = "立体镜片",
                text = { "判定牌型时", "视第{C:attention}一{}张牌",
                    "为{C:attention}重复{}的" },
                unlock = { "同时拥有", "{C:attention}#1# #2#{}" }
            },
            BakeryCharm_Bakery_Pedigree = {
                name = "血统",
                text = { "{C:attention}葫芦{}可由", "{C:attention}花色{}组成",
                    "{C:inactive}（除了{C:attention}点数{C:inactive}）" }
            },
            BakeryCharm_Bakery_Epitaph = {
                name = "墓志铭",
                text = { "{C:attention}未计分{}的出牌", "提供{X:mult,C:white}X#1#{}倍率" },
                unlock = { "牌组中只有", "{C:attention}始终计分{}的牌" }
            },
            BakeryCharm_Bakery_Rune = {
                name = "符文",
                text = { "可以弃{C:attention}0张牌{}", "来额外抽",
                    "{C:attention}#1#{}张牌" },
                unlock = { "手牌中至少有", "{C:attention}#1#{}张牌" }
            },
            BakeryCharm_Bakery_Obsession = {
                name = "执念",
                text = { "可以弃{C:attention}0张牌{}", "来获得{C:money}$#1#{}" },
                unlock = { "赢得一局", "不弃掉任何一张牌" }
            },
            BakeryCharm_Bakery_Introversion = {
                name = "内向",
                text = { "{C:attention}小丑{}不会", "出现在商店" }
            },
            BakeryCharm_Bakery_Extroversion = {
                name = "外向",
                text = { "{C:attention}塔罗{}和{C:attention}星球{}牌", "不会出现在商店" }
            },
            BakeryCharm_Bakery_Coin = {
                name = "硬币",
                text = { "每{C:money}$#1#{}获得", "{C:attention}利息{}",
                    "{C:inactive}（而不是每{C:money}$5{C:inactive}）" }
            },
            BakeryCharm_Bakery_Void = {
                name = "虚空",
                text = { "{C:dark_edition}负片{}牌出现", "频率{X:dark_edition,C:white}#1#倍{}" },
                unlock = { "拥有至少", "{C:attention}#1#个小丑{}" }
            },
            BakeryCharm_Bakery_PrintError = {
                name = "印刷错误",
                text = { "打印机打印两次" },
                unlock = { "拥有至少", "{C:attention}#1#个合同{}" }
            },
            BakeryCharm_Bakery_Posterization = {
                name = "色调分离",
                text = { "{C:colourcard}颜色{}牌只", "占用{C:attention}半个{}槽位" },
                unlock = { "拥有一张触发", "{C:attention}#1#{}次的{C:colourcard}颜色{}牌" }
            },
            BakeryCharm_Bakery_Marm = {
                name = "马姆",
                text = { "每手都是{C:attention}对子{}", "每张{C:attention}打出的牌{}", "都计分" },
                unlock = { "只用{C:attention}对子{}", "赢得一局" }
            },
            BakeryCharm_Bakery_DuctTape = {
                name = "胶带",
                text = {
                    "{C:common}普通{}和{C:uncommon}罕见{}",
                    "{C:attention}小丑{}不出现",
                    "{C:red}无法移除"
                }
            },
            BakeryCharm_Bakery_Virus = {
                name = "病毒",
                text = {
                    "计分后随机{C:green}感染{}",
                    "一张未感染的留牌"
                },
                unlock = {
                    "只拥有{C:attention}{C:green}感染牌{}",
                }
            },
            BakeryCharm_Bakery_PetriDish = {
                name = "培养皿",
                text = { "{C:attention}+#1#{}消耗品槽位" },
                unlock = {
                    "用{C:tarot}#2#{}",
                    "复制{C:legendary}#1#{}"
                }
            },
            BakeryCharm_Bakery_Cogwheel = {
                name = '齿轮',
                text = { "{C:attention}-#1#{}底注，", "商店少{C:attention}#2#{}张牌" },
                unlock = { '通过底注{C:attention}#1#{}' }
            },
            BakeryCharm_Bakery_OopsAll20s = {
                name = '全是20！',
                text = { '所有{C:attention}显示{}的', '{C:green,E:1,S:1.1}概率{}翻三倍', '{C:inactive}（如：{C:green}1/3{C:inactive} -> {C:green}3/3{C:inactive}）' }
            },
            BakeryCharm_Bakery_Fortuna = {
                name = '幸运女神',
                text = { '{C:tarot}#1#{}不再', '添加{C:dark_edition}#2#{}或{C:dark_edition}#3#{}' }
            },
            BakeryCharm_Bakery_MementoMori = {
                name = '勿忘死亡',
                text = { '所有{C:tarot}塔罗{}牌', '都是{C:attention}#1#{}' },
                unlock = { '{C:attention}完整牌组{}中的', '所有牌都', '完全相同' }
            }
            -- KEEP_LITE
        },
        Other = {
            Bakery_charm = {
                name = "护符",
                text = { "一次只能装备一个护符，", "购买新护符会", "替换旧护符" }
            },
            undiscovered_bakerycharm = {
                name = "未发现",
                text = { "在无种子局中", "装备此护符", "以了解其功能" }
            }
        }
    },
    misc = {
        v_text = {
            ch_c_Bakery_Balanced = { "{C:mult}倍率{}不能超过{C:chips}筹码{}" },
            ch_c_Bakery_Vagabond = { "{C:money}金钱{}不能超过{C:money}$#1#{}" },
            ch_c_Bakery_Sprint_Small = { "必须跳过{C:attention}小盲注{}" },
            ch_c_Bakery_Sprint_Big = { "必须跳过{C:attention}大盲注{}" },
        },
        -- END_KEEP_LITE
        challenge_names = {
            c_Bakery_Balanced = "平衡",
            c_Bakery_Vagabond = "流浪者",
            c_Bakery_Sprint = "冲刺",
        },
        -- KEEP_LITE
        dictionary = {
            -- END_KEEP_LITE
            b_Bakery_store = "存放",
            b_Bakery_return = "取回",
            b_Bakery_shattered = "破碎了！",
            k_Bakery_charm = "护符",
            k_Bakery_charms = "护符",
            b_Bakery_double_tags = "双倍标签",
            -- KEEP_LITE
            k_bakerycharm = "护符",
            k_BakeryCharmInfo = { "一次只能装备一个护符。",
                "购买新护符会替换旧护符。" },
            b_Bakery_equip = "装备",
            b_Bakery_ante = "（底注）"
        },
        -- END_KEEP_LITE
        v_dictionary = {
            b_Bakery_deposit = "存入$#1#",
            b_Bakery_ante_times = "（底注*#1#）",
            v_Bakery_artist = "美术：#1#",
            v_Bakery_coder = "代码：#1#",
            v_Bakery_idea = "创意：#1#",
            v_Bakery_by = "作者：#1#"
        },
        labels = {
            Bakery_Carbon = "碳素"
        },
        poker_hands = {
            Bakery_StuffedHouse = "满堂彩",
            Bakery_StuffedFlush = "满堂同花",
            Bakery_StraightHouse = "后宫",
            Bakery_StraightFlushHouse = "同花后宫",
            Bakery_RoyalFlushHouse = "皇家后宫",
            Bakery_FullFive = "满五条",
            Bakery_FullFlushFive = "同花满五条",
            Bakery_SixOfAKind = "六条",
            Bakery_FlushSix = "同花六条",
            Bakery_ThreePair = "三对",
            Bakery_FlushThreePair = "同花三对",
            Bakery_TwoTriplets = "双三条",
            Bakery_FlushTriplets = "同花双三条",
            Bakery_FlushMansion = "同花大宅"
        }
        -- KEEP_LITE
    }
}
