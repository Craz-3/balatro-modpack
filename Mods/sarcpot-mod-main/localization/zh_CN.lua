return {
    misc = {
        dictionary = {
            sarc_travel_pack = "旅行包",

            sarc_combat_roll_ex = "战斗翻滚！",
            sarc_plus_one_discard = "+1 弃牌！",
            sarc_stolen = "偷走了！",
            sarc_yoink = "抢走！",
            sarc_lucky6 = "幸运6！",
            sarc_focus = "聚焦！",
            sarc_scrapped = "报废！",
            sarc_throw = '投掷！',
            sarc_snap = '折断！',
            sarc_collapse = '坍塌！',
            sarc_exhausted = '耗尽...',
            sarc_caught = '抓住了！',
            sarc_chips = '筹码',
            sarc_mult = '倍率',
            sarc_common = '普通',
            sarc_uncommon = '罕见',
            sarc_rare = '稀有',
            sarc_2_random_hands = "2个随机牌型",
            sarc_plus_rerolls = '+3 重掷次数',
            sarc_minus_ante = "-1 底注",
            sarc_active = "激活",
            sarc_inactive = "未激活",
            sarc_disabled = "已禁用！",

            sarc_requires_restart = "重启游戏以应用更改",
            sarc_enable_vouchers = "启用优惠券",
            sarc_enable_jokers = "启用小丑",
            sarc_enable_consumables = "启用消耗品",
            sarc_enable_decks = "启用牌组"

        },
        v_dictionary = {
            sarc_progress = '#1#/#2#'
        }
    },
    descriptions = {
        Back = {
            b_sarc_travelling = {
                name = "旅行牌组",
                text = {"开局带有", "{C:attention,T:v_sarc_compass}#1#{}优惠券",
                        "{C:attention}+#2#{}消耗品槽位"}
            },
            b_sarc_metro = {
                name = "地铁牌组",
                text = {"进入{C:attention}底注4{}时", "创建一个免费的{V:1}车票包{}",
                        "本局游戏中可以", "多次找到{V:1}车票包{}"}
            }
        },

        Blind = {
            bl_sarc_ex_summit = {
                name = "攀登巅峰",
                text = {"大型盲注，+#1#出牌次数"}
            },
            bl_sarc_ex_fortune = {
                name = {"来认识我们的主持人"},
                text = {"概率翻三倍"}
            },
            bl_sarc_ex_radiance = {
                name = "光芒",
                text = {"复制第一张", "计分牌#1#次"}
            },
            bl_sarc_ex_gris = {
                name = "在你手中",
                text = {"永久+#1#手牌上限"}
            },
            bl_sarc_ex_hades = {
                name = "冥王",
                text = {"增强首次出牌", "的每张手牌和留牌"}
            },
            bl_sarc_ex_owl = {
                name = "爪与羽",
                text = {"重掷第一个卖出的小丑", "成为更高稀有度的小丑"}
            }

        },
        ticket = {
            c_sarc_t_celeste = {
                name = '山峰车票',
                text = {"带你前往{C:attention}塞莱斯特山{}"}
            },

            c_sarc_t_dicey = {
                name = '幸运车票',
                text = {"带你前往{C:attention}幸运女神的后台{}"}
            },
            c_sarc_t_gris = {
                name = '荒芜车票',
                text = {"带你穿越{C:attention}否认之境{}"}
            },
            c_sarc_t_hollow = {
                name = '甲壳车票',
                text = {"带你前往{C:attention}圣巢{}"}
            }
        },
        -- Edition={},
        travel = {
            c_sarc_brittle_hollow = {
                name = '破旧明信片',
                text = {"升级{C:attention}#1#{}个随机牌型",
                        "使用{C:attention}#3#{}次后，{C:purple}坍塌{}", "{C:inactive}（当前#2#/#3#）{}"}
            },
            c_sarc_brutal_orchestra = {
                name = '涂改的征召令',
                text = {"为手牌中{C:attention}#1#{}张选中的卡牌",
                        "{C:attention}添加{}{C:red}红色{}、{C:blue}蓝色{}、{C:purple}紫色{}或{C:gold}金色{}蜡封"}
            },
            c_sarc_celeste = {
                name = '来自塞莱斯特山的明信片',
                text = {"将{C:attention}#1#{}张选中的卡牌", "增强为{C:red}草莓牌{}",
                        "{s:0.8,C:inactive}（草莓牌通过一回合{}",
                        "{s:0.8,C:inactive}不打出来充能）{}"}
            },
            c_sarc_chicory = {
                name = '填色卡',
                text = {"将最多{C:attention}#1#{}张", "选中的卡牌转换为",
                        "{C:attention}不同的{}花色", "每转换一张获得{C:money}#2#${}"}
            },
            c_sarc_deaths_door = {
                name = '灰色纪念品',
                text = {"选择最多{C:attention}#1#{}张卡牌", "摧毁最左边的一张",
                        "将其他卡牌转换为", "该牌的{C:attention}花色{}"}
            },
            c_sarc_going_under = {
                name = '无灵魂的营销',
                text = {"创建一个{C:attention}优惠券标签{}"}
            },
            c_sarc_greenpath = {
                name = '"苍绿之径的风景"',
                text = {"创建一个{C:uncommon}罕见标签{}", "获得{C:money}+#1#${}"}
            },
            c_sarc_haven = {
                name = '锈蚀海报',
                text = {"将{C:attention}#1#{}张", "选中的卡牌增强为", "{C:blue}流动牌{}"}
            },
            c_sarc_isaac = {
                name = "孩子的画",
                text = {"{C:green}+#1#{}次免费重掷"}
            },
            c_sarc_kingdom = {
                name = "君主资金",
                text = {"每底注获得{C:money}+#1#${}", "{C:inactive}（最高{C:money}#2#${}{C:inactive}）{}"}
            },
            c_sarc_loop_hero = {
                name = '道路的记忆',
                text = {"摧毁手牌中最多{C:attention}#1#{}张", "随机卡牌", 
                        "抽取等量的卡牌"}
            },
            c_sarc_magic_survival = {
                name = '战痕日志',
                text = {"为手牌中最多{C:attention}#2#{}张", "随机卡牌添加随机增强",
                        "数量随底注增加", "{C:inactive}（最高#1#张）{}"}
            },
            c_sarc_obra_dinn = {
                name = '病态的怀表',
                text = {"选择最多{C:attention}#1#{}张卡牌", "摧毁最左边的一张",
                        "将其他卡牌转换为", "该牌的{C:attention}点数{}"}
            },
            c_sarc_plort = {
                name = '粉色史莱姆核',
                text = {"使用时获得{C:money}+#1#${}"}
            },
            c_sarc_slay_the_spire = {
                name = '"征服尖塔的秘诀！"',
                text = {"创建最多{C:attention}#1#{}张{V:1}旅行{}卡牌", "{C:inactive}（需要有空位）{}"}
            },
            c_sarc_slime_rancher = {
                name = '彩色宣传册',
                text = {"将{C:attention}#1#{}张", "选中的卡牌增强为", "{C:red}史莱姆牌{}"}
            },
            c_sarc_ultrakill = {
                name = '神圣干预',
                text = {"摧毁{C:attention}#1#{}张选中的卡牌，", "如果它有{C:attention}蜡封{}，将其给予",
                        "手牌中{C:attention}#2#{}张随机卡牌"}
            },
            c_sarc_undertale = {
                name = "...还是你",
                text = {"使用{C:attention}#3#{}次后，{C:attention}-1底注{}", "{C:inactive}（当前#1#/#3#）{}",
                        "{C:inactive}（触发后所需次数增加{C:attention}#2#{}", "{C:inactive}）{}"}
            },
            c_sarc_wildfrost = {
                name = '冰霜日记',
                text = {"将{C:attention}#1#{}张", "选中的卡牌增强为", "{C:blue}光冰牌{}"}
            }
        },
        Enhanced = {
            m_sarc_flow = {
                name = '流动牌',
                text = {"{X:chips,C:white}X1.2{}筹码，", "每打出一张{C:blue}流动牌{}额外{X:chips,C:white}+X0.1{}"}
            },
            m_sarc_luminice = {
                name = '光冰牌',
                text = {"始终计分，", "无点数或花色", "为计分牌提供{C:mult}+#1#{}倍率",
                        "和{C:chips}+#2#{}筹码"}
            },
            m_sarc_slime = {
                name = '史莱姆牌',
                text = {"计分时创建", "一个{C:attention}史莱姆核{}"}
            },
            m_sarc_strawberry = {
                name = '草莓牌',
                text = {"在{C:attention}手牌{}中计分时", "重新触发{C:attention}#1#{}次",
                        "使用后需要充能"}
            }
        },
        Joker = {
            j_sarc_garlic_bread = {
                name = '蒜香面包',
                text = {"如果回合首次出牌", "为{C:attention}单张牌{}", "将其转换为A"}
            },
            j_sarc_aksnes = {
                name = '阿克斯内斯',
                text = {"{C:attention}重新触发{}计分牌中",
                        "第一张{C:clubs}梅花{}、{C:hearts}红桃{}和{C:spades}黑桃{}牌"}
            },
            j_sarc_artemis = {
                name = '阿尔忒弥斯',
                text = {"{C:attention}失效{}所有{C:hearts}红桃{}牌，", "每张失效的牌",
                        "提供{X:mult,C:white}X#1#{}倍率", "{C:inactive}（当前{X:mult,C:white}X#2#{}{C:inactive}倍率）"}
            },
            j_sarc_beauty_of_the_sea = {
                name = '海之美人',
                text = {"选择盲注时{C:red}-#1#弃牌{}，", "此小丑每回合获得{C:mult}+#2#{}倍率",
                        "{C:inactive}（当前{C:mult}+#3#{}{C:inactive}倍率）{}"}
            },
            j_sarc_council_of_shadows = {
                name = '暗影议会',
                text = {"{C:attention}-#1#手牌上限{}", "{C:attention}三倍{}的{C:money}利息{}"}
            },
            j_sarc_cracked_egg = {
                name = '破裂的蛋',
                text = {"出售时，将右边的小丑", "转变为{C:attention}#1#{}小丑",
                        "每击败一个{C:attention}Boss盲注{}", "稀有度提升",
                        "{C:inactive}（当前{C:attention}#2#{C:inactive}/2）"}
            },
            j_sarc_crash_message = {
                name = '崩溃信息',
                text = {"牌组中每张{C:attention}无点数{}牌", "提供{C:mult}+#1#{}倍率",
                        "{C:inactive}（当前{C:mult}+#2#{}{C:inactive}倍率）{}"}
            },
            j_sarc_day_cycle = {
                name = '昼夜循环',
                text = {"如果计分牌包含{C:attention}三条{}、",
                        "{C:attention}四条{}或{C:attention}五条{}，", "最后一张牌{C:attention}重新触发{}相应次数"}
            },
            j_sarc_diversity = {
                name = '多样性',
                text = {"牌组中每种花色达到{C:attention}#2#{}张以上", "提供{C:mult}+#1#{}倍率",
                        "{C:inactive}（当前{C:mult}+#3#{}{C:inactive}倍率）{}"}
            },
            j_sarc_double_crescent = {
                name = '双月牙',
                text = {"如果手牌包含{C:attention}对子{}，", "有{C:green}#1#/#2#{}的概率",
                        "生成一张{C:planet}星球{}牌"}
            },
            j_sarc_green_carnation = {
                name = '绿色康乃馨',
                text = {"计分的K", "每张之前计分的K", "提供{C:chips}+#1#{}筹码"}
            },
            j_sarc_halbschwert = {
                name = "半剑",
                text = {"使用{C:attention}10{}张{C:planet}星球{}牌后",
                        "此小丑提供{X:mult,C:white}X#1#{}倍率",
                        "{C:inactive}（当前{C:attention}#2#{C:inactive}/#3#）{}"}
            },
            j_sarc_inventor_dice_travel = {
                name = '发明家骰子',
                text = {"离开商店时摧毁一个消耗品", "创建一张{C:tarot}塔罗{}、{C:planet}星球{}或{V:1}旅行{}牌",
                        "有{C:green}#1#/#2#{}的概率", "获得一张{C:spectral}幽灵{}牌"}
            },
            j_sarc_inventor_dice_no_travel = {
                name = '发明家骰子',
                text = {"离开商店时摧毁一个消耗品", "创建一张{C:tarot}塔罗{}或{C:planet}星球{}牌",
                        "有{C:green}#1#/#2#{}的概率", "获得一张{C:spectral}幽灵{}牌"}
            },
            j_sarc_jester_dice = {
                name = '小丑骰子',
                text = {"打出或弃掉{C:attention}相同点数{}的牌时", "有{C:green}#1#/#2#{}的概率",
                        "获得{C:blue}+1{}出牌次数"}
            },
            j_sarc_labrys = {
                name = '双刃斧',
                text = {"计分的Q", "每张之前计分的Q", "提供{C:mult}+#1#{}倍率"}
            },
            j_sarc_lil_guy = {
                name = "小家伙",
                text = {"选择盲注时{C:blue}-#1#出牌次数{}，", "此小丑每回合获得{C:chips}+#2#{}筹码",
                        "{C:inactive}（当前{C:chips}+#3#{}{C:inactive}筹码）{}"}
            },
            j_sarc_none_of_the_above = {
                name = '以上皆非',
                text = {"{C:attention}万能牌{}有{C:green}#1#/#2#{}的概率",
                        "提供：{C:mult}+#3#{}倍率、{C:chips}+#4#{}筹码、",
                        "{C:money}+#5#${}或{X:mult,C:white}X#6#{}倍率", "{C:inactive}（可触发多个效果）"}
            },
            j_sarc_orchid = {
                name = '兰花',
                text = {"每次打出包含计分{C:attention}J{}的牌型", "此小丑获得{C:mult}+#1#{}倍率",
                        "{C:inactive}（当前{C:mult}+#2#{}{C:inactive}倍率）{}"}
            },
            j_sarc_pancake = {
                name = '煎饼',
                text = {"接下来{C:attention}#2#{}次出牌后，",
                        "将所有打出的牌转换为{C:attention}万能牌{}",
                        "{C:inactive}（当前{C:attention}#1#{C:inactive}/#2#）"}
            },
            j_sarc_phase_shift = {
                name = '相位转换',
                text = {"打出的{V:1}#1#{}和{V:2}#2#",
                        "{C:attention}计分{}时平衡{C:attention}#3#%{}的{C:mult}倍率{}和{C:chips}筹码{}"}
            },
            j_sarc_robot_dice = {
                name = '机器人骰子',
                text = {"当{C:attention}出牌{}点数和为{C:attention}#3#{}时",
                        "此小丑获得{C:mult}#5#{}倍率",
                        "有{C:green}#1#/#2#{}的概率倍率增加{C:attention}6{}倍",
                        "{C:inactive}（当前{C:mult}#4#{}{C:inactive}倍率，{}",
                        "{C:inactive}目标值每次出牌改变）{}"}
            },
            j_sarc_rocky_geode = {
                name = '岩石晶洞',
                text = {"牌组中{C:hearts}红桃{}和{C:attention}石头{}牌",
                        "的数量等于倍率",
                        "{C:inactive}（当前{C:mult}+#2#{}{C:inactive}倍率）{}"}
            },
            j_sarc_strange_fluid = {
                name = "奇异流体",
                text = {"{C:chips}#1#{} #2# {C:mult}#3#{} #4#", "效果根据",
                        "{C:blue}出牌次数{}或{C:red}弃牌次数{}",
                        "哪个更高而改变"}
            },
            j_sarc_stray_pixel = {
                name = "迷失像素",
                text = {"获得时，如果没有版本", "则获得{C:dark_edition}多彩{}版本"}
            },
            j_sarc_sunflower = {
                name = "向日葵",
                text = {"跳过盲注后", "{C:attention}禁用{}{C:attention}Boss盲注{}",
                        "{C:inactive}（#1#）{}"}
            },
            j_sarc_terrarrium = {
                name = '玻璃容器',
                text = {{"{C:attention}+#3#{}消耗品槽位"},
                        {"每种{C:attention}不同{}的消耗品", "提供{X:mult,C:white}X#1#{}倍率",
                         "{C:inactive}（当前{X:mult,C:white}X#2#{}{C:inactive}倍率）{}"}}
            },
            j_sarc_thief_dice = {
                name = '盗贼骰子',
                text = {{"选择盲注时偷取{C:money}$#3#{}",
                         "并加入其{C:money}售价{}"},
                        {"有{C:green}#1#/#2#{}的概率获得{C:attention}#4#倍{}的价值",
                         "然后在回合结束时{C:red}自毁{}"}}
            },
            j_sarc_warrior_dice = {
                name = '战士骰子',
                text = {{"{C:attention}弃牌{}时有{C:green}#1#/#2#{}的概率", "获得一次{C:green}重掷{}"},
                        {"{C:green}重掷{}时有{C:green}#1#/#2#{}的概率",
                         "获得一次{C:attention}临时弃牌{}"}}
            },
            j_sarc_watermelon_candy = {
                name = '西瓜糖',
                text = {"{C:mult}+#1#{}倍率", "{C:attention}#2#{}回合后被消耗"}
            },
            j_sarc_welch = {
                name = '韦尔奇',

                text = {{"计分牌中每张{C:attention}增强牌{}", "为无增强牌提供{C:mult}+#1#{}倍率"},
                        {"计分牌中每张{C:attention}无增强牌{}", "为增强牌提供{C:mult}+#1#{}倍率"}}
            },
            j_sarc_witch_dice = {
                name = '女巫骰子',
                text = {"打出或弃牌时", "有{C:green}#1#/#2#{}的概率",
                        "添加{C:chips}#3#{}筹码", "{C:inactive}（当前{C:chips}#4#{}{C:inactive}筹码）{}"}
            }
        },
        Tag = {
            tag_sarc_cardinal = {
                name = "红雀标签",
                text = {"获得一个免费的", "{V:1}超级旅行包{}"}
            },
            tag_sarc_ex_summit = {
                name = "浆果标签",
                text = {"带你前往", "{C:attention}一座山{}"}
            },
            tag_sarc_ex_fortune = {
                name = "命运标签",
                text = {"带你前往", "{C:attention}幕后{}"}
            },
            tag_sarc_ex_radiance = {
                name = "虚空标签",
                text = {"带你前往", "{C:attention}永恒王国{}"}
            },
            tag_sarc_ex_gris = {
                name = "悲伤标签",
                text = {"带你穿越", "{C:attention}失去后的生活{}"}
            }
        },
        Voucher = {
            v_sarc_advantage = {
                name = '优势',
                text = {"所有显示概率{C:attention}X2{}"}
            },
            v_sarc_nat_20 = {
                name = '天生20！',
                text = {"所有显示概率{C:attention}X1.5{}"}
            },
            v_sarc_compass = {
                name = '指南针',
                text = {"击败{C:attention}Boss盲注{}后", "创建一个{V:1}红雀标签{}"}
            },
            v_sarc_journey = {
                name = '旅程',
                text = {"{V:1}旅行{}卡牌现在", "会出现在商店中"}
            }
        },
        Other = {

            sarc_fortune_tip = {
                name = "来认识我们的主持人",
                text = {"提高概率"}
            },
            sarc_gris_tip = {
                name = "在你手中",
                text = {"永久增加手牌上限"}
            },
            sarc_radiance_tip = {
                name = "光芒",
                text = {"多次复制一张牌"}
            },
            sarc_summit_tip = {
                name = "攀登巅峰",
                text = {"大型盲注，额外出牌次数"}
            },

            sarc_strawberry_deactivated = {
                name = "已停用",
                text = {"不打出此牌", "{C:attention}1{}回合", "来充能"}
            },
            sarc_collapse_tip = {
                name = "坍塌中...",
                text = {"摧毁自身以", "获得一张{C:spectral}黑洞{}"}
            },
            sarc_expedition_tip = {
                name = "远征",
                text = {"远征是具有特殊", "{C:attention}Boss盲注{}的底注",
                        "提供许多{C:attention}奖励{}"}
            },
            p_sarc_ticket = {
                name = "车票包",
                text = {"从最多{C:attention}#2#{}张", "{V:1}车票{}中选择{C:attention}#1#{}张使用"}
            },
            p_sarc_travel_small = {
                name = "旅行包",
                text = {"从最多{C:attention}#2#{}张", "{V:1}旅行{}卡牌中选择{C:attention}#1#{}张使用"}
            },
            p_sarc_travel_jumbo = {
                name = "巨型旅行包",
                text = {"从最多{C:attention}#2#{}张", "{V:1}旅行{}卡牌中选择{C:attention}#1#{}张使用"}
            },
            p_sarc_travel_mega = {
                name = "超级旅行包",
                text = {"从最多{C:attention}#2#{}张", "{V:1}旅行{}卡牌中选择{C:attention}#1#{}张使用"}
            }

        }
    }
}
