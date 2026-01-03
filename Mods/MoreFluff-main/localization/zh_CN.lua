local art_credit = function (name, forced)
  if mf_config["Programmer Art"] and not forced then return nil end
  if mf_config["Disable Art Credits"] then return nil end
  return "{s:0.8,C:inactive}Art by: "..name
end

return {
  descriptions = {
    Joker = {
      j_mf_badlegaldefence = {
        name = "绝命毒师",
        text = {"当选择{C:attention}Boss盲注{}时",
            "创建一张{C:attention}死神{}{C:tarot}塔罗牌{}", "{C:inactive}(必须有空间)"}
      },
      j_mf_basepaul_card = {
        name = "基础保罗",
        text = {"{X:mult,C:white} X#1# {}倍率",
            "拥有{C:red}保罗{}时改为{X:mult,C:white} X#2# {}倍率", "{C:inactive}(谁是保罗？)"}
      },
      j_mf_bladedance = {
        name = "刀锋之舞",
        text = {"当选择盲注时", "向你的牌组添加{C:attention}#1#{}张",
            "临时的{C:attention}钢铁牌{}"}
      },
      j_mf_blasphemy = {
        name = "亵渎",
        text = {"{X:red,C:white} X#1# {} 倍率", "每次出牌后 {C:blue}-#2#{} 出牌次数"}
      },
      j_mf_bloodpact = {
        name = "血契",
        text = {
            "{X:mult,C:white} X#1# {} 倍率",
            "当你打出非{C:hearts}红桃{}牌时",
            "{C:red}自毁{}",
            art_credit("footlongdingledong"),
        }
      },
      j_mf_bowlingball = {
        name = "保龄球",
        text = {
            "打出{C:attention}3{}并得分时",
            "给予{C:chips}+#1#{}筹码",
            "和{C:mult}+#2#{}倍率",
            art_credit("footlongdingledong"),
        }
      },
      j_mf_cba = {
        name = "高级卡牌缓冲",
        text = {"{C:attention}重新触发{}你的第一个", "{C:dark_edition}版本{}小丑",
            "{C:inactive}(高级卡牌缓冲除外){}"}
      },
      j_mf_clipart = {
        name = "剪贴画小丑",
        text = {"当选择{C:attention}盲注{}时", "创建一张{C:colourcard}色彩牌{}",
            "{C:inactive}(必须有空间)"}
      },
      j_mf_clownfish = {
        name = "小丑鱼",
        text = {"{C:attention}增强{}牌计分时给予", "{C:chips}+#1#{} 筹码和 {C:mult}+#2#{} 倍率"}
      },
      j_mf_colorem = {
        name = "颜色",
        text = {"当使用{C:colourcard}色彩牌{}时，",
            "有{C:green}#1# in #2#{}的几率添加一张副本", "到你的消耗区",
            "{C:inactive}(必须有空间)"}
      },
      j_mf_coupon_catalogue = {
        name = "优惠券目录",
        text = {"每购买一张{C:attention}优惠券{}", "获得{C:mult}+#1#{}倍率", "本局游戏",
            "{C:inactive}(当前{C:mult}+#2#{C:inactive}倍率)"}
      },
      j_mf_css = {
        name = "CSS",
        text = {"当打出的手牌包含{C:attention}同花{}时",
            "创建一张随机的{C:colourcard}色彩牌{}", "{C:inactive}(必须有空间)"}
      },
      j_mf_dramaticentrance = {
        name = "戏剧性入场",
        text = {"每回合的第一手牌", "获得{C:chips}+#1#{}筹码"}
      },
      j_mf_dropkick = {
        name = "倒挂金钩",
        text = {"当手牌包含{C:attention}顺子{}时", "获得{C:blue}+#1#{}出牌次数"}
      },
      j_mf_expansion_pack = {
        name = "补充包",
        text = {"当选择{C:attention}盲注{}时，",
            "创建一张{C:attention}#1#{C:dark_edition}版本的{C:attention}小丑",
            "{C:inactive}(必须有空间)"}
      },
      j_mf_fleshprison = {
        name = "血肉监狱",
        text = {"{C:red}X#1#{} {C:attention}Boss盲注{}大小", "当{C:attention}Boss盲注{}被击败时，",
            "{C:red}自毁{}，并创建", "一张{C:dark_edition}负片{} {C:spectral}灵魂{}牌"}
      },
      j_mf_fleshpanopticon = {
        name = "血肉全景监狱",
        text = {"{C:red}X#1#{} {C:attention}Boss盲注{}大小", "当{C:attention}Boss盲注{}被击败时，",
            "{C:red}自毁{}，并创建", "一张{C:dark_edition}负片{} {C:spectral}传送门{}牌"}
      },
      j_mf_globe = {
        name = "地球仪",
        text = {"当你在商店中{C:attention}重掷{}时，", "创建#1#张{C:planet}星球{}牌"}
      },
      j_mf_goldencarrot = {
        name = "金胡萝卜",
        text = {"在回合结束时", "获得{C:money}$#1#{}", "每打出一手牌", "扣除{C:money}$#2#{}"}
      },
      j_mf_hallofmirrors = {
        name = "镜厅",
        text = {"每在当前回合中打出一张{C:attention}6{}，", "增加{C:attention}+#2#{}手牌大小",
            "{C:inactive}(当前{C:attention}+#1#{C:inactive}张牌)"}
      },
      j_mf_hollow = {
        name = "空心小丑",
        text = {"{C:attention}#1#{}手牌大小", "手牌的数量每比{C:attention}#3#{}张少一张，",
            "就获得{C:mult}+#2#{}倍率"}
      },
      j_mf_hugejoker = {
        name = "巨型小丑",
        text = {"{X:red,C:white} X#1# {}倍率", "{C:attention}#2#{}手牌大小"}
      },
      j_mf_hyperbeam = {
        name = "超能光束",
        text = {"{X:red,C:white} X#1# {}倍率", "当选择{C:attention}盲注{}时，",
            "{C:attention}失去所有弃牌{}"}
      },
      j_mf_impostor = {
        name = "冒牌货",
        text = {"如果打出的手牌中", "恰好有一张{C:red}红色{}牌，",
            "获得{X:mult,C:white} X#1# {}倍率"}
      },
      j_mf_jankman = {
        name = "融合巨怪",
        text = {"每张{C:dark_edition}版本{}小丑", "{C:inactive}(以及快乐小丑){}",
            "给予{X:chips,C:white} X#1# {}筹码"}
      },
      j_mf_jester = {
        name = "小丑",
        text = {"{C:chips,s:1.1}+#1#{}筹码"}
      },
      j_mf_loadeddisk = {
        name = "加载磁盘",
        text = {"出售时创建一张{C:colourcard}粉色{}和",
            "一张{C:colourcard}黄色{} {C:colourcard}色彩牌{}", "{C:inactive}(必须有空间)"}
      },
      j_mf_lollipop = {
        name = "棒棒糖",
        text = {"{X:mult,C:white} X#1# {} 倍率", "每回合{X:mult,C:white} -X#2# {} 倍率"}
      },
      j_mf_luckycharm = {
        name = "幸运符",
        text = {"{C:green}#1#/#3#{}几率", "获得{C:mult}+#2#{}倍率", "{C:green}#1#/#5#{}几率",
            "在回合结束时赢得{C:money}$#4#"}
      },
      j_mf_mashupalbum = {
        name = "混音专辑",
        text = {"如果打出的手牌包含{C:hearts}红色{}同花，", "获得{C:mult}+#3#{}倍率",
            "如果打出的手牌包含{C:spades}黑色{}同花，", "获得{C:chips}+#4#{}筹码",
            "{C:inactive}(当前{C:mult}+#1#{C:inactive}和{C:chips}+#2#{C:inactive})"}
      },
      j_mf_monochrome = {
        name = "褪色小丑",
        text = {
            "未持有{C:colourcard}色彩牌{}时，每回合{C:mult}+#1#{}倍率",
            "{C:inactive}(当前{C:mult}+#2#{C:inactive})",
            art_credit("footlongdingledong"),
        }
      },
      j_mf_mspaint = {
        name = "画师小丑",
        text = {"每个盲注的第一手牌", "增加{C:attention}+#1#{}手牌大小"}
      },
      j_mf_paintcan = {
        name = "油漆罐",
        text = {"每当{C:colourcard}色彩牌{}获得回合时，",
            "有{C:green}#1#/#2#{}的几率额外获得一个回合"}
      },
      j_mf_pixeljoker = {
        name = "像素小丑",
        text = {"打出{C:attention}A{}、{C:attention}4{}和{C:attention}9{}时，",
            "每张给予{X:mult,C:white} X#1# {}倍率"}
      },
      j_mf_philosophical = {
        name = "哲学小丑",
        text = {"{C:dark_edition}+#1#{}小丑槽位"}
      },
      j_mf_rainbowjoker = {
        name = "彩虹小丑",
        text = {
            "每张{C:colourcard}色彩牌{}给予",
            "{X:mult,C:white} X#1#{}倍率",
            art_credit("footlongdingledong"),
        }
      },
      j_mf_recycling = {
        name = "回收",
        text = {"当任何{C:attention}增强包{}被跳过时，",
            "创建一张随机的{C:planet}星球牌{}或{C:tarot}塔罗牌{}",
            "{C:inactive}(必须有空间)"}
      },
      j_mf_rosetinted = {
        name = "玫瑰色眼镜",
        text = {"如果回合的{C:attention}第一手牌{}是", "一张{C:attention}2{}，销毁它并",
            "创建一个免费的{C:attention}双倍标签{}"}
      },
      j_mf_simplified = {
        name = "简化小丑",
        text = {"所有{C:blue}普通{}小丑", "每张给予{C:mult}+#1#{}倍率"}
      },
      j_mf_spiral = {
        name = "螺旋小丑",
        text = {"{C:mult}+(#1#+#2#cos(pi/#3# x {C:attention}$${C:mult})){}倍率",
            "{C:inactive}({C:attention}$${C:inactive}是你当前的钱)",
            "{C:inactive}(当前给予{C:mult}+#4#{C:inactive}倍率)"}
      },
      j_mf_stylemeter = {
        name = "风格计",
        text = {"每跳过{C:attention}盲注{}，", "在回合结束时获得{C:money}$#1#{}",
            "{C:inactive}(当前{C:money}$#2#{C:inactive})"}
      },
      j_mf_teacup = {
        name = "茶杯",
        text = {"接下来的{C:attention}#1#{}手牌", "升级{C:attention}打出的手牌{}"}
      },
      j_mf_the_solo = {
        name = "独奏",
        text = {"如果打出的手牌只有{C:attention}1{}张牌，", "获得{X:mult,C:white} X#2# {}倍率",
            "{C:inactive}(当前{X:mult,C:white} X#1# {C:inactive}倍率)"}
      },
      j_mf_tonersoup = {
        name = "我喝墨粉汤",
        text = {"当打出一手牌时", "创建一张{C:tarot}塔罗牌{}", "当盲注被击败时销毁",
            "{C:inactive}(必须有空间)"}
      },
      j_mf_treasuremap = {
        name = "藏宝图",
        text = {"经过{C:attention}#2#{}回合后，", "出售此牌以", "获得{C:money}$#3#{}",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}/#2#)"}
      },
      j_mf_triangle = {
        name = "三角",
        text = {"如果打出的手牌是{C:attention}三条{}，",
            "每张牌给予{X:mult,C:white} X#1# {}倍率"}
      },
      j_mf_virtual = {
        name = "虚拟小丑",
        text = {"{X:red,C:white} X#1# {}倍率", "当选择盲注时，", "翻转并洗混所有小丑牌"}
      },
      j_mf_marigold = {
        name = "万寿菊",
        text = {
          "打出或持有的{C:attention}万寿菊卡{}额外",
          "{C:attention}重新触发{}#1#次",
          art_credit("marigold"),
        },
      },
      j_mf_yuckyrat = { 
        name = "恶心老鼠",
        text = {
          "打出的{C:attention}未增强{}卡牌",
          "会转换为{C:attention}恶心卡{}。",
          "每转换一张卡牌，",
          "获得{X:red,C:white} X#1# {}倍率",
          "{C:inactive}(当前{X:red,C:white} X#2# {C:inactive}倍率)"
        },
      },
      j_mf_hyperjimbo = { 
        name = "超常吉姆博",
        text = {
          "{X:dark_edition,C:white,s:1.4} ^^#1# {s:1.4} 筹码",
          "得分前触发，如果{C:attention}打出的手牌",
          "恰好包含{C:attention}4{}张卡牌"
        },
      },
      j_mf_brass = {
        name = "黄铜小丑",
        text = {
          "每销毁{C:attention}#4#张黄铜卡{}，",
          "{C:attention}重新触发{}右侧的小丑一次",
          "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
        }
      },
      j_mf_allicantdo = {
        name = "与我无缘",
        text = {
          "{C:red}削弱{}第一手抽到的牌",
          "每打出一张{C:red}被削弱的{}卡牌，",
          "获得{X:red,C:white} X#1# {}倍率",
          "{C:inactive}(当前{X:red,C:white} X#2# {C:inactive})"
        }
      },
      j_mf_tealjoker = {
        name = "蓝绿色小丑",
        text = {
          "牌组中每有一张{C:attention}蓝绿色卡{}，",
          "给予{X:chips,C:white} X#1# {}筹码",
          "{C:inactive}(当前{X:chips,C:white} X#2# {C:inactive}筹码)",
        }
      },
      j_mf_gemstonejoker = {
        name = "宝石小丑",
        text = {
          "回合结束时，牌组中每有一张{C:attention}宝石卡{}，",
          "获得{C:money}$#1#{}",
          "{C:inactive}(当前{C:money}$#2#{C:inactive})"
        }
      },
      j_mf_top10 = {
        name = "1到10中的前10名小丑",
        text = {
          "回合结束时，{C:attention}当前持有金钱{}中",
          "每显示一个{C:green}独特的数字{}，获得{C:money}$#1#{}",
          "{C:inactive}(它们是 0, 1, 2, 3, 4, 5, 6, 7, 8, 和 9。)",
        }
      },
      j_mf_junkmail = {
        name = "垃圾邮件",
        text = {
          "每次商店进入时，",
          "创建一张价格为{C:money}#1#x{}的{C:attention}优惠券{}",
        }
      },
      j_mf_stonejokerjoker = {
        name = "石头小丑小丑",
        text = {
          "每次商店结束时，",
          "创建一张{C:dark_edition}负片{}{C:spectral}永恒{}的{C:attention}大理石小丑{}",
        }
      },
      j_mf_flintandsteel = {
        name = "燧石与钢铁",
        text = {
          "如果得分手牌包含{C:attention}石头卡{}和{C:attention}钢铁卡{}，",
          "升级该{C:attention}打出的手牌{}等级",
        }
      },
      j_mf_talljoker = {
        name = "高大小丑",
        text = {
          "{C:mult,s:1.1}+#1#{}倍率",
        },
      },
      j_mf_complexitycreep = {
        name = "复杂度膨胀",
        text = {
          "生成时或选择{C:attention}Boss盲注{}时",
          "获得一个随机效果"
        },
      },
      j_mf_selfinsert = {
        name = "自我插入",
        text = {
          "效果可在设置中自定义..."
        }
      },
      j_mf_missingjoker = {
        name = "丢失纹理",
        text = {
          "当选择盲注时，在盲注期间",
          "转换为一张{C:dark_edition}随机小丑{}"
        }
      },
      j_mf_rot_cartomancer = {
        name = "占卜师！",
        text = {
          "当选择{C:attention}盲注{}时，",
          "创建一张{C:rotarot}45度旋转移位塔罗牌{}",
          "{C:inactive}(必须有空间)"
        },
      },
      j_mf_widejoker = {
        name = "宽版小丑",
        text = {
          "{X:dark_edition,C:white}^#1#{}倍率",
        },
      },
      j_mf_farmmerge = {
        name = "小丑合合谷",
        text = {
          "弃掉恰好{C:attention}3张{}相同点数的牌时，",
          "将它们全部与{C:attention}最右侧{}的弃牌{C:dark_edition}合并{}",
        },
      },
      j_mf_broomcloset = {
        name = "扫帚间",
        text = {
          "如果在上一个{C:attention}商店{}没有进行任何购买，",
          "获得{X:mult,C:white}X#1#{}倍率",
          "{C:inactive}(当前 #2#)"
        },
      },
      j_mf_unregisteredhypercam = { 
        name = "未注册 Hypercam 2",
        text = {
          "得分前触发，",
          "{X:dark_edition,C:white,s:1.4} ^^#1# {s:1.4} 倍率",
        },
      },
      j_mf_blahaj = { 
        name = "Blåhaj",
        text = {
          "交换{C:chips}筹码{}和{C:mult}倍率{}"
        },
      },
      j_mf_wilddrawfour = { 
        name = "变色加四",
        text = {
          "当前回合中，每有一张{C:attention}野牌{}计分，",
          "增加{C:attention}+#2#{}手牌大小",
          "{C:inactive}(当前{C:attention}+#1#{C:inactive}张牌)"
        },
      },
      j_mf_unpleasantcard = { 
        name = "败兴牌",
        text = {
          "{X:chips,C:white} X#1# {}筹码",
          "{C:attention}增强包{}内",
          "仅包含{C:attention}1{}张卡牌"
        },
      },
      j_mf_slotmachine = { 
        name = "老虎机",
        text = {
          "计分的{C:attention}7{}有{C:green}#1#/#2#{}几率",
          "额外{C:attention}重新触发{}#3#次",
        },
      },
      j_mf_snake = {
        name = "蛇",
        text = {
          "在{C:attention}出牌{}或{C:attention}弃牌{}后，",
          "始终抽取{C:attention}#1#{}张卡牌"
        }
      },
      j_mf_bookmove = {
        name = "理论招法",
        text = {
          "经过{C:attention}#2#{}回合后，",
          "出售此牌以创建",
          "{C:attention}挂件小丑{}和{C:attention}照片",
          "{C:inactive}(当前{C:attention}#1#{C:inactive}/#2#，必须有空间)"
        },
      },
      j_mf_cueball = {
        name = "母球",
        text = {
          "计分的{C:attention}无点数卡{}有{C:green}#1#/#2#{}几率",
          "创建一张{C:rotarot}45度旋转移位塔罗牌{}",
          "{C:inactive}(必须有空间)"
        },
      },
      j_mf_blunder = {
        name = "漏着",
        text = {
          "{X:mult,C:white} X#1# {}倍率",
          "强制选中",
          "一张卡牌"
        },
      },
      j_mf_brilliant = {
        name = "妙着",
        text = {
          "如果在一手牌内击败盲注，",
          "创建一张随机的{C:spectral}幻灵牌{}",
          "{C:inactive}(必须有空间)"
        },
      },
      j_mf_lessfluff = {
        name = "精简插件",
        text = {
          "每次{C:attention}盲注{}开始时，",
          "销毁所有其他{C:dark_edition}修改版{}{C:attention}小丑{}", 
          "每销毁一个{C:attention}小丑{}，获得{X:mult,C:white} X#2# {}倍率",
          "{C:inactive}(当前 {X:red,C:white} X#1# {C:inactive})"
        },
      },
      j_mf_sudoku = {
        name = "数独小丑",
        text = {
          "如果从{C:attention}A到9{}的每个点数都已{C:attention}计分{}，",
          "获得{X:mult,C:white} X#1# {}倍率。击败",
          "{C:attention}Boss盲注{}时重置",
          "{C:inactive}(当前 {V:1}A{C:inactive}, {V:2}2{C:inactive}, {V:3}3{C:inactive}, {V:4}4{C:inactive}, {V:5}5{C:inactive}, {V:6}6{C:inactive}, {V:7}7{C:inactive}, {V:8}8{C:inactive}, {V:9}9{C:inactive})"
        },
      },
      j_mf_sapling = {
        name = "速生树苗",
        text = {
          "经过{C:attention}#3#{}回合后，",
          "出售此牌以将{C:attention}回合分数{}设置为",
          "{s:1.1,C:spectral}TREE(3){}",
          "{C:inactive}(当前 #4#, {}[{C:attention}#1#{C:inactive}#2#{}]{C:inactive})",
        }
      },
      j_mf_onesliptoolate = {
        name = "一着不慎",
        text = {
          "如果{C:attention}手牌{}恰好包含{C:attention}N{}张牌，",
          "获得{X:mult,C:white} xN {}倍率。{C:attention}N{}是",
          "本回合已打出的手牌数",
          "{C:inactive}(当前 N 等于 {C:attention}#1#{C:inactive})",
        }
      },
      j_mf_lightningstrikesthrice = {
        name = "三等雷劈",
        text = {
          "{C:attention}弃牌时{}效果奖励",
          "额外触发{C:attention}#1#{}次",
        }
      },
      j_mf_friendinsideme = {
        name = "腹中挚友",
        text = {
          "每层{C:attention}底注{}限一次，出售一张",
          "{C:common}普通{}或{C:uncommon}罕见{}小丑时，",
          "创建一张更高稀有度的小丑",
          "{C:inactive}(当前 #1#)"
        }
      },
      j_mf_thewayhome = {
        name = "归家之路",
        text = {
          "选择{C:attention}盲注{}时；",
          "有{C:green}#1#/#2#{}几率",
          "获得{C:blue}#3#{}次出牌机会"
        }
      },
      j_mf_jackofalltrades = {
        name = "万能杰克",
        text = {
          "手牌中持有的每张{C:attention}Jack{}",
          "给予{C:mult}+#1#{}倍率，",
          "{C:chips}+#2#{}筹码和{C:money}$#3#"
        },
      },
      j_mf_oopsallfives = {
        name = "噢！全是5",
        text = {
          "将所有列出的{C:green,E:1,S:1.1}分母{}减少{C:green}1",
          "{C:inactive}(例如: {C:green}1/5{C:inactive} -> {C:green}1/4{C:inactive})"
        },
      },
      j_mf_passando = {
        name = "5分钟通关 Balatro",
        text = {
          "{X:attention,C:white}X2{} 游戏速度",
          "每跳过{C:attention}2{}个盲注，",
          "创建一张{C:dark_edition}负片{}{C:attention}健怡可乐",
          "{C:inactive}(当前 #1#/#2#)"
        },
      },
      j_mf_grep = {
        name = "grep",
        text = {
          "如果本回合的{C:attention}第一次弃牌{}",
          "只有{C:attention}1{}张卡牌，将所有{C:attention}点数或花色{}",
          "匹配的卡牌移至{C:dark_edition}牌组顶部{}"
        }
      },
      j_mf_forge = {
        name = "小丑熔炉",
        text = {
          "每售出{C:attention}#3#张小丑牌{}，",
          "创建一张随机的{C:attention}小丑牌{}",
          "{C:inactive}(当前 {}[{C:attention}#1#{C:inactive}#2#{}]{C:inactive})",
          art_credit("LFMoth")
        }
      },
      j_mf_forgeslop = {
        name = "熔炉残渣",
        text = {
          "售出时不会触发{C:attention}小丑熔炉{}"
        }
      },
      j_mf_trianglewalker = {
        name = "三角，鹏洛客",
        text = {
          {
            "{X:black,C:white} +2 {}: 抽取{C:attention}三张{}卡牌",
          },
          {
            "{X:black,C:white} -3 {}: 销毁最多{C:attention}三张{}选中的卡牌",
          },
          {
            "{X:black,C:white} -11 {}: 使最多{C:attention}三张{}选中的",
            "{C:attention}游戏卡牌{}变为{C:dark_edition}多彩{}",
          }
        }
      },
      j_mf_mindsculptor = {
        name = "吉姆博，心灵塑师",
        text = {
          {
            "{X:black,C:white} +2 {}: 抽取一张卡牌",
          },
          {
            "{X:black,C:white} 0 {}: 抽取{C:attention}四张{}卡牌，并将手牌中",
            "{C:attention}最左侧{}的三张卡牌{C:green}洗回{}牌组",
          },
          {
            "{X:black,C:white} -1 {}: 将所有持有的手牌{C:green}洗回{}牌组",
          },
          {
            "{X:black,C:white} -12 {}: {C:red}销毁{}牌组中剩余的所有卡牌",
            art_credit("Ice"),
          },
        }
      },
      j_mf_johnbalatro = {
        name = "约翰·巴拉卓..？",
        text = {
          {
            "{X:black,C:white} +1 {}: 恰好{C:attention}五张{}选中的没有",
            "{C:mult}倍率{}奖励的{C:attention}游戏卡牌{}获得{C:mult}+4{}倍率"
          },
          {
            "{X:black,C:white} -11 {}: {C:attention,E:1}解放{}约翰·巴拉卓",
          },
        }
      },
      j_mf_johnbalatrotrue = {
        name = "约翰·巴拉卓",
        text = {
          "得分前触发，",
          "{X:dark_edition,C:white,s:1.5}^2{} 倍率"
        }
      },
      j_mf_dinner = {
        name = "晚餐！",
        text = {
          "在接下来的{C:attention}#1#{}回合中，",
          "{C:attention}重新触发{}右侧的小丑"
        }
      },
      j_mf_doubledscale = {
        name = "双倍比例",
        text = {
          "{C:attention}成长型小丑{}的{C:green,E:1}成长速度",
          "变为{C:attention}两倍{}",
          art_credit("LFMoth")
        }
      },
      j_mf_theneedle = {
        name = "指针",
        text = {
          "选择{C:attention}盲注{}时，",
          "将除一次{C:blue}出牌机会{}以外的所有出牌机会",
          "转换为各{C:red}#1#{}次弃牌机会"
        }
      },
      j_mf_farmmergecivilisation = {
        name = "我在小丑合合文明中生存",
        text = {
          "回合结束时，{C:dark_edition}合并{}",
          "所有卡牌，并将它们全部转换为",
          "合并后的结果"
        },
      },
      -- ORTALAB SWAPS
      j_mf_clintcondition = {
        name = "克林特条款",
        text = {"{X:chips,C:white} X#1# {}筹码",
            "拥有{C:chips}克林特{}时改为{X:chips,C:white} X#2# {}筹码",
            "{C:inactive}(谁是克林特？)"}
      },
      j_mf_sheetsuggestion = {
        name = "建议收集表",
        text = {"{C:mult,s:1.1}+#1#{}倍率", "{C:inactive}(有趣的描述)"}
      },

      j_mf_devilsknife = {
        name = "恶魔之刃",
        text = {"出售时创建一张{C:colourcard}蓝色{}和",
            "一张{C:colourcard}淡紫色{} {C:colourcard}色彩牌{}", "{C:inactive}(必须有空间)"}
      },

      j_mf_twotrucks = {
        name = "两辆卡车",
        text = {"每对独特的手牌", "获得{X:chips,C:white} X#1# {}筹码",
            "{C:inactive}(当前{X:chips,C:white} X#2# {} {C:inactive}筹码)"}
      },

      -- FAMILIAR SWAPS
      j_mf_jimbojjoker = {
        name = "吉姆博·J·小丑",
        text = {"{X:mult,C:white} X#1# {}倍率"}
      }
    },
    Colour = {
      c_mf_black = {
        name = "黑色",
        text = {"每持有{C:attention}#4#{}回合，",
            "向随机{C:attention}小丑{}添加{C:dark_edition}负片{}",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      c_mf_deepblue = {
        name = "深蓝",
        text = {"每持有{C:attention}#4#{}回合，",
            "将手牌中的一张随机牌转换为{C:spades}黑桃{}",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      c_mf_crimson = {
        name = "深红",
        text = {"每持有{C:attention}#4#{}回合，", "创建一个{C:red}稀有标签{}",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      c_mf_seaweed = {
        name = "海藻色",
        text = {"每持有{C:attention}#4#{}回合，",
            "将手牌中的一张随机牌转换为{C:clubs}梅花{}",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      c_mf_brown = {
        name = "棕色",
        text = {"每持有{C:attention}#4#{}回合，",
            "销毁手牌中的一张随机牌并给予{C:attention}$#5#{}",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      c_mf_grey = {
        name = "灰色",
        text = {"每持有{C:attention}#4#{}回合，", "创建一个{C:attention}双倍标签{}",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      c_mf_silver = {
        name = "银色",
        text = {"每持有{C:attention}#4#{}回合", "创建一个{C:dark_edition}多彩标签{}",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      c_mf_white = {
        name = "白色",
        text = {"每持有{C:attention}#4#{}回合", "创建一张随机的{C:dark_edition}负片{}{C:colourcard}色彩牌{}",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      c_mf_red = {
        name = "红色",
        text = {"每持有{C:attention}#4#{}回合",
            "将手牌中的一张随机卡转换为{C:hearts}红桃{}",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      c_mf_orange = {
        name = "橙色",
        text = {"每持有{C:attention}#4#{}回合",
            "将手牌中的一张随机卡转换为{C:diamonds}方块{}",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      c_mf_yellow = {
        name = "黄色",
        text = {"每{C:attention}#4#{}回合", "{C:attention}售价{}增加{C:money}$#5#{}",
            "{C:inactive}({}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      c_mf_green = {
        name = "绿色",
        text = {"每持有{C:attention}#4#{}回合", "创建一张{C:dark_edition}负片{}", "{C:green}噢！全是5s{}",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      c_mf_blue = {
        name = "蓝色",
        text = {"每持有{C:attention}#4#{}回合", "创建一张随机的",
            "{C:dark_edition}负片{}{C:planet}星球牌{}",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      c_mf_lilac = {
        name = "紫色",
        text = {"每持有{C:attention}#4#{}回合", "创建一张随机的",
            "{C:dark_edition}负片{}{C:tarot}塔罗牌{}",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      c_mf_pink = {
        name = "粉色",
        text = {"每持有{C:attention}#4#{}回合", "为一张随机的{C:colourcard}色彩牌{}",
            "增加{C:attention}1{}回合",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      c_mf_peach = {
        name = "桃色",
        text = {"每持有{C:attention}#4#{}回合",
            "创建一张随机的{C:dark_edition}负片{}", "{C:rotarot}45度旋转移位塔罗牌{}",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      c_mf_new_gold = {
        name = "金色",
        text = {"每持有{C:attention}#4#{}回合",
            "创建一张{C:dark_edition}负片{}{C:spectral}灵魂{}牌",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      -- c_mf_peach = {
      --   name = "桃色",
      --   text = {"每持有{C:attention}#4#{}回合",
      --       "创建一个{C:dark_edition}负片{} {C:spectral}灵魂{}", "卡",
      --       "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"}
      -- },
      c_mf_purple = {
        name = "洋红色",
        text = {"每持有{C:attention}#4#{}回合", "创建一个{C:cry_epic}史诗标签{}",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      c_mf_moonstone = {
        name = "月长石色",
        text = {"每持有{C:attention}#4#{}回合", "创建一个{C:dark_edition}欢乐小丑{}",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      c_mf_gold = {
        name = "Mutare Basi Ludum",
        text = {"每持有{C:attention}#4#{}回合",
            "创建一个{C:dark_edition}负片{} {C:cry_exotic}Gateway{}牌",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      c_mf_ooffoo = {
        name = "00FF00",
        text = {"每持有{C:attention}#4#{}回合",
            "创建一个{C:dark_edition}负片{} {C:cry_code}代码{}牌",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      c_mf_wordlegreen = {
        name = "Wordle 绿",
        text = {"每持有{C:attention}#4#{}回合",
            "创建一个{C:dark_edition}负片{} {C:green}字母{}牌",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      c_mf_pastelpink = {
        name = "淡粉色",
        text = {"每持有{C:attention}#4#{}回合",
            "创建一个{C:dark_edition}负片{} {V:1}笨蛋{}牌",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      c_mf_royalblue = {
        name = "品蓝",
        text = {"每持有{C:attention}#4#{}回合",
            "创建一个{C:dark_edition}负片{} {C:spectral}印记幻灵{}牌",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      c_mf_teal = {
        name = "青色",
        text = {"每持有{C:attention}#4#{}回合",
            "创建一个{C:dark_edition}负片{} {C:spectral}Splash{}幻灵牌",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      c_mf_blank = {
        name = "空白",
        text = {"每持有{C:attention}#4#{}回合",
            "创建一个{C:dark_edition}负片{} {C:spectral}Joker Studio: Basic{}",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      c_mf_amber = {
        name = "琥珀色",
        text = {"每持有{C:attention}#4#{}回合",
            "创建一个{C:dark_edition}负片{} {C:G.SP.C.travel_1}旅行{}牌",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      c_mf_respiceperprisma = {
        name = "棱镜视界",
        text = {"每持有{C:attention}#4#{}回合",
            "创建一个{C:dark_edition}负片{} {C:spectral}奇点{}幻灵牌",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("astralightsky")}
      },
      c_mf_moss = {
        name = "苔藓绿",
        text = {"每持有{C:attention}#4#{}回合",
            "创建一个{C:dark_edition}负片{} {C:myth_light}神话{}牌",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      c_mf_caramel = {
        name = "焦糖色",
        text = {"每持有{C:attention}#4#{}回合",
            "创建一个{C:dark_edition}负片{} {C:bakery}烘焙{}物品",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
      c_mf_violet = {
        name = "紫罗兰",
        text = {"每持有{C:attention}#4#{}回合",
            "创建一个{C:dark_edition}负片{} {C:spectral}无尽{}幻灵牌",
            "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})",
            art_credit("Multi")}
      },
    },
    Rotarot = {
      c_mf_rot_fool = {
        name = "愚者！",
        text = {
          "创建一个本局游戏中",
          "最后使用的除{s:0.8,C:rotarot}愚者！{s:0.8}以外的",
          "{C:rotarot}45度旋转移位塔罗牌{}或{C:colourcard}色彩牌{}"
        }
      },
      c_mf_rot_magician = {
        name = "魔术师！",
        text = {
          "将{C:attention}#1#{}张选中的卡牌",
          "增强为{C:attention}#2#s"
        }
      },
      c_mf_rot_high_priestess = {
        name = "女祭司！",
        text = {
          "创建最多{C:attention}#1#{}张",
          "随机{C:colourcard}色彩牌{}",
          "{C:inactive}(必须有空间)"
        }
      },
      c_mf_rot_empress = {
        name = "皇后！",
        text = {
          "将{C:attention}#1#{}张选中的卡牌",
          "增强为{C:attention}#2#s"
        }
      },
      c_mf_rot_emperor = {
        name = "皇帝！",
        text = {
          "创建最多{C:attention}#1#{}张随机",
          "{C:rotarot}45度旋转移位塔罗牌{}",
          "{C:inactive}(必须有空间)"
        },
      },
      c_mf_rot_heirophant = {
        name = "教皇！",
        text = {
          "将{C:attention}#1#{}张选中的卡牌",
          "增强为{C:attention}#2#s"
        }
      },
      c_mf_rot_lovers = {
        name = "恋人！",
        text = {
          "将{C:attention}#1#{}张选中的卡牌",
          "增强为{C:attention}#2#s"
        }
      },
      c_mf_rot_chariot = {
        name = "战车！",
        text = {
          "将{C:attention}#1#{}张选中的卡牌",
          "增强为{C:attention}#2#"
        }
      },
      c_mf_rot_justice = {
        name = "正义！",
        text = {
          "将{C:attention}#1#{}张选中的卡牌",
          "增强为{C:attention}#2#"
        }
      },
      c_mf_rot_hermit = {
        name = "隐士！",
        text = {
          "将持有金钱设为",
          "下一个{C:money}$#1#{}的倍数",
          "{C:inactive}(对已经是{C:money}$#1#{C:inactive}倍数的金钱无效)"
        },
      },
      c_mf_rot_wheel = {
        name = "命运之轮！",
        text = {
          "有{C:green}#1#/#2#{}几率向随机{C:attention}小丑{}",
          "添加一个随机的{C:negative}版本",
          "{C:inactive}所有版本的权重相等...{}"
        }
      },
      c_mf_rot_strength = {
        name = "力量！",
        text = {
          "随机化最多",
          "{C:attention}#1#{}张选中卡牌的点数",
        },
      },
      c_mf_rot_hanged_man = {
        name = "倒吊人！",
        text = {
          "随机销毁手牌中的",
          "{C:attention}#1#{}张卡牌",
        },
      },
      c_mf_rot_death = {
        name = "死神！",
        text = {
          "选中{C:attention}#1#{}张卡牌，",
          "将{C:attention}所有{}选中卡牌转换为",
          "其中一张{C:attention}随机{}选中卡牌"
        }
      },
      c_mf_rot_temperance = {
        name = "节制！",
        text = {
          "为每个{C:attention}小丑{}和",
          "{C:attention}消耗牌{}添加{C:money}$#1#{}的",
          "{C:attention}售价"
        },
      },
      c_mf_rot_devil = {
        name = "恶魔！",
        text = {
          "将{C:attention}#1#{}张选中的卡牌",
          "增强为{C:attention}#2#s"
        }
      },
      c_mf_rot_tower = {
        name = "高塔！",
        text = {
          "将{C:attention}#1#{}张选中的卡牌",
          "增强为{C:attention}#2#"
        }
      },
      c_mf_rot_star = {
        name = "星星！",
        text = {
          "向手牌中添加{C:attention}#1#{}张随机的",
          "{C:attention}增强{C:diamonds}方块{}"
        }
      },
      c_mf_rot_moon = {
        name = "月亮！",
        text = {
          "向手牌中添加{C:attention}#1#{}张随机的",
          "{C:attention}增强{C:clubs}梅花{}"
        }
      },
      c_mf_rot_sun = {
        name = "太阳！",
        text = {
          "向手牌中添加{C:attention}#1#{}张随机的",
          "{C:attention}增强{C:hearts}红桃{}"
        }
      },
      c_mf_rot_judgement = {
        name = "审判！",
        text = {
          "创建一个随机的",
          "{C:dark_edition}修改版{C:attention}小丑",
          "{C:inactive}(必须有空间)"
        },
      },
      c_mf_rot_world = {
        name = "世界！",
        text = {
          "向手牌中添加{C:attention}#1#{}张随机的",
          "{C:attention}增强{C:spades}黑桃{}"
        }
      },
    },
    Shape = {
      c_mf_cloud = {
        name = "云朵",
        text = {
          "每持有{C:attention}#4#{}回合创建一张",
          "{C:dark_edition}负片{}{C:spectral}哲学小丑{}",
          "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
        },
      },
      c_mf_spade = {
        name = "黑桃 (形状)",
        text = {
          "每持有{C:attention}#4#{}回合，将{C:dark_edition}完整牌组{}中",
          "的一张随机卡牌转换为{C:spades}黑桃{}。如果已经是",
          "{C:spades}黑桃{}，则{C:red}销毁{}该卡牌。触发{C:attention}两次{}",
          "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
        },
      },
      c_mf_omega = {
        name = "欧米伽",
        text = {
          "每持有{C:attention}#4#{}回合，",
          "创建一个{C:dark_edition}绝对标签{}",
          "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
        },
      },
      c_mf_club = {
        name = "梅花 (形状)",
        text = {
          "每持有{C:attention}#4#{}回合，将{C:dark_edition}完整牌组{}中",
          "的一张随机卡牌转换为{C:clubs}梅花{}。如果已经是",
          "{C:clubs}梅花{}，则{C:red}销毁{}该卡牌。触发{C:attention}两次{}",
          "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
        },
      },
      c_mf_rectangle = {
        name = "矩形",
        text = {
          "每持有{C:attention}#4#{}回合，向手牌中添加",
          "一张随机的{C:dark_edition}游戏卡牌{}",
          "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
        },
      },
      c_mf_squircle = {
        name = "方圆形",
        text = {
          "每持有{C:attention}#4#{}回合，",
          "创建一个{C:dark_edition}随机标签{}",
          "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
        },
      },
      c_mf_arrow = {
        name = "箭头",
        text = {
          "每持有{C:attention}#4#{}回合，",
          "创建一个{C:dark_edition}日光标签{}",
          "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
        },
      },
      c_mf_circle = {
        name = "圆形",
        text = {
          "每持有{C:attention}#4#{}回合创建一张",
          "{C:dark_edition}负片{}{C:shape}形状牌{}",
          "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
        },
      },
      c_mf_heart = {
        name = "红桃 (形状)",
        text = {
          "每持有{C:attention}#4#{}回合，将{C:dark_edition}完整牌组{}中",
          "的一张随机卡牌转换为{C:hearts}红桃{}。如果已经是",
          "{C:hearts}红桃{}，则{C:red}销毁{}该卡牌。触发{C:attention}两次{}",
          "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
        },
      },
      c_mf_diamond = {
        name = "方块 (形状)",
        text = {
          "每持有{C:attention}#4#{}回合，将{C:dark_edition}完整牌组{}中",
          "的一张随机卡牌转换为{C:diamond}方块{}。如果已经是",
          "{C:diamond}方块{}，则{C:red}销毁{}该卡牌。触发{C:attention}两次{}",
          "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
        },
      },
      c_mf_dollar = {
        name = "金钱 (形状)",
        text = {
          "每持有{C:attention}#4#{}回合，以{C:money}#1#倍售价{}",
          "{C:red}强制出售{}一张随机{C:attention}小丑{}或{C:attention}消耗牌{}",
          "{C:inactive}(增加1倍。强制出售无视永恒属性){}",
          "{C:inactive}({}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
        },
      },
      c_mf_green = {
        name = "绿色 (形状)",
        text = {
          "每持有{C:attention}#4#{}回合创建一张",
          "{C:dark_edition}负片{}{C:green}噢！全是6s{}",
          "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
        },
      },
      c_mf_star = {
        name = "星星 (形状)",
        text = {
          "每持有{C:attention}#4#{}回合创建一张",
          "随机的{C:dark_edition}负片{}{C:purple}星星牌{}",
          "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
        },
      },
      c_mf_lilac = {
        name = "浅紫色 (形状)",
        text = {
          "每持有{C:attention}#4#{}回合创建一张",
          "随机的{C:dark_edition}负片{}{C:tarot}塔罗牌{}",
          "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
        },
      },
      c_mf_pause = {
        name = "暂停",
        text = {
          "每持有{C:attention}#4#{}回合，为所有{C:colourcard}色彩牌{}",
          "增加{C:attention}1{}回合，然后{C:red}停止{}它们周期",
          "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
        },
      },
      c_mf_peach = {
        name = "桃色 (形状)",
        text = {
          "每持有{C:attention}#4#{}回合创建一张",
          "{C:dark_edition}负片{}{C:rotarot}45度旋转移位塔罗牌{}",
          "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
        },
      },
      c_mf_gem = {
        name = "宝石",
        text = {
          "每持有{C:attention}#4#{}回合创建一张",
          "{C:dark_edition}负片{}{C:spectral}热望牌{}",
          "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
        },
      },
      c_mf_house = {
        name = "房屋",
        text = {
          "每持有{C:attention}#4#{}回合创建一张",
          "{C:dark_edition}引用标签{}",
          "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
        },
      },
      c_mf_loss = {
        name = "迷失",
        text = {
          "每持有{C:attention}#4#{}回合创建一张",
          "{C:dark_edition}迷失牌{}",
          "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
        },
      },
      c_mf_prism = {
        name = "三棱镜",
        text = {
          "每持有{C:attention}#4#{}回合创建一张",
          "{C:dark_edition}负片{}{C:cry_exotic}彼端幻灵牌{}",
          "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
        },
      },
      c_mf_brackets = {
        name = "括号",
        text = {
          "每持有{C:attention}#4#{}回合创建一张",
          "{C:dark_edition}负片{}{C:cry_code}代码？牌{}",
          "{C:inactive}(当前{C:attention}#1#{C:inactive}, {}[{C:attention}#2#{C:inactive}#3#{}]{C:inactive})"
        },
      },
    },
    Spectral = {
      c_mf_soul2 = {
        name = "{s:2,E:4}灵魂 {s:2,C:red,E:4}2",
        text = {
          "创建一个",
          "{C:dark_edition,s:3,E:1}超传说{}",
          "小丑牌....",
        }
      }
    },
    Enhanced = {
      m_mf_yucky = {
        name = "恶心卡",
        text = {
          "计分后有{C:green}#1#/#2#{}几率",
          "被{C:red}销毁{}"
        },
      },
      m_mf_teal = {
        name = "青色卡",
        text = {
          "持有时，给予",
          "{X:chips,C:white} X#1# {} 筹码"
        }
      },
      m_mf_styled = {
        name = "样式卡",
        text = {
          "抽到手牌时，获得",
          "一个随机{C:attention}印记{}"
        }
      },
      m_mf_monus = {
        name = "Monus卡",
        text = {
          "每个牌型等级给予",
          "{C:chips}+#1#{} 筹码"
        }
      },
      m_mf_cult = {
        name = "教团卡",
        text = {
          "每个牌型等级给予",
          "{C:mult}+#1#{} 倍率"
        }
      },
      m_mf_marigold = {
        name = "金盏花卡",
        text = {
          "回合结束时获得{C:money}$#1#{}，",
          "手牌中每有一张其他{C:attention}金盏花卡{}",
          "额外获得{C:money}$#1#{}"
        }
      },
      m_mf_brass = {
        name = "黄铜卡",
        text = {
          "计分时{C:attention}额外触发{}#1#次，",
          "计分后有{C:green}#2#/#3#{}几率",
          "被{C:red}销毁{}"
        }
      },
      m_mf_gemstone = {
        name = "宝石卡",
        text = {
          "计分时给予{C:attention}+$#1#{}",
          "无点数或花色"
        }
      },
    },
    Oddity = {
      c_mf_jimbophone = {
        name = "JimboPhone",
        text = {
          "创建{C:attention}#1#{}张{C:mult}小丑{}，",
          "不需要槽位",
          "{C:inactive}(小丑：+4 倍率)"
        },
      },
    },
    Voucher = {
      v_mf_paintroller = {
        name = "油漆滚筒",
        text = {
          "当{C:colourcard}色彩牌{}获得回合数时，",
          "有{C:green}#1#/#2#{}几率额外获得{C:attention}1{}回合"
        },
      },
      v_mf_colourtheory = {
        name = "色彩理论",
        text = {
          "补充包中的一些{C:colourcard}色彩牌{}",
          "会是{C:dark_edition}多彩{}版本",
        },
      },
      v_mf_artprogram = {
        name = "艺术计划",
        text = {
          "补充包中的一些{C:colourcard}色彩牌{}",
          "会是{C:dark_edition}负片{}版本",
        },
      },
      v_mf_superboss_ticket = {
        name = "超级入场券",
        text = {
          "升级{C:attention}底注 #1#{}",
          "{C:inactive,s:0.8}祝你好运！{}"
        },
      },
    },
    Back = {
      b_mf_grosmichel = {
        name = "大麦克牌组",
        text = {
          "开始游戏时拥有{C:attention}大麦克"
        }
      },
      b_mf_philosophical = {
        name = "哲学牌组",
        text = {
          "开始游戏时拥有5个",
          "{C:attention}哲学小丑"
        }
      },
      b_mf_rainbow = {
        name = "彩虹牌组",
        text = {
          "开始游戏时拥有一张{C:colourcard}白色",
          "{C:colourcard}色彩牌{}和",
          "{C:tarot,T:v_mf_paintroller}油漆滚筒{}优惠券",
        }
      },
      b_mf_blasphemy = {
        name = "亵渎牌组",
        text = {
          "开始游戏时拥有一张{C:dark_edition}负片{}",
          "{C:spectral}永恒{} {C:attention}亵渎"
        }
      },
    },
    Stake = {
      stake_mf_pink = {
        name = "粉红注金",
        text = {
          "第二个{C:attention}补充包{}",
          "永远是{C:attention}标准包{}",
          "{s:0.8}应用于所有之前的注金",
        }
      },
      stake_mf_lime = {
        name = "青柠注金",
        text = {
          "底注增加时，",
          "所需分数增长更快",
          "{s:0.8}应用于所有之前的注金",
        }
      },
      stake_mf_steel = {
        name = "钢铁注金",
        text = {
          "商店中会出现{C:attention}沉重{}小丑",
          "{C:inactive,s:0.8}(-1 弃牌选中限制)",
          "{s:0.8}应用于所有之前的注金",
        }
      },
      stake_mf_zodiac = {
        name = "黄道注金",
        text = {
          "开始游戏时拥有{C:attention}星球商人{}，",
          "{C:attention}塔罗商人{}和{C:attention}戏法",
          "{s:0.8}应用于所有之前的注金",
        }
      },
      stake_mf_hot = {
        name = "滚烫注金",
        text = {
          "商店中会出现{C:attention}土豆{}小丑",
          "{C:inactive,s:0.8}(必须先售出)",
          "{s:0.8}应用于所有之前的注金",
        }
      },
      stake_mf_accelerated = {
        name = "加速注金",
        text = {
          "底注增加时，",
          "所需分数大幅增长更多",
          "{s:0.8}应用于所有之前的注金",
          art_credit("Aikoyori"),
        }
      },
      stake_mf_cardboard = {
        name = "纸板注金",
        text = {
          "{C:uncommon}罕见{}和{C:rare}稀有{}小丑",
          "出现的几率降低{C:attention}2倍{}",
          "{s:0.8}应用于所有之前的注金",
        }
      },
      stake_mf_violet = {
        name = "紫罗兰注金",
        text = {
          "底注4会出现{C:dark_edition}摊牌",
          "{s:0.8}应用于所有之前的注金",
        }
      },
      stake_mf_jimbo = {
        name = "吉姆博注金",
        text = {
          "+1 底注获胜要求",
          "{s:0.8}应用于所有之前的注金",
        }
      },
    },
    Other = {
      undiscovered_colour = {
        name = "未发现",
        text = {
          "在未使用种子的游戏中",
          "购买或使用此卡以",
          "了解其内容"
        }
      },
      p_mf_colour_normal_1 = {
        name = "色彩包",
        text = {
          "选择{C:attention}#1#{}张最多",
          "{C:attention}#2#{C:colourcard} 色彩牌{}来",
          "添加到你的消耗品中"
        }
      },
      p_mf_colour_normal_2 = {
        name = "色彩包",
        text = {
          "选择{C:attention}#1#{}张最多",
          "{C:attention}#2#{C:colourcard} 色彩牌{}来",
          "添加到你的消耗品中"
        }
      },
      p_mf_colour_jumbo_1 = {
        name = "巨型色彩包",
        text = {
          "选择{C:attention}#1#{}张最多",
          "{C:attention}#2#{C:colourcard} 色彩牌{}来",
          "添加到你的消耗品中"
        }
      },
      p_mf_colour_mega_1 = {
        name = "超大型色彩包",
        text = {
          "选择{C:attention}#1#{}张最多",
          "{C:attention}#2#{C:colourcard} 色彩牌{}来",
          "添加到你的消耗品中"
        }
      },
      p_mf_rotarot_normal_1 = {
        name = "45度旋转移位秘仪包",
        text = {
          "选择{C:attention}#1#{}张最多{C:attention}#2#{}张",
          "{C:rotarot}45度旋转移位塔罗牌{}",
          "立即使用"
        }
      },
      p_mf_rotarot_normal_2 = {
        name = "45度旋转移位秘仪包",
        text = {
          "选择{C:attention}#1#{}张最多{C:attention}#2#{}张",
          "{C:rotarot}45度旋转移位塔罗牌{}",
          "立即使用"
        }
      },
      p_mf_rotarot_normal_3 = {
        name = "45度旋转移位秘仪包",
        text = {
          "选择{C:attention}#1#{}张最多{C:attention}#2#{}张",
          "{C:rotarot}45度旋转移位塔罗牌{}",
          "立即使用"
        }
      },
      p_mf_rotarot_normal_4 = {
        name = "45度旋转移位秘仪包",
        text = {
          "选择{C:attention}#1#{}张最多{C:attention}#2#{}张",
          "{C:rotarot}45度旋转移位塔罗牌{}",
          "立即使用"
        }
      },
      p_mf_rotarot_jumbo_1 = {
        name = "巨型45度旋转移位秘仪包",
        text = {
          "选择{C:attention}#1#{}张最多{C:attention}#2#{}张",
          "{C:rotarot}45度旋转移位塔罗牌{}",
          "立即使用"
        }
      },
      p_mf_rotarot_jumbo_2 = {
        name = "巨型45度旋转移位秘仪包",
        text = {
          "选择{C:attention}#1#{}张最多{C:attention}#2#{}张",
          "{C:rotarot}45度旋转移位塔罗牌{}",
          "立即使用"
        }
      },
      p_mf_rotarot_mega_1 = {
        name = "超大型45度旋转移位秘仪包",
        text = {
          "选择{C:attention}#1#{}张最多{C:attention}#2#{}张",
          "{C:rotarot}45度旋转移位塔罗牌{}",
          "立即使用"
        }
      },
      p_mf_rotarot_mega_2 = {
        name = "超大型45度旋转移位秘仪包",
        text = {
          "选择{C:attention}#1#{}张最多{C:attention}#2#{}张",
          "{C:rotarot}45度旋转移位塔罗牌{}",
          "立即使用"
        }
      },
      p_mf_modded_normal_1 = {
        name = "修改包",
        text = {
          "选择{C:attention}#1#{}张最多",
          "{C:attention}#2#{C:dark_edition} 修改小丑牌{}"
        }
      },
      p_mf_modded_normal_2 = {
        name = "修改包",
        text = {
          "选择{C:attention}#1#{}张最多",
          "{C:attention}#2#{C:dark_edition} 修改小丑牌{}"
        }
      },
      p_mf_modded_jumbo_1 = {
        name = "巨型修改包",
        text = {
          "选择{C:attention}#1#{}张最多",
          "{C:attention}#2#{C:dark_edition} 修改小丑牌{}"
        }
      },
      p_mf_modded_mega_1 = {
        name = "超大型修改包",
        text = {
          "选择{C:attention}#1#{}张最多",
          "{C:attention}#2#{C:dark_edition} 修改小丑牌{}"
        }
      },
      tetr_explainer = {
        name = "说明",
        text = {
          "{X:dark_edition,C:white}^^n{} 代表 {C:attention}迭代幂次",
          "在这里，{X:dark_edition,C:white}n^^#1#{} 可以",
          "通过 {X:dark_edition,C:white}n^^#1# = n^n^#2#{} 计算"
        }
      },
      planeswalker_explainer = {
        name = "鹏洛客",
        text = {
          "初始具有 #1# {C:dark_edition}忠诚度{}。",
          "每回合一次，你可以通过调整 {C:dark_edition}忠诚度{}",
          "来{C:attention}激活{}一项{C:dark_edition}能力{}。",
          "{C:dark_edition}忠诚度{}不能低于 0。",
        }
      },
      mf_halted = {
        name = "已停止",
        text = {
          "无法再获得更多 {C:attention}回合数{}"
        },
      },
      mf_heavy = {
        name = "沉重",
        text = {
          "-1 {C:red}弃牌{}选中限制"
        },
      },
      mf_potato = {
        name = "土豆",
        text = {
          "必须先售出"
        },
      },
    },
    Blind = {
      bl_mf_bigger_blind = {
        name = "超大盲注",
      },
      bl_mf_violet_vessel_dx = {
        name = "紫罗兰之舰 DX",
        text = {
          "极其巨大的盲注分数"
        }
      },
      bl_mf_cerulean_bell_dx = {
        name = "蔚蓝之钟 DX",
        text = {
          "强制选中 3 张卡牌"
        }
      },
      bl_mf_needle_dx = {
        name = "指针 DX",
        text = {
          "只能出 1 手牌，",
          "初始具有 1 次弃牌机会"
        }
      },
      bl_mf_manacle_dx = {
        name = "手铐 DX",
        text = {
          "-3 手牌大小"
        }
      },
      bl_mf_pillar_dx = {
        name = "支柱 DX",
        text = {
          "本局游戏中打出的卡牌",
          "有一半会被削弱"
        }
      },
      bl_mf_serpent_dx = {
        name = "巨蛇 DX",
        text = {
          "仅在手牌为空时补牌"
        }
      },
      bl_mf_club_dx = {
        name = "梅花 DX",
        text = {
          "所有非梅花花色的卡牌",
          "都会被削弱"
        }
      },
      bl_mf_goad_dx = {
        name = "尖刺 DX",
        text = {
          "所有非黑桃花色的卡牌",
          "都会被削弱"
        }
      },
      bl_mf_window_dx = {
        name = "窗子 DX",
        text = {
          "所有非方块花色的卡牌",
          "都会被削弱"
        }
      },
      bl_mf_head_dx = {
        name = "人头 DX",
        text = {
          "所有非红桃花色的卡牌",
          "都会被削弱"
        }
      },
      bl_mf_arm_dx = {
        name = "手臂 DX",
        text = {
          "将打出的牌型等级",
          "设置为 0"
        }
      },
      bl_mf_wheel_dx = {
        name = "轮子 DX",
        text = {
          "只有一张牌被正面朝上",
          "地抽取"
        }
      },
      bl_mf_house_dx = {
        name = "房屋 DX",
        text = {
          "第一手抽到的牌",
          "会被弃掉"
        }
      },
      bl_mf_psychic_dx = {
        name = "灵媒 DX",
        text = {
          "不能打出 5 张卡牌"
        }
      },
      bl_mf_hook_dx = {
        name = "钩子 DX",
        text = {
          "出牌后，抽完牌会",
          "再弃掉手牌"
        }
      },
    },
    Sleeve = {
      sleeve_mf_grosmichel = {
        name = "大麦克卡套",
        text = {
          "开始游戏时拥有{C:attention}大麦克"
        }
      },
      sleeve_mf_grosmichel_alt = {
        name = "大麦克卡套",
        text = {
          "开始游戏时拥有{C:attention}Cavendish"
        }
      },
      sleeve_mf_philosophical = {
        name = "哲学卡套",
        text = {
          "开始游戏时拥有 5 个",
          "{C:attention}哲学小丑"
        }
      },
      sleeve_mf_philosophical_alt = {
        name = "哲学卡套",
        text = {
          "开始游戏时拥有 10 个",
          "{C:attention}哲学小丑"
        }
      },
      sleeve_mf_rainbow = {
        name = "彩虹卡套",
        text = {
          "开始游戏时拥有一张",
          "{C:colourcard}白色{}{C:colourcard}色彩牌{}和",
          "{C:tarot}油漆滚筒{}优惠券"
        }
      },
      sleeve_mf_rainbow_alt = {
        name = "彩虹卡套",
        text = {
          "开始游戏时拥有",
          "{C:tarot}色彩理论{}优惠券"
        }
      },
      sleeve_mf_blasphemy = {
        name = "亵渎卡套",
        text = {
          "开始游戏时拥有一张{C:dark_edition}负片{}",
          "{C:spectral}永恒{} {C:attention}亵渎"
        }
      },
      sleeve_mf_blasphemy_alt = {
        name = "亵渎卡套",
        text = {
          "开始游戏时拥有一张",
          "{C:dark_edition}负片{} {C:attention}亵渎"
        }
      },
    },
    Tag = {
      tag_mf_colour = {
        name = "画家标签",
        text = {
          "给予一个免费的",
          "{C:colourcard}巨型色彩包"
        }
      },
      tag_mf_rotarot = {
        name = "旋转移位标签",
        text = {
          "给予一个免费的",
          "{C:rotarot}45度旋转移位超大型秘仪包"
        }
      },
      tag_mf_moddedpack = {
        name = "修改标签",
        text = {
          "给予一个免费的",
          "{C:dark_edition}巨型修改包"
        }
      },
      tag_mf_clutch = {
        name = "紧要标签",
        text = {
          "下一场{C:attention}盲注{}中",
          "给予 {X:mult,C:white}X#1#{} 倍率"
        }
      },
      tag_mf_absolute = {
        name = "绝对标签",
        text = {
          "商店中的下一张小丑牌免费",
          "且变为 {C:dark_edition}绝对{} 版本"
        }
      },
      tag_mf_eclutch = {
        name = "{C:gold}关键标签{}",
        text = {
          "下一场{C:attention}盲注{}中",
          "给予 {X:dark_edition,C:white}^#1#{} 倍率"
        }
      },
      tag_mf_eabsolute = {
        name = "{C:gold}绝对标签{}",
        text = {
          "商店中的所有物品变为 {C:dark_edition}绝对{} 版本"
        }
      },
			tag_mf_emoddedpack = {
				name = "{C:gold}修改标签{}",
				text = { "给予一个免费的有版本的", "{C:dark_edition}巨型修改包" },
			},
    },
    ComplexityCreep = {
      cc_plusmult = {
        name = "效果",
        text = {
          "{C:mult}+#1#{} 倍率",
          "#2#",
        }
      },
      cc_plusmult_if = {
        name = "效果",
        text = {
          "{C:mult}+#1#{} 倍率",
          "#2#",
          "#3#",
        }
      },
      cc_pluschips = {
        name = "效果",
        text = {
          "{C:chips}+#1#{} 筹码",
          "#2#",
        }
      },
      cc_pluschips_if = {
        name = "效果",
        text = {
          "{C:chips}+#1#{} 筹码",
          "#2#",
          "#3#",
        }
      },
      cc_xmult = {
        name = "效果",
        text = {
          "{X:mult,C:white}X#1#{} 倍率",
          "#2#",
        }
      },
      cc_xmult_if = {
        name = "效果",
        text = {
          "{X:mult,C:white}X#1#{} 倍率",
          "#2#",
          "#3#",
        }
      },
      cc_xchips = {
        name = "效果",
        text = {
          "{X:chips,C:white}X#1#{} 筹码",
          "#2#",
        }
      },
      cc_xchips_if = {
        name = "效果",
        text = {
          "{X:chips,C:white}X#1#{} 筹码",
          "#2#",
          "#3#",
        }
      },
      cc_emult = {
        name = "效果",
        text = {
          "{X:dark_edition,C:white}^#1#{} 倍率",
          "#2#",
        }
      },
      cc_emult_if = {
        name = "效果",
        text = {
          "{X:dark_edition,C:white}^#1#{} 倍率",
          "#2#",
          "#3#",
        }
      },
      cc_echips = {
        name = "效果",
        text = {
          "{X:dark_edition,C:white}^#1#{} 筹码",
          "#2#",
        }
      },
      cc_echips_if = {
        name = "效果",
        text = {
          "{X:dark_edition,C:white}^#1#{} 筹码",
          "#2#",
          "#3#",
        }
      },
      cc_eemult = {
        name = "效果",
        text = {
          "{X:dark_edition,C:white}^^#1#{} 倍率",
          "#2#",
        }
      },
      cc_eemult_if = {
        name = "效果",
        text = {
          "{X:dark_edition,C:white}^^#1#{} 倍率",
          "#2#",
          "#3#",
        }
      },
      cc_eechips = {
        name = "效果",
        text = {
          "{X:dark_edition,C:white}^^#1#{} 筹码",
          "#2#",
        }
      },
      cc_eechips_if = {
        name = "效果",
        text = {
          "{X:dark_edition,C:white}^^#1#{} 筹码",
          "#2#",
          "#3#",
        }
      },
      cc_dollars = {
        name = "效果",
        text = {
          "给予 {C:money}$#1#{}",
          "#2#",
        }
      },
      cc_dollars_if = {
        name = "效果",
        text = {
          "给予 {C:money}$#1#{}",
          "#2#",
          "#3#",
        }
      },
      cc_swapchipmult = {
        name = "效果",
        text = {
          "交换 {C:chips}筹码{} 和 {C:mult}倍率{}",
          "#2#",
        }
      },
      cc_swapchipmult_if = {
        name = "效果",
        text = {
          "交换 {C:chips}筹码{} 和 {C:mult}倍率{}",
          "#2#",
          "#3#",
        }
      },
      cc_createtarot = {
        name = "效果",
        text = {
          "创建一个 {C:tarot}塔罗牌",
          "#2#",
        }
      },
      cc_createtarot_if = {
        name = "效果",
        text = {
          "创建一个 {C:tarot}塔罗牌",
          "#2#",
          "#3#",
        }
      },
      cc_createplanet = {
        name = "效果",
        text = {
          "创建一个 {C:planet}星球牌",
          "#2#",
        }
      },
      cc_createplanet_if = {
        name = "效果",
        text = {
          "创建一个 {C:planet}星球牌",
          "#2#",
          "#3#",
        }
      },
      cc_copyconsumeable = {
        name = "效果",
        text = {
          "创建一个你拥有的",
          "随机 {C:attention}消耗牌{} 的",
          "{C:dark_edition}负片{} 复制品",
          "#2#",
        }
      },
      cc_copyconsumeable_if = {
        name = "效果",
        text = {
          "创建一个你拥有的",
          "随机 {C:attention}消耗牌{} 的",
          "{C:dark_edition}负片{} 复制品",
          "#2#",
          "#3#",
        }
      },
    },
  },
  misc = {
    v_dictionary = {
      cc_mf_joker_trigger = { "每手牌" },
      cc_mf_card_trigger = { "当卡牌计分时" },
      cc_mf_first_card_trigger = { "当第一张卡牌计分时" },
      cc_mf_face_card_trigger = { "当人头牌计分时" },
      cc_mf_endofround = { "在回合结束时" },
      cc_mf_cardsold = { "当卡牌被售出时" },
      cc_mf_shoproll = { "当商店重掷时" },

      cc_mf_handtype = { "如果手牌包含 #3#" },
      cc_mf_odds = { "如果有 #4# / #3# 的几率成功" },
    },
    v_text = {
      ch_c_mf_superboss_active = { "超级盲注始终激活" },
    },
    dictionary = {
      k_colour = "色彩",
      b_colour_cards = "色彩牌",
      k_colour_pack = "色彩包",
      k_plus_colour = "+1 色彩",
      k_plus_rotarot = "+1 45度旋转移位塔罗牌",
      b_take = "拿取",
      k_death_caps = "死亡",
      k_effect_added_ex = "已添加效果！",
      k_merged_ex = "已合并！",
      k_swap_ex = "已交换！",
      k_noted_ex = "已记录！",
      k_equals_tree_three = "=TREE(3)",
      k_correct_ex = "完全正确！",
      k_searched_ex = "已搜索！",
      k_forged_ex = "已锻造！",

      k_shape = "形状",
      b_shape_cards = "形状牌",

      k_rotarot = "45度旋转移位塔罗牌",
      b_rotarot_cards = "45度旋转移位塔罗牌",
      k_rotarot_pack = "45度旋转移位秘仪包",

      k_modded_pack = "修改包",

      k_plus_voucher = "+1 优惠券",

      k_display_for_paul = "(为了保罗)",
      k_display_for_paul_ex = "(为了保罗！)",
      k_display_steel_cards = "钢铁卡",
      k_display_per_round = "每回合",
      k_display_lose_all_hands = "(-9999 手)",
      k_display_only_hearts = "(仅红桃！)",
      k_display_enhanced = "(增强)",
      k_display_per_voucher = "每张优惠券",
      k_display_first_hand = "(第一手)",
      k_display_straight = "(顺子)",
      k_display_modded_joker = "修改小丑",
      k_display_on_reroll = "(重掷时)",
      k_display_per_hand = "每手",
      k_display_one_red_card = "(1张红卡)",
      k_display_modded = "修改版",
      k_display_hand_size = "手牌大小",
      k_display_joker_slot = "小丑槽",
      k_display_pack_skipped = "(已跳过卡包)",
      k_display_play_debuffed = "(出牌被削弱)",
      k_display_flint_and_steel = "(燧石与钢铁！)",
      k_display_inactive = "(未激活)",
      k_display_upgrade_ex = "升级！",
      k_display_four_cards = "(4张卡牌)",
      k_display_marigold_card = "(金盏花卡)",
      k_display_yucky = "(恶心的。)",

      mf_config_features = "功能",

      mf_config_progart = "艺术包 (需要重启)",
      mf_config_disablecred = "禁用卡牌上的艺术致谢",
      mf_config_jokers = "小丑",
      mf_config_music = "音乐",
      mf_config_colour_cards = "色彩牌",
      mf_config_rotarot_cards = "45度旋转移位塔罗牌",
      mf_config_achievements = "成就",
      mf_config_unfinished = "未完成内容",
      mf_config_huger_joker = "更大小丑",
      mf_config_horse_sound = "马鸣声",
      mf_config_superboss = "超级盲注",
      mf_config_other_tags = "其他标签",
      mf_config_other_packs = "其他卡包",

      mf_credits = "致谢",

      mf_config_maj = "我的超赞小丑",
    },
    labels = {
      colour = "色彩",
      shape = "形状",
      mf_halted = "已停止",
      mf_heavy = "沉重",
      mf_potato = "土豆",
    },
    achievement_names = {
      ach_mf_ten_colour_rounds = "十全十美",
      ach_mf_whos_paul = "谁是保罗？",
      ach_mf_jank_it_up = "爱上那个Janker",
      ach_mf_dropkick_ten_hands = "无限循环",
      ach_mf_negative_philosophical = "双管齐下",
      ach_mf_huge_and_pixel = "抗锯齿盟友",
    },
    achievement_descriptions = {
      ach_mf_ten_colour_rounds = '让一张色彩卡触发10次',
      ach_mf_whos_paul = "触发基础保罗卡的更强效果",
      ach_mf_jank_it_up = "拥有三张融合巨怪",
      ach_mf_dropkick_ten_hands = "在一回合内触发倒挂金钩 5 次",
      ach_mf_negative_philosophical = "拥有一个负片哲学小丑",
      ach_mf_huge_and_pixel = "同时拥有一个像素小丑和一个巨大小丑",
    },
    challenge_names = {
      c_mf_superboss_always = "更好的巴拉卓 II",
    },
  },
}