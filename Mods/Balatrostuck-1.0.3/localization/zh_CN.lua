return {
    descriptions = {
        Other = {
            art_bstuck_1 = {
                name = '画师',
                text = {'{E:1,V:1}#1#{}'}
            },
            art_bstuck_2 = {
                name = '画师',
                text = {
                    '{E:1,V:1}#1#{}',
                    '{E:1,V:2}#2#{}'
                }
            },
            warn_bstuck_wip = {
                name = '开发中内容',
                text = {
                    '将{C:red}不会{}在',
                    '{C:attention}普通游玩{}中出现'
                }
            },
            bstuck_act_joker = {
                name = "章节进度",
                text = {
                    "#1#这张小丑牌",
                    "来完成{C:attention}第 #2# 幕{}"
                }
            },
            c_bstuck_levelup = {
                text = {'{s:1.1,E:2,V:1}(等级 1){} 升级'}
            },
            bstuck_scratchwarning = {
                text = {'有 {C:scratch}#1# / 1000{} 的几率', '{C:scratch}自毁{}'}
            }
        },
        Joker = {
            j_bstuck_descend = {
                name = '堕落', --would like to replace entire description with just "X1 Mult" for however much mult it has after the removal thangs
                text = {
                    '在 {C:attention}#1#{} 轮后，将所有',
                    '{C:attention}牌组等级{}设为 1，且此小丑牌',
                    '每{C:attention}移除一级{}',
                    '便获得 {C:white,X:mult}X#2#{} 倍率',
                    '{C:inactive}(当前为 #3#/#1#)'
                },
                unlock = {'完成第 3 幕',
                '后解锁'}
            },
            j_bstuck_descend_alt = {
                name = '堕落',
                text = {
                    '{C:white,X:mult}X#1#{} 倍率'
                }
            },
            j_bstuck_darkscholar = {
                name = '黑暗学者', 
                text = {
                    "每使用一张 {C:tarot}塔罗牌{}，",
                    "手牌上限 {C:attention}+1{}。",
                    "在到达 {C:attention}+#2#{} 时变为",
                    "{C:dark_edition}阴郁{}状态",
                    "{C:inactive}(当前手牌上限 {C:attention}+#1#{C:inactive})"
                },
                unlock = {'完成第 4 幕',
                '后解锁'}
            },
            j_bstuck_darkscholar_alt = {
                name = '黑暗学者',
                text = {
                    "若本轮已使用过 {C:tarot}塔罗牌{}，",
                    "则获得 {X:mult,C:white} X#3# {} 倍率，",
                    "否则获得 {X:mult,C:white} X#4# {} 倍率"
                    },
                unlock = {'完成第 4 幕',
                '后解锁'}
            },
            j_bstuck_backseater_1 ={
                name = '指手画脚者',
                text = {
                    '{C:dark_edition}任务 #1#：',
                    '打出一副 {C:attention}同花顺{}'
                }
            },
            j_bstuck_backseater_2 ={
                name = '指手画脚者',
                text = {
                    '{C:dark_edition}任务 #1#：',
                    '每轮有 {C:green}#2# / #3#{} 的几率',
                    '完成此任务'
                }
            },
            j_bstuck_backseater_3 ={
                name = '指手画脚者',
                text = {
                    '{C:dark_edition}任务 #1#：',
                    '在拥有 #2# 个 {C:attention}空余{}',
                    '小丑牌槽位时赢得一轮'
                }
            },
            j_bstuck_backseater_4 ={
                name = '指手画脚者',
                text = {
                    '{C:dark_edition}任务 #1#：',
                    '在同一底注中跳过两个盲注，',
                    '然后击败大盲注'
                }
            },
            j_bstuck_backseater_5 ={
                name = '指手画脚者',
                text = {
                    '{C:dark_edition}任务 #1#：',
                    '在单轮中摧毁 #2# 张牌',
                    '{C:inactive}(当前：{C:attention}#3#{C:inactive}/#2#)'
                }
            },
            j_bstuck_backseater_6 ={
                name = '指手画脚者',
                text = {
                    '{C:dark_edition}任务 #1#：',
                    '在单个盲注中创造 #2# 张消耗牌',
                    '{C:inactive}(当前：{C:attention}#3#{C:inactive}/#2#)'
                }
            },
            j_bstuck_backseater_7 ={
                name = '指手画脚者',
                text = {
                    '{C:dark_edition}任务 #1#：',
                    '在单手中触发打出的牌 #2# 次，',
                    '然后击败盲注',
                    '{C:inactive}(当前：{C:attention}#3#{C:inactive}/#2#)'
                }
            },
            j_bstuck_backseater_8 ={
                name = '指手画脚者',
                text = {
                    '{C:dark_edition}任务 #1#：',
                    '在单手中获得 #2# 筹码，',
                    '然后击败盲注'
                }
            },
            j_bstuck_backseater_0 ={
                name = '指手画脚者',
                text = {
                    '糟糕，我的任务坏了',
                    '在 {C:paradox}Balatrostuck{} 里',
                    '真是啥都没法有'
                }
            },
            j_bstuck_dolorosa = {
                name = '变装者',
                text = {
                    "如果 {C:attention}首次打出的牌{} 是 {C:attention}高牌{}",
                    "为计分的每张 {C:attention}增强{} 牌",
                    "创建一个对应的 {C:paradox}悖论{} {C:tarot}塔罗牌{}"
                }
            },
            j_bstuck_clownincar = {
                name = '车内小丑',
                text = {
                    "{C:attention}标准包{} 中的 {C:attention}游戏牌{}",
                    "只能是持有的 {C:attention}黄道卡{} (如果有)",
                    "所对应的点数"
                },
                unlock = {'完成第 2 幕', '后解锁'}
            },
            j_bstuck_verticlemovements = {
                name = '垂直移动',
                text = {
                    "商店里的 {C:attention}小丑牌{} 都是 {C:paradox}悖论{} 版，",
                    "所有 {C:paradox}悖论{} 卡牌给予 {C:white,X:mult}X1.2{} 倍率"
                },
                unlock = {"使用 {C:attention}绘彩牌组{} 赢得一场比赛解锁"}
            },
            j_bstuck_enterthemedium = {
                name = '进入媒介',
                text = {
                    "此小丑牌在 {C:attention}底注{} 结束时变为",
                    "一个随机的 {C:attention}Balatrostuck{} 小丑牌"
                },
                unlock = {'完成第 2 幕', '后解锁'}
            },
            j_bstuck_conventioncenter = {
                name = '会议中心',
                text = {
                    "商店中额外提供",
                    "{C:attention}+1{} 个补充包"
                },
                unlock = {"使用 {C:attention}绘彩牌组{} 赢得一场比赛解锁"}
            },
            j_bstuck_roundtwo = {
                name = '影之最后通牒',
                text = {
                    "基础盲注大小 {C:red}X#2#{}",
                    "击败 {C:attention}Boss 盲注{} 时",
                    "创建一个 {C:red}稀有小丑牌{}",
                    "{C:inactive}每底注增加 X#1#",
                    "{C:inactive}（必须有空位）"
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_stump = {
                name = '树桩',
                text = {
                    "{C:green}#1# 分之一{} 的几率",
                    "防止死亡，",
                    "此几率 {C:red}不能{} 被改变"
                },
                unlock = {'完成第 3 幕', '后解锁'}
            },
            j_bstuck_parcelmistress = {
                name = '包裹女主人',
                text = {
                    "牌组中每有一张带有封印的牌，",
                    "获得 {C:mult}+#1#{} 倍率",
                    "{C:inactive}(当前为 {C:mult}+#2#{C:inactive} 倍率)"
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_ringofvoid = {
                name = '虚空之戒',
                text = {
                    "在每个 {C:attention}Boss 盲注{} 后",
                    "创建一个 {C:dark_edition}负片标签{}"
                },
                unlock = {'完成第 3 幕', '后解锁'}
            },
            j_bstuck_twinarmageddons = {
                name = '孪生末日',
                text = {
                    "如果 {C:attention}打出的手牌{} 是 {C:attention}#1#{}",
                    "计分的卡牌获得相当于",
                    "其 {C:blue}筹码{} 值的 {C:red}倍率{}"
                }
            },
            j_bstuck_joker = {
                name = '小丑',
                text = {'{C:mult}+4{} 倍率'},
                unlock = {'完成第 6 幕', '后解锁'}
            },
            j_bstuck_synchronization = {
                name = '同步',
                text = {
                    '如果本 {C:attention}底注{} 中有 {C:attention}人头牌{} 被摧毁，',
                    '获得 {C:white,X:mult}X#1#{} 倍率',
                    '{C:inactive}#2#'
                }
            },
            j_bstuck_cruxiteapple = {
                name = '核心苹果',
                text = {
                    "在本轮 {C:attention}最后一次出牌{} 后，",
                    "创建一个免费的 {C:attention}D6 标签{}",
                    "并 {C:attention}摧毁{} 此卡"
                }
            },
            j_bstuck_courtyarddroll = {
                name = '庭院小丑',
                text = {
                    "如果打出的手牌包含 {C:attention}同花{}",
                    "且包含计分的 {C:clubs}梅花{}，所有",
                    "{C:attention}打出的卡牌{} 变为 {C:attention}石头牌{}",
                    "且此小丑牌 {C:red,E:2}自毁{}"
                }
            },
            j_bstuck_mirthful = {
                name = '欢乐小丑',
                text = {
                    "{C:green}#1# 分之 #2#{} 的几率在",
                    "回合结束时创建一个",
                    "{C:zodiac}黄道卡{}"
                }
            },
            j_bstuck_beyondcanon = {
                name = '超越正剧',
                text = {
                    "本底注每打出一种 {X:mult,C:white}独有的手牌{}，",
                    "获得 {X:mult,C:white}X#2#{} 倍率，",
                    "{C:attention}本底注打出过的手牌{} {C:red}不被允许{} 再次打出",
                    "{C:inactive}(当前为 {X:mult,C:white}X#1#{C:inactive} 倍率)"
                },
                unlock = {'完成第 2 幕', '后解锁'}
            },
            j_bstuck_ectobiology = {
                name = '异生生物学',
                text = {
                    "选择 {C:attention}盲注{} 时，创建一张",
                    "右侧 {C:attention}小丑牌{} 的 {C:paradox}悖论{} 副本"
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_applejuice = {
                name = '苹果汁',
                text = {
                    '当 {C:attention}丢弃次数为 0{} 时',
                    '获得 {C:red}+1{} 丢弃次数',
                    '{C:inactive}(剩余 {C:attention}#1#{C:inactive} 次使用)'
                }
            },
            j_bstuck_innapropriatebucket = {
                name = '不当之桶',
                text = {
                    "{V:1}#1#{} 也被视为 {V:2}#2#{},",
                    "花色在回合结束时改变"
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_jokermode = {
                name = '小丑模式',
                text = {
                    "如果打出的手牌包含 {C:attention}同花{}",
                    "获得 {C:chips}+#2#{} {C:zodiac}筹码{}",
                    "{C:inactive}(当前为 {C:chips}+#1#{C:inactive} 筹码)"
                },
                unlock = {'完成第 6 幕', '后解锁'}
            },
            j_bstuck_waywardvagabond = {
                name = '迷途流浪者',
                text = {
                    '所有 {C:attention}King{} 被削弱，',
                    '打出的卡牌在 {C:attention}计分{} 或 {C:attention}持有时{}',
                    '给予 {C:mult}+#1#{} 倍率'
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_hegemonicbrute = {
                name = '霸权暴徒',
                text = {
                    '如果打出的手牌包含 {C:attention}同花{}',
                    '且包含计分的 {C:hearts}红桃{}，',
                    '计分牌中的 {C:attention}第一张{} 和 {C:attention}第二张{}',
                    '变为 {C:attention}倍率卡{}'
                }
            },
            j_bstuck_sovereignslayer = {
                name = '君主屠夫',
                text = {
                    '如果打出的手牌包含 {C:attention}同花{}',
                    '且包含计分的 {C:spades}黑桃{}，',
                    '每张 {C:attention}计分牌{} 有',
                    '{C:green}#2# 分之 #1#{} 的几率被摧毁'
                }
            },
            j_bstuck_draconiandignitary = {
                name = '严苛显贵',
                text = {
                    '如果打出的手牌包含 {C:attention}同花{}',
                    '且包含计分的 {C:diamonds}方片{}，',
                    '获得等同于相邻小丑牌',
                    '总 {C:attention}售价{} 的 {C:money}金钱{}'
                }
            },
            j_bstuck_amberfirefly = {
                name = '琥珀萤火虫',
                text = {
                    "选择 {C:attention}盲注{} 时，将一张随机",
                    "带有 {C:purple}紫色封印{} 的 {C:paradox}悖论{} 卡",
                    "洗入牌组"
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_cruxitedowel = {
                name = '核心销钉',
                text = {
                    "每使用 {C:attention}2{} 个 {C:attention}非悖论消耗品{}，",
                    "就 {C:attention}炼制{} 出一张 {C:paradox}悖论塔罗牌{}，",
                    "在使用 {C:attention}3{} 张 {C:paradox}悖论塔罗牌{} 后被摧毁",
                    "{C:inactive}(当前为 {C:attention}#1#{C:inactive}/2)"
                }
            },
            j_bstuck_gristtorrent = {
                name = '刻蚀激流',
                text = {
                    '每张计分牌永久失去 {C:blue}-#3#{} 筹码。',
                    '每轮前 {C:attention}#4#{} 次发生时，赚取 {C:money}$#2#{}。',
                    '之后每次发生时，',
                    '增加此小丑牌 {C:money}$#2#{} 的售价',
                    '{C:inactive}(当前剩余 {C:attention}#1#{C:inactive} 次)'
                },
                unlock = {'完成第 2 幕', '后解锁'}
            },
            j_bstuck_gamebro = {
                name = '游戏兄弟',
                text = {
                    "{C:green}#1# 分之 #2#{} 几率给予 {C:mult}+#3#{} 倍率，",
                    "计分牌中每有一张 {C:attention}奖励卡{}，",
                    "倍率 {C:mult}+#4#{} 且 {C:green}概率{} 增加 {C:attention}#5#"
                },
                unlock = {'完成第 4 幕', '后解锁'}
            },
            j_bstuck_lofaf = {
                name = '霜冻与青蛙',
                text = {
                    "{C:attention}补充包{} 多出 {C:attention}+#1#{} 个",
                    "备选卡牌，",
                    "{C:attention}底注{} 结束时再 {C:attention}+1{}",
                    "{C:inactive}(最高 +3)"
                },
                unlock = {"创建 {C:attention}100{} 张", "{C:paradox}悖论{}卡", "{C:inactive}(#1#)"}
            },
            j_bstuck_typheus = {
                name = '提丰',
                text = {
                    '所有卡牌在',
                    '生成时总是',
                    '带有 {C:dark_edition}版本{}'
                }
            },
            j_bstuck_collide = {
                name = '碰撞',
                text = {
                    '当回合开始时，',
                    '将四张 {C:attention}钢制{}',
                    '{C:spades}Jack of Spades{}',
                    '加入你的手牌'
                },
                unlock = {'完成第 5 幕', '后解锁'}
            },
            j_bstuck_aceDick = {
                name = '王牌神探',
                text = {'{C:mult}+#1#{} 倍率 和 {C:chips}+#2#{} 筹码，',
                        '总是最后结算'},
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_dead_shuffle = {
                name = '死亡洗牌',
                text = {
                    '本轮每有一张计分的',
                    '{V:1}#1#{}，获得 {X:mult,C:white}X#2#{} 倍率，',
                    '花色每轮改变',
                    '{C:inactive}(当前为 {X:mult,C:white}X#3#{C:inactive} 倍率)'
                }
            },
            j_bstuck_aimlessrenegade = {
                name = '漫无目的的叛徒',
                text = {
                    "选择 {C:attention}盲注{} 时，获得 {C:mult}+#1#{} 倍率，",
                    "{C:attention}摧毁{} 一个随机小丑牌，",
                    "并创建一个 {C:paradox}悖论 {C:attention}审判牌{}",
                    "{C:inactive}(当前为 {C:mult}+#2#{C:inactive} 倍率)"
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_kernelsprite = {
                name = '核心精灵',
                text = {
                    "接下来 {C:attention}#1#{} 次只包含 {C:attention}1 张卡牌{} 的",
                    "丢弃将被 {C:red}摧毁{} 并 {C:attention}存储{}。",
                    "回合开始时，创建两张与",
                    "{C:attention}存储{} 的点数和花色相同的 {C:paradox}悖论{} 卡",
                    "{C:inactive}(#2#) (#3#)"
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_pairing_grid = {
                name = "配对网格",
                text = {
                    '本手牌中每计分一种 {C:attention}独有花色{}，',
                    '获得 {C:mult}+#1#{} 倍率，如果是',
                    '{C:attention}所有四种花色{}，则获得 {C:mult}+#2#{} 倍率'
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_paintseal = {
                name = '喷漆封印',
                text = {
                    "如果本轮 {C:attention}第一手牌{} 只有 {C:attention}1{} 张卡，",
                    "创建一个对应的 {C:zodiac}黄道卡{}",
                    "并 {C:red}摧毁{} 此小丑牌",
                    "{C:inactive}(必须有空位)"
                },
                unlock = {"使用 {C:attention}绘彩牌组{} 赢得一场比赛解锁"}
            },
            j_bstuck_whatpumpkin = {
                name = '什么南瓜？',
                text = {
                    '每张计分牌在计分时有',
                    '{C:green}#1# 分之 #2#{} 的几率',
                    '创建一个自身的 {C:paradox}悖论{} 副本',
                    '{C:inactive}(剩余 {C:attention}#3#{C:inactive} 次副本)'
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_hotdogjuggler = {
                name = '热狗杂耍者',
                text = {
                    "每丢弃 {C:attention}#2#{} 张卡 {C:inactive}[#1#]{}，",
                    "创建一个 {C:zodiac}黄道卡{}",
                    "{C:inactive}(必须有空位)"
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_complacencyofthelearned = {
                name = '学者的自满',
                text = {
                    "如果 {C:attention}幸运卡 成功触发{}，",
                    "{X:red,C:white}X倍率{} 等于 {C:attention}#1#{} 乘以",
                    "幸运卡 {C:attention}成功{} 的次数，",
                    "再除以卡牌 {C:attention}计分{} 的次数"
                },
                unlock = {'完成第 4 幕', '后解锁'}
            },
            j_bstuck_cloudwatching = {
                name = '观云',
                text = {
                    "当回合开始时，为你的",
                    "{C:attention}牌组第 10 张卡{} 创建一张",
                    "对应的 {C:paradox}悖论{} 副本"
                }
            },
            j_bstuck_strifespecibus = {
                name = '惩击器',
                text = {
                    '在卡牌结算前获得 {C:red}+#1#{} 倍率，',
                    '下一次出牌后，',
                    '所有其他 {C:attention}手牌类型{} 将 {C:red}不被允许{}'
                }
            },
            j_bstuck_tanglebuddies = {
                name = '纠缠伙伴',
                text = {
                    "当打出的卡牌计分时，",
                    "获得等同于其 {C:attention}点数{}",
                    "在本手牌中计分次数的 {C:attention}累加{} 值的 {C:mult}+倍率{}"
                },
                unlock = {'在不购买凭证的情况下', '击败底注 12'}
            },
            j_bstuck_echeladder = {
                name = '等级梯',
                text = {
                    '击败 {C:attention}Boss 盲注{} 后',
                    '赚取 {C:money}$#1#{}'
                }
            },
            j_bstuck_pickleinspector = {
                name = '泡菜检查员',
                text = {
                    "每当 {C:attention}一张打出或持有的卡牌触发{} 时，",
                    "此小丑牌获得 {X:red,C:white}X#1#{} 倍率，",
                    "每轮结束时重置",
                    "{C:inactive}(当前为 {X:red,C:white}X#2#{C:inactive} 倍率)"
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_yourlordandmaster = {
                name = '你的主宰与主公',
                text = {
                    "你不需要知道我的手段。",
                    "我腐烂的灵魂会让这款",
                    "所谓的游戏变得滑稽可笑。"
                },
                unlock = {'完成第 6 幕', '后解锁'}
            },
            j_bstuck_vodkamutini = {
                name = '伏特加穆蒂尼',
                text = {
                    "每当创建一张 {C:paradox}悖论{} 卡时，",
                    "创建一张它的 {C:attention}非悖论{} 副本",
                    "{C:inactive}(必须有空位)"
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_trolltrain = {
                name = '巨魔列车',
                text = {
                    '{C:attention}打出的卡牌{} 在计分时',
                    '根据其点数的 {C:zodiac}黄道等级{}',
                    '给予 {C:mult}+#1#{} 倍率'
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_horrorterrors = {
                name = '恐怖惊魂',
                text = {
                    "当打出的卡牌计分时，",
                    "获得等同于其 {C:attention}点数{}",
                    "在本手牌中计分次数的 {C:dark_edition}阶乘{} 值的 {C:mult}+倍率{}"
                },
                unlock = {'在不购买凭证的情况下', '击败底注 12'}
            },
            j_bstuck_abraxas = {
                name = '阿布拉克萨斯',
                text = {
                    '{C:attention}+#1#{} 手牌上限，',
                    '{C:attention}补充包{} 多出',
                    '{C:attention}+#1#{} 个备选卡牌'
                }
            },
            j_bstuck_nepetajoker = {
                name = '游侠媒人',
                text = {
                    "如果打出的手牌包含计分的",
                    "{V:1}#3#{} 和 {V:2}#4#{} 卡牌，此小丑牌获得 {C:mult}+#1#{} 倍率",
                    "{s:0.8}花色每轮改变{}",
                    "{C:inactive}(当前为 {C:mult}+#2#{C:inactive} 倍率)"
                }
            },
            j_bstuck_objectduality = {
                name = '物体二重性',
                text = {
                    "如果回合中第一次打出的 {C:attention}扑克手牌{}",
                    "是 {C:attention}高牌{}，则为每张计分牌",
                    "创建一个 {C:paradox}悖论{} {E:2,C:dark_edition}无害副本{}"
                },
                unlock = {'完成第 6 幕', '后解锁'}
            },
            j_bstuck_fluoriteoctet = {
                name = '萤石八重奏',
                text = {
                    '{C:green}#1# / 64{} 的几率获得 {C:white,X:mult}X64{} 倍率，',
                    '{C:inactive}否则无效果'
                }
            },
            j_bstuck_signofthesignless = {
                name = '无名氏之兆',
                text = {
                    "如果打出的手牌是单张 {C:attention}万能卡{}",
                    "创建一个对应的 {C:zodiac}黄道卡{}，",
                    "{C:green}#2# / #1#{} 的几率 {C:red,E:2}自毁{}",
                    "并将所有 {C:zodiac}黄道等级{} 重置为 {C:attention}0",
                    "{C:inactive}（必须有空位）"
                },
                unlock = {"{C:attention}发现{} 每一张", "{C:zodiac}黄道卡{}"}
            },
            j_bstuck_stress = {
                name = '压力',
                text = {
                    '如果本底注中有 {C:attention}2 张人头牌{}',
                    '被摧毁，则给予 {C:white,X:mult}X#1#{} 倍率'
                }
            },
            j_bstuck_problemsleuth = {
                name = '问题侦探',
                text = {
                    '允许通过支付 {C:money}$10{} 乘以',
                    '当前底注次数的金额来',
                    '{C:attention}买过{} 盲注',
                    '{C:inactive}（在无尽模式中价格更高）'
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_descendascend = {
                name = '堕落升天',
                text = {
                    "商店结束时获得一个 {C:attention}小丑标签{}，",
                    "{C:attention}小丑包{} 中的 {C:attention}小丑牌{} 都是 {C:paradox}悖论{} 版"
                },
                unlock = {"使用 {C:attention}绘彩牌组{} 赢得一场比赛解锁"}
            },
            j_bstuck_snowman = {
                name = '雪人',
                text = {
                    "每张 {C:attention}8{} 被视为",
                    "{C:attention}人头牌{}，手中持有的",
                    "{C:attention}人头牌{} 给予 {C:mult}+2{} 倍率"
                },
                unlock = {'打出一张带有', '{C:attention}幻觉{} 的 8'}
            },
            j_bstuck_lordoftime = {
                name = '时间领主',
                text = {
                    "每轮 {C:blue}+3{} 次出牌次数",
                    "在回合结束时转化为",
                    "{C:attention}空间缪斯{}"
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_therapture = {
                name = '狂喜',
                text = {
                    '每有一张 {C:attention}打出的卡牌{}，此卡获得 {C:white,X:mult}X#1#{} 倍率，',
                    '所有打出的卡牌将被 {E:2,C:red}摧毁{}，',
                    '{E:2,C:red}出售此卡将导致游戏结束',
                    '{C:inactive}(当前为 {C:white,X:mult}X#2#{C:inactive} 倍率)'
                },
                unlock = {'完成第 2 幕', '后解锁'}
            },
            j_bstuck_frogbreeding = {
                name = '青蛙繁殖',
                text = {
                    "每轮为第 {C:attention}一{} 个使用的",
                    "消耗品创建一个 {C:paradox}悖论{} 副本",
                    "{C:inactive}(剩余 {C:attention}#1#{C:inactive} 轮)"
                }
            },
            j_bstuck_jetpack = {
                name = '喷气背包',
                text = {
                    "打出的卡牌给予 {C:mult}+#1#{} 倍率，且在计分时",
                    "有 {C:green}#2# / #3#{} 的几率被",
                    "{C:attention}永久削弱{}"
                },
                unlock = {'{C:red}输掉{} 一场比赛'}
            },
            j_bstuck_cueball = {
                name = '魔法母球',
                text = {
                    '显示接下来的 {C:attention}3{} 张卡牌',
                }
            },
            j_bstuck_frustration = {
                name = '挫败',
                text = {
                    "每打出一张 {C:attention}未计分{} 的卡牌，",
                    "此小丑牌获得 {C:chips}+#1# 筹码{}",
                    "{C:inactive}(当前为 {C:chips}+#2#{C:inactive} 筹码)"
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_note_desolation = {
                name = '荒芜之注',
                text = {
                    "{C:green}#1# / #2#{} 的卡牌会",
                    "{C:attention}背面朝上{} 被抽到",
                    "{C:red}+#3# 倍率{}"
                }
            },
            j_bstuck_consortconcierge = {
                name = '伴侣门房',
                text = {
                    '本轮每打出一手牌，',
                    '{C:attention}+1 手牌上限{}',
                    '{C:inactive}(当前为 {C:attention}+#1#{C:inactive}/#2#)'
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_pawnrevolution = {
                name = '兵卒革命',
                text = {
                    "在本轮 {C:attention}第一手牌{} 中，",
                    "为手中等级 {C:attention}最低{} 的卡牌",
                    "创建一个 {C:paradox}悖论{} 副本"
                },
                unlock = {'在单次比赛中摧毁', '四张 {C:attention}King{}'}
            },
            j_bstuck_culling = {
                name = '汰选',
                text = {
                    "每丢弃一张 {C:attention}#2#{} 或 {C:attention}#3#{} 点数的牌，",
                    "此小丑牌获得 {C:mult}+#1#{} 倍率，",
                    "点数每轮改变，排除人头牌",
                    "{C:inactive}(当前为 {C:mult}+#4#{C:inactive} 倍率)"
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_clover = {
                name = '三叶草',
                text = {
                    "当回合开始时，在手中创建 {C:green}#1#{} 张",
                    "{C:attention}幸运 {C:paradox}悖论 {C:clubs}梅花 4{}"
                }
            },
            j_bstuck_echidna = {
                name = '针鼹',
                text = {
                    "{C:attention}刮擦标签{} 不会影响",
                    "{C:attention}小丑牌{}，每底注第二个 {C:attention}跳过目标{} 总是",
                    "获得一个 {C:attention}刮擦标签{}"
                }
            },
            j_bstuck_museofspace = {
                name = '空间缪斯',
                text = {
                    "{C:attention}+3{} 手牌上限",
                    "在回合结束时转化为",
                    "{C:attention}时间领主{}"
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_sepulcritude = {
                name = '肃穆',
                text = {
                    "如果打出的手牌包含 {C:attention}三条{}",
                    "且包含计分的 {C:attention}人头牌{}，",
                    "获得 {X:mult,C:white}X#1#{} 倍率"
                },
                unlock = {'将一个层面等级', '提升至 5 级或更高'}
            },
            j_bstuck_hephaestus = {
                name = '赫菲斯托斯',
                text = {
                    "手中持有的 {C:attention}钢制卡{} 额外",
                    "再次触发 {C:attention}2{} 次，",
                    "打出的 {C:attention}钢制卡{} 在计分时",
                    "给予 {X:mult,C:white}X2{} 倍率"
                }
            },
            j_bstuck_donotship = {
                name = '斯克伦克尔·宾高德',
                text = {
                    '强制你的第一手牌',
                    '为梅花 Ace 的同花五条'
                }
            },
            j_bstuck_crowbarsfelt = {
                name = '铁棍费尔特',
                text = {
                    "如果打出的手牌包含 {C:attention}顺子{}",
                    "获得 {C:mult}+#2#{} 倍率",
                    "{C:inactive}(当前为 {C:mult}+#1#{C:inactive} 倍率)"
                },
                unlock = {'完成第 6 幕', '后解锁'}
            },
            j_bstuck_oldsecret = {
                name = '古老的秘密',
                text = {
                    "回合结束时，一张随机持有的 {C:attention}消耗品{} 变为",
                    "{C:paradox}悖论{} 版，{C:paradox}悖论{} 消耗品",
                    "无法被摧毁"
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_tumor = {
                name = '肿瘤',
                text = {
                    '如果你拥有 {C:money}$1{} 或更少，',
                    '获得 {C:white,X:mult}X2{} 倍率'
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_commandervantas = {
                name = '范塔斯指挥官',
                text = {
                    '{C:attention}万能卡{} 额外提供',
                    '{C:attention}+2 {C:zodiac}黄道等级{}'
                }
            },
            j_bstuck_biscuits = {
                name = '饼干',
                text = {
                    "{C:paradox}悖论{} 卡无法被",
                    "{C:attention}出售{}、{C:attention}摧毁{}",
                    "或 {C:paradox}消失{}"
                }
            },
            j_bstuck_betacopy = {
                name = '测试副本',
                text = {
                    "{C:red}X2{} 基础盲注大小",
                    "在回合结束时获得一个 {C:attention}Sburb 标签",
                    "{S:1.1,C:red,E:2}随后自毁"
                }
            },
            j_bstuck_smallerbutterflies = {
                name = '小蝴蝶',
                text = {
                    '每个空余的 {C:attention}小丑牌{} 槽位',
                    '有 {C:green}#1# / #2#{} 的几率',
                    '给予 {C:money}$#3#{}'
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_misspaint = {
                name = '喷涂小姐',
                text = {
                    "每有一张卡牌 {C:attention}改变花色{}，",
                    "获得 {C:mult}+#1#{} 倍率",
                    "{C:inactive}(当前为 {C:mult}+#2#{C:inactive} 倍率)"
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_bigkahuna = {
                name = '大酋长',
                text = {
                    "在回合结束时创建一个",
                    "{C:paradox}悖论 {C:attention}恋人{} 卡"
                }
            },
            j_bstuck_sucker = {
                name = '衰仔',
                text = {
                    '{C:green}#1# / #2#{} 的几率获得 {C:white,X:mult}X#2#{} 倍率，',
                    '打出的手牌中每有一张卡，',
                    '此倍率减少 {C:suckers,E:2}1{}'
                },
                unlock = {'完成第 1 幕后', '解锁'}
            },
            j_bstuck_yaldabaoth = {
                name = '亚达巴欧',
                text = {
                    '当前 {C:aspect}层面{} 等级 {C:attention}+#1#{}'
                }
            },
            j_bstuck_whoisthis = {
                name = '这到底是哪位？',
                text = {
                    '选择 {C:attention}盲注{} 时，创建一个',
                    '随机 {C:paradox}悖论 {C:attention}小丑牌{}'
                },
                unlock = {'完成第 2 幕', '后解锁'}
            },
            j_bstuck_vasterror = {
                name = '十二乘十二',
                text = {
                    "商店中每进行 {C:green}#1# 次刷新{}，为牌组中",
                    "两张 {C:attention}随机{} 卡牌添加 {C:paradox}悖论{} 版本",
                    "和 {C:blue}蓝色封印{}",
                    "{C:inactive}(当前为 {C:attention}#2#{C:inactive}/#1# 次刷新)"
                },
                unlock = {"使用 {C:attention}绘彩牌组{} 赢得一场比赛解锁"}
            },
            j_bstuck_magnificent = {
                name = '华丽小丑',
                text = {
                    "此小丑牌描绘了一位英俊的年轻天使。",
                    "每向他展示一张 {C:attention}King{}，他就会获得",
                    "{C:white,X:chips}+0.4X{} {C:chips}筹码倍率{}。",
                    "{C:inactive}(当前为 {X:chips}X#1#{}{C:inactive} 筹码倍率) {C:red}请勿出售"
                },
                unlock = {'完成第 6 幕', '后解锁'}
            },
            j_bstuck_conditionalimmortality = {
                name = '有条件的永生',
                text = {
                    "每售出一张 {C:attention}Jimbo{}，获得 {C:mult}+#1#{} 倍率。",
                    "{C:attention}Jimbo{} 在商店中出现的频率",
                    "提高 {C:attention}10{} 倍。",
                    "{C:inactive}(当前为 {C:mult}+#2#{C:inactive} 倍率)"
                },
                unlock = {'完成第 6 幕', '后解锁'}
            },
            j_bstuck_captchacard = {
                name = '存储卡',
                text = {
                    "每持有一张 {C:attention}消耗品{}，",
                    "获得 {C:red}+#1# 倍率{}",
                    "{C:inactive}(当前为 {C:red}+#2#{} {C:inactive}倍率)"
                }
            },
            j_bstuck_lonegunbird = {
                name = '独行火鸟',
                text = {
                    "商店中每进行 {C:attention}#1# 次刷新{}，",
                    "获得一个随机 {C:attention}标签{}",
                    "{C:inactive}(当前为 {C:attention}#2#{C:inactive}/#1#)"
                },
                unlock = {'完成第 1 幕后', '解锁'}
            },
            j_bstuck_balletslippers = {
                name = '芭蕾舞鞋',
                text = {
                    "此小丑牌获得 {C:mult}+#1#{} 倍率，如果接下来的",
                    "3 手 {C:attention}扑克手牌{} 分别是",
                    "{C:attention}#2#{}, {C:attention}#3#{} 和 {C:attention}#4#{}",
                    "{C:inactive}(下个为 {C:attention}#5#{C:inactive})",
                    "{C:inactive}(当前为 {C:mult}+#6#{C:inactive} 倍率)"
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_mobiusdoublereacharound = {
                name = '莫比乌斯双重环绕',
                text = {
                    "如果打出的手牌包含 {C:attention}顺子{}",
                    "计分牌有 {C:green}#1# / #2#{} 的几率在",
                    "计分时创建一个 {C:zodiac}黄道卡{}"
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_caledfwlch = {
                name = '圣剑',
                text = {
                    '{C:green}#1# / #2#{} 的几率获得 {C:white,X:mult}X#3#{} 倍率，',
                    '否则获得 {C:mult}+#3#{} 倍率'
                }
            },
            j_bstuck_dadswallet = {
                name = '老爸的钱包',
                text = {
                    "每拥有 {C:money}$#1#{}，获得 {C:attention}+#2#{} 消耗品槽位",
                    "{C:inactive}(当前为 {C:attention}#3#{C:inactive}/#4#)"
                },
                unlock = {'完成第 4 幕', '后解锁'}
            },
            j_bstuck_ascend = {
                name = '升序',
                text = {
                    "每打出一种 {C:inactive}(按点数计){} 独有的",
                    "{C:attention}#2#{} 时，此小丑牌获得 {C:mult}+#1#{} 倍率",
                    "{C:inactive}(当前为 {C:mult}+#3#{C:inactive} 倍率)"
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_porkhollow = {
                name = '猪肉中空',
                text = {
                    "所有赚取的 {C:money}利息{} 改为增加到此小丑牌",
                    "的 {C:attention}售价{} 中，每拥有 {C:money}$1{} {C:attention}售价{}",
                    "给予 {C:chips}+#2#{} 筹码",
                    "{C:inactive}(当前为 {C:chips}+#1#{}{C:inactive} 筹码)"
                },
                unlock = {'完成第 3 幕', '后解锁'}
            },
            j_bstuck_skaia = {
                name = '斯凯亚',
                text = {
                    "每轮 {C:attention}第一次丢弃{} 时，为每一张",
                    "丢弃的卡牌创建一个 {C:paradox}悖论{} 副本"
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_whitequeen = {
                name = '白王后',
                text = {
                    '打出的 {C:diamonds}方片 Queen{}',
                    '获得 {C:money}金色封印{}'
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_operation_regisurp = {
                name = '重修旧好行动',
                text = {
                    "打出的 {C:attention}#1# 花色的 Queen{}",
                    "在计分时给予 {C:money}$#2#{} 随后被摧毁"
                }
            },
            j_bstuck_cascade = {
                name = '级联',
                text = {
                    '打出的卡牌根据所打出 {C:attention}扑克手牌{} 的等级，',
                    '额外 {C:attention}再次触发{} 该等级的 {C:attention}#1#{} 倍次数'
                },
                unlock = {'完成第 4 幕', '后解锁'}
            },
            j_bstuck_alltheirons = {
                name = '所有的烙铁',
                text = {
                    "每张打出的 {C:attention}8{} 在计分时",
                    "给予 {C:green}$#1#{}"
                }
            },
            j_bstuck_genejoker = {
                name = '基因小丑',
                text = {
                    "每当创建一张 {C:paradox}悖论{} 卡时，",
                    "此小丑牌获得 {C:blue}+#2#{} 筹码",
                    "{C:inactive}(当前为 {C:blue}+#1# {C:inactive}筹码)"
                },
                unlock = {'完成第 1 幕', '后解锁'}
            },
            j_bstuck_questbed = {
                name = '任务床',
                text = {
                    '防止死亡，随后为当前 {C:aspect}层面{}',
                    '增加 {C:attention}2{} 级，并 {C:red,E:2}摧毁所有小丑牌{}',
                },
                unlock = {"{C:attention}发现{} 每一张", "{C:aspect}层面{} 卡"}
            },
            j_bstuck_ringoflife = {
                name = '生命之戒',
                text = {
                    '每当一张 {C:attention}人头牌{} 被 {C:red}摧毁{} 时，',
                    '将它的一张副本加入牌组',
                    '{C:inactive}(移除副本的 {C:paradox}悖论{C:inactive} 版本)'
                },
                unlock = {'完成第 3 幕', '后解锁'}
            },
            j_bstuck_impetuscombcharging = {
                name = '动力梳充电',
                text = {
                    "每底注第一次打出的 {C:attention}三条{} 给予",
                    "一个 {C:attention}D6 标签{}。在进行 {C:attention}20{} 次刷新",
                    "后 {C:green}释放肃穆{}",
                    "{C:inactive}(当前为 {C:attention}#1#{C:inactive}/20 次刷新)"
                },
                unlock = {'将一个层面等级', '提升至 5 级或更高'}
            },
            j_bstuck_wake = {
                name = '觉醒',
                text = {
                    "每有一个剩余的 {C:attention}出牌数{}，",
                    "给予 {C:white,X:mult}X#1#{} 倍率。弃掉的 {C:attention}J{}",
                    "给予 {C:blue}+1{} 出牌数",
                    "{C:inactive}(当前为 {C:white,X:mult}X#2# {C:inactive} 倍率)"
                }
            },
            j_bstuck_soporpie = {
                name = '安神派',
                text = {
                    "{C:blue}+#1#{} 筹码，{C:attention}-#3#{} 手牌上限。",
                    "每轮增加 {C:blue}100{} 筹码",
                    "并减少 {C:red}1{} 手牌上限"
                },
                unlock = {'因为{C:attention}无法抽牌{}而{C:red}输掉{}一轮游戏'}
            },
            j_bstuck_theplotpoint = {
                name = '剧情点',
                text = {
                    "出售此牌以创建一个 {C:paradox}悖论 {C:dark_edition}黑洞{}，",
                    "{C:red}摧毁{} 除了{C:attention}最左侧{}小丑牌之外的所有小丑牌，",
                    "并使底注 {C:attention}-1{}"
                },
                unlock = {'完成第 6 幕后解锁'}
            },
            j_bstuck_batterwitch = {
                name = '炮打女巫',
                text = {
                    "如果打出的 {C:attention}扑克手牌{} 是你 {C:attention}等级最高{} 的手牌，",
                    "它将损失 {C:attention}所有{} 等级，",
                    "并为损失的每一级赚取 {C:money}$#1#{}"
                },
                unlock = {'完成第 2 幕后解锁'}
            },
            j_bstuck_ahabscrosshairs = {
                name = '亚哈的准星',
                text = {
                    "当前所有 {C:attention}小丑牌{} 的总 {C:attention}售价{} 每有 {C:money}$#2#{}，",
                    "给予 {X:red,C:white}X#1#{} 倍率",
                    "{C:inactive}(当前为 {X:red,C:white}X#3#{C:inactive} 倍率)"
                },
                unlock = {'完成第 2 幕后解锁'}
            },
            j_bstuck_dark_carnival = {
                name = '黑暗狂欢节',
                text = {
                    "摧毁所有计分的、点数对应消耗品槽位中",
                    "{C:attention}黄道卡{} 的牌"
                },
                unlock = {'在单次比赛中，每种 {C:attention}点数{} 的牌', '都至少摧毁一张'}
            },
            j_bstuck_lucky_break = {
                name = '翻转',
                text = {
                    "在该轮 of the {C:attention}最后一手牌{} 中，",
                    "所有 {C:green}基于几率{} 的效果都会成功"
                },
                unlock = {'在单手牌中获得 8^8 或更多分数'}
            },
            j_bstuck_lowas = {
                name = '风与影之地',
                text = {
                    "当选择 {C:attention}盲注{} 时，",
                    "将 {C:attention}#1#{} 张 {C:paradox}悖论 {C:attention}黄金{} 卡洗入牌组"
                },
                unlock = {'完成第 1 幕后解锁'}
            },
            j_bstuck_lolar = {
                name = '光与雨之地',
                text = {
                    "每有一个空余的 {C:attention}小丑牌{} 槽位，",
                    "在打出手牌时，此小丑牌获得 {C:chips}+#2#{} 筹码",
                    "{C:inactive}(当前为 {C:chips}+#1#{} {C:inactive}筹码)"
                },
                unlock = {'完成第 1 幕后解锁'}
            },
            j_bstuck_lohac = {
                name = '热与钟表之地',
                text = {
                    "如果上一轮的得分{C:attention,E:2,S:1.1}被点燃{}了，",
                    "则在选择 {C:attention}盲注{} 时获得 {C:blue}+#1#{} 出牌数"
                },
                unlock = {'完成第 1 幕后解锁'}
            },
            j_bstuck_purrfectwarrior = {
                name = '喵美战士',
                text = {
                    "手牌等级高于 1 级的每 {C:attention}#2#{} 级之和，",
                    "使每轮获得 {C:blue}+#1#{} 出牌数",
                    "{C:inactive}(当前为 {C:blue}+#3#{} 手牌)"
                },
                unlock = {'完成第 1 幕后解锁'}
            },
            j_bstuck_faygo = {
                name = '费戈',
                text = {
                    "打出的卡牌在计分时给予 {C:mult}#3##1#{} 倍率，",
                    "每有一张卡牌计分，该倍率减少 {C:red}#2#{}",
                },
                unlock = {'完成第 3 幕后解锁'}
            },
            j_bstuck_jocker = {
                name = '娇客',
                text = {
                    "{C:inactive}(暂无描述)"
                }
            },
        },
        Zodiac = {
            c_bstuck_aries_current = {
                text = {'{C:inactive}(当前获得 {C:white,X:mult}X#1#{C:inactive})'}
            },
            c_bstuck_gemini_current = {
                text = {'{C:inactive}(当前为 {C:attention}#1#{C:inactive} 次#2#{C:inactive})'}
            },
            c_bstuck_taurus_current = {
                text = {'{C:inactive}(当前为 {C:white,X:mult}X#1#{C:inactive})'}
            },
            c_bstuck_cancer_current = {
                text = {'{C:inactive}(当前为 {C:chips}+#1#{} 永久筹码{C:inactive})'}
            },
            c_bstuck_leo_current = {
                text = {'{C:inactive}(当前为 {C:money}$#2#{C:inactive})'}
            },
            c_bstuck_virgo_current = {
                text = {'{C:inactive}(当前为 {C:mult}+#1#{C:inactive} 倍率)'}
            },
            c_bstuck_libra_current = {
                text = {'{C:inactive}(当前为 {C:white,X:mult}X#1#{C:inactive} 倍率)'}
            },
            c_bstuck_scorpio_current = {
                text = {'{C:inactive}(当前最多为 {C:attention}#1# {C:inactive}次#2#)'}
            },
            c_bstuck_sagittarius_current = {
                text = {'{C:inactive}(当前为 {C:chips}+#1#{C:inactive} 筹码)'}
            },
            c_bstuck_capricorn_current = {
                text = {'{C:inactive}(当前为 {C:white,X:mult}X#1#{C:inactive} 和 {C:white,X:mult}X#2#{C:inactive})'}
            },
            c_bstuck_aquarius_current = {
                text = {'{C:inactive}(当前为 {C:attention}#1#{C:inactive} 标签#2#{C:inactive})'}
            },
            c_bstuck_pisces_current = {
                text = {'{C:inactive}(当前为 {C:money}$#1#{C:inactive})'}
            },
            c_bstuck_ophiuchus_current = {
                text = {'{C:inactive}(当前为 {C:white,X:mult}X#1#{C:inactive} 倍率)'}
            },
            c_bstuck_aries = {
                name = '白羊座',
                text = {'本轮每计分一张 {C:attention}Ace{}，', '使该牌在本场比赛中获得 {X:mult,C:white}X#1#{} 倍率'}
            },
            c_bstuck_taurus = {
                name = '金牛座',
                text = {'每丢弃一张 {C:attention}3{}，', '使当前的 {C:attention}盲注要求分数{} 乘以 {C:white,X:mult}X#1#{}'}
            },
            c_bstuck_gemini = {
                name = '双子座',
                text = {'{C:attention}再次触发{} 每张打出的 {C:attention}2{}，', '额外触发 {C:attention}#1#{} 次'}
            },
            c_bstuck_cancer = {
                name = '巨蟹座',
                text = {'每张打出的 {C:attention}4{} 在计分时', '会给予该牌 {C:chips}+#1# {C:attention}永久筹码{}'}
            },
            c_bstuck_leo = {
                name = '狮子座',
                text = {'每张 {C:attention}持有的 5{} 有 {C:green}#1# / 4{} 的几率', '在任意打出的牌计分时给予 {C:money}$#2#{}'}
            },
            c_bstuck_virgo = {
                name = '处女座',
                text = {'每张 {C:attention}持有的 6{} 给予 {C:mult}+#1#{} 倍率'}
            },
            c_bstuck_libra = {
                name = '天秤座',
                text = {'每张打出的 {C:attention}7{} 在计分时', '给予 {X:mult,C:white}X#1#{} 倍率'}
            },
            c_bstuck_scorpio = {
                name = '天蝎座',
                text = {'每张打出的 {C:attention}8{} 在计分时', '使所有 {C:green,E:2}概率{} 翻倍，单手牌最多翻倍 {C:attention}#1#{} 次。', '在打出下一手牌时重置。'}
            },
            c_bstuck_sagittarius = {
                name = '射手座',
                text = {'如果打出的牌中包含 {C:attention}不计分的 9{}，', '计分牌获得 {C:chips}+#1#{} 筹码'}
            },
            c_bstuck_capricorn = {
                name = '摩羯座',
                text = {'每张计分的 {C:attention}10{} 给予 {X:mult,C:white}X#1#{} 倍率，', '手中持有的每张 {C:attention}10{} 给予 {X:mult,C:white}X#2#{} 倍率'}
            },
            c_bstuck_aquarius = {
                name = '水瓶座',
                text = {'每当一张 {C:attention}Jack{} 被 {C:attention}摧毁{} 时，', '随机创造 {C:attention}#1#{} 个 {C:attention}标签{}'}
            },
            c_bstuck_pisces = {
                name = '双鱼座',
                text = {'计分的 {C:attention}Queen{} 给予 {C:money}$#1#{}，', '并 {C:red,E:2}减去{} 剩余的出牌次数'}
            },
            c_bstuck_ophiuchus = {
                name = '蛇夫座',
                text = {'当打出的 {C:attention}King{} 计分时，', '手中一张随机卡牌变为 {C:paradox}悖论{} 版本', '并给予 {X:mult,C:white}X#1#{} 倍率'}
            },
        },
        Aspect = {
            c_bstuck_blood_current = {
                text = {'{C:inactive}(当前为 {C:attention}#1# {C:inactive}张卡牌)'}
            },
            c_bstuck_breath_current = {
                text = {'{C:inactive}(当前为 {C:attention}#1# {C:inactive}次重抽#2#)'}
            },
            c_bstuck_doom_current = {
                text = {'{C:inactive}(当前为 {C:green}#1# {C:inactive}等级#2# 且 {C:green}1/ #3#{C:inactive})'}
            },
            c_bstuck_heart_current = {
                text = {'{C:inactive}(当前为 {C:attention}#1# {C:inactive}等级#2#)'}
            },
            c_bstuck_hope_current = {
                text = {'{C:inactive}(当前为 {C:attention}+#1# {C:inactive}张卡牌#2#)'}
            },
            c_bstuck_life_current = {
                text = {'{C:inactive}(当前为 {C:attention}#1#{C:inactive} 张悖论卡)'}
            },
            c_bstuck_light_current = {
                text = {'{C:inactive}(当前为 {C:white,X:mult}X#1# {C:inactive} 倍率)'}
            },
            c_bstuck_mind_current = {
                text = {'{C:inactive}(当前为 {C:attention}#1# {C:inactive}个副本#2#)'}
            },
            c_bstuck_piss_current = {
                text = {'{C:inactive}(当前为 {C:paradox}#1# {C:inactive}个小丑)'}
            },
            c_bstuck_rage_current = {
                text = {'{C:inactive}(当前为 {C:white,X:mult}X#1# {C:inactive} 倍率和 {C:white,X:mult}X#2# {C:inactive} 倍率)'}
            },
            c_bstuck_space_current = {
                text = {'{C:inactive}(当前为 {C:attention}+#1#{C:inactive})'}
            },
            c_bstuck_time_current = {
                text = {'{C:inactive}(当前为 {C:blue}+#1#{C:inactive})'}
            },
            c_bstuck_void_current = {
                text = {'{C:inactive}(当前为 {C:dark_edition}+#1#{C:inactive})'}
            },
            c_bstuck_blood = {
                name = '血',
                text = {'每轮前 {C:attention}#1#{} 张丢弃的卡牌获得随机 {C:purple}增强{}'}
            },
            c_bstuck_breath = {
                name = '气息',
                text = {'每间商店获得 {C:attention}#1#{} 次免费 {C:green}刷新{}'}
            },
            c_bstuck_doom = {
                name = '厄运',
                text = {'{C:zodiac}黄道{} 卡获得 {C:green}#1#{} 次额外等级，', '且使用时有 {C:green}1/ #3#{} 的几率将所有', '其他 {C:zodiac}黄道{} 卡重置为 {C:red}0 级{}'}
            },
            c_bstuck_heart = {
                name = '心',
                text = {'当一种扑克手牌 {C:attention}升级{} 时，', '额外获得 {C:attention}#1#{} 级'}
            },
            c_bstuck_hope = {
                name = '希望',
                text = {'{C:attention}补充包{} 中增加 {C:attention}+#1#{} 张卡牌供选择'}
            },
            c_bstuck_life = {
                name = '生命',
                text = {'每轮开始时将 {C:attention}#1#{} 张随机 {C:paradox}悖论{} 卡加入手牌，', '每轮结束时每有一张 {C:paradox}悖论{} 卡给予 {C:money}$1{}'}
            },
            c_bstuck_light = {
                name = '光',
                text = {'{C:attention}消耗品槽位{} 中的卡牌给予 {X:mult,C:white}X#1#{} 倍率'}
            },
            c_bstuck_mind = {
                name = '意',
                text = {'每当创建一个 {C:attention}标签{} 时，', '额外创建 {C:attention}#1#{} 个副本'}
            },
            c_bstuck_piss = {
                name = '尿',
                text = {'当选择 {C:attention}盲注{} 时，', '创建 {C:attention}#1#{} 个 {C:paradox}悖论{C:attention} 小丑'}
            },
            c_bstuck_rage = {
                name = '怒',
                text = {'第一张打出的计分牌，每剩余一次 {C:red}丢弃次数{}', '给予 {C:white,X:mult}X#1#{} 倍率，每剩余一次 {C:blue}出牌次数{}', '给予 {C:white,X:mult}X#2#{} 倍率'}
            },
            c_bstuck_space = {
                name = '空间',
                text = {'{C:attention}+#1#{} 手牌上限'}
            },
            c_bstuck_time = {
                name = '时间',
                text = {'每轮获得 {C:blue}+#1#{} 出牌数'}
            },
            c_bstuck_void = {
                name = '虚空',
                text = {'{C:dark_edition}+#1#{} 小丑牌槽位'}
            },
        },
        zodiacui = {
            Inactive = {
                text = {'{C:inactive}(当前未激活){}'}
            },
            Aries = {
                text = {'本轮每{C:attention}丢弃一张 Ace{}，',
                    '或当前{C:attention}牌组中{}的每张 {C:attention}Ace{}，',
                    '都能使 {C:attention}Ace{} 获得 {X:mult,C:white}X#1#{} 倍率'}
            },
            Gemini = {
                text = {'{C:attention}再次触发{}打出的 {C:attention}2{}，',
                        '次数为 {C:attention}#1#{} 次'}
            },
            Taurus = {
                text = {'丢弃的 {C:attention}3{} 将使当前的' ,
                        '{C:attention}盲注要求筹码{}乘以 {C:white,X:mult}X#1#{}'}
            },
            Virgo = {
                text = {'{C:attention}持有的 6{} 给予 {C:mult}+#1#{} 倍率'}
            },
            Cancer = {
                text = {'打出的 {C:attention}4{} 在计分时会给予',
                        '计分牌 {C:chips}+#1# {C:attention}永久{}筹码'}
            },
            Leo = {
                text = {'{C:attention}持有的 5{} 有 {C:green}#1# / 4{} 的几率',
                        '在任意计分牌计分时给予 {C:money}$#2#{}'}
            },
            Libra = {
                name = '天秤座' ,
                text = {'打出的 {C:attention}7{} 给予 {X:mult,C:white}X#1#{} 倍率'}
            },
            Scorpio = {
                text = {'打出的 {C:attention}8{} 在计分时使所有',
                    '{C:green,E:1,S:1.1}概率{}翻倍，每手牌最多',
                    '{C:attention}#1#{} 次，并在',
                    '打出下一手牌时重置'}
            },
            Sagittarius = {
                text = {
                    '若打出的牌组中包含',
                    '{C:attention}不计分的 9{}，',
                    '则打出的牌给予 {C:chips}+#1#{} 筹码'
                }
            },
            Capricorn = {
                text = {
                    "打出的 {C:attention}10{} 在计分时给予 {X:mult,C:white}X#1#{} 倍率，",
                    "持有的 {C:attention}10{} 给予 {X:mult,C:white}X#2#{} 倍率"
                }
            },
            Aquarius = {
                text = {
                    '{C:attention}Jack{} 被{C:attention}摧毁{}时，',
                    '随机创造 {C:attention}#1#{} 个 {C:attention}标签{}'
                }
            },
            Pisces = {
                text = {
                    '打出的{C:attention} Queen{} 在计分时给予 {C:money}$#1#{}，',
                    '但要{C:red,E:2}减去{}当前{C:attention}剩余的出牌次数{}'
                }
            },
            Ophiuchus = {
                text = {
                    "当打出的 {C:attention}King{} 计分时，",
                    "手中一张随机卡牌变为 {C:paradox}悖论{}卡，",
                    "并给予 {X:mult,C:white}X#1#{} 倍率",
                }
            }
        },
        Back = {
            b_bstuck_alternian = {
                name = "巨魔牌组",
                text = {
                    "开始时有 {C:attention}#3#{} 个小丑牌槽位",
                    "{C:blue}#2#{} 次出牌，{C:red}#1#{} 次丢弃",
                    "且获得 {C:money}+8${} 开局资金",
                    "{C:red}X#4#{} 基础盲注大小"
                },
                unlock = {
                    "使用 {C:attention}普罗斯派特{} 或 {C:attention}德瑟{} 牌组",
                    "赢得 3 场比赛"
                }
            },
            b_bstuck_dersite = {
                name = "德瑟牌组",
                text = {
                    "{C:zodiac}黄道{}牌在商店中出现的",
                    "频率增加 {C:attention}2倍{}",
                    "{s:0.2} ",
                    "{C:planet}天体包{}和{C:planet}星球牌{}",
                    "不再出现在商店中"
                }
            },
            b_bstuck_frog = {
                name = "青蛙牌组",
                text = {
                    "开始时拥有 3 个 {C:attention}Sburb 标签{}",
                    "击败小王盲注后，",
                    "基础盲注规模增加 {C:red}X0.5{}"
                },
                unlock = {
                    "使用过",
                    "{C:attention}Sburb 标签{}"
                }
            },
            b_bstuck_prospitan = {
                name = "普罗斯派特牌组",
                text = {
                    "每轮开始时将{C:paradox}悖论{}卡抽到手中",
                    "{s:0.12} ",
                    "{C:attention}标准包{}中的卡牌",
                    "总是带有{C:paradox}悖论{}版本",
                    "{s:0.12} ",
                    "{C:attention}标准包{}价格降低 {C:money}$4{}"
                }
            }
        },
        Tag = {
            t_bstuck_spirograph = {
                name = "螺旋仪标签",
                text = {
                    "给予一个免费的",
                    "{C:aspect}层面包{}"
                }
            },
            t_bstuck_sburb = {
                name = "Sburb 标签",
                text = {
                    "给予一个免费的",
                    "{C:aspect}Sburb 包{}"
                }
            },
            t_bstuck_scratch = {
                name = "刮擦标签",
                text = {
                    "重新开始当前底注，",
                    "将你所有的{C:attention}小丑牌{}转换为",
                    "同稀有度的{C:attention}随机小丑牌{}"
                }
            },
            t_bstuck_matriorb = {
                name = "繁殖球标签",
                text = {
                    "给予一个免费的",
                    "{C:zodiac}巨型黄道卡包{}"
                }
            },
            t_bstuck_parcelpyxis = {
                name = "包裹盒子标签",
                text = {
                    "创建 {C:attention}2{} 张带有封印的",
                    "{C:spectral}幻灵{C:paradox}悖论{}卡牌"
                }
            },
            t_bstuck_perfecltygeneric = {
                name = "完全通用标签",
                text = {
                    "填满空的消耗品槽位",
                    "获得其对应的 {C:tarot}愚者{} 牌",
                    "{C:inactive}（必须有空间）"
                }
            }
        },
        Booster = {
            p_bstuck_aspect_booster = {
                name = "层面卡包",
                text = {
                    "从最多 {C:attention}#2#{} 张 {C:aspect}层面{}卡中",
                    "选择 {C:attention}#1#{} 张立即使用"
                }
            },
            p_bstuck_aspect1_booster = {
                name = "层面卡包",
                text = {
                    "从最多 {C:attention}#2#{} 张 {C:aspect}层面{}卡中",
                    "选择 {C:attention}#1#{} 张立即使用"
                }
            },
            p_bstuck_aspect_booster_jumbo = {
                name = "大层面卡包",
                text = {
                    "从最多 {C:attention}#2#{} 张 {C:aspect}层面{}卡中",
                    "选择 {C:attention}#1#{} 张立即使用"
                }
            },
            p_bstuck_zodiac_mega_booster = {
                name = "巨型黄道卡包",
                text = {
                    "从最多 {C:attention}#2#{} 张 {C:zodiac}黄道{}卡中",
                    "选择 {C:attention}#1#{} 张立即使用"
                }
            },
            p_bstuck_zodiac_jumbo_booster = {
                name = "大黄道卡包",
                text = {
                    "从最多 {C:attention}#2#{} 张 {C:zodiac}黄道{}卡中",
                    "选择 {C:attention}#1#{} 张立即使用"
                }
            },
            p_bstuck_zodiac_booster = {
                name = "黄道卡包",
                text = {
                    "从最多 {C:attention}#2#{} 张 {C:zodiac}黄道{}卡中",
                    "选择 {C:attention}#1#{} 张立即使用"
                }
            },
            p_bstuck_zodiac2_booster = {
                name = "黄道卡包",
                text = {
                    "从最多 {C:attention}#2#{} 张 {C:zodiac}黄道{}卡中",
                    "选择 {C:attention}#1#{} 张立即使用"
                }
            },
            p_bstuck_sburb_booster = {
                name = "Sburb 卡包",
                text = {
                    "从最多 {C:attention}#2#{} 张 {C:aspect}层面{}卡中",
                    "选择 {C:attention}#1#{} 张立即使用"
                }
            }
        },
        ConsumableType = {
            zodiac = {
                name = "黄道",
                collection = "黄道卡",
                label = "黄道",
                undiscovered = {
                    name = "未发现",
                    text = {
                        "在无种子的比赛中",
                        "购买或使用此卡",
                        "来了解它的作用"
                    }
                }
            },
            aspect = {
                name = "层面",
                collection = "层面卡",
                label = "层面",
                undiscovered = {
                    name = "未发现",
                    text = {
                        "在无种子的比赛中",
                        "购买或使用此卡",
                        "来了解它的作用"
                    }
                }
            }
        },
        Voucher = {
            v_bstuck_giftofgab = {
                name = "雄辩口才",
                text = {
                    "每张 {C:zodiac}黄道{} 卡牌",
                    "出现的概率相同"
                },
                unlock = {
                    "将一个黄道提升至",
                    "5级或更高"
                }
            },
            v_bstuck_godtier = {
                name = "神层位",
                text = {
                    "当前 {C:current_aspect}层面{} 等级 {C:attention}+1{}"
                },
                unlock = {
                    "将一个层面提升至",
                    "3级或更高"
                }
            },
            v_bstuck_riseup = {
                name = "崛起",
                text = {
                    "{C:zodiac}黄道包{}和{C:aspect}层面包{}",
                    "在商店出现的频率增加"
                }
            },
            v_bstuck_aspect_mastery = {
                name = "层面精通",
                text = {
                    "{C:attention}层面包{}总是包含",
                    "当前{C:aspect}层面{}的卡牌"
                }
            }
        },
        Spectral = {
            c_bstuck_thetreasure = {
                name = "宝藏",
                text = {
                    "获得 {C:aspect}层面{} 等级 1",
                    "{C:aspect}层面{} 开始时等级 +1",
                    "永久 {C:red}-1{} 小丑牌槽位",
                    "{C:inactive}如果你没有层面，" ,
                    "{C:inactive}则不会获得层面"
                }
            },
            c_bstuck_lotuscapsule = {
                name = "莲花胶囊",
                text = {
                    "为手牌中选定的 {C:attention}1{} 张卡",
                    "添加一个 {C:paradox}毡封印{}"
                }
            },
            c_bstuck_scratchconstruct = {
                name = "刮擦构造体",
                text = {
                    "将手牌中所有卡牌转换为",
                    "随机 {C:attention}点数{}、{C:attention}花色{}",
                    "和 {C:attention}增强{}"
                }
            },
            c_bstuck_13ofstars = {
                name = "十三颗星",
                text = {
                    "创建一张 {E:2,C:paradox}饼干{} 小丑牌",
                    "{C:inactive}(必须有空位)"
                }
            },
            c_bstuck_jailkey = {
                name = "监狱钥匙",
                text = {
                    "摧毁 {C:attention}1{} 张选定的卡牌",
                    "并创建它的",
                    "{E:2,C:dark_edition}无害双子{}",
                    "{C:inactive}(必须有空位)"
                }
            }
        },
        Edition = {
            e_bstuck_paradox = {
                name = "悖论",
                label = "悖论",
                text = {
                    "在回合结束时 {C:paradox}消失{}",
                    "不占用 {C:dark_edition}任何空间{}"
                }
            }
        },
        Seal = {
            s_bstuck_felt = {
                name = "毡封印",
                label = "毡封印",
                text = {
                    "抽到手中时，创建一张",
                    "此卡牌的无封印 {C:paradox}悖论{} 副本"
                }
            }
        },
        Blind = {
            bl_bstuck_bettycrocker = {
                name = "贝蒂·克罗克",
                text = {
                    "荒谬的超大盲注",
                    "每进行一次出牌，手牌上限 -1"
                }
            },
            bl_bstuck_demoness = {
                name = "女魔",
                text = {
                    "荒谬的超大盲注",
                    "每进行一次出牌，手牌上限 -1"
                }
            },
            bl_bstuck_disciple = {
                name = "徒弟",
                text = {
                    "荒谬的超大盲注",
                    "每进行一次出牌，手牌上限 -1"
                }
            },
            bl_bstuck_dolorosa = {
                name = "多萝罗莎",
                text = {
                    "荒谬的超大盲注",
                    "每进行一次出牌，手牌上限 -1"
                }
            },
            bl_bstuck_executioner = {
                name = "刽子手",
                text = {
                    "荒谬的超大盲注",
                    "每进行一次出牌，手牌上限 -1"
                }
            },
            bl_bstuck_helmsman = {
                name = "舵手",
                text = {
                    "荒谬的超大盲注",
                    "每进行一次出牌，手牌上限 -1"
                }
            },
            bl_bstuck_legislacerator = {
                name = "法官",
                text = {
                    "荒谬的超大盲注",
                    "每进行一次出牌，手牌上限 -1"
                }
            },
            bl_bstuck_manipulator = {
                name = "操控者",
                text = {
                    "荒谬的超大盲注",
                    "每进行一次出牌，手牌上限 -1"
                }
            },
            bl_bstuck_orphaner = {
                name = "孤儿收容者",
                text = {
                    "荒谬的超大盲注",
                    "每进行一次出牌，手牌上限 -1"
                }
            },
            bl_bstuck_subjuggulator = {
                name = "征服者",
                text = {
                    "荒谬的超大盲注",
                    "每进行一次出牌，手牌上限 -1"
                }
            },
            bl_bstuck_sufferer = {
                name = "受难者",
                text = {
                    "荒谬的超大盲注",
                    "每进行一次出牌，手牌上限 -1"
                }
            },
            bl_bstuck_summoner = {
                name = "召唤师",
                text = {
                    "荒谬的超大盲注",
                    "每进行一次出牌，手牌上限 -1"
                }
            }
        },
        Challenge = {
            littlemonsters = { name = "小怪物" },
            contrivance = { name = "计谋" },
            bootstrapparadox = { name = "靴帮悖论" },
            alchemy = { name = "炼金术" },
            likeaseer = { name = "如同先知" },
            shippingwars = { name = "结对战争" },
            lylacrapsody = { name = "紫丁香狂想曲" },
            blackholesun = { name = "黑洞太阳" },
            flarp = { name = "FLARP" },
            plurality = { name = "复数性" },
            chamlang = { name = "Chamlang" }
        },
    },
    misc = {
        dictionary = {
            k_drank_ex = "喝掉了！",
            k_val_up = "价值提升！",
            k_upgrade_ex = "升级！",
            k_again_ex = "再次触发！",
            k_nope_ex = "不行！",
            k_eaten_ex = "吃掉了！",
            k_safe_ex = "已保护！",
            k_saved_ex = "已救下！",
            k_reset = "重置",
            k_active_ex = "已激活",
            k_plus_joker = "+1 小丑牌",
            k_plus_tarot = "+1 塔罗牌",
            k_plus_spectral = "+1 幻灵牌",
        },
        v_text = {
            ch_c_mult_dollar_cap = {
                '{C:red}倍率{}不能超过当前 {C:money}${} 的 {C:attention}一半{}'
            },
            ch_c_tripleblindsize = {
                '{C:red}3倍{} 基础盲注大小'
            },
            ch_c_perfectly_generic = {
                '仅出现 {C:attention}完全通用{} 标签'
            },
            ch_c_only_shop_zodiac = {
                '商店不会出现 {C:attention}小丑牌{}、{C:planet}星球牌{} 和 {C:tarot}塔罗牌{}'
            },
            ch_c_lylac1 = {
                '所有 {C:attention}小丑牌{} 在底注结束时被 {C:red}摧毁{}'
            },
            ch_c_lylac2 = {
                '所有小丑牌售价 {C:money}2${}，卖出价 {C:money}1${}'
            },
        },
        quips={
            john_bought={
                "{C:blue}约翰：嘿，你好啊！"
            },
            john_balls={
                "{C:blue}约翰：噢天哪，另一个我！",
            },
            john_future={
                "{C:blue}约翰：别管我！",
            },
            john_loop={
                "{C:blue}约翰：抱歉！必须得闭合这个环！",
            },
            john_cost={
                "{C:blue}约翰：别担心，我来帮你！",
            },
            john_pack_1={
                "{C:blue}约翰：不想要那个吗？"
            },
            john_pack_2={
                "{C:blue}约翰：再来一个怎么样！"
            },
            john_pack_3={
                "{C:blue}约翰：我们要不换个卡包试试"
            },
            john_charity = {
                "{C:blue}约翰：噢，你缺钱吗？你可以拿去点我的"
            },
            john_revive = {
                "{C:blue}约翰：呼！我总算救下了你，但是",
                "{C:blue}我不觉得我还能再做一次这种事，哈哈"
            },
            backseater_pickup={
                "{C:vriska}AG：嗨嗨嗨——！真巧在这儿碰见你",
                "{C:vriska}我正躲避一些正剧后的破烂破事儿，",
                "{C:vriska}介意让我在这儿待一会儿（8it）吗？ :::;)",
            },
            backseater_quest_1_start={
                "{C:Scorpio}AG：呃呃呃呃呃呃呃呃，我见过虫宝宝",
                "{C:Scorpio}玩儿得都比你牛（8etter）！快点儿——",
                "{C:Scorpio}至少给我打出一副同花顺（Str8 Flush）！",
            },
            backseater_quest_1_done={
                "{C:Scorpio}AG：好吧，也许你并不是",
                "{C:Scorpio}完全没用！只要你想的话，",
                "{C:Scorpio}还是能打出点儿好牌的。"
            },
            backseater_quest_2_start={
                "{C:Scorpio}AG：真玩家从不废话（cut to the chase）。",
                "{C:Scorpio}他们扫清所有烂梗直奔金牌。",
                "{C:Scorpio}他们作弊。是时候让你学会作弊了。"
            },
            backseater_quest_2_done={
                "{C:Scorpio}AG：真是幸运的转机（lucky 8r8k）！！！！！！！！",
                "{C:Scorpio}你有我当队友真是太走运了，我可以",
                "{C:Scorpio}挑战并帮助你变强。喏，辛苦费拿好。"
            },
            backseater_quest_3_start={
                "{C:Scorpio}AG：我觉得你还能玩得更牛（8etter）！",
                "{C:Scorpio}按我教你的那样干掉盲注，",
                "{C:Scorpio}但留出 2 个空位。祝你好运！"
            },
            backseater_quest_3_done={
                "{C:Scorpio}AG：既然现在我知道你不是什么脑瓜空空的",
                "{C:Scorpio}幼稚鬼（8oy skylark），是时候给你第一个真正的挑战了！"
            },
            backseater_quest_4_start={
                "{C:Scorpio}AG：跳过这些宝宝（8a8y）盲注，直接去干",
                "{C:Scorpio}那个大头（8oss）！我知道你能行！ ::::)"
            },
            backseater_quest_4_done={
                "{C:Scorpio}AG：哈哈哈！我其实没指望你真的能",
                "{C:Scorpio}办到。我已经准备好闪人（8ounce）了。",
                "{C:Scorpio}喏，下个商店算我的。"
            },
            backseater_quest_5_start={
                "{C:Scorpio}AG：我之前没想提，但你的",
                "{C:Scorpio}牌组真的太臃肿（8loated）了。我通常",
                "{C:Scorpio}只留 8 张卡，但那对你来说可能太难了。",
                "{C:Scorpio}但你起码该学会至少减掉 8 张卡吧！"
            },
            backseater_quest_5_done={
                "{C:Scorpio}AG：哈？你还想要奖赏？那就是",
                "{C:Scorpio}给你的奖赏，我让你精简了你惨兮兮的",
                "{C:Scorpio}牌组，让它变得更容易被操控（manipul8）！"
            },
            backseater_quest_6_start={
                "{C:Scorpio}AG：如果你想要奖赏，我还有一个",
                "{C:Scorpio}挑战。在单次盲注里生成 8 个消耗品。",
                "{C:Scorpio}这对你这种扑克天才来说不算难吧 :::;)"
            },
            backseater_quest_6_done={
                "{C:Scorpio}AG：耶！！！！！！你做得真棒（gr8），但可别",
                "{C:Scorpio}得意忘形！在你变得像我一样牛（gr8）之前，",
                "{C:Scorpio}你还得从我这儿学好多东西呢 ::::)"
            },
            backseater_quest_7_start={
                "{C:Scorpio}AG：但在那之前你还有一个挑战。",
                "{C:Scorpio}秀秀你的本事，在单手牌里触发 20 次。 ",
                "{E:2}听起来不可能？{} {C:Scorpio}对你来说可能确实很",
                "{C:Scorpio}玄（may well 8e）。我不会告诉你怎么做，",
                "{C:Scorpio}自己想办法！你需要学会独立！"
            },
            backseater_quest_7_done={
                "{C:Scorpio}好啦——现在你完成了维里斯卡的特别集训，",
                "{C:Scorpio}我有个请求。我由于跨叙事（Multifiction）旅行，",
                "{C:Scorpio}马上就得走了，但我还差临门一脚。",
            },
            backseater_quest_8_start={
                "{C:Scorpio}AG：单手获得 16777216 筹码。如果听起来",
                "{C:Scorpio}很多，那是因为确实很多。搞定它，",
                "{C:Scorpio}我走的时候会给你一点额外奖励。但",
                "{C:Scorpio}如果你不是那块料，我也能理解。"
            },
            backseater_quest_8_done={
                "{C:Scorpio}AG：总之，我的时间要用光了，得闪人（8ounce）了。",
                "{C:Scorpio}为了报答你的辛苦，我把我最心爱的小丑留给你。",
                "{C:Scorpio}如果我就算离谱也依然牛（gr8）的运气还在显灵的话，",
                "{C:Scorpio}我们很快就会再见的！待会儿见（L8r）！ <33333333"
            },
            backseater_invalid_tier={
                "{C:Scorpio}有些东西干扰了我的变量，",
                "{C:Scorpio}我正处在一个无效的任务编号上。",
                "{C:Scorpio}所以——，咱要亲热一下吗？"
            },
            caliborn_bought1={
                "{C:green}我想玩个游戏"
            },
            caliborn_bought2={
                "{C:green}别再动那个牌组了。",
                "{C:green}也别打出弱智的手牌。",
                "{C:green}扑克就是扑克。",
                "{C:green}真正的扑克。"
            },
            caliborn_bought3={
                "{C:green}证明你是个真正的男人。",
                "{C:green}我会奖赏你的。重重有赏。",
                "{C:green}用我的挂坠（JUJUS），也就是小丑牌。"
            },
            caliborn_straight1={
                "{C:red}今天不准打顺子。",
                "{C:green}它们太简单了。"
            },
            caliborn_straight2={
                "{C:red}不准打顺子。",
                "{C:green}打更难的。"
            },
            caliborn_fullhouse1={
                "{C:red}别再打葫芦了。",
                "{C:green}我看腻了。"
            },
            caliborn_fullhouse2={
                "{C:red}忘掉葫芦吧。",
                "{C:green}房子（HOUSES）都很蠢！"
            },
            caliborn_flush1={
                "{C:red}同花很差劲。",
                "{C:green}它们很无聊。"
            },
            caliborn_flush2={
                "{C:red}我讨厌同花。",
                "{C:green}卡莉奥珀（CALLIOPE）倒是挺喜欢的。"
            },
            caliborn_gift={
                "{C:green}瞧好了。",
                "{C:green}我的馈赠！！",
                "{C:green}这是我珍藏的挂坠（JUJUS）之一。",
                "{C:green}好好保管它。"
            },
        },
        zodiac_names = {
            Taurus = '金牛座',
            Gemini = '双子座',
            Cancer = '巨蟹座',
            Leo = '狮子座',
            Virgo = '处女座',
            Libra = '天秤座',
            Scorpio = '天蝎座',
            Sagittarius = '射手座',
            Capricorn = '摩羯座',
            Aquarius = '水瓶座',
            Pisces = '双鱼座',
            Ophiuchus = '蛇夫座',
            Aries = '白羊座'
        },
    },
    
}
