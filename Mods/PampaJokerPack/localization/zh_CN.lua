return {
    descriptions = {
        Joker = {
            j_jazztrio = {
                name = '爵士三重奏',
                text = {
                    '如果打出的计分牌中',
                    '包含{C:attention}J{}、{C:attention}Q{}和{C:attention}K{}',
                    '升级{C:attention}2{}个随机{C:attention}牌型{}'
                }
            },
            j_subway = {
                name = '地铁线路图',
                text = {
                    '如果打出的{C:attention}顺子{}是目前最高的',
                    '获得{C:red}+#1#{}倍率',
                    '{C:inactive}(最高点数: #3#){}',
                    '{C:inactive}(当前: +#2#){}'
                }
            },
            j_snecko = {
                name = '蛇眼',
                text = {
                    '每回合抽到的第一批牌',
                    '点数被永久随机更换'
                }
            },
            j_sealbouquet = {
                name = '蜡封花束',
                text = {
                    '如果{C:attention}黑桃{}同花的第一张牌',
                    '有{C:attention}蜡封{}，则随机给',
                    '另一张牌添加随机{C:attention}蜡封{}'
                }
            },
            j_mixtape = {
                name = '混音带',
                text = {
                    '回合结束时，牌组中每张',
                    '增强的{C:clubs}梅花{}牌获得{C:money}$#1#{}',
                    '{C:inactive}(当前{C:money}$#2#{}){}'
                }
            },
            j_bikini = {
                name = '虎纹比基尼',
                text = {
                    '牌组中{C:hearts}红心{}牌',
                    '超过{C:attention}#2#{}张的部分',
                    '每张提供{C:red}+#1#{}倍率',
                    '{C:inactive}(当前{C:red}+#3#{C:inactive}倍率)'
                }
            },
            j_flamingo = {
                name = '火烈鸟',
                text = {
                    '打出的{C:diamonds}方块{}牌',
                    '{C:green}#1#/#2#{}几率',
                    '变成{C:dark_edition}多彩{}'
                }
            },
            j_sliding = {
                name = '滑动小丑',
                text = {
                    '包含{C:attention}同花{}时获得{C:red}+#1#{}倍率',
                    '包含{C:attention}顺子{}时获得{C:chips}+#2#{}筹码',
                    '每个底注结束时重置',
                    '{C:inactive}(当前: {C:red}+#3#{C:inactive}倍率, {C:chips}+#4#{C:inactive}筹码)'
                }
            },
            j_claw = {
                name = '爪子',
                text = {
                    '打出任意{C:attention}3{}时',
                    '永久给牌组中所有3',
                    '增加{C:chips}+#1#{}筹码'
                }
            },
            j_mahjong = {
                name = '麻将小丑',
                text = {
                    '每打出{C:attention}#2#{}手包含',
                    '{C:attention}三条{}的牌型',
                    '获得{X:mult,C:white}X#1#{}倍率',
                    '{C:inactive}(#3#/#2#){}',
                    '{C:inactive}(当前{X:mult,C:white}X#4#{C:inactive}倍率)'
                }
            },
            j_blackstar = {
                name = '黑星',
                text = {
                    '阻止一次死亡',
                    '销毁所有小丑并替换为',
                    '2张随机罕见小丑'
                }
            },
            j_moon = {
                name = '月兔',
                text = {
                    '打出{C:attention}葫芦{}时',
                    '{C:green}#1#/#2#{}几率',
                    '生成一张{C:attention}愚者{}'
                }
            },
            j_bell = {
                name = '钟形曲线',
                text = {
                    '每回合抽到第一手牌时',
                    '将一张随机牌增强为',
                    '{C:attention}幸运牌{}'
                }
            },
            j_konbini = {
                name = '便利店',
                text = {
                    '本局使用过的每种',
                    '不同{C:tarot}塔罗牌{}',
                    '提供{C:mult}+#1#{}倍率',
                    '{C:inactive}(当前{C:mult}+#2#{}){}'
                }
            },
            j_3776 = {
                name = '3776',
                text = {
                    '每张打出的{C:attention}3{}、',
                    '{C:attention}6{}或{C:attention}7{}计分时',
                    '提供{C:mult}+#1#{}倍率',
                    '重新触发所有{C:attention}7{}'
                }
            },
            j_pampa = {
                name = '潘帕斯',
                text = {
                    '回合结束时获得{C:money}$#1#{}',
                    '{C:green}#2#/#3#{}几率',
                    '在回合结束时',
                    '销毁此小丑'
                }
            },
            j_voodoo = {
                name = '巫毒娃娃',
                text = {
                    '本回合已打出过的',
                    '每种不同点数',
                    '提供{X:mult,C:white}X#1#{}倍率',
                    '{C:inactive}(已打出点数: {C:attention}#2#{C:inactive})'
                }
            },
            j_cherry = {
                name = '樱桃',
                text = {
                    '每弃掉一手{C:attention}对子{}',
                    '获得{C:red}+#1#{}倍率',
                    '弃掉#3#手对子后销毁',
                    '{C:inactive}(当前: {C:red}+#2#{C:inactive}倍率){}'
                }
            },
            j_cafeg = {
                name = '美食咖啡',
                text = {
                    '如果该牌型打出次数',
                    '不超过{C:attention}#2#{}次',
                    '则获得{C:chips}+#1#{}筹码'
                }
            },
            j_pimpbus = {
                name = '豪华巴士',
                text = {
                    '连续打出包含至少一张',
                    '增强牌、版本牌或蜡封牌的',
                    '计分牌时，获得{X:mult,C:white}X#1#{}倍率',
                    '{C:inactive}(当前{X:mult,C:white}X#2#{}){}'
                }
            },
            j_selfpaint = {
                name = '自画像',
                text = {
                    '打出的第一张',
                    '未计分人头牌',
                    '变为随机非人头点数'
                }
            },
            j_matry = {
                name = '套娃',
                text = {
                    '本回合打出的每种不同',
                    '计分牌数量',
                    '提供{C:blue}+#1#{}筹码'
                }
            },
            j_trick = {
                name = '不给糖就捣蛋',
                text = {
                    '使用过的每张{C:spectral}幽灵牌{}',
                    '提供{X:mult,C:white}X#1#{}倍率',
                    '{C:inactive}(当前{X:mult,C:white}X#2#{}){}'
                }
            },
            j_fabric = {
                name = '织物设计',
                text = {
                    '选择{C:attention}盲注{}时',
                    '失去所有{C:red}弃牌次数{}',
                    '并给牌组所有牌随机{C:attention}增强{}',
                    '移除此小丑时恢复为普通牌'
                }
            },
            j_open = {
                name = '大满贯',
                text = {
                    '本回合打出的每种',
                    '不同同花花色',
                    '提供{X:mult,C:white}X#1#{}倍率',
                    '{C:inactive}(已打出花色: #3#){}',
                    '{C:inactive}(当前{X:mult,C:white}X#2#{}倍率){}'
                }
            },
            j_thedream = {
                name = '梦想',
                text = {
                    '打出{C:attention}隐藏牌型{}时',
                    '升级该牌型'
                }
            },
            j_ishihara = {
                name = '色盲测试',
                text = {
                    '打出的所有{C:attention}9{}和{C:attention}6{}',
                    '变成{C:attention}百搭牌{}'
                }
            },
            j_scopedog = {
                name = '侦察犬',
                text = {
                    '打出包含{C:attention}A三条{}的牌型时',
                    '禁用{C:attention}Boss盲注{}'
                }
            },
        },
    },
    misc = {
        dictionary = {
            pampa_bye = '再见！',
            k_upgrade_ex_claw = '升级所有3！',
            ph_black_star = '被黑星拯救',
        },
        v_dictionary = {
            sliding_joker = '+#1#倍率！+#2#筹码！',
        },
    },
}
