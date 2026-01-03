return {
	["misc"] = {
		["labels"] = {
			["splat_goldenegg_seal"] = "黄金蛋封印",
			["splat_order_seal"] = "秩序封印",
		},
		["dictionary"] = {
			["k_plus_chip"] = "+1 彩色筹码",
			["k_c_chip_pack"] = "筹码包",
			["k_spectrum_chip"] = "光谱筹码",
			["k_double_st"] = "双倍！",
		},
	},
	["descriptions"] = {
		["Joker"] = {
			["j_splat_the_company"] = {
				["name"] = "公司",
				["text"] = {
					"对回合{C:attention}最后一手{}中的",
					"{C:attention}1 张牌{}应用{C:money}黄金蛋封印{}",
					"对每个剩余的{C:chips}出牌阶段",
					"重复此效果",
				},
			},
			["j_splat_subject_3"] = {
				["name"] = "3号实验体",
				["text"] = {
					"在{C:attention}2 回合{}后{C:money}出售{}此牌，",
					"将手牌中所有牌强化为",
					"{C:attention}哺乳卡{}",
					"{C:inactive}(#1#/2)",
				},
			},
			["j_splat_savior"] = {
				["name"] = "救世主",
				["text"] = {
					"在回合的{C:attention}第一手牌{}后，",
					"所有打出的{V:1}#1#{}",
					"变为{C:attention}净化卡{}",
					"{s:0.8}花色在回合结束时改变",
				},
			},
			["j_splat_portal"] = {
				["name"] = "传送门",
				["text"] = {
					"对所有与最常出现的",
					"点数相同的打出牌",
					"应用{C:attention}秩序封印{}",
					"{s:0.8}(例:K,K,10,10,10 = 所有10获得封印)",
				},
			},

			["j_splat_free_association"] = {
				["name"] = "自由联想",
				["text"] = {
					"每持有一个{C:splat_chip}彩色筹码{}，",
					"此小丑在回合结束时",
					"获得{C:red}+#2#{}倍率",
					"{C:inactive}(当前{C:red}+#1#{C:inactive} 倍率)",
				},
			},
			["j_splat_infinity_ball"] = {
				["name"] = "无限球",
				["text"] = {
					"每打出{C:chips}一手牌{}，",
					"此小丑获得{C:chips}+#2#{}筹码",
					"当有牌被{C:red}弃置{}时{C:red}重置{}",
					"{C:inactive}(当前{C:chips}+#1#{C:inactive} 筹码)",
				},
			},

			["j_splat_saturation"] = {
				["name"] = "饱和",
				["text"] = {
					"若回合{C:attention}最后一手牌{}",
					"包含{C:attention}同花{}，",
					"创建一个随机{C:splat_chip}彩色筹码{}",
					"{C:inactive}(需有空间)",
				},
			},

			["j_splat_vending_machine"] = {
				["name"] = "自动售货机",
				["text"] = {
					"击败{C:attention}Boss 盲注{}后，",
					"支付{C:money}$#1#{}将最左侧",
					"消耗品变为{C:dark_edition}负片{}",
					"{C:inactive,s:0.5}(破产时不触发)",
				},
			},

			["j_splat_turbine"] = {
				["name"] = "涡轮塔",
				["text"] = {
					"若{C:attention}盲注分数{}超过",
					"要求分数的{C:attention}133%{}，",
					"回合{C:attention}结束{}时获得{C:money}$#1#{}",
				},
			},

			["j_splat_spire_hack"] = {
				["name"] = "尖塔黑客",
				["text"] = {
					"每个持有的{C:attention}消耗品{}",
					"在回合结束时都有{C:green}#1#/#2#{}",
					"几率变为{C:splat_chip}彩色筹码{}",
					"{C:inactive}(版本转移)",
				},
			},

			["j_splat_pearl_drone"] = {
				["name"] = "珍珠无人机",
				["text"] = {
					"每在本局游戏中",
					"{C:money}出售{}或{C:red}摧毁{}一个",
					"{C:splat_chip}彩色筹码{}，",
					"获得{C:dark_edition}+1{} 消耗品栏位",
					"{C:inactive}(当前+#1# 栏位)",
				},
			},
		},
		["Enhanced"] = {
			["m_splat_mammalized"] = {
				["name"] = "哺乳卡",
				["text"] = {
					"每持有一个{C:attention}哺乳卡{}，",
					"{C:attention}重触发{}一次",
				},
			},
			["m_splat_sanitized"] = {
				["name"] = "净化卡",
				["text"] = {
					"{X:chips,C:white}X#1#{} 筹码",
					"被打出{C:attention}5{}次后",
					"{C:red}销毁{}",
					"{C:inactive}(#2#/5)",
				},
			},
		},
		["Spectral"] = {
			["c_splat_overtime"] = {
				["name"] = "加班",
				["text"] = {
					"对{C:attention}#1#{}张",
					"选中的牌应用",
					"{C:money}黄金蛋封印{}",
				},
			},
			["c_splat_conformity"] = {
				["name"] = "从众",
				["text"] = {
					"对{C:attention}#1#{}张",
					"选中的牌应用",
					"{C:attention}秩序封印{}",
				},
			},
		},
		["Tarot"] = {
			["c_splat_apocalypse"] = {
				["name"] = "启示录",
				["text"] = {
					"将{C:attention}#1#{}张选中的牌",
                    "强化为{C:attention}哺乳卡{}",
				},
			},
			["c_splat_cleansing"] = {
				["name"] = "净化",
				["text"] = {
					"将{C:attention}#1#{}张选中的牌",
                    "强化为{C:attention}净化卡{}",
				},
			},
			["c_splat_mission"] = {
				["name"] = "任务",
				["text"] = {
					"创建{C:attention}#1#{}个{C:splat_chip}彩色筹码{}",
                    "{C:inactive}(需有空间){}",
				},
			},
		},
		["Back"] = {
			["b_splat_spire_deck"] = {
				["name"] = "尖塔牌组",
				["text"] = {
					"开局携带{C:splat_chip,T:v_splat_palette}调色板{}优惠券，",
                    "每击败第{C:attention}三{}个",
					"{C:attention}Boss 盲注{}后，",
					"获得{C:dark_edition}+1 消耗品栏位{}",
					"{C:attention}+1{} 胜利需提高Ante",
				},
			},
		},
		["Tag"] = {
			["tag_splat_chip_tag"] = {
				["name"] = "筹码标签",
				["text"] = {
					"创建一个",
					"{C:splat_chip}大型筹码包{}",
				},
			},
		},
		["Voucher"] = {
			["v_splat_palette"] = {
				["name"] = "调色板",
				["text"] = {
					"{C:dark_edition}+#1#{} 消耗品栏位",
				},
			},

			["v_splat_acht"] = {
				["name"] = "八号",
				["text"] = {
					"击败{C:attention}Boss 盲注{}后，",
					"1个随机持有的",
					"{C:splat_chip}彩色筹码{}变为",
					"{C:dark_edition}负片{}",
				},
			},

			["v_splat_cipher"] = {
				["name"] = "密码",
				["text"] = {
					"{C:splat_chip}彩色筹码{}",
					"可以出现在{C:money}商店{}中",
				},
			},

			["v_splat_lockers"] = {
				["name"] = "储物柜",
				["text"] = {
					"生成的{C:splat_chip}彩色筹码{}",
					"带有随机{C:dark_edition}版本{}",
				},
			},
		},
		["c_chip"] = {
			["c_splat_power_CC"] = {
				["name"] = "力量-CC",
				["text"] = {
					"提供{X:mult,C:white}X1{} 倍率，",
					"加上{C:attention}打出手中{}每张牌",
					"提供的{X:mult,C:white}X#1#{} 倍率",
					"{s:0.8}(例:A,A,2,2 = X1.8 倍率)",
				},
			},
			["c_splat_power_D4"] = {
				["name"] = "力量-D4",
				["text"] = {
					"每打出一张{C:attention}3{}或{C:attention}8{}，",
					"每个持有的{C:splat_chip}彩色筹码{}",
					"提供{C:mult}+#1#{} 倍率",
				},
			},
			["c_splat_power_E3"] = {
				["name"] = "力量-E3",
				["text"] = {
					"如果得分筹码低于",
					"要求分数的{C:attention}50%{}，",
					"提供{C:blue}+#1#{} 筹码",
				},
			},

			["c_splat_mobility_FF"] = {
				["name"] = "机动-FF",
				["text"] = {
					"当使用第一个{C:blue}出牌{}或{C:red}弃牌{}时，",
					"获得另一个的{C:attention}+#1#{}",
					"{C:inactive}(每个盲注只生效一次)",
				},
			},

			["c_splat_mobility_A3"] = {
				["name"] = "机动-A3",
				["text"] = {
					"跳过{C:attention}#2#{}个盲注后，",
					"将{C:attention}Ante{}降低{C:attention}1{}",
					"{C:inactive}(#1#/#2#)",
				},
			},

			["c_splat_mobility_6A"] = {
				["name"] = "机动-6A",
				["text"] = {
					"回合{C:attention}结束{}时，",
					"每剩余一个{C:blue}出牌{}，",
					"获得{C:money}+$#1#{}",
				},
			},

			["c_splat_lucky_FF"] = {
				["name"] = "幸运-FF",
				["text"] = {
					"每张打出的牌都有{C:green}#1#/#2#{}几率",
					"给予{C:money}$3{}",
				},
			},

			["c_splat_lucky_AF"] = {
				["name"] = "幸运-AF",
				["text"] = {
					"回合结束时，有{C:green}#1#/#2#{}几率",
					"创建一个随机{C:splat_chip}彩色筹码{}",
					"{C:inactive}(需有空间)",
				},
			},

			["c_splat_lucky_78"] = {
				["name"] = "幸运-78",
				["text"] = {
					"有{C:green}#1#/#2#{}几率",
					"给予{X:mult,C:white}X#3#{} 倍率",
					"{C:inactive,S:0.7}触发后几率和奖励随机变化",
				},
			},

			["c_splat_drone_DD"] = {
				["name"] = "无人机-DD",
				["text"] = {
					"回合结束时",
                    "创建一张{C:tarot}塔罗牌{}",
                    "{C:inactive}(需有空间)",
				},
			},
			["c_splat_drone_CA"] = {
				["name"] = "无人机-CA",
				["text"] = {
					"回合结束时，",
					"创建上一手{C:attention}牌型{}的",
					"{C:planet}行星牌{}",
                    "{C:inactive}(需有空间)",
				},
			},
			["c_splat_drone_F2"] = {
				["name"] = "无人机-F2",
				["text"] = {
					"回合结束时",
                    "创建一张{C:spectral}幽灵牌{}",
                    "{C:inactive}(需有空间)",
				},
			},
			["c_splat_range_FC"] = {
				["name"] = "范围-FC",
				["text"] = {
					"{C:attention}+#1#{} 手牌上限",
				},
			},

			["c_splat_range_9A"] = {
				["name"] = "范围-9A",
				["text"] = {
					"商店中",
					"{C:attention}+1{} 个卡牌位",
				},
			},

			["c_splat_range_8F"] = {
				["name"] = "范围-8F",
				["text"] = {
					"{C:attention}+#1#{} 选牌上限",
				},
			},

			["c_splat_support_FF"] = {
				["name"] = "支援-FF",
				["text"] = {
					"回合{C:attention}结束{}时，",
					"清除{C:red}债务{}并",
					"获得{C:money}+$#1#{}",
				},
			},

			["c_splat_support_AA"] = {
				["name"] = "支援-AA",
				["text"] = {
					"{C:dark_edition}+#1#{} 消耗品栏位",
				},
			},

			["c_splat_support_A5"] = {
				["name"] = "支援-A5",
				["text"] = {
					"{C:dark_edition}+#1#{} 小丑栏位",
				},
			},

			["c_splat_power_S1"] = {
				["name"] = "力量-S1",
				["text"] = {
					"每个持有的{C:attention}消耗品{}",
					"提供{X:chips,C:white}X#1#{} 筹码和{X:mult,C:white}X#1#{} 倍率",
				},
			},

			["c_splat_mobility_S2"] = {
				["name"] = "机动-S2",
				["text"] = {
					"本局游戏中每跳过{C:attention}1{}个盲注，",
					"提供{C:dark_edition}+1{} 手牌上限",
					"{C:inactive}(当前+#1# 手牌上限)",
				},
			},

			["c_splat_lucky_S3"] = {
				["name"] = "幸运-S3",
				["text"] = {
					"将所有{C:attention}列出的{C:green,E:1,S:1.1}几率{}翻倍",
					"{C:inactive}(例: {C:green}1/3{C:inactive} -> {C:green}2/3{C:inactive})",
					"回合结束时，有{C:green}25%{}几率",
					"再次将{C:green,E:1,S:1.1}几率{}翻倍",
				},
			},

			["c_splat_drone_S4"] = {
				["name"] = "无人机-S4",
				["text"] = {
					"回合结束时，",
					"相邻的消耗品变为{C:dark_edition}负片{}",
				},
			},

			["c_splat_range_S5"] = {
				["name"] = "无人机-S5",
				["text"] = {
					"每持有一个{C:splat_chip}彩色筹码{}，",
					"{C:attention}重触发{}所有打出的牌一次",
				},
			},

			["c_splat_support_S6"] = {
				["name"] = "支援-S6",
				["text"] = {
					"击败{C:attention}#2#{}个Boss盲注后，",
					"{C:dark_edition}-#1#{} Ante",
				},
			},
		},
		["Other"] = {
			["splat_goldenegg_seal"] = {
				["label"] = "黄金蛋封印",
				["name"] = "黄金蛋封印",
				["text"] = {
					"打出手中每有",
					"一个{C:money}黄金蛋封印{}，",
					"提供{C:blue}+#1#{} 筹码和{X:chips,C:white}X#2#{} 筹码",
				},
			},

			["golden_s_egg"] = {
				["name"] = "黄金蛋封印",
				["text"] = {
					"打出手中每有",
					"一个{C:money}黄金蛋封印{}，",
					"提供{C:blue}+5{} 筹码和{X:chips,C:white}X1.05{} 筹码",
				},
			},
			["splat_order_seal"] = {
				["label"] = "秩序封印",
				["name"] = "秩序封印",
				["text"] = {
					"若{C:attention}打出牌型{}包含",
					"{C:attention}顺子{}或{C:attention}同花{}，",
					"提供{X:mult,C:white}X#1#{} 倍率",
				},
			},
			["splat_s_conformity"] = {
				["label"] = "秩序封印",
				["name"] = "秩序封印",
				["text"] = {
					"若{C:attention}打出牌型{}包含",
					"{C:attention}顺子{}或{C:attention}同花{}，",
					"提供{X:mult,C:white}X1.25{} 倍率",
				},
			},
			["p_splat_chip_normal_1"] = {
				["name"] = "筹码包",
				["text"] = {
					"选择最多{C:attention}#2#{C:splat_chip}个彩色筹码{}中的",
					"{C:attention}#1#{}个",
                    "添加到你的消耗品中",
				},
			},
			["p_splat_chip_normal_2"] = {
				["name"] = "筹码包",
				["text"] = {
					"选择最多{C:attention}#2#{C:splat_chip}个彩色筹码{}中的",
					"{C:attention}#1#{}个",
                    "添加到你的消耗品中",
				},
			},
			["p_splat_chip_jumbo_1"] = {
				["name"] = "大型筹码包",
				["text"] = {
					"选择最多{C:attention}#2#{C:splat_chip}个彩色筹码{}中的",
					"{C:attention}#1#{}个",
                    "添加到你的消耗品中",
				},
			},
			["p_splat_chip_jumbo_2"] = {
				["name"] = "大型筹码包",
				["text"] = {
					"选择最多{C:attention}#2#{C:splat_chip}个彩色筹码{}中的",
					"{C:attention}#1#{}个",
                    "添加到你的消耗品中",
				},
			},
			["p_splat_chip_mega_1"] = {
				["name"] = "巨型筹码包",
				["text"] = {
					"选择最多{C:attention}#2#{C:splat_chip}个彩色筹码{}中的",
					"{C:attention}#1#{}个",
                    "添加到你的消耗品中",
				},
			},
		},
	},
}
