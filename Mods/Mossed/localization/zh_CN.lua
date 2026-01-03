return {
    descriptions = {
        Back = {
            b_moss_henry = {
                name = "双倍牌组",
                text = {
                    "游戏开始时拥有{C:attention,T:v_overstock_norm}扩容{}",
                    "和{C:attention,T:v_overstock_plus}扩容Plus{}",
                    "{C:attention}+2{}小丑牌槽位",
                    "{C:attention}+2{}手牌上限",
                    "{C:red}x2{}基础盲注分数",
                },
            },
            b_moss_fitzgerald = {
                name = "赌场牌组",
                text = {
                    "游戏开始时拥有",
                    "{C:tarot,T:c_wheel_of_fortune}命运之轮",
                    "{C:blue}出牌{}和{C:red}弃牌{}次数在",
                    "每回合开始时{C:attention}随机化{}",
                },
            },
        },
        Blind = {},
        Edition = {
            e_moss_green = {
                name = "翠绿",
                label = "翠绿",
                text = {
                    "回合结束时",
                    "{C:attention}+#2#{}售出价值",
                },
            },
            e_moss_greenalt = {
                name = "翠绿",
                label = "翠绿",
                text = {
                    "此牌计分时",
                    "{C:blue}+#1#{}额外筹码",
                },
            },
            e_moss_greenalt2 = {
                name = "翠绿",
                label = "翠绿",
                text = {
                    "放在{C:attention}小丑牌{}上时，回合结束时{C:attention}+#2#{}售出价值",
                    "放在{C:attention}游戏牌{}上时，计分时{C:blue}+#1#{}额外筹码",
                },
            },
        },
        Enhanced={},
        Joker = {
            j_moss_mossy = {
                name = "苔藓小丑",
                text = {
                    "经过{C:attention}#1#{}回合后，",
                    "售出此小丑牌将为一张",
                    "随机小丑牌应用{C:green}翠绿{}版本",
                    "{C:inactive}（当前{}{C:attention}#2#{}{C:inactive}/#1#）{}",
                },
            },
            j_moss_kitchen = {
                name = "厨房瓷砖",
                text = {
                    "所有{C:attention}石头牌{}",
                    "被视为{V:1}#1#{}",
                    "{s:0.8}花色每回合结束时改变",
                },
            },
            j_moss_jeb = {
                name = "杰布",
                text = {
                    "每打开一个补充包",
                    "此小丑牌获得{C:red}+#2#{}倍率",
                    "击败{C:attention}Boss盲注{}时重置",
                    "{C:inactive}（当前{}{C:red}+#1#{}{C:inactive}倍率）{}",
                },
            },
            j_moss_d9volt = {
                name = "{s:0.75}刻有骰子数字的9伏电池{}",
                text = {
                    "根据当前局的",
                    "{C:attention}种子{}给予倍率",
                    "{C:inactive}（当前{}{C:red}+#2#{}{C:inactive}倍率）{}",
                },
            },
            j_moss_lara = {
                name = "拉拉",
                text = {
                    "游戏牌上的{C:attention}版本{}",
                    "现在在{C:attention}留在手中{}时也会触发",
                },
            },
            j_moss_bittergiggle = {
                name = "终极小丑",
                text = {
                    "{C:attention}增强的Q牌{}计分时",
                    "给予{X:mult,C:white}X#1#{}倍率",
                },
            },
            j_moss_blueberry = {
                name = "蓝莓",
                text = {
                    "本局获得的每个蓝莓",
                    "给予{C:blue}+#2#{}筹码",
                    "{C:attention}#1#{}回合后摧毁自身",
                    "{C:inactive}（当前{}{C:blue}+#3#{}{C:inactive}筹码）{}",
                    "{s:0.8}此小丑牌可以在没有{s:0.8,C:attention}表演者{}的情况下多次出现",
                },
            },
            j_moss_strawberry = {
                name = "草莓",
                text = {
                    "本局获得的每个草莓",
                    "给予{C:red}+#2#{}倍率",
                    "{C:attention}#1#{}回合后摧毁自身",
                    "{C:inactive}（当前{}{C:red}+#3#{}{C:inactive}倍率）{}",
                    "{s:0.8}此小丑牌可以在没有{s:0.8,C:attention}表演者{}的情况下多次出现",
                },
            },
            j_moss_followsuit = {
                name = "跟随花色",
                text = {
                    "当手中第一张计分的{V:1}#1#{}",
                    "计分时，获得等于牌组中",
                    "{C:attention}花色{}数量的{C:money}金钱{}",
                    "{C:inactive}（当前{}{C:money}$#2#{}{C:inactive}）{}",
                    "{s:0.8}花色每回合改变{}",
                },
            },
            j_moss_fourfold = {
                name = "四重对称",
                text = {
                    "每{C:attention}奇数次{}出牌",
                    "给予{C:blue}+#1#{}筹码",
                    "每{C:attention}偶数次{}出牌",
                    "给予{C:red}+#2#{}倍率",
                },
            },
            j_moss_pixel = {
                name = "像素完美",
                text = {
                    "回合结束时，完整牌组中",
                    "每有一张{C:attention}8{}",
                    "此小丑牌获得{C:blue}+#2#{}筹码",
                    "{C:inactive}（当前{}{C:blue}+#1#{}{C:inactive}筹码）{}",
                },
            },
            j_moss_luigi = {
                name = "胆小水管工",
                text = {
                    "每使用一张{C:spectral}幻灵牌{}",
                    "此小丑牌获得{X:mult,C:white}X#3#{}倍率",
                    "{C:green}#4#/#1#{}概率",
                    "改为{C:attention}摧毁{}自身",
                    "{C:inactive}（当前{}{X:mult,C:white}X#2#{}{C:inactive}倍率）",
                },
            },
            j_moss_impractical = {
                name = "今晚最大的输家",
                text = {
                    "此小丑牌获得{C:red}+#1#{}倍率并",
                    "在回合最后一次出牌时摧毁",
                    "{C:attention}留在手中{}的{C:attention}最低点数牌{}",
                    "{C:inactive}（当前{}{C:red}+#2#{}{C:inactive}倍率）{}",
                },
            },
            j_moss_split = {
                name = "分裂小丑",
                text = {
                    "当{C:attention}弃掉{}包含",
                    "{C:attention}3{}张或更少牌的手牌时",
                    "此小丑牌获得{C:blue}+#1#{}筹码",
                    "{C:inactive}（当前{}{C:blue}+#2#{}{C:inactive}筹码）{}",
                },
            },
            j_moss_jet = {
                name = "杰特齐尔",
                text = {
                    "重新触发所有带有",
                    "{C:attention}增强{}的游戏牌",
                },
            },
            j_moss_glamorous = {
                name = "魅力小丑",
                text = {
                    "{C:attention}皇后对{}可以与",
                    "任意{C:attention}人头牌{}组成",
                    "{C:inactive}（例如：{C:attention}J 5 5{C:inactive}）",
                },
                unlock = {
                    "打出一次{C:attention}????? ????{}"
                },
            },
        },
        Other={},
        Planet={
            c_moss_iris = {
                name="鸢尾星",
                text={
                    "{S:0.8}（{S:0.8,V:1}等级#2#{S:0.8}）{}升级",
                    "{C:attention}#1#{}",
                    "{C:red}+#3#{}倍率和",
                    "{C:blue}+#4#{}筹码",
                },
            },
        },
        Spectral={
            c_moss_plague = {
                name = "瘟疫",
                text = {
                    "有{C:green}#3#/#2#{}概率",
                    "为最多{C:attention}#1#{}张选中的",
                    "{C:attention}游戏牌{}应用{C:green}翠绿{}版本",
                    "如果概率失败",
                    "则{C:attention}摧毁{}该牌",
                },
            },
            c_moss_avarice = {
                name = "贪婪",
                text = {
                    "为一张随机{C:attention}小丑牌{}",
                    "应用{C:green}翠绿{}版本",
                },
            },
        },
        Stake={},
        Tag={
            tag_moss_greentag = {
                name = "翠绿标签",
                text = {
                    "下一张商店中的",
                    "基础版本小丑牌免费并",
                    "变为{C:green}翠绿{}版本",
                },
            },
        },
        Tarot={},
        Voucher={},
        Mod = {
            mossed = {
                name = "Mossed",
                text = {
                    "                                                                              ",
                    "{s:1.25}此模组添加了{C:red,s:1.25}16个小丑牌{s:1.25}，",
                    "{C:attention,s:1.25}2个牌组{s:1.25}，",
                    "{C:spectral,s:1.25}2张幻灵牌{s:1.25}，",
                    "{C:green,s:1.25}一个新版本{s:1.25}，",
                    "{s:1.25}以及更多！",
                    " ",
                    "{s:1.25}美术 - {C:green,E:1,s:1.25}Larantula{}",
                    " ",
                    "{s:1.25}代码 - {C:blue,E:1,s:1.25}Jetziel{}",
                    " ",
                    "{s:1.25}特别鸣谢 - {C:tarot,E:1,s:1.25}Balatro Discord{s:1.25}, {C:red,E:1,s:1.25}ITDEER{s:1.25}, {C:blue,E:1,s:1.25}jeb_yoshi{s:1.25}, {C:blue,E:1,s:1.25}MilesB24{}",
                    " ",
                },
            },
        },
    },
    misc = {
        achievement_descriptions={},
        achievement_names={},
        blind_states={},
        challenge_names={},
        collabs={},
        dictionary={
            k_green_ex="翠绿！",
            k_destroyed="摧毁！",
            k_good_night="晚安...",
        },
        high_scores={},
        labels={},
        poker_hand_descriptions={
            ["moss_Queen Pair"]={
                "两张相同点数的牌，加上一张Q。",
                "可以与最多2张其他不计分的牌一起打出",
            },
        },
        poker_hands={
            ["moss_Queen Pair"]="皇后对",
        },
        quips={},
        ranks={},
        suits_plural={},
        suits_singular={},
        tutorial={},
        v_dictionary={},
        v_text={},
    },
}
