return {
    descriptions = {
        Back={
            b_jokerhub_film_deck = {
                name = "电影人牌组",
                text ={
                    "游戏开始时拥有{C:red,T:v_directors_cut}导演剪辑版{}",
                    "{C:attention}Boss盲注{}刷新费用",
                    "降低至{C:money}$5{}",
                    "任何{C:attention}Boss盲注{}可能出现",
                    "在任何{C:attention}底注{}",
                },
            },
        },
        Blind={},
        Edition={},
        Enhanced={},
        Joker={
            j_jokerhub_broker = {
                name = '经纪人',
                text = {
                    "不获得{C:attention}利息{}",
                    "每{C:money}$1{}的{C:attention}利息{}",
                    "此小丑牌获得{C:chips}+#1#{}筹码",
                    "{C:inactive}（当前{C:chips}+#2#{C:inactive}筹码）"
                }
            },
            j_jokerhub_da_joki = {
                name = '达·乔基',
                text = {
                    "如果连续两次出牌是相同的",
                    "{C:attention}牌型{}，此小丑牌获得{C:mult}+#2#{}倍率",
                    "否则{C:mult}-#3#{}倍率",
                    "{C:inactive}（当前{C:mult}+#1#{C:inactive}倍率，{C:attention}#4#{C:inactive}）"
                }
            },
            j_jokerhub_demon_core = {
                name = '恶魔核心',
                text = {
                    "{X:mult,C:white}X#1#{}倍率",
                    "出牌时有{C:green}#2#/#3#{}概率",
                    "摧毁所有{C:attention}小丑牌{}"
                }
            },
            j_jokerhub_face_value = {
                name = '面值',
                text = {
                    "每张打出的{C:attention}人头牌{}",
                    "计分时永久获得",
                    "{C:mult}+#1#{}倍率"
                }
            },
            j_jokerhub_forbidden_fruit = {
                name = '禁果',
                text = {
                    "每出牌一次此小丑牌获得{X:mult,C:white}X#2#{}倍率",
                    "如果计分的牌中包含{C:attention}#3#{}",
                    "{S:1.1,C:red,E:2}自毁{}，点数每回合改变",
                    "{C:inactive}（当前{X:mult,C:white}X#1#{C:inactive}倍率）"
                }
            },
            j_jokerhub_gambit = {
                name = '赌博',
                text = {
                    "每摧毁一个{C:attention}食物小丑牌{}",
                    "此小丑牌获得{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}（当前{X:mult,C:white}X#1#{C:inactive}倍率）"
                }
            },
            j_jokerhub_garbage_bag = {
                name = '垃圾袋',
                text = {
                    "未使用的{C:red}弃牌次数{}",
                    "会保留到下一回合",
                    "{C:inactive}（最多{C:red}#1#{C:inactive}次弃牌）{}"
                }
            },
            j_jokerhub_going_viral = {
                name = '病毒传播',
                text = {
                    "每出牌一次此小丑牌获得{C:mult}+#2#{}倍率",
                    "补充包或商店中的{C:attention}小丑牌{}和{C:attention}消耗牌{}",
                    "有{C:green}#3#/#4#{}概率",
                    "被替换为{C:attention}病毒传播{}",
                    "{C:inactive}（当前{C:mult}+#1#{C:inactive}倍率）",
                }
            },
            j_jokerhub_hudson = {
                name = '哈德森',
                text = {
                    "复制其{C:attention}左侧{}{C:attention}小丑牌{}的能力",
                    "手中每持有一张{C:attention}7{}",
                    "此小丑牌触发一次"
                }
            },
            j_jokerhub_last_hurrah = {
                name = '最后欢呼',
                text = {
                    "如果此小丑牌在{C:attention}最后{}位置，",
                    "每拥有{C:money}$#1#{}，重新触发{C:attention}最后{}一张",
                    "计分牌{C:attention}1{}次",
                    "{C:inactive}（最多{C:attention}#2#{C:inactive}次重触发）{}，然后金钱设为{C:money}$0{}",
                    "{C:inactive}（当前{C:attention}#3#{C:inactive}次重触发）",
                }
            },
            j_jokerhub_orb_of_confusion = {
                name = '困惑之球',
                text = {
                    "{X:mult,C:white}X#1#{}倍率",
                    "每回合{C:attention}第一次出牌{}",
                    "牌面朝下抽取"
                }
            },
            j_jokerhub_rekoj = {
                name = 'rekoJ',
                text = {
                    "如果牌型包含至少{C:attention}2{}个",
                    "计分{C:attention}点数{}且点数从低到高排列",
                    "给予{C:mult}+#1#{}倍率"
                }
            },
            j_jokerhub_snowball_effect = {
                name = '滚雪球效应',
                text = {
                    "每{C:attention}连续{}在{C:attention}第一次出牌{}",
                    "击败盲注，此小丑牌获得{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}（当前{X:mult,C:white}X#1#{C:inactive}倍率）"
                }
            },
            j_jokerhub_twins = {
                name = '双胞胎',
                text = {
                    "如果牌型包含",
                    "{C:attention}同花{}和{C:attention}对子{}",
                    "生成{C:attention}2{}张相同的随机{C:tarot}塔罗牌{}",
                    "{C:inactive}（必须有空位）"
                }
            },
            j_jokerhub_union_member_card = {
                name = '工会会员卡',
                text = {
                    "如果所有其他持有的",
                    "{C:attention}小丑牌{}都是{C:blue}普通{}的",
                    "则{X:mult,C:white}X#1#{}倍率",
                }
            },
            j_jokerhub_mulligan = {
                name = '重来',
                text = {
                    "如果出牌得分只达到",
                    "所需筹码的{C:attention}#1#%{}或更少",
                    "获得{C:blue}+#2#{}次出牌",
                    "{C:inactive}（每回合最多{C:blue}#3#{C:inactive}次）"
                }
            },
            j_jokerhub_syphon_funding = {
                name = '资金虹吸',
                text = {
                    "选择{C:attention}盲注{}时",
                    "削弱右侧的小丑牌",
                    "回合结束时获得被削弱的",
                    "小丑牌售出价值的{C:money}三倍{}"
                }
            },
            j_jokerhub_leap_frog = {
                name = '跳蛙',
                text = {
                    "如果{C:attention}左侧{}的{C:attention}小丑牌{}数量",
                    "比本回合任何一次出牌时都多",
                    "每张给予{C:chips}+#1#{}筹码",
                    "{C:inactive}（当前{C:attention}#2#{C:inactive}个小丑牌）"
                }
            },
            j_jokerhub_long_time_friends = {
                name = '老朋友',
                text = {
                    "{C:attention}永恒{}小丑牌可以被售出",
                    "每售出一个{C:attention}永恒{}小丑牌",
                    "此小丑牌获得{X:mult,C:white}X#2#{}倍率",
                    "{C:inactive}（当前{X:mult,C:white}X#1#{C:inactive}倍率）"
                }
            },
            j_jokerhub_amamiya = {
                name = '雨宫',
                text = {
                    "击败{C:attention}Boss盲注{}时，",
                    "此小丑牌永久获得",
                    "基于{C:attention}Boss盲注{}的",
                    "一种{C:attention}能力{}"
                }
            },
            j_jokerhub_metal_joker = {
                name = '金属小丑',
                text = {
                    "{C:attention}钢铁牌{}被视为",
                    "{C:attention}黄金牌{}，反之亦然"
                }
            },
            j_jokerhub_lychee_dragon = {
                name = '荔枝龙',
                text = {
                    "每张打出的{C:hearts}红桃{}花色的牌",
                    "计分时永久获得",
                    "{X:mult,C:white}X#1#{}倍率"
                }
            },
        },
        Other={
            jokerhub_pink_sticker = {
                name = "粉色贴纸",
                text = {
                    "使用此小丑牌",
                    "在{C:attention}粉色赌注{}难度下",
                    "赢得了游戏",
                }
            },
            jokerhub_stake_silver_sticker = {
                name = "银色贴纸",
                text = {
                    "使用此小丑牌",
                    "在{C:attention}银色赌注{}难度下",
                    "赢得了游戏",
                }
            },
            jokerhub_card_extra_mult = {
                text = { "{C:mult}+#1#{}额外倍率" }
            },
            jokerhub_amamiya_ability_bl_manacle = {
                name = "镣铐之心",
                text = { "{C:attention}+#1#{}手牌上限" }
            },
            jokerhub_amamiya_ability_bl_ox = {
                name = "公牛之心",
                text = {
                    "打出最常用的{C:attention}牌型{}时",
                    "获得{C:money}$#1#{}"
                }
            },
            jokerhub_amamiya_ability_bl_wall = {
                name = "城墙之心",
                text = { "{X:mult,C:white}X#1#{}倍率" }
            },
            jokerhub_amamiya_ability_bl_final_vessel = {
                name = "紫罗兰容器之心",
                text = { "{X:mult,C:white}X#1#{}倍率" }
            },
            jokerhub_amamiya_ability_bl_arm = {
                name = "手臂之心",
                text = {
                    "每回合升级{C:attention}第一个{}",
                    "打出的{C:attention}牌型{}等级"
                }
            },
            jokerhub_amamiya_ability_bl_club = {
                name = "梅花之心",
                text = {
                    "重新触发所有",
                    "打出的{C:club}梅花{}牌",
                }
            },
            jokerhub_amamiya_ability_bl_goad = {
                name = "刺棒之心",
                text = {
                    "重新触发所有",
                    "打出的{C:spades}黑桃{}牌",
                }
            },
            jokerhub_amamiya_ability_bl_window = {
                name = "窗户之心",
                text = {
                    "重新触发所有",
                    "打出的{C:diamonds}方片{}牌",
                }
            },
            jokerhub_amamiya_ability_bl_head = {
                name = "头颅之心",
                text = {
                    "重新触发所有",
                    "打出的{C:hearts}红桃{}牌",
                }
            },
            jokerhub_amamiya_ability_bl_plant = {
                name = "植物之心",
                text = {
                    "重新触发所有",
                    "打出的{C:attention}人头牌{}",
                }
            },
            jokerhub_amamiya_ability_bl_pillar = {
                name = "支柱之心",
                text = {
                    "每张打出的{C:attention}牌{}",
                    "计分时永久获得",
                    "{C:chips}+#1#{}筹码",
                },
            },
            jokerhub_amamiya_ability_bl_water = {
                name = "水之心",
                text = {
                    "每回合{C:red}+#1#{}次弃牌",
                }
            },
            jokerhub_amamiya_ability_bl_needle = {
                name = "针之心",
                text = {
                    "每回合{C:blue}+#1#{}次出牌",
                }
            },
            jokerhub_amamiya_ability_bl_final_leaf = {
                name = "翠绿之叶之心",
                text = { "{C:dark_edition}+#1#{}小丑牌槽位" }
            },
            jokerhub_amamiya_ability_bl_tooth = {
                name = "牙齿之心",
                text = {
                    "每张计分的牌",
                    "获得{C:money}$#1#{}"
                }
            },
            jokerhub_amamiya_ability_bl_flint = {
                name = "燧石之心",
                text = {
                    "牌计分前",
                    "{X:mult,C:white}X#1#{}倍率和{X:chips,C:white}X#2#{}筹码"
                }
            },
            jokerhub_amamiya_ability_bl_final_bell = {
                name = "天蓝之钟之心",
                text = {
                    "重新触发一张{C:attention}随机{}",
                    "计分牌",
                    "{C:attention}#1#{}次",
                }
            },
            jokerhub_amamiya_ability_bl_ReduxArcanum_bane = {
                name = "祸害之心",
                text = { "{C:attention}+#1#{}消耗品槽位" }
            },
            jokerhub_amamiya_ability_unknown = {
                name = "未知盲注之心",
                text = { "{C:chips}+#1#{}筹码" }
            },
            jokerhub_amamiya_ability_bl_hook = {
                name = "钩子之心",
                text = {
                    "如果{C:attention}弃掉{}的手牌",
                    "恰好包含{C:attention}#1#{}张牌，",
                    "获得{C:red}+1{}次弃牌",
                    "{C:inactive}（每回合最多{C:red}+#2#{C:inactive}次）"
                }
            },
            jokerhub_amamiya_ability_bl_psychic = {
                name = "通灵者之心",
                text = {
                    "每张{C:attention}打出的牌",
                    "都参与计分",
                }
            },
            jokerhub_amamiya_ability_bl_mouth = {
                name="嘴巴之心",
                text={
                    "如果打出的{C:attention}牌型{}",
                    "本回合已经打出过",
                    "则{X:mult,C:white}X#1#{}倍率",
                },
            },
            jokerhub_amamiya_ability_bl_eye = {
                name="眼睛之心",
                text={
                    "如果打出的{C:attention}牌型{}",
                    "本回合尚未打出过",
                    "则{X:mult,C:white}X#1#{}倍率",
                },
            },
            jokerhub_amamiya_ability_bl_final_heart = {
                name="绯红之心",
                text={
                    "重新触发{C:attention}#1#{}，",
                    "小丑牌每次出牌后改变",
                },
            },
            jokerhub_amamiya_ability_bl_poke_cgoose = {
                name="翠绿密室之心",
                text={
                    "{C:pink}+#1#{}能量上限",
                },
            },
            jokerhub_amamiya_ability_bl_house = {
                name="房屋之心",
                text={
                    "{C:attention}第一次抽牌{}中的牌",
                    "留在手中时每张给予{X:mult,C:white}X#1#{}倍率",
                },
            },
            jokerhub_amamiya_ability_bl_fish = {
                name="鱼之心",
                text={
                    "在回合{C:attention}最后一次出牌{}时",
                    "重新触发所有打出的牌",
                },
            },
            jokerhub_amamiya_ability_bl_wheel = {
                name="车轮之心",
                text={
                    "回合结束时留在手中的牌",
                    "有{C:green}#2#/#1#{}概率获得",
                    "{C:dark_edition}闪箔{}、{C:dark_edition}镭射{}或{C:dark_edition}多彩{}",
                },
            },
            jokerhub_amamiya_ability_bl_mark = {
                name="印记之心",
                text={
                    "{C:attention}人头牌{}留在手中时",
                    "回合结束时获得{C:money}$#1#{}",
                },
            },
            jokerhub_amamiya_ability_bl_final_acorn = {
                name="琥珀橡子之心",
                text={
                    "牌组顶部的牌分别是",
                    "{C:attention}#1#{}的{V:1}#2#{}，{C:attention}#3#{}的{V:2}#4#{}，",
                    "{C:attention}#5#{}的{V:3}#6#{}，{C:attention}#7#{}的{V:4}#8#{}，",
                    "{C:attention}#9#{}的{V:5}#10#{}",
                },
            },
            jokerhub_amamiya_ability_bl_mxms_rot = {
                name="腐烂之心",
                text={
                    "每张打出的牌有",
                    "{C:green}#2#/#1#{}概率",
                    "被重新触发{C:attention}两次{}"
                },
            },
            jokerhub_amamiya_ability_bl_mxms_grinder = {
                name="磨床之心",
                text={
                    "在回合{C:attention}第一次出牌{}时",
                    "给随机一张计分牌",
                    "添加随机{C:attention}蜡封{}"
                },
            },
        },
        Planet={},
        Spectral={},
        Stake={
            stake_jokerhub_pink = {
                name = "粉色赌注",
                text = {
                    "{C:attention}终结盲注{}和游戏结束",
                    "在{C:attention}底注9{}",
                    "{s:0.8}应用紫色赌注及以下"
                },
            },
            stake_jokerhub_stake_silver = {
                name = "银色赌注",
                text = {
                    "每个{C:attention}底注{}所需分数",
                    "增长更快",
                    "{s:0.8}应用粉色赌注及以下"
                },
            },
        },
        Tag={},
        Tarot={},
        Voucher={},
    },
    misc = {
        achievement_descriptions={},
        achievement_names={},
        blind_states={},
        challenge_names={
            c_jokerhub_covid_19 = "新冠疫情",
            c_jokerhub_another_mans_treasure = "他人的宝藏",
            c_jokerhub_dinner_time = "晚餐时间"
        },
        collabs={},
        dictionary={
            k_jokerhub_syphon = "虹吸！",
            k_jokerhub_sealed = "封印！",
        },
        high_scores={},
        labels={},
        poker_hand_descriptions={},
        poker_hands={},
        quips={},
        ranks={},
        suits_plural={},
        suits_singular={},
        tutorial={},
        v_dictionary={
            a_discards="+#1#次弃牌",
        },
        v_text={},
    },
}
