return {
    descriptions = {
        Joker = {
            j_rh_widget = {
                name = '小器件',
                text = {
                    "重新触发打出的",
                    "第{C:attention}5{} 张计分牌",
                    "{C:attention}#1#{} 次",
                }
            },
            j_rh_onion = {
                name = '毛洋葱',
                text = {
                    "弃牌时，额外抽{C:attention}#1#{}张牌"
                }
            },
            j_rh_sneaky_spirit = {
                name = "鬼鬼祟祟的幽灵",
                text = {
                    "{C:attention}#2#{}回合后，",
                    "出售此牌可使",
                    "随机一张小丑牌获得{C:dark_edition}负片{}",
                    "{C:inactive}(当前 {C:attention}#1#{C:inactive}/#2#)"
                }
            },
            j_rh_samurai_drummer = {
                name = "武士鼓手",
                text = {
                    "本局游戏中每使用一张",
                    "{C:rh_flow}节奏{}牌，{C:blue}+#1#{}筹码",
                    "{C:inactive}(当前 {C:chips}+#2#{C:inactive})",
                }
            },
            j_rh_goat = {
                name = "山羊",
                text = {
                    "回合结束时获得随机收益",
                    "{C:inactive}({C:money}$#1# {C:inactive}/ {C:money}$#2# {C:inactive}/ {C:money}$#3#{C:inactive})",
                }
            },
            j_rh_monkey = {
                name = "猴子",
                text = {
                    "重新触发{C:attention}每张{}打出的牌",
                    "{C:attention}#1#{}次"
                }
            },
            j_rh_lockstep = {
                name = '双面',
                text = {
                    "打出的{C:attention}#1#{}点数的牌",
                    "在计分时，",
                    "给予{C:chips}+#2#{}筹码和{C:mult}+#3#{}倍率",
                    "奇偶性在回合结束时切换",
                }
            },
            j_rh_munchy_monk = {
                name = '贪吃和尚',
                text = {
                    "本局游戏中每使用一张{C:rh_flow}节奏{}牌，",
                    "此牌{C:blue}+#1#{}筹码，每使用一张{C:tarot}塔罗牌{}，",
                    "{C:red}+#2#{}倍率，每使用一张{C:planet}星球牌{}",
                    "{X:mult,C:white} X#3# {}倍率",
                    "{C:inactive}(当前 {C:blue}+#4#{}筹码, {C:red}+#5#{}倍率, {X:mult,C:white} X#6# {C:inactive}倍率)",
                }
            },
            j_rh_cosmic_girl = {
                name = '宇宙少女',
                text = {
                    "如果打出的牌中包含",
                    "{C:hearts}红桃{}或{C:diamonds}方块{}的{C:attention}#2#{}",
                    "此牌获得{C:mult}+#1#{}倍率",
                    "{C:inactive}(当前 {C:red}+#3#{C:inactive}倍率)",
                }
            },
            j_rh_space_gramp = {
                name = '太空爷爷',
                text = {
                    "如果打出的牌中包含",
                    "{C:spades}黑桃{}或{C:clubs}梅花{}的{C:attention}#2#{}",
                    "此牌获得{C:mult}+#1#{}倍率",
                    "{C:inactive}(当前 {C:red}+#3#{C:inactive}倍率)",
                }
            },
            j_rh_songbird_egg = {
                name = '鸣禽蛋',
                text = {
                    "{C:mult}+#1#{}倍率",
                    "使用{C:rh_flow}节奏牌{}#3#次后孵化",
                    "{C:inactive}(当前 {C:attention}#2#{C:inactive}/#3#)"
                }
            },
            j_rh_songbird_bird = {
                name = '鸣禽',
                text = {
                    "{X:mult,C:white}x#1#{}倍率",
                }
            },
            j_rh_lumbearjack = {
                name = '伐木熊',
                text = {
                    "如果回合的{C:attention}第一手牌{}",
                    "只有{C:attention}1{}张牌，",
                    "摧毁它并将{C:attention}其点数一半{}",
                    "的牌#1#张加入牌组",
                    "并抽到{C:attention}手中",
                }
            },
            j_rh_tibby = {
                name = '提比',
                text = {
                    "如果回合的{C:attention}第一手牌{}",
                    "只有{C:attention}1{}张牌，",
                    "根据它已有的属性，",
                    "给予它{C:enhanced}增强{}、",
                    "{C:attention}蜡封{}或{C:dark_edition}版本{}",
                }
            },
            j_rh_sick_beats = {
                name = '病毒',
                text = {
                    "如果打出的牌未能获胜，",
                    "将{C:attention}#1#张随机打出的牌{}",
                    "返回手中"
                }
            },
            j_rh_flockstep = {
                name = '彩羽鸟群',
                text = {
                    "如果打出的牌中包含",
                    "{C:diamonds}方块{}、{C:clubs}梅花{}、",
                    "{C:hearts}红桃{}和{C:spades}黑桃{}各一张",
                    "{C:rh_flow} +#1#张节奏牌{}",
                    "{C:inactive}(需有空位)",
                }
            },
            j_rh_two_players = {
                name = '双人玩家',
                text = {
                    "如果打出的每个点数",
                    "都是{C:attention}成对的{}，",
                    "平衡{C:chips}筹码{}和{C:mult}倍率{}"
                }
            },
            j_rh_glee_club = {
                name = '指挥家',
                text = {
                    "右边的3张{C:attention}小丑牌{}",
                    "各给予{X:mult,C:white} X#1# {}倍率",
                    "{C:inactive}(仅在有3张{C:attention}小丑牌{C:inactive}时生效)"
                }
            }
        },
        Flow = {
            c_rh_you = {
                name = '你',
                text = {
                    "将选中的牌标记为{C:dark_edition}你{}",
                }
            },
            c_rh_try_again = {
                name = '再试一次',
                text = {
                    "弃掉并重新抽取",
                    "你的整手牌"
                }
            },
            c_rh_ok = {
                name = '还行',
                text = {
                    "弃掉并重新抽取",
                    "你的整手牌，",
                    "选中的牌除外"
                }
            },
            c_rh_superb = {
                name = '极好',
                text = {
                    "增强选中的牌，",
                    "打出它们，",
                    "并弃掉其余手牌"
                }
            },
            c_rh_perfect = {
                name = '完美',
                text = {
                    "覆盖选中牌的版本",
                    "并打出它们，",
                    "然后摧毁手中所有牌",
                    "{s:0.6,C:green}#1#/#2# {s:0.6,C:inactive}几率清除版本，",
                    "{s:0.6,C:inactive}否则添加{s:0.6,C:dark_edition}闪箔{s:0.6,C:inactive}、{s:0.6,C:dark_edition}镭射{s:0.6,C:inactive}或{s:0.6,C:dark_edition}多彩"
                }
            },
            c_rh_simple_tap = {
                name = '简单敲击',
                text = {
                    "下一回合，",
                    "增强、版本",
                    "和小丑牌",
                    "对{C:blue}筹码{}的影响",
                    "将改为影响{C:mult}倍率{}"
                }
            },
            c_rh_new_record = {
                name = '新纪录',
                text = {
                    "本回合使用此卡后，",
                    "如果创造了本局游戏的新纪录，",
                    "生成一个{C:red}稀有标签",
                    "{C:inactive}(当前记录：{C:red}#1#{C:inactive})"
                }
            },
            c_rh_pity_skip = {
                name = '怜悯跳过',
                text = {
                    "跳过非Boss盲注而不结算",
                    "{s:0.6,C:dark_edition}猴子手表让你很头疼吗？"
                }
            },
            c_rh_some_good_parts = {
                name = '还有一些好的部分',
                text = {
                    "如果得分筹码",
                    "至少达到所需筹码的{C:attention}#1#%{}",
                    "则阻止死亡",
                    "{C:green}#2#/#3#{}几率"
                }
            },
            c_rh_extra_life = {
                name = '额外生命',
                text = {
                    "{C:blue}+#1#出牌次数#2#{}，{C:red}+#3#弃牌次数#4#{}"
                }
            },
            c_rh_skill_star = {
                name = '技巧之星',
                text = {
                    "每超过所需分数的{C:attention}#1#%{}",
                    "获得{C:money}$#2#{}",
                    "{C:inactive}(最多{C:money}$#3#{C:inactive})"
                }
            },
        },
        Tag = {
            tag_rh_some_good_parts = {
                name = '还有一些好的部分',
                text = {
                    "如果得分筹码",
                    "至少达到所需筹码的{C:attention}#1#%{}",
                    "则阻止死亡",
                    "{C:green}#2#/#3#{}几率"
                }
            },
            tag_rh_you = {
                name = '你',
                text = {
                    "选中的牌已被标记为{C:dark_edition}你{}",
                }
            },
            tag_rh_skill_star = {
                name = '技巧之星',
                text = {
                    "每超过所需分数的{C:attention}#1#%{}",
                    "获得{C:money}$#2#{}",
                    "{C:inactive}(最多{C:money}$#3#{C:inactive})"
                }
            },
            tag_rh_simple_tap = {
                name = '简单敲击',
                text = {
                    "下一回合，",
                    "增强、版本",
                    "和小丑牌",
                    "对{C:blue}筹码{}的影响",
                    "将改为影响{C:mult}倍率{}"
                }
            },
            tag_rh_new_record = {
                name = '新纪录',
                text = {
                    "本回合使用此卡后，",
                    "如果创造了本局游戏的新纪录，",
                    "生成一个{C:red}稀有标签",
                    "{C:inactive}(当前记录：{C:red}#1#{C:inactive})"
                }
            },
            tag_rh_random = {
                name = '随机补给包标签',
                text = {
                    "获得一个免费的",
                    "{C:attention}随机补给包",
                }
            },
            tag_rh_mega_flow = {
                name="节奏标签",
                text={
                    "获得一个免费的",
                    "{C:rh_flow}巨型节奏包",
                },
            },
        },
        Planet = {
            c_rh_hevven_world = {
                name = '节奏天国',
                text = {
                    "随机升级{C:attention}#1#{}个",
                    "牌型{C:attention}#2#{}次"
                }                
            }
        },
        Spectral = {
            c_rh_remix = {
                name = '混音',
                text = {
                    "手中所有牌获得",
                    "随机{C:dark_edition}增强{}、{C:dark_edition}蜡封{}和{C:dark_edition}版本{}，",
                    "然后全部打出"
                }
            },
            c_rh_ascension = {
                name = '飞升',
                text = {
                    "{C:green}#1#/#2#{}几率",
                    "使随机一张{C:attention}小丑牌{}",
                    "获得{C:dark_edition}多彩{}，",
                    "否则将其摧毁"
                }
            },
            c_rh_anguish = {
                name = '痛苦',
                text = {
                    "将最右边的",
                    "{C:attention}小丑牌{}转变为",
                    "最左边的{C:attention}小丑牌{}，",
                    "底注+#1#"
                }
            },
            c_rh_endless = {
                name = '无尽',
                text = {
                    "{C:attention}复制{}一张随机小丑牌，",
                    "并使两者都变为{C:attention}永恒{}",
                    "{C:inactive}(需有空位)",
                    "{C:inactive,s:0.9}(从副本移除{C:dark_edition,s:0.9}负片{C:inactive,s:0.9})",
                }
            },
            c_rh_imperfection = {
                name = '缺陷',
                text = {
                    "使{C:attention}#1#张随机牌{}",
                    "获得{C:dark_edition}负片{}，",
                    "并将其增强为",
                    "{C:attention}石头牌"
                }
            },
            c_rh_finale = {
                name = '终曲',
                text = {
                    "为最左边的{C:attention}小丑牌{}、",
                    "{C:attention}消耗牌{}和{C:attention}游戏牌{}",
                    "添加{C:dark_edition}混音{}贴纸",
                }
            },
        },
        Tarot = {
            c_rh_castle = {
                name = '城堡',
                text = {
                    "生成一张随机{C:rh_flow}节奏{}牌",
                    "{C:inactive}(需有空位)",
                }
            },
            c_rh_trio = {
                name = '三重奏',
                text = {
                    "生成一张随机{C:tarot}塔罗牌{}、",
                    "{C:planet}星球牌{}和{C:rh_flow}节奏{}牌",
                    "{C:inactive}(需有空位)",
                }
            },
            c_rh_performer = {
                name = '表演者',
                text = {
                    "获得一个",
                    "{C:attention}随机补给包标签",
                }
            },
            c_rh_translator = {
                name = '翻译者',
                text={
                    "将{C:attention}#1#{}张选中的牌",
                    "增强为",
                    "{C:attention}呼应牌",
                },
            },
            c_rh_descendant = {
                name = '后裔',
                text={
                    "移除屏幕上所有的",
                    "{C:dark_edition}混音{}贴纸",
                },
            },
        },
        Voucher = {
            v_rh_flow_gauge = {
                name = '节奏计量器',
                text = {
                    "{C:rh_flow}节奏{}牌在商店中",
                    "出现频率提高{C:attention}#1#倍{}",
                },
            },
            v_rh_flow_master = {
                name = '节奏大师',
                text = {
                    "{C:rh_flow}节奏{}牌在商店中",
                    "出现频率提高{C:attention}#1#倍{}",
                },
            },
            v_rh_shopkeeper_deal = {
                name = "店长优惠",
                text = {
                    "{C:rh_flow}节奏{}牌可能出现在",
                    "任何{C:attention}秘术包{}中",
                },
            },
            v_rh_gatekeeper_deal = {
                name = "守门人优惠",
                text = {
                    "{C:rh_flow}节奏包{}",
                    "可能出现在商店中",
                },
            },
        },
        Enhanced = {
            m_rh_call_response = {
                name = '呼应牌',
                text = {
                    '复制左边牌的',
                    '{C:attention}点数{}、',
                    '{C:attention}花色{}和{C:attention}增强{}' 
                }
            }
        },
		Back = {
            b_rh_flow = {
                name ="节奏牌组",
                text={
                    "{C:attention}#1#{}个消耗牌槽位",
                    "击败每个{C:attention}盲注{}后，",
                    "获得一张{C:rh_flow}节奏{}牌",
                    "{s:0.8}获得的{s:0.8,C:rh_flow}节奏{s:0.8}牌取决于",
                    "{s:0.8}你的{s:0.8,C:attention}表现{}",
                },
            }
        },
        Sleeve = {
            sleeve_rh_flow = { 
                name = "节奏卡套",
                text = {
                    "{C:attention}#1#{}个消耗牌槽位",
                    "击败每个{C:attention}盲注{}后，",
                    "获得一张{C:rh_flow}节奏{}牌",
                    "{s:0.8}获得的{s:0.8,C:rh_flow}节奏{s:0.8}牌取决于",
                    "{s:0.8}你的{s:0.8,C:attention}表现{}",
                },
            },
            sleeve_rh_flow_alt = { 
                name = "节奏卡套",
                text = { 
                    "恢复到{C:attention}#1#{}个消耗牌槽位",
                    "生成的{C:rh_flow}节奏{}牌为{C:dark_edition}负片{}",
                }
            }
        },
        Other = {
            rh_you_sticker = {
                name = '你',
                text = {
                    "此牌将始终被{C:attention}选中{}",
                    "并在{C:attention}每{}手牌中{C:attention}打出{}",
                    "{C:inactive,s:0.9}({C:attention,s:0.9}贴纸{C:inactive,s:0.9}在回合结束时移除)"
                },
            },
            rh_remix_sticker_joker = {
                name = '混音',
                text = {
                    "回合结束时，",
                    "转变为另一个{C:attention}#1#",
                    "#2# {C:attention}#3#",
                },
            },
            rh_remix_sticker_card = {
                name = '混音',
                text = {
                    "抽到时，转变为",
                    "另一张{C:attention}游戏牌",
                    "{C:inactive}(随机化{C:attention}点数{C:inactive}、{C:attention}花色{C:inactive}和{C:attention}增强{C:inactive})",
                },
            },
            p_rh_flow_pack_1 = {
                name = "节奏包",
                text = {
                    "从最多{C:rh_flow}#2#张节奏牌{}中",
                    "选择{C:attention}#1#{}张",
                },
            },
            p_rh_flow_pack_2 = {
                name = "节奏包",
                text = {
                    "从最多{C:rh_flow}#2#张节奏牌{}中",
                    "选择{C:attention}#1#{}张",
                },
            },
            p_rh_flow_jumbo = {
                name = "巨型节奏包",
                text = {
                    "从最多{C:rh_flow}#2#张节奏牌{}中",
                    "选择{C:attention}#1#{}张",
                },
            },
            p_rh_flow_mega = {
                name = "超级节奏包",
                text = {
                    "从最多{C:rh_flow}#2#张节奏牌{}中",
                    "选择{C:attention}#1#{}张",
                },
            },
            p_rh_legendary = {
                name = "传奇小丑包",
                text = {
                    "从最多{C:attention}#2#{}张",
                    "{C:legendary,E:1}传奇{}小丑牌中选择{C:attention}#1#{}张",
                },
            },
            active_flow = {
                name="节奏牌（活跃）",
                text={
                    "每回合仅{C:attention}1{}张活跃",
                },
            }
        }
    },
    misc = {
        dictionary = {
            rh_skip_save_barista = "被咖啡师跳过",
            rh_skip_save_rupert = "被鲁伯特跳过",
            rh_skip_cash_out = "回合通过！",
            rh_good_parts_save = "还有一些好的部分！",
            rh_good_parts_cash_out = "回合通过！",
            rh_even = "偶数", 
            rh_odd = "奇数", 
            k_rh_flow_pack = "节奏包",
            k_rh_legendary = "传奇小丑包",
            k_flow = "节奏",
            b_flow_cards = "节奏牌",
            rh_language = "语言",
            rh_language_desc = {
                "音效将以",
                "哪种语言播放",
                "注意：如果该语言没有翻译音效，",
                "将默认使用英语。"
            },
            rh_language_options = {
                "英语",
                "日语",
                "法语（不完整）",
                "西班牙语（不完整）"
            },
            rh_beat_anim = "主菜单节拍动画",
            rh_beat_anim_desc = {
                "启用标题画面上",
                "卡牌的节拍动画",
                "（需要重启游戏）"
            },
            rh_remix_sticker_joker_name = "小丑牌",
            rh_remix_sticker_joker_link = "相同",
            rh_remix_sticker_joker_type = "稀有度",
            rh_remix_sticker_consumeable_name = "消耗牌",
            rh_remix_sticker_consumeable_link = "相同",
            rh_remix_sticker_consumeable_type = "类型",
            rh_lumbearjack_axed = "劈开了！",
            k_rh_endless = "无尽混音",
            k_rh_tibby = "我们走吧！",
            k_rh_virus_miss = "未命中！",

            k_rh_gba_badge="天国",
            k_rh_ds_badge="DS",
            k_rh_wii_badge="狂热",
            k_rh_3ds_badge="超级混音",
        },
        v_dictionary = {
            a_mmoonk = {"+#1#筹码，+#2#倍率，X#3#倍率"},
            k_rh_plus_flow = {"+#1#节奏"}
        },
        v_text={
            ch_c_all_rental={
                "所有小丑牌都是{C:eternal}租赁{}的",
            },
            ch_c_no_skip={
                "你无法{C:attention}跳过",
            },
            ch_c_all_boss={
                "所有盲注都是{C:attention}Boss盲注{}",
            },
            ch_c_all_water={
                "所有Boss盲注都是{C:dark_edition}水{}",
            },
        },
		challenge_names = {
			c_rh_second_contact = "第二次接触",
			c_rh_saffron_trial = "萨芙蓉的试炼",
			c_rh_remix_medley = "混音串烧",
			c_rh_remix_10 = "混音10",
			c_rh_perfect_campaign = "追求完美！",
		},
        labels = {
            rh_you_sticker = '你',
            rh_remix_sticker_joker = "混音",
            rh_remix_sticker_card = "混音"
        }
    }
}
