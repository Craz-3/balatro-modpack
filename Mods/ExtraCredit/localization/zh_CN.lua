return {
    descriptions = {
        Joker = {
            j_ec_forklift = {
                name = '叉车',
                text = {
                    '{C:attention}+#1#{} 消耗品栏位',
                }
            },
            j_ec_doublerainbow = {
                name = '双重彩虹',
                text = {
                    '{C:attention}重触发{}所有{C:attention}幸运牌{}',
                }
            },
            j_ec_starfruit = {
                name = '杨桃',
                text = {
                    '每回合{C:attention}首次打出{}的牌型',
                    '有{C:green}#2#/#3#{}几率',
                    '获得{C:attention}1{}级',
                    '{C:inactive}(剩余{C:attention}#1#{C:inactive}回合)',
                }
            },
            j_ec_eclipse = {
                name = '日蚀',
                text = {
                    '每{C:attention}1级{}手牌等级',
                    '提供{C:chips}+#2#{}筹码',
                    '{C:inactive}(当前{C:chips}+#1#{C:inactive}筹码)',
                }
            },
            j_ec_rubberducky = {
                name = '橡皮鸭',
                text = {
                    '打出的牌计分时{C:red}失去{}{C:chips}#2#筹码{}',
                    '此小丑获得失去的筹码',
                    '{C:inactive}(当前{C:chips}+#1# {C:inactive}筹码)',
                }
            },
            j_ec_pocketaces = {
                name = '袖珍A',
                text = {
                    '回合结束时给予{C:money}$#1#{}',
                    '打出的{C:attention}A{}计分时',
                    '增加{C:money}$#2#{}支付',
                    '{C:inactive}(每{C:attention}下注{}重置)',
                }
            },
            j_ec_warlock = {
                name = '术士',
                text = {
                    '打出的{C:attention}幸运牌{}有',
                    '{C:green}#1#/#2#{}几率被{C:attention}销毁{}并',
                    '生成一张{C:spectral}幽灵牌{}当计分时',
                    '{C:inactive}(需有空位)',
                }
            },
            j_ec_purplejoker = {
                name = '紫小丑',
                text = {
                    '每回合结束后获得等于',
                    '剩余{C:blue}手数{}和{C:red}弃牌数{}之和的',
                    '{C:mult}倍率{}和{C:chips}筹码{}',
                    '{C:inactive}(当前{}{C:purple}+#1# {C:inactive}倍率和筹码)',
                }
            },
            j_ec_compost = {
                name = '堆肥',
                text = {
                    '每{C:attention}弃掉3{}张牌',
                    '此小丑获得{C:mult}+#2# {}倍率',
                    '达到{C:mult}+30 {}倍率后销毁',
                    '{C:inactive}(当前{C:mult}+#1#{C:inactive}倍率，{C:attention}#3#{C:inactive}/3)',
                }
            },
            j_ec_candynecklace = {
                name = '糖果项链',
                text = {
                    '在{C:attention}商店{}结束时',
                    '获得一个随机{C:attention}补充包标签{}',
                    '{C:inactive}(剩余{C:attention}#1#{C:inactive})',
                }
            },
            j_ec_yellowcard = {
                name = '黄牌',
                text = {
                    '跳过任何{C:attention}补充包{}时',
                    '获得{C:money}$#1#{}',
                }
            },
            j_ec_turtle = {
                name = '乌龟',
                text = {
                    '在每个{C:attention}小盲注{}或{C:attention}大盲注{}结束时',
                    '此小丑获得{X:mult,C:white} X#1# {}倍率',
                    '{C:inactive}(当前{X:mult,C:white}X#2#{C:inactive}倍率)',
                }
            },
            j_ec_clowncollege = {
                name = '小丑学院',
                text = {
                    '{C:attention}填满{}消耗品栏位，',
                    '放置{C:tarot}愚者牌{}，',
                    '在击败{C:attention}Boss盲注{}后',
                    '{C:inactive}(需有空位)',
                }
            },
            j_ec_handbook = {
                name = '手册',
                text = {
                    '如果打出的{C:attention}牌型{}',
                    '本回合{C:attention}未{}打过，',
                    '此小丑获得{C:blue}+#1#{}筹码',
                    '{C:inactive}(当前{C:blue}+#2#{C:inactive}筹码)',
                }
            },
            j_ec_tengallon = {
                name = '十加仑帽',
                text = {
                    '每拥有{C:money}$#2#{}',
                    '提供{X:mult,C:white}X#1#{}倍率',
                    '{C:inactive}(当前{X:mult,C:white}X#3#{C:inactive}倍率)',
                }
            },
            j_ec_montehaul = {
                name = '蒙特豪尔',
                text = {
                    '{C:attention}1{}回合后，出售此卡',
                    '获得{C:attention}2{}个随机{C:attention}小丑标签',
                    '{C:inactive}(当前{C:attention}#1#{C:inactive}/1)',
                }
            },
            j_ec_espresso = {
                name = '浓缩咖啡',
                text = {
                    '跳过任何{C:attention}盲注{}时',
                    '获得{C:money}$#1#{}并销毁此卡',
                    '每回合减少{C:money}$#2#{}',
                }
            },
            j_ec_trafficlight = {
                name = '红绿灯',
                text = {
                    '提供{X:mult,C:white}X#1#{}倍率',
                    '每打一手牌',
                    '减少{X:mult,C:white}X#2#{}',
                    '在{X:mult,C:white}X0.5{}后重置',
                }
            },
            j_ec_holdyourbreath = {
                name = '屏住呼吸',
                text = {
                    '每打一手牌获得{C:chips}+#2#{}筹码',
                    '使用{C:red}弃牌{}时重置',
                    '达到{C:chips}+#3#{}筹码后{C:attention}销毁{}',
                    '{C:inactive}(当前{C:chips}+#1#{C:inactive}筹码)',
                }
            },
            j_ec_corgi = {
                name = '托比的柯基',
                text = {
                    '选择{C:attention}盲注{}时',
                    '{C:attention}销毁{}一个随机消耗品，',
                    '然后获得{C:mult}+#2#{}倍率',
                    '{C:inactive}(当前{C:mult}+#1# {C:inactive}倍率)',
                }
            },
            j_ec_werewolf = {
                name = '狼人',
                text = {
                    '打出的牌如果是',
                    '{C:attention}已强化{}的，变为{C:attention}万能牌',
                }
            },
            j_ec_permanentmarker = {
                name = '记号笔',
                text = {
                    '{C:attention}已强化{}的牌',
                    '无法被削弱',
                }
            },
            j_ec_pridefuljoker = {
                name = '傲慢小丑',
                text = {
                    '打出的{C:attention}万能牌{}',
                    '计分时提供{C:mult}+#1#{}倍率',
                }
            },
            j_ec_tuxedo = {
                name = '燕尾服',
                text = {
                    '{C:attention}重触发{}所有',
                    '{V:1}#1#{}花色的牌',
                    '{s:0.8}花色在回合结束时改变',
                }
            },
            j_ec_farmer = {
                name = '农夫',
                text = {
                    '回合结束时，手中',
                    '持有{V:1}#2#{}花色的牌',
                    '给予{C:money}$#1#{}',
                    '{s:0.8}花色在回合结束时改变',
                }
            },
            j_ec_ambrosia = {
                name = '仙馔',
                text = {
                    '跳过{C:attention}盲注{}时',
                    '{C:attention}填满{}消耗品栏位放入{C:spectral}幽灵牌{}，',
                    '出售任何{C:spectral}幽灵牌{}时销毁此卡',
                    '{C:inactive}(需有空位)',
                }
            },
            j_ec_clowncar = {
                name = '小丑车',
                text = {
                    '计分{C:attention}之前{}',
                    '提供{C:mult}+#1#{}倍率并失去{C:money}$#2#{}',
                }
            },
            j_ec_shipoftheseus = {
                name = '特修斯之船',
                text = {
                    '每当一张{C:attention}扑克牌{}被{C:attention}销毁{}时，',
                    '将一张{C:attention}复制{}加入你的{C:attention}牌库{}，',
                    '此小丑获得{X:mult,C:white}X#2#{}倍率',
                    '{C:inactive}(当前{X:mult,C:white}X#1#{C:inactive}倍率)',
                }
            },
            j_ec_accretiondisk = {
                name = '吸积盘',
                text = {
                    '每使用{C:attention}#2#{}张{C:planet}星球牌{}，',
                    '你最常打出的{C:attention}牌型{}',
                    '获得{C:attention}1{}级',
                    '{C:inactive}(当前{C:attention}#1#{C:inactive}/#2#)',
                }
            },
            j_ec_gofish = {
                name = '钓鱼',
                text = {
                    '当打出的{C:attention}牌型{}',
                    '{C:attention}首次{}包含计分的',
                    '{C:attention}#1#{}时，销毁它们',
                    '{s:0.8}点数在回合结束时改变',
                }
            },
            j_ec_plushie = {
                name = '毛绒玩具',
                text = {
                    '每张{C:attention}小丑{}卡',
                    '提供{C:chips}+#1#{}筹码',
                    '{C:inactive}(当前{C:blue}+#2#{C:inactive}筹码)',
                }
            },
            j_ec_pyromancer = {
                name = '火焰法师',
                text = {
                    '如果剩余{C:attention}手数{}',
                    '小于或等于{C:attention}弃牌数{}，',
                    '提供{C:mult}+#1#{}倍率',
                }
            },
            j_ec_bobby = {
                name = '博比',
                text = {
                    '选择{C:attention}盲注{}时，',
                    '失去{C:attention}#1#{}手数',
                    '并每失去1手数获得{C:red}+#1#{}弃牌',
                }
            },
            j_ec_yinyang = {
                name = '阴阳',
                text = {
                    '如果剩余{C:attention}手数{}',
                    '等于剩余{C:attention}弃牌数{}，',
                    '回合结束时创建',
                    '{C:purple}塔罗牌{}和{C:planet}星球牌',
                }
            },
            j_ec_blackjack = {
                name = '二十一点',
                text = {
                    '如果打出的牌型包含',
                    '计分的{C:attention}人头牌{}',
                    '和非计分的{C:attention}A{}，提供{C:mult}+#1#{}倍率',
                }
            },
            j_ec_joty = {
                name = '年度小丑',
                text = {
                    '如果打出的牌型有',
                    '{C:attention}5{}张计分牌，',
                    '{C:attention}重触发{}打出的牌',
                }
            },
            j_ec_averagealice = {
                name = '普通爱丽丝',
                text = {
                    '如果打出的牌型包含',
                    '计分的{C:attention}奇数{}和{C:attention}偶数{}牌，',
                    '提供{C:white,X:mult}X#1#{}倍率',
                }
            },
            j_ec_couponsheet = {
                name = '优惠券页',
                text = {
                    '击败{C:attention}Boss盲注{}后',
                    '创建一个{C:attention}优惠券标签{}',
                    '和一个{C:attention}代金券标签',
                }
            },
            j_ec_hoarder = {
                name = '囤积者',
                text = {
                    '每当获得{C:money}钱{}时，',
                    '此小丑的出售价值增加{C:money}$#1#{}',
                }
            },
            j_ec_chainlightning = {
                name = '连锁闪电',
                text = {
                    '打出的{C:attention}倍率牌{}计分时',
                    '提供{X:mult,C:white}X#1#{}倍率，',
                    '然后增加{X:mult,C:white}X#2#{}',
                    '{C:inactive}(每手重置)',
                }
            },
            j_ec_jokalisa = {
                name = '蒙娜丽莎',
                text = {
                    '每有一个计分手牌中的',
                    '{C:attention}独特强化{}，',
                    '获得{X:mult,C:white}X#2#{}倍率',
                    '{C:inactive}(当前{X:mult,C:white}X#1#{C:inactive})',
                }
            },
            j_ec_badapple = {
                name = '坏苹果',
                text = {
                    '提供{C:chips}+#1#{}筹码',
                    '回合结束时{C:green}#2#分之#3#{}几率',
                    '此卡或{C:attention}相邻{}的小丑被销毁',
                }
            },
            j_ec_passport = {
                name = '护照',
                text = {
                    '每{C:attention}下注{}一次，如果回合',
                    '最后{C:attention}一张弃牌{}只有{C:attention}1{}张牌，',
                    '它获得一个随机{C:attention}印章{}',
                    '{C:inactive}(当前{C:attention}#1#{C:inactive}剩余)',
                }
            },
            j_ec_lucky7 = {
                name = '幸运7',
                text = {
                    '如果打出的牌型包含',
                    '计分的{C:attention}7{}，所有打出的牌',
                    '都视为{C:attention}幸运牌',
                }
            },
            j_ec_alloy = {
                name = '合金',
                text = {
                    '游戏开始时',
                }
            },
        },
    },
}
