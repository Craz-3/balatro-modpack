return {
	["misc"] = {
		["dictionary"] = {
			["k_ccc_what"] = "???",
			["k_ccc_secret"] = "秘密",
			
			["k_ccc_a_jslot"] = "+1 小丑栏位",
			["k_ccc_a_pack"] = "+1 补给包",
			["k_ccc_applied"] = "已应用",
			["k_ccc_broken"] = "损坏",
			["k_ccc_correct"] = "正确",
			["k_ccc_discarded"] = "已弃牌",
			["k_ccc_equal"] = "相等",
			["k_ccc_fire"] = "火",
			["k_ccc_incorrect"] = "错误",
			["k_ccc_redraw"] = "重抽",
			["k_ccc_reset"] = "重置",
			["k_ccc_steel"] = "钢制",
			["k_ccc_swapped"] = "交换",
			["k_ccc_upgraded"] = "升级",
			
			["k_ccc_active_ex"] = "激活！",
			["k_ccc_fire_ex"] = "起火！",
			["k_ccc_prevent_ex"] = "阻止！",
			["k_ccc_standard_ex"] = "标准！",
			["k_ccc_strawberry_ex"] = "草莓！",
			["k_ccc_safe_eq"] = "安全..?",
		},
		["v_dictionary"] = {
			["ccc_a_ante_minus"] = "-#1# 底注",
			["ccc_a_discard"] = "+#1# 弃牌次数",
			["ccc_a_cards"] = "+#1# 卡牌",
			["ccc_hardlist_star"] = "#1#星！",
		},
		["labels"] = {
			["k_ccc_secret"] = "秘密",
			["ccc_mirrored"] = "镜像",
			["k_ccc_what"] = "???",
			["k_ccc_strawberry_badge"] = "草莓",
		},
	},
	["descriptions"] = {
		["Back"] = {
			["b_ccc_summit"] = {
				["name"] = "山顶牌组",
				["text"] = {
					"{C:attention}-4{} 小丑栏位",
					"每个非{C:red}最终Boss{}的底注",
					"增加{C:attention}+1{} 小丑栏位",
					"{s:0.75}(若底注之前未曾达到过){}",
				},
			},
			["b_ccc_virus"] = {
				["name"] = "病毒牌组",
				["text"] = {
					"每张打出的牌都会重新触发，",
					"然后被{C:red}削弱{}",
					"直到该底注结束",
				},
			},
			["b_ccc_heartside"] = {
				["name"] = "核心区牌组",
				["text"] = {
					"只会遇到{C:attention}模组添加{}的小丑",
					"{s:0.75}(可能还有{C:legendary,E:1,s:0.75}Jimbo{}{s:0.75})",
				},
			},
			["b_ccc_bside"] = {
				["name"] = "B面牌组",
				["text"] = {
					"每个盲注都是{C:red}Boss盲注{}",
					"从{C:attention}底注 0{}开始",
					"跳过盲注需花费{C:red}$8{}乘以",
					"({C:attention}当前底注{} + {C:attention}1{})",
				},
			},
		},
		["Sleeve"] = {
			["sleeve_ccc_bside"] = {
				["name"] = "B面卡套",
				["text"] = {
					"每个盲注都是{C:red}Boss盲注{}",
					"从{C:attention}底注 0{}开始",
					"跳过盲注需花费{C:red}$8{}乘以",
					"({C:attention}当前底注{} + {C:attention}1{})",
				},
			},
			["sleeve_ccc_bside_alt"] = {
				["name"] = "B面卡套",
				["text"] = {
					"每个盲注都会{C:red}结伴而行{}",
					"开局拥有{C:blue,T:v_grabber}抓取手{}、{C:red,T:v_wasteful}浪费{}和{C:attention,T:v_blank}空白{}",
				},
			},
			["sleeve_ccc_virus"] = {
				["name"] = "病毒卡套",
				["text"] = {
					"每张打出的牌都会重新触发，",
					"然后被{C:red}削弱{}",
					"直到该底注结束",
				},
			},
			["sleeve_ccc_virus_alt"] = {
				["name"] = "病毒卡套",
				["text"] = {
					"每张打出的牌都会重新触发，",
					"然后被{C:red}削弱{}",
					"直到该底注结束",
				},
			},
			["sleeve_ccc_summit"] = {
				["name"] = "山顶卡套",
				["text"] = {
					"{C:attention}-4{} 小丑栏位",
					"每个非{C:red}最终Boss{}的底注",
					"增加{C:attention}+1{} 小丑栏位",
					"{s:0.75}(若底注之前未曾达到过){}",
				},
			},
			["sleeve_ccc_summit_alt"] = {
				["name"] = "山顶卡套",
				["text"] = {
					"你必须击败底注 16 才能获胜",
				},
			},
			["sleeve_ccc_heartside"] = {
				["name"] = "核心区卡套",
				["text"] = {
					"只会遇到{C:attention}模组添加{}的小丑",
					"{s:0.75}(可能还有{C:legendary,E:1,s:0.75}Jimbo{}{s:0.75})"
				},
			},
		},
		["Blind"] = {
			["bl_ccc_crystal"] = {
				["name"] = "水晶",
				["text"] = {
					"所有方块牌",
					"以背面向上抽出",
				},
			},
			["bl_ccc_snow"] = {
				["name"] = "雪",
				["text"] = {
					"所有梅花牌",
					"以背面向上抽出",
				},
			},
			["bl_ccc_shriek"] = {
				["name"] = "尖啸",
				["text"] = {
					"手牌在打出之后",
					"会被削弱",
				},
			},
			["bl_ccc_goldencrown"] = {
				["name"] = "金冠",
				["text"] = {
					"需要击败此盲注",
					"#1# 次",
				},
			},
			["bl_ccc_fallacy"] = {
				["name"] = "谬误",
				["text"] = {
					"出牌在计分后",
					"降低一级点数",
				},
			},
			["bl_ccc_stone"] = {
				["name"] = "石头",
				["text"] = {
					"所有黑桃牌",
					"以背面向上抽出",
				},
			},
			["bl_ccc_gap"] = {
				["name"] = "裂缝",
				["text"] = {
					"打出的牌每隔一张",
					"就会被削弱",
				},
			},
			["bl_ccc_berry"] = {
				["name"] = "浆果",
				["text"] = {
					"所有红桃牌",
					"以背面向上抽出",
				},
			},
		},
		["Other"] = {
			["e_mirrored"] = {
				["name"] = "镜像",
				["text"] = {
					"如果存在一张{C:attention}镜子{}卡，",
					"则{C:attention}重新触发{}此牌，",
					"否则在回合结束时",
					"{C:red}自我销毁{}",
				},
			},
			["partofyou_complements"] = {
				["name"] = "互补对",
				["text"] = {
					"{s:0.83}A <> K{C:white,s:0.83}ii{s:0.83} ",
					"{s:0.83}2 <> Q",
					"{s:0.83}3 <> J",
					"{s:0.83}4 <> 10",
					"{s:0.83}5 <> 9",
					"{s:0.83}6 <> 8",
					"{s:0.83}7 <> 7",
				},
			},
			["ccc_acts_as_mirror"] = {
				["name"] = "n2",
				["text"] = {
					"{C:inactive,s:0.9}(充当{C:attention,s:0.9}镜子{C:inactive,s:0.9})",
				},
			},
			["ccc_focused"] = {
				["name"] = "n3",
				["text"] = {
					"{C:inactive,s:0.9}(由 {C:attention,s:0.9}#1#{C:inactive,s:0.9} 聚焦)",
				},
			},
		},
		["Joker"] = {
			["j_ccc_collapsingbridge"] = {
				["name"] = "坍塌之桥",
				["text"] = {
					"如果打出的手牌包含{C:attention}顺子{}：",
					"{X:mult,C:white} X#2# {} 倍率，且打出的",
					"每张牌都有 {C:green}#1#/#3#{} 几率",
					"被{C:red}摧毁{}",
				},
			},
			["j_ccc_refundpolicy"] = {
				["name"] = "退款政策",
				["text"] = {
					"跳过{C:attention}补给包{}时，",
					"获得 {C:money}#1#%{} 的{C:attention}退利",
					"{C:inactive,s:0.8}(向下取整){}",
				},
			},
			["j_ccc_rainbowspinner"] = {
				["name"] = "彩虹旋转器",
				["text"] = {
					"{C:money}金蜡封{} 被视为",
					"{C:attention}每一种{} {C:money}蜡{C:red}封",
				},
			},
			["j_ccc_granny"] = {
				["name"] = "奶奶",
				["text"] = {
					"在{C:red}弃牌{}之后，",
					"每弃掉一张牌，",
					"额外{C:attention}抽{} {C:attention}#1#{} 张牌",
				},
			},
			["j_ccc_cassette_block_pink"] = {
				["name"] = "磁带方块",
				["text"] = {
					"回合结束时，每剩余一次",
					"{C:mult}弃牌次数{}，获得 {C:mult}+#4#{} 倍率",
					"在回合开始时进行{C:chips}交换{}",
					"{C:inactive}(当前 {C:mult}+#2#{C:inactive} 倍率){}",
				},
			},
			["j_ccc_feather"] = {
				["name"] = "羽毛",
				["text"] = {
					"每从牌组中{C:attention}抽{}出一张牌，",
					"获得 {X:mult,C:white} X#1# {} 倍率",
					"在每轮结束时{C:red}重置{}",
					"{C:inactive}(当前 {X:mult,C:white} X#2# {C:inactive} 倍率){}",
				},
			},
			["j_ccc_badeline"] = {
				["name"] = "坏斑",
				["text"] = {
					"{C:attention}维持{}所有{C:dark_edition}镜像{}牌和/或",
					"{C:attention}玻璃{}牌，它们在计分时",
					"各自给予 {X:mult,C:white} X#1# {} 倍率",
				},
			},
			["j_ccc_wingedstrawberry"] = {
				["name"] = "飞翔草莓",
				["text"] = {
					"如果{C:attention}牌组牌型{}中不包含",
					"{C:attention}#1#{}，则赚取 {C:money}$#2#{}",
					"{s:0.8}要求牌型在回合结束时变化",
				},
			},
			["j_ccc_zipper"] = {
				["name"] = "拉链",
				["text"] = {
					"本局游戏中每跳过一个{C:attention}盲注{}",
					"以此获得 {C:chips}+#2#{} 筹码",
					"{C:inactive}(当前 {C:chips}+#1#{C:inactive} 筹码)",
				},
			},
			["j_ccc_mechanicalheart"] = {
				["name"] = "机械之心",
				["text"] = {
					"如果打出的手牌是单张",
					"{C:clubs}梅花A{}，将手中{C:attention}所有{}",
					"{C:clubs}梅花{}变为具有 {X:mult,C:white}X2{} 倍率的",
					"{C:attention}钢制牌{} {C:inactive,s:0.87}(不受重新触发影响){}",
				},
			},
			["j_ccc_eventhorizon"] = {
				["name"] = "事件视界",
				["text"] = {
					"使用 {C:attention}#2#{} 张{C:planet}星球牌{}后，",
					"下一次使用的{C:planet}星球牌{}",
					"其效果如同{C:legendary,E:1,S:1.1}黑洞{}",
					"{C:inactive}(当前 {C:attention}#1#{C:inactive}/{C:attention}#2#{C:inactive})",
				},
			},
			["j_ccc_books"] = {
				["name"] = "乱七八糟：书籍",
				["text"] = {
					"打出的手牌包含{C:attention}顺子{}时，手中每有",
					"一张可延长该{C:attention}顺子{}的额外卡牌，",
					"即获得 {X:mult,C:white} X#2# {} 倍率",
					"{C:inactive}(当前 {X:mult,C:white} X#1# {C:inactive} 倍率){}",
				},
			},
			["j_ccc_moonberry"] = {
				["name"] = "月之莓",
				["text"] = {
					"如果回合结束时未曾打出",
					"你最常打出的{C:attention}牌组牌型{}，",
					"则将其等级提升 {C:attention}#2#{} 次",
					"{C:inactive,s:0.8}(当前最常打出：{C:attention,s:0.8}#1#{C:inactive,s:0.8})",
				},
			},
			["j_ccc_thecrowd"] = {
				["name"] = "聚集者",
				["text"] = {
					"如果打出的手牌包含{C:attention}五条{}，",
					"{C:attention}计分{}牌给予 {C:money}$#2#{}，随后",
					"创建被打出牌型的{C:planet}星球牌{}",
					"{C:inactive}(需有空位){}",
				},
			},
			["j_ccc_jump"] = {
				["name"] = "跳跃",
				["text"] = {
					"{C:chips}+#1#{} 筹码",
				},
			},
			["j_ccc_cloud"] = {
				["name"] = "云",
				["text"] = {
					"在本轮每打出一手牌，",
					"以此获得 {C:chips}+#1#{} 筹码",
					"{C:inactive}(当前 {C:blue}+#2#{C:inactive} 筹码)",
				},
			},
			["j_ccc_dash"] = {
				["name"] = "冲刺",
				["text"] = {
					"{X:mult,C:white} X#1#{} 倍率",
				},
			},
			["j_ccc_bunnyhop"] = {
				["name"] = "兔子跳",
				["text"] = {
					"弃掉一张{C:attention}卡牌{}时，",
					"为手中{C:attention}所有{}牌",
					"永久增加 {C:chips}+#1#{} 筹码",
				},
			},
			["j_ccc_heavyheart"] = {
				["name"] = "沉重心灵",
				["text"] = {
					"如果打出的手牌是单张",
					"{C:diamonds}方块A{}，则手中每持有一张",
					"牌，即可赚取 {C:money}$#1#{}",
					"{C:inactive,s:0.87}(不受重新触发影响){}",
				},
			},
			["j_ccc_quietheart"] = {
				["name"] = "静谧心灵",
				["text"] = {
					"如果打出的手牌是单张",
					"{C:spades}黑桃A{}，则为手中{C:attention}所有{}",
					"牌永久增加 {C:chips}+#1#{} 筹码",
					"{C:inactive,s:0.87}(不受重新触发影响){}",
				},
			},
			["j_ccc_cornerjump"] = {
				["name"] = "墙角跳",
				["text"] = {
					"如果打出的手牌包含一张{C:attention}A{}",
					"以及一张{C:attention}K{}或一张{C:attention}2{}",
					"则获得 {C:chips}+#1#{} 筹码",
				},
			},
			["j_ccc_tothesummit"] = {
				["name"] = "登上山顶",
				["text"] = {
					"每有一个{C:attention}连续跳过{}且金额高于",
					"{C:attention}上个盲注{}的盲注，",
					"以此获得 {X:mult,C:white} X#3# {} 倍率",
					"{C:inactive}(当前 {X:mult,C:white} X#1# {C:inactive} 倍率)",
					"{C:inactive}(上次金额：{C:money}$#2#{C:inactive})",
				},
			},
			["j_ccc_iceball"] = {
				["name"] = "冰球",
				["text"] = {
					"如果你的{C:attention}得分显示板{}在",
					"{C:attention}上一轮{}没有{C:attention}起火{}，",
					"则获得 {C:white,X:red}X3{} 倍率",
				},
			},
			["j_ccc_chests"] = {
				["name"] = "乱七八糟：箱子",
				["text"] = {
					"打出的手牌包含{C:attention}三条{}时，手中每有",
					"一个{C:attention}点数不同{}的可能{C:attention}对子{}，",
					"即获得 {C:mult}+#2#{} 倍率",
					"{C:inactive}(当前 {C:mult}+#1#{C:inactive} 倍率)",
				},
			},
			["j_ccc_goldenstrawberry"] = {
				["name"] = "黄金草莓",
				["text"] = {
					"在{C:attention}Boss盲注{}结束时",
					"赚取 {C:money}$#1#{}",
				},
			},
			["j_ccc_introcar"] = {
				["name"] = "开场之车",
				["text"] = {
					"在每张 {C:attention}5{} 或 {C:attention}8{} 计分前，",
					"{C:attention}交换{}当前的",
					"{C:chips}筹码{}和{C:mult}倍率{}",
				},
			},
			["j_ccc_bumper"] = {
				["name"] = "弹簧",
				["text"] = {
					"如果{C:mult}弃牌次数{} {C:attention}>{} {C:chips}出牌次数{}，{C:mult}+#1#{} 倍率",
					"如果{C:chips}出牌次数{} {C:attention}>{} {C:mult}弃牌次数{}，{C:chips}+#2#{} 筹码",
					"如果两者{C:attention}相等{}，则{C:inactive}无效果{}",
				},
			},
			["j_ccc_freeze"] = {
				["name"] = "冻结",
				["text"] = {
					"手牌获得 {C:chips}+#1#{} 筹码，",
					"持续直到回合结束",
				},
			},
			["j_ccc_coyotejump"] = {
				["name"] = "土狼跳",
				["text"] = {
					"如果手中的牌无法组成{C:attention}对子{}",
					"{C:attention}顺子{}或{C:attention}同花{}，",
					"获得 {C:red}+#1#{} 次弃牌机会",
				},
			},
			["j_ccc_bird"] = {
				["name"] = "鸟",
				["text"] = {
					"每使用一张{C:planet}星球牌{}，",
					"{C:attention}抽取{} {C:attention}#1#{} 张牌",
				},
			},
			["j_ccc_cassetteblock"] = {
				["name"] = "磁带方块",
				["text"] = {
					"回合结束时，每剩余一次",
					"{C:attention}出牌次数{}，获得 {C:chips}+#3#{} 筹码",
					"在回合开始时进行{C:mult}交换{}",
					"{C:inactive}(当前 {C:chips}+#1#{C:inactive} 筹码){}",
				},
			},
			["j_ccc_bubsdrop"] = {
				["name"] = "Bubs跳",
				["text"] = {
					"击败{C:attention}Boss盲注{}时，",
					"失去 {C:red}$#2#{} 且底注 {C:attention}-#1#{}，",
					"随后{C:red}禁用{}此卡",
				},
			},
			["j_ccc_greenbooster"] = {
				["name"] = "绿色增强器",
				["text"] = {
					"为所有{C:attention}补给包{}增加",
					"{C:attention}#1#{} 个可选选项",
				},
			},
			["j_ccc_smotsgaming"] = {
				["name"] = "smots gaming",
				["text"] = {
					"{C:dark_edition}+1{} 小丑栏位",
					"{C:inactive}smots gaming",
				},
			},
			["j_ccc_grab"] = {
				["name"] = "抓取",
				["text"] = {
					"如果右侧有{C:attention}小丑{}，",
					"则提供 {C:mult}+#1#{} 倍率",
				},
			},
			["j_ccc_brittlecloud"] = {
				["name"] = "脆弱云",
				["text"] = {
					"在本轮的{C:attention}第一手{}牌中",
					"提供 {C:chips}+#1#{} 筹码",
				},
			},
			["j_ccc_waterfall"] = {
				["name"] = "瀑布",
				["text"] = {
					"如果打出的手牌包含{C:attention}同花{}，",
					"将一张随机{C:attention}手牌{}转变为",
					"相同的{C:attention}花色{}",
				},
			},
			["j_ccc_towels"] = {
				["name"] = "乱七八糟：毛巾",
				["text"] = {
					"打出的手牌包含{C:attention}同花{}时，手中每有",
					"一张具有相同{C:attention}花色{}的牌，",
					"即获得 {C:chips}+#2#{} 筹码",
					"{C:inactive}(当前 {C:chips}+#1#{C:inactive} 筹码)",
				},
			},
			["j_ccc_strongwinds"] = {
				["name"] = "强风",
				["text"] = {
					"{X:mult,C:white} X#1# {} 倍率",
					"{C:attention}点数{}最高的计分牌",
					"将被{C:red}摧毁{}",
				},
			},
			["j_ccc_theocrystal"] = {
				["name"] = "西奥水晶",
				["text"] = {
					"强制{C:attention}始终{}选中一张卡牌。",
					"在击败{C:attention}Boss盲注{}时，",
					"所有的{C:green,E:1}概率分母{}减少 {C:green}#1#{}",
					"{C:inactive}(例如：{C:green}2/7{C:inactive} -> {C:green}2/#3#{C:inactive})",
					"{C:inactive}(当前分母：{C:green}#2#{C:inactive})",
				},
			},
			["j_ccc_checkpoint"] = {
				["name"] = "检查点",
				["text"] = {
					"在不使用{C:red}弃牌{}的情况下",
					"击败{C:attention}Boss盲注{}，以此获得 {X:mult,C:white} X#2#{} 倍率",
					"{C:inactive}(当前 {X:mult,C:white} X#1# {C:inactive} 倍率)",
				},
			},
			["j_ccc_redspinner"] = {
				["name"] = "红旋转器",
				["text"] = {
					"在具有{C:red}红蜡封{}的卡牌被",
					"{C:attention}弃掉{}时，有 {C:green}#1#/#2#{} 几率",
					"为弃牌组中{C:attention}相邻{}的牌添加{C:red}红蜡封{}",
					"{C:inactive,s:0.87}(不受重新触发影响){}",
				},
			},
			["j_ccc_templeeyes"] = {
				["name"] = "神庙之眼",
				["text"] = {
					"如果进入一个盲注时携带",
					"金额为 {C:money}$#1#{} 或更少，则创建一张",
					"{C:tarot}倒吊人{}",
					"{C:inactive}(需有空位)",
				},
			},
			["j_ccc_coreswitch"] = {
				["name"] = "地核切换",
				["text"] = {
					"选择盲注时交换你的",
					"{C:blue}出牌次数{}和{C:red}弃牌次数{}",
					"交换后获得 {C:red}+#1#{} 次弃牌机会",
				},
			},
			["j_ccc_wingedgoldenstrawberry"] = {
				["name"] = "飞翔黄金草莓",
				["text"] = {
					"击败{C:attention}Boss盲注{}时如果不曾打出过",
					"包含 {C:attention}#1#{} 的牌型，则赚取 {C:money}$#2#{}",
					"{s:0.8}要求牌型在回合结束时变化",
				},
			},
			["j_ccc_partofyou"] = {
				["name"] = "你的一部分",
				["text"] = {
					"如果该回合产生的{C:attention}第一手{}牌",
					"正好由 {C:attention}2{} 张牌组成，将其",
					"{C:attention}等级{}转换为其{C:dark_edition}镜像{C:attention}互补牌{}",
				},
			},
			["j_ccc_ominousmirror"] = {
				["name"] = "凶兆之镜",
				["text"] = {
					"打出的计分牌有 {C:green}#1#/#2#{} 几率在手中",
					"创建一个永久的{C:dark_edition}镜像{}副本，",
					"在回合结束时有 {C:green}#3#/#4#{} 几率{C:inactive}损坏{}",
					"并变成一个{C:attention}破碎之镜{}",
				},
			},
			["j_ccc_seeker"] = {
				["name"] = "搜寻者",
				["text"] = {
					"如果抽出的牌是{C:attention}正面向上{}的且不是",
					"持有最多的{C:attention}点数{} ({C:attention}#1#{})",
					"或{C:attention}花色{} ({V:1}#2#{})，则将其",
					"洗回{C:attention}牌组{}并{C:attention}再抽一张",
				},
			},
			["j_ccc_broken_mirror"] = {
				["name"] = "破碎之镜",
				["text"] = {
					"{C:inactive}无效果。",
				},
			},
			["j_ccc_strawberry"] = {
				["name"] = "草莓",
				["text"] = {
					"回合结束时赚取 {C:money}$#1#{}，",
					"在每次结算奖励后减少 {C:money}$#2#{}",
				},
			},
			["j_ccc_madeline"] = {
				["name"] = "玛德琳",
				["text"] = {
					"{C:attention}防止{}任何持有的小丑能力",
					"对其{C:attention}数值{}进行降低",
					"或重置",
				},
			},
			["j_ccc_redbooster"] = {
				["name"] = "红色增强器",
				["text"] = {
					"可以从所有{C:attention}补给包{}中",
					"多{C:attention}选择 #1#{} 张卡牌",
				},
			},
			["j_ccc_1up"] = {
				["name"] = "1UP",
				["text"] = {
					"回合结束时赚取 {C:money}$#1#{}。",
					"每卖出一个{C:attention}草莓{}，此数值增加 {C:money}$#2#{}",
					"随后每次以此减少 {C:money}$#3#{}",
					"{C:inactive}(最低为 $1)",
				},
			},
			["j_ccc_templerock"] = {
				["name"] = "神庙岩石",
				["text"] = {
					"手中每持有一张{C:attention}石头牌{}，",
					"获得 {C:chips}+#1#{} 筹码",
				},
			},
			["j_ccc_bluespinner"] = {
				["name"] = "蓝旋转器",
				["text"] = {
					"在具有{C:planet}蓝蜡封{}的卡牌计分时，",
					"有 {C:green}#1#/#2#{} 几率为计分组中",
					"{C:attention}相邻{}的牌添加{C:planet}蓝蜡封{}",
					"{C:inactive,s:0.87}(不受重新触发影响){}",
				},
			},
			["j_ccc_moveblock"] = {
				["name"] = "移动方块",
				["text"] = {
					"每次弃牌获得 {C:mult}+#1#{} 倍率，",
					"如果打出的手牌包含{C:attention}三条{}",
					"则会被{C:attention}重置{}",
					"{C:inactive}(当前 {C:mult}+#2#{C:inactive} 倍率)",
				},
			},
			["j_ccc_purplespinner"] = {
				["name"] = "紫旋转器",
				["text"] = {
					"在具有{C:tarot}紫蜡封{}的卡牌在回合结束",
					"时{C:attention}持在{}手中时，有 {C:green}#1#/#2#{} 几率",
					"为手中{C:attention}相邻{}的牌添加{C:tarot}紫蜡封{}",
					"{C:inactive,s:0.87}(不受重新触发影响){}",
				},
			},
			["j_ccc_lettinggo"] = {
				["name"] = "放手",
				["text"] = {
					"每有一张卡牌被摧毁，都有 {C:green}#1#/#3#{} ",
					"几率创建一张{C:tarot}死亡{}牌 {C:inactive}(需有空位)",
					"每使用一张{C:tarot}死亡{}，获得 {X:mult,C:white} X#4# {} 倍率",
					"{C:inactive}(当前 {X:mult,C:white} X#2# {C:inactive} 倍率)",
				},
			},
			["j_ccc_secretshrine"] = {
				["name"] = "秘密神龛",
				["text"] = {
					"完整牌组中每有一张{C:attention}7{}，",
					"获得 {C:mult}+#2#{} 倍率",
					"{C:inactive}(当前 {C:mult}+#1#{C:inactive} 倍率){}",
				},
			},
			["j_ccc_strawberrypie"] = {
				["name"] = "草莓派",
				["text"] = {
					"根据当前持有{C:money}金额{}提供高额奖金：",
					"  {C:white}ii{}{C:money}$30{}-{C:money}$79{}: {C:chips}+#1#{} 筹码",
					"{C:money}$80{}-{C:money}$174{}: {C:mult}+#2#{} 倍率",
					"   {C:money}$175+{}: {X:mult,C:white} X#3# {} 倍率{C:white}i{}",
				},
			},
			["j_ccc_climbinggear"] = {
				["name"] = "登山装备",
				["text"] = {
					"{C:red}+#1#{} 次弃牌机会",
					"打出和弃掉的牌都会洗回牌组",
				},
			},
			["j_ccc_pointlessmachines"] = {
				["name"] = "无意义的机器",
				["text"] = {
					"信号太差？",
				},
			},
			["j_ccc_crumblejoker"] = {
				["name"] = "碎裂小丑",
				["text"] = {
					"打出的{C:attention}石头牌{}每张提供",
					"{X:mult,C:white} X#1# {} 倍率并被{C:red}摧毁{}",
				},
			},
			["j_ccc_jokerppt"] = {
				["name"] = "joker.ppt",
				["text"] = {
					"如果某回合打出了{C:attention}#1#{}，",
					"则在回合结束时创建该牌型的",
					"{C:planet}星球牌{}，要求牌型在回合结束变化",
				},
			},
			["j_ccc_fireball"] = {
				["name"] = "火球",
				["text"] = {
					"如果你的{C:attention}计分显示板{}在该回合",
					"{C:attention}起火{}，下个商店将拥有一个",
					"额外的{C:attention}超级补给包{}",
				},
			},
			["j_ccc_switchgate"] = {
				["name"] = "切换门",
				["text"] = {
					"如果计分手牌中包含以下任何一位，",
					"获得 {C:chips}+#8#{} 筹码：",
					"{V:1}#3#{} 的 {C:attention}#2#{}",
					"{V:2}#5#{} 的 {C:attention}#4#{}",
					"{V:3}#7#{} 的 {C:attention}#6#{}",
					"{C:inactive}(当前 {C:chips}+#1#{C:inactive} 筹码){}",
					"{s:0.8}卡牌属性每轮变化",
				},
			},
			["j_ccc_berryseeds"] = {
				["name"] = "草莓种子",
				["text"] = {
					"在计分了 {C:attention}#2#{} 张 {V:1}#3#{} 牌后，",
					"卖出此卡可{C:attention}创建{}一个随机{C:attention}草莓{}",
					"{C:inactive}(当前 {C:attention}#1#{C:inactive}/#2#)",
				},
			},
			["j_ccc_hardlist"] = {
				["name"] = "五星高难表",
				["text"] = {
					"{C:mult}+#1#{} 倍率",
					"每买一个小丑或一个补给包，",
					"减少 {C:mult}-#2#{} 倍率",
				},
			},
			["j_ccc_hyperdash"] = {
				["name"] = "超级冲刺",
				["text"] = {
					"在弃掉一手包含{C:attention}两对{}的手牌后，",
					"下一次打出的手牌获得 {X:mult,C:white} X#1# {} 倍率",
				},
			},
			["j_ccc_lapidary"] = {
				["name"] = "宝石工匠",
				["text"] = {
					"具有{C:attention}独特稀有度{}的小丑",
					"各自提供 {X:mult,C:white}X#1#{} 倍率",
				},
			},
			["j_ccc_pico8joker"] = {
				["name"] = "PICO-8 小丑",
				["text"] = {
					"重新触发打出的",
					"每张 {C:attention}A{}、{C:attention}8{} 或 {C:attention}6{}",
				},
			},
			["j_ccc_miniheart"] = {
				["name"] = "迷你之心",
				["text"] = {
					"在计分前，有 {C:green}#1#/#2#{} 几率",
					"为计分牌增加{C:dark_edition}闪箔{}版本",
				},
			},
			["j_ccc_thelastjoker"] = {
				["name"] = "最后一件事",
				["text"] = {
					"???",
				},
			},
			["j_ccc_kevin"] = {
				["name"] = "凯文",
				["text"] = {
					"计分的{C:attention}人头牌{}充当",
					"打出的{C:attention}最右边{}卡牌的副本",
				},
			},
			["j_ccc_slightmiscalculation"] = {
				["name"] = "微小的计算误差",
				["text"] = {
					"如果{C:attention}计分手牌{}的起始与结尾点数",
					"{C:attention}相同{}，提供 {C:mult}+#1#{} 倍率",
					"{C:inactive}(示例：3, 7, 7, 3)",
				},
			},
			["j_ccc_crystalheart"] = {
				["name"] = "水晶之心",
				["text"] = {
					"如果打出的手牌是单张",
					"{C:hearts}红桃A{}，则为手牌中的",
					"{C:attention}#1#{} 张牌应用随机版本",
					"{C:inactive,s:0.87}(不受重新触发影响){}",
				},
			},
		},
		["Voucher"] = {
			["v_ccc_gondola"] = {
				["name"] = "快速通道",
				["text"] = {
					"{C:attention}+1{} 底注",
					"盲注所需筹码减少 {C:red}30%{}",
				},
			},
			["v_ccc_feather"] = {
				["name"] = "正念",
				["text"] = {
					"盲注所需筹码减少 {C:red}30%{}",
				},
			},
		},
		["Edition"] = {
			["e_ccc_mirrored"] = {
				["label"] = "镜像",
				["name"] = "镜像",
				["text"] = {
					"如果存在一张{C:attention}镜子{}卡，",
					"则{C:attention}重新触发{}此牌，",
					"否则在回合结束时",
					"{C:red}自我销毁{}",
				},
			},
		},
		["Spectral"] = {
			["c_ccc_crystallic"] = {
				["name"] = "水晶化",
				["text"] = {
					"摧毁手牌中 {C:attention}#1#{} 张随机牌，",
					"随后为手中{C:attention}所有{}其他牌",
					"添加{C:dark_edition}镜像{}版本",
				},
			},
		},
	},
}
