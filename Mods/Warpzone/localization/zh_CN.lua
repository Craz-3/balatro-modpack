return {
    descriptions = {
        Joker = {
            j_Wzon_aluber = {
                name = '小丑阿鲁贝尔',
                text = {
                    '若本回合{C:attention}首次弃牌{}',
                    '只有{C:attention}1{}张牌，销毁它',
                    '并{C:attention}变形{}此牌',
                    '直至本盲注结束'
                }
            },
            j_Wzon_meatboy = {
                name = '肉小子',
                text = {
                    '每次出牌未能击败盲注时',
                    '{C:mult}+#1#{}倍率',
                    '{C:inactive}(当前{C:mult}+#2#{C:inactive}倍率){}'
                }
            },
            j_Wzon_malganis = {
                name = '恐怖恶魔',
                text = {
                    '你不会死亡',
                    '{C:green}#1#/#2#{}的几率',
                    '在回合结束时',
                    '变成一只乌龟'
                }
            },
            j_Wzon_wwreason = {
                name = '无端之战',
                text = {
                    '每次出牌得分超过',
                    '你的{C:attention}最高得分{}时',
                    '获得{X:mult,C:white}X#3#{}倍率',
                    '{C:inactive}(当前{X:mult,C:white}X#1#{}{C:inactive}倍率)',
                    '{C:inactive}(需超过: {}{C:attention}#2#{}{C:inactive}){}'
                }
            },
            j_Wzon_stack = {
                name = '堆叠',
                text = {
                    '{C:dark_edition}+1{}小丑槽位'
                }
            },
            j_Wzon_unocard = {
                name = '一张牌',
                text = {
                    '若{C:attention}获胜牌型{}是',
                    '{C:attention}高牌{}，销毁手中',
                    '所有未打出的牌'
                }
            },
            j_Wzon_votv = {
                name = '虚空之声',
                text = {
                    '每回合为{C:attention}3张牌{}',
                    '赋予计分时的{C:attention}加成{}',
                    '{C:attention}#4# of #1#{}: {C:chips}+303{}筹码',
                    '{C:attention}#5# of #2#{}: {C:mult}+42{}倍率',
                    '{C:attention}#6# of #3#{}: {X:mult,C:white}X3.14{}倍率'
                }
            },
            j_Wzon_chcard = {
                name = '角色卡',
                text = {
                    '击败{C:attention}盲注{}时随机获得',
                    '{C:money}${}、{C:chips}筹码{}、{C:mult}倍率{}',
                    '和{X:mult,C:white}X倍率{}，数量取决于{C:attention}难度{}',
                    '{C:inactive}(当前{C:chips}+#1#{C:inactive}/{C:mult}+#2#{C:inactive}/{X:mult,C:white}X#3#{C:inactive}){}'
                }
            },
            j_Wzon_discojoker = {
                name = '你是什么小丑？',
                text = {
                    '每次出牌后{C:attention}效果变化{}',
                    '效力取决于',
                    '{C:green}随机骰子点数{}'
                }
            },
            j_Wzon_horn = {
                name = '小丑之角',
                text = {
                    '最后打出的牌计分时',
                    '获得{X:chips,C:white}X#1#{}筹码'
                }
            },
            j_Wzon_hollowness = {
                name = '空洞',
                text = {
                    '经过{C:attention}2{}个回合后，出售',
                    '此牌使手中所有牌',
                    '变为{C:dark_edition}负片{}',
                    '{C:inactive}(当前{C:attention}#1#{C:inactive}/2)'
                }
            },
            j_Wzon_ironclad = {
                name = '红宝石钥匙',
                text = {
                    '购买时变为',
                    '随机{C:attention}铁甲战士消耗品{}',
                    '{C:inactive}(只能购买一次，需有空位){}'
                }
            },
            j_Wzon_silent = {
                name = '翡翠钥匙',
                text = {
                    '购买时变为',
                    '随机{C:attention}静默者消耗品{}',
                    '{C:inactive}(只能购买一次，需有空位){}'
                }
            },
            j_Wzon_defect = {
                name = '蓝宝石钥匙',
                text = {
                    '购买时变为',
                    '随机{C:attention}缺陷体消耗品{}',
                    '{C:inactive}(只能购买一次，需有空位){}'
                }
            },
            j_Wzon_exoticaceofspades = {
                name = '异域黑桃A',
                text = {
                    '重新触发所有打出的',
                    '{C:spades}黑桃{}花色牌',
                    '击败盲注后为你的下{C:attention}#1#{}张',
                    '计分牌赋予{C:dark_edition}闪箔{}',
                    '{C:inactive}(当前可赋予{C:attention}#2#{C:inactive}张)'
                }
            },
            j_Wzon_corruptheart = {
                name = '腐化之心',
                text = {
                    '选择{C:attention}盲注{}时',
                    '生成一张{C:red}客串{}消耗品',
                    '{C:inactive}(需有空位){}'
                }
            },
            j_Wzon_jimbo_forbidden = {
                name = '禁忌之人吉姆博',
                text = {
                    '首次抽牌时{C:attention}分裂{}成{C:attention}5{}张',
                    '{C:attention}禁忌{}牌加入你的{C:attention}牌组{}',
                    '若被{C:attention}复制{}或你的',
                    '{C:attention}完整牌组{}不在',
                    '{C:attention}40{}到{C:attention}60{}张之间，则{C:red}自毁{}'
                }
            },
            j_Wzon_lobotomy = {
                name = '脑叶切除术',
                text = {
                    '{C:green}#1#/#2#{}的几率',
                    '在{C:attention}得分燃烧{}时',
                    '生成一张{C:dark_edition}黑洞{}'
                }
            },
            j_Wzon_serializedjoker = {
                name = '序列号小丑',
                text = {
                    '{C:mult}+#1#{}倍率',
                    '回合结束时获得',
                    '{C:money}#2#${}出售价值',
                    '{s:0.8}若序列号是',
                    '{C:attention,s:0.8}069{}、{C:attention,s:0.8}690{}或{C:attention,s:0.8}420{}',
                    '{s:0.8}则初始出售价值为{C:money,s:0.8}#3#${}'
                }
            },
            j_Wzon_powercreep = {
                name = '强度膨胀',
                text = {
                    '{X:mult,C:white}X#1#{}倍率',
                    '若非{C:dark_edition}负片{}且击败{C:attention}Boss盲注{}时',
                    '得分达到所需分数的两倍以上',
                    '生成一张{C:dark_edition}负片{}复制'
                }
            },
            j_Wzon_traffikrab = {
                name = '毒蟹',
                text = {
                    '{C:attention}得分燃烧{}时将打出牌中',
                    '随机{C:attention}#1#{}张增强为{C:attention}剧毒牌{}',
                    '{C:inactive,s:0.8}(已是剧毒牌则进一步强化)',
                    '{C:inactive,s:0.8}(增强{C:attention,s:0.8}#2#{C:inactive,s:0.8}张后{C:attention,s:0.8}重制{})'
                }
            },
            j_Wzon_lobstacle = {
                name = '龙虾障',
                text = {
                    '{C:attention}得分燃烧{}时将打出牌中',
                    '随机{C:attention}#1#{}张增强为{C:attention}剧毒牌{}',
                    '{C:inactive,s:0.8}(已是剧毒牌则进一步强化)',
                    '每次以此方式增强牌时',
                    '获得{X:mult,C:white}X#3#{}倍率',
                    '{C:inactive,s:0.8}(当前{X:mult,C:white,s:0.8}X#2#{C:inactive,s:0.8}倍率)'
                }
            },
            j_Wzon_weevilite = {
                name = '象鼻虫精',
                text = {
                    '打出牌中的{C:attention}剧毒牌{}向相邻牌',
                    '蔓延{C:attention}#1#{}次',
                    '{C:inactive,s:0.8}(已是剧毒牌则进一步强化)',
                    '若手牌中无剧毒牌则随机',
                    '将{C:attention}#1#{}张增强为{C:attention}剧毒牌{}'
                }
            },
            j_Wzon_magikrab = {
                name = '魔力蟹',
                text = {
                    '重新触发打出的所有牌',
                    '{C:attention}剧毒牌{}额外',
                    '重新触发{C:attention}#1#{}次'
                }
            },
            j_Wzon_burn_my_dread = {
                name = '燃烧吾惧',
                text = {
                    '击败{C:attention}盲注{}时',
                    '生成一张{C:tarot}#1#{}的复制',
                    '#2#{C:tarot}#4#{C:red}#3#',
                    '{C:inactive}(需有空位)'
                }
            },
            j_Wzon_aria_of_the_soul = {
                name = '灵魂咏叹调',
                text = {
                    '{C:attention}商店{}结束时销毁',
                    '你的前{C:attention}2{}张消耗品并获得{C:money}$#1#{}',
                    '若销毁的是{C:attention}0{}到{C:attention}XX{}之间的',
                    '{C:tarot}塔罗牌{}，则生成一张{C:tarot}塔罗牌{}'
                }
            },
            j_Wzon_planeswalker = {
                name = '旅法师',
                text = {
                    '根据位置有{C:attention}3种不同效果{}',
                    '若{C:attention}忠诚度{}降至{C:attention}0{}',
                    '则{C:red}自毁{}',
                    '{C:inactive}(当前{C:attention}#1#{C:inactive}忠诚度)'
                }
            },
            j_Wzon_stonemask = {
                name = '石鬼面',
                text = {
                    '计分{C:attention}#1#{}张{C:hearts}红桃{}花色牌后',
                    '生成一个{C:attention}吸血鬼{}，然后{C:red}自毁{}',
                    '{C:inactive}(当前{C:attention}#2#{C:inactive}/#1#)',
                    '{C:inactive,s:0.8}(若拥有{C:attention,s:0.8}吸血鬼{C:inactive,s:0.8}则效果不同)'
                }
            },
            j_Wzon_loan = {
                name = '贷款',
                text = {
                    '打出的每张牌',
                    '{C:chips}-#1#{}筹码',
                    '第一张打出的牌计分时',
                    '{C:chips}+#2#{}筹码'
                }
            },
            j_Wzon_bluestorm = {
                name = '蓝色风暴',
                text = {
                    '若被{C:attention}头脑风暴{}复制',
                    '则表现为{C:attention}蓝图{}，反之亦然',
                    '{C:inactive,s:0.8}(若你没有这两者则效果不同)'
                }
            },
        },
        Tarot = {
            c_Wzon_universe = {
                name = '宇宙',
                text = {
                    '{C:attention}立即获胜{}当前{C:attention}盲注{}',
                    '销毁所有消耗品',
                    '永久将出牌次数设为{C:blue}1{}'
                }
            },
        },
        GuestAppearance = {
            c_Wzon_fiendfire = {
                name = '邪火',
                text = {
                    '选择一张牌，销毁其他所有牌',
                    '并生成一个{C:dark_edition}负片{}\"{C:attention}小丑{}\"',
                    '其{C:mult}倍率加成{}等于所有',
                    '被销毁牌{C:attention}点数总和{}的一半'
                }
            },
            c_Wzon_bloodletting = {
                name = '放血',
                text = {
                    '获得{C:attention}+1{}手牌上限',
                    '所有所需得分',
                    '增加{C:attention}6%{}'
                }
            },
            c_Wzon_armaments = {
                name = '武装',
                text = {
                    '为{C:attention}1{}张选中的牌添加',
                    '{C:chips}+5{}筹码和随机',
                    '{C:attention}增强{}、{C:attention}蜡封{}和{C:attention}版本{}'
                }
            },
            c_Wzon_distraction = {
                name = '干扰',
                text = {
                    '本回合{C:chips}+1{}出牌次数',
                    '生成一张随机',
                    '{C:attention}消耗品{}'
                }
            },
            c_Wzon_bouncingflask = {
                name = '弹跳药瓶',
                text = {
                    '随机将{C:attention}1{}张牌增强为',
                    '{C:attention}剧毒牌{}，共{C:attention}3{}次',
                    '{C:inactive}(已是剧毒牌则进一步强化)'
                }
            },
            c_Wzon_calculatedgamble = {
                name = '精算赌博',
                text = {
                    '获得{C:mult}+1{}弃牌次数'
                }
            },
            c_Wzon_zap = {
                name = '电击',
                text = {
                    '为{C:attention}1{}张选中的牌',
                    '或小丑附加{C:attention}闪电{}'
                }
            },
            c_Wzon_coolheaded = {
                name = '冷静',
                text = {
                    '为{C:attention}1{}张选中的牌',
                    '或小丑附加{C:attention}霜冻{}',
                    '抽{C:attention}1{}张牌'
                }
            },
            c_Wzon_darkness = {
                name = '黑暗',
                text = {
                    '为{C:attention}1{}个选中的',
                    '小丑附加{C:attention}暗黑{}'
                }
            },
        },
        Enhanced = {
            m_Wzon_poisonous = {
                name = '剧毒牌',
                text = {
                    '计分时按当前',
                    '{C:chips}筹码{}数量',
                    '减少盲注要求'
                }
            },
        },
        Other = {
            masquerade_reminder = {
                name = '炎龙假面舞者',
                text = {
                    '{C:chips}+#1#{}筹码',
                    '{C:mult}+#2#{}倍率',
                    '每张计分牌',
                    '减少{C:attention}0.8%{}完整盲注'
                }
            },
            discostats = {
                name = '小丑属性',
                text = {
                    '{C:chips}+#5#{}筹码',
                    '{C:mult}+#4#{}倍率',
                    '{C:green}骰子点数:',
                    '{C:green}#3# (#1# + #2# 加成)'
                }
            },
            remaster = {
                name = '重制',
                text = {
                    '根据位置变为更强的小丑',
                    '{C:inactive}(左侧: {C:attention}龙虾障{C:inactive} / 右侧: {C:attention}象鼻虫精{C:inactive})'
                }
            },
            Wzon_lightning = {
                name = '闪电',
                text = {
                    '{X:mult,C:white}X2{}倍率'
                }
            },
            Wzon_frost = {
                name = '霜冻',
                text = {
                    '{C:chips}+100{}筹码'
                }
            },
            Wzon_dark = {
                name = '暗黑',
                text = {
                    '两回合后出售附加此贴纸的',
                    '{C:attention}小丑{}以生成一个相同',
                    '{C:attention}稀有度{}的{C:dark_edition}负片{}{C:attention}小丑{}'
                }
            },
            Plastic = {
                name = '类型',
                text = {
                    '{X:mult,C:white}塑料{}'
                }
            },
            planeswalkerleft = {
                name = '左侧',
                text = {
                    '选择{C:attention}盲注{}时',
                    '生成{C:attention}1{}个{C:blue}普通{C:attention}小丑{}',
                    '并获得{C:attention}#1#{}忠诚度',
                    '{C:inactive}(需有空位)'
                }
            },
            planeswalkermid = {
                name = '中间',
                text = {
                    '选择{C:attention}盲注{}时',
                    '获得{C:blue}+1{}出牌次数'
                }
            },
            planeswalkerright = {
                name = '右侧',
                text = {
                    '选择{C:attention}盲注{}时',
                    '失去{C:attention}#1#{}忠诚度并生成{C:attention}#2#{}张',
                    '{C:dark_edition}多彩{}、{C:red}红色蜡封{}、{C:attention}钢铁K{}'
                }
            },
            bluestormcopier = {
                name = '蓝色风暴',
                text = {
                    '若被{C:attention}头脑风暴{}复制',
                    '则表现为{C:attention}蓝图{}，反之亦然',
                    '{C:inactive,s:0.8}(若你没有这两者则效果不同)'
                }
            },
            bluestormlonely = {
                name = '蓝色风暴',
                text = {
                    '经过{C:attention}#1#{}个回合后出售此牌',
                    '以随机生成一个',
                    '{C:attention}蓝图{}或{C:attention}头脑风暴{}',
                    '{C:inactive}(当前{C:attention}#2#{C:inactive}/#1#)',
                    '{C:inactive,s:0.8}(若你拥有这两者之一则效果不同)'
                }
            },
        },
        Sticker = {
            Wzon_lightning = {
                name = '闪电',
                text = {
                    '{X:mult,C:white}X2{}倍率'
                }
            },
            Wzon_frost = {
                name = '霜冻',
                text = {
                    '{C:chips}+100{}筹码'
                }
            },
            Wzon_dark = {
                name = '暗黑',
                text = {
                    '两回合后出售附加此贴纸的',
                    '{C:attention}小丑{}以生成一个相同',
                    '{C:attention}稀有度{}的{C:dark_edition}负片{}{C:attention}小丑{}'
                }
            },
        },
        Energy = {
            c_Wzon_plastic_energy = {
                name = '塑料能量',
                text = {
                    '永久增加最左侧或选中的',
                    '{C:attention}塑料{}类型小丑的大多数',
                    '{C:attention}计分{}和{C:money}${}数值',
                    '{C:inactive}(每个小丑最多增加{C:attention}#1#{C:inactive}次)'
                }
            },
        },
        Spectral = {
            c_Wzon_ritual = {
                name = '仪式',
                text = {
                    '将选中的带有{C:pink}类型{}的小丑',
                    '变为相同{C:attention}家族{}和{C:attention}阶段{}',
                    '但不同{C:pink}类型{}的小丑{C:inactive}(若可能)',
                    '或反之亦然'
                }
            },
        },
    },
    misc = {
        dictionary = {
            k_Wzon_GuestAppearance = '客串消耗品',
        },
        labels = {
            Wzon_lightning = '闪电',
            Wzon_frost = '霜冻',
            Wzon_dark = '暗黑',
        },
    },
}
