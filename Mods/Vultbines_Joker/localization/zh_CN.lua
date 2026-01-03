return {
    descriptions = {
        Joker = {
            j_sweet_theatre_combo = {
                name = '甜蜜剧院套餐',
                text = {
                    '{C:mult}+#1#{}倍率',
                    '{C:chips}+#2#{}筹码',
                    '{C:attention}#3#{}回合后销毁',
                    '{C:inactive}(#4# + #5#)'
                }
            },
            j_bribery_clown = {
                name = '贿赂小丑',
                text = {
                    '跳过任何{C:attention}补充包{}时',
                    '获得{C:red}+#2#{}倍率',
                    '并创建一张{C:tarot}塔罗牌{}',
                    '{C:inactive}(需有空位)',
                    '{C:inactive}(当前{C:red}+#1#{C:inactive}倍率)',
                    '{C:inactive}(#3# + #4#)'
                }
            },
            j_moorstone = {
                name = '沼泽石',
                text = {
                    '牌组中每张{C:attention}石牌{}',
                    '提供{C:chips}+#1#{}筹码',
                    '每打出{C:attention}#3#{}张{C:attention}石牌{}',
                    '向牌组添加一张{C:attention}石牌{}',
                    '{C:inactive}(当前{C:chips}+#2#{C:inactive}筹码)',
                    '{C:inactive}(#4# + #5#)'
                }
            },
            j_oscar_best_actor = {
                name = '奥斯卡影帝',
                text = {
                    '重新触发所有',
                    '{C:attention}留在手中{}的牌的效果',
                    '和所有打出的{C:attention}人头牌{}',
                    '{C:attention}#1#{}次',
                    '{C:inactive}(#2# + #3#)'
                }
            },
            j_optimist = {
                name = '乐观主义者',
                text = {
                    '手牌上限{C:red}+#1#{}',
                    '每回合出牌次数{C:red}#2#{}',
                    '弃牌次数{C:red}+#3#{}',
                    '{C:inactive}(#4# + #5#)'
                }
            },
            j_fight_a_bull = {
                name = '斗牛',
                text = {
                    '每拥有{C:money}$#1#{}',
                    '获得{C:mult}+2{}倍率和{C:chips}+8{}筹码',
                    '{C:inactive}(当前{C:mult}+#2#{C:inactive}倍率)',
                    '{C:inactive}(当前{C:chips}+#3#{C:inactive}筹码)',
                    '{C:inactive}(#4# + #5#)'
                }
            },
            j_melancholy_phantom = {
                name = '忧郁幽灵',
                text = {
                    '每向牌组添加一张{C:attention}游戏牌{}',
                    '获得{X:mult,C:white}X0.1{}倍率和{C:chips}+8{}筹码',
                    '{C:inactive}(当前{X:mult,C:white}X#1#{C:inactive}倍率)',
                    '{C:inactive}(当前{C:chips}+#2#{C:inactive}筹码)',
                    '{C:inactive}(#3# + #4#)'
                }
            },
            j_solar_flare_joker = {
                name = '太阳耀斑小丑',
                text = {
                    '{C:green}#1#/#2#{}几率',
                    '升级打出的{C:attention}牌型{}',
                    '和弃掉的{C:attention}牌型{}',
                    '{C:inactive}(#3# + #4#)'
                }
            },
            j_blue_java = {
                name = '蓝爪蕉',
                text = {
                    '{X:mult,C:white}X#1#{}倍率',
                    '每回合结束时',
                    '{C:green}#2#/#3#{}几率',
                    '减少{X:mult,C:white}X1{}倍率',
                    '{C:inactive}(#4# + #5#)'
                }
            },
            j_serial_killer = {
                name = '连环杀手',
                text = {
                    '选择{C:attention}盲注{}时',
                    '销毁右侧的小丑',
                    '并将其售价的{C:attention}25%{}',
                    '永久加到此小丑的{C:red}倍率{}上',
                    '{C:inactive}(当前{X:mult,C:white}X#1#{C:inactive}倍率)',
                    '{C:inactive}(#2# + #3#)'
                }
            },
        },
    },
    misc = {
        v_dictionary = {
            sweet_theatre_combo = '+#1#倍率 +#2#筹码',
            melancholy_phantom = 'X#1#倍率 +#2#筹码',
        },
    },
}
