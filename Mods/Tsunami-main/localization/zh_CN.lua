return {
	["misc"] = {
		["dictionary"] = {
			["k_probability_tm"] = "幸运！",
			["k_enhance_tm"] = "已强化！",
			["k_change_tm"] = "变化！",

			["k_tsun_leg_fusion"] = "传奇融合",
			["k_tsun_gold_fusion"] = "黄金融合",
			["k_tsun_gold_legendary"] = "黄金传奇融合",

			["k_mariesave"] = "被黄金玛丽拯救",
			["k_yu_cut"] = "斩断！",

			["k_rise_disable"] = "我来掩护你！",
			["k_rise_random"] = "随机增益：",
			["k_rise_failed"] = "未能给予增益，或增益无有效目标",
			["k_rise_final_heart"] = "此卡的所有增益翻倍",
			["k_rise_final_acorn"] = "创建一个随机拥有小丑的负片副本（Rise除外）",
			["k_chie_followup"] = "追击",
		},
		["v_dictionary"] = {
			["k_rise_hand"] = "+#1# 出牌",
			["k_rise_handsize"] = "+#1# 手牌上限",
			["k_rise_discard"] = "+#1# 弃牌",
			["k_rise_money"] = "每Ante在Boss盲注被击败时获得+$#1#",
			["k_rise_minus_ante"] = "-#1# Ante",
			["k_rise_pokerhand"] = "回合结束时创建#1#张上一手牌型的负片行星牌",
			["k_rise_pokerhand2"] = "将最常打出的牌型升级#1#次",
			["k_rise_psychic"] = "+#1# 选牌上限",
			["k_rise_retrigger_h"] = "红桃额外重触发#1#次",
			["k_rise_retrigger_s"] = "黑桃额外重触发#1#次",
			["k_rise_retrigger_d"] = "方片额外重触发#1#次",
			["k_rise_retrigger_c"] = "梅花额外重触发#1#次",

			["k_rise_minus_vessel"] = "-#1# Ante，胜利需提高-#1# Ante",
			["k_rise_card_xmult"] = "打出的牌提供X#1#倍率",
		},
		["achievement_names"] = {
			ach_tsun_splash_fan = "水花粉丝",
			ach_tsun_invest_team = "特别搜查队",
			ach_tsun_true_ending = "真结局",
			ach_tsun_min_wage = "最低工资",
			ach_tsun_solo_performance = "独奏演出",
			ach_tsun_dragon_trial = "[尚未实现]",
		},
		["achievement_descriptions"] = {
			ach_tsun_splash_fan = "让Splash进入你的使用次数前十名小丑",
			ach_tsun_invest_team = "同时拥有全部5个原版传奇融合",
			ach_tsun_true_ending = "只使用Yu、Mary和不超过普通稀有度的其他小丑赢得一局",
			ach_tsun_min_wage = "在负债低于$100时带着Yosuke离开商店",
			ach_tsun_solo_performance = "只用Rise没有任何其他小丑赢得一轮",
			ach_tsun_dragon_trial = "滚出去！！！滚出~~~~去！！！滚~~~~出~~~~~~~~去！！！！！！！！！！！！！！！！！！！",
		},
	},
	["descriptions"] = {
		["Back"] = {
			["b_tsun_splashdeck"] = {
				["name"] = "水花牌组",
				["text"] = {
					"开局拥有2张{C:dark_edition}负片{}{C:attention}永恒{}",
					'的{C:blue,T:j_splash}水花{}副本和{C:attention}$5{}',
				},
			},
			["b_tsun_floatiedeck"] = {
				["name"] = "漂浮牌组",
				["text"] = {
					"{C:blue}+#1# 出牌{}，",
					"{C:red}+#1# 弃牌{}，",
					"{C:attention}+#2# 手牌上限{}，",
					"{C:attention}+#2# 消耗品栏位",
					"{C:dark_edition}+#2# 小丑栏位",
					"{C:attention}+#3# 胜利需提高Ante",
				},
			},
		},
		["Sleeve"] = {
			["sleeve_tsun_splash"] = {
				["name"] = "水花牌套",
				["text"] = {
					"开局拥有2张{C:dark_edition}负片{}{C:attention}永恒{}",
					'的{C:blue,T:j_splash}水花{}副本和{C:attention}$5{}',
				},
			},
			["sleeve_tsun_floatiesleeve"] = {
				["name"] = "漂浮牌套",
				["text"] = {
					"{C:blue}+#1# 出牌{}，",
					"{C:red}+#1# 弃牌{}，",
					"{C:attention}+#2# 手牌上限{}，",
					"{C:attention}+#2# 消耗品栏位",
					"{C:dark_edition}+#2# 小丑栏位",
					"{C:attention}+#3# 胜利需提高Ante",
				},
			},
			["sleeve_tsun_splash_alt_red"] = {
				["name"] = "水花牌套 | 红色牌组",
				["text"] = {
					"开局拥有2张{C:dark_edition}负片{}{C:attention}永恒{}{C:blue,T:j_splash}水花{}和{C:money}$5{}",
					"在{C:attention}盲注{}期间出售{C:blue}水花{}获得{C:attention}1{}个临时{C:red}弃牌",
				},
			},
			["sleeve_tsun_splash_alt_blue"] = {
				["name"] = "水花牌套 | 蓝色牌组",
				["text"] = {
					"开局拥有2张{C:dark_edition}负片{}{C:attention}永恒{}{C:blue,T:j_splash}水花{}和{C:money}$5{}",
					"在{C:attention}盲注{}期间出售{C:blue}水花{}获得{C:attention}1{}个临时{C:blue}出牌",
				},
			},
			["sleeve_tsun_splash_alt_yellow"] = {
				["name"] = "水花牌套 | 黄色牌组",
				["text"] = {
					"开局拥有2张{C:dark_edition}负片{}{C:attention}永恒{}{C:blue,T:j_splash}水花{}和{C:money}$5{}",
					"{C:blue}水花{}在回合结束时获得{C:money}$2{}",
				},
			},
			["sleeve_tsun_splash_alt_green"] = {
				["name"] = "水花牌套 | 绿色牌组",
				["text"] = {
					"开局拥有2张{C:dark_edition}负片{}{C:attention}永恒{}{C:blue,T:j_splash}水花{}和{C:money}$5{}",
					"且{C:attention}0{} 利息上限",
					"出售{C:blue}水花{}使{C:attention}利息上限{}增加{C:attention}1{}",
				},
			},
			["sleeve_tsun_splash_alt_black"] = {
				["name"] = "水花牌套 | 黑色牌组",
				["text"] = {
					"开局拥有2张{C:dark_edition}负片{}{C:attention}永恒{}{C:blue,T:j_splash}水花{}和{C:money}$5{}",
					"{C:blue}水花{}提供{C:dark_edition}+1 小丑栏位{}",
				},
			},
			["sleeve_tsun_splash_alt_magic"] = {
				["name"] = "水花牌套 | 魔法牌组",
				["text"] = {
					"开局拥有2张{C:dark_edition}负片{}{C:attention}永恒{}{C:blue,T:j_splash}水花{}和{C:money}$5{}",
					"使用{C:tarot}塔罗牌{}时创建{C:blue}水花{}",
					"{C:inactive}(需有空间)",
				},
			},
			["sleeve_tsun_splash_alt_nebula"] = {
				["name"] = "水花牌套 | 星云牌组",
				["text"] = {
					"开局拥有2张{C:dark_edition}负片{}{C:attention}永恒{}{C:blue,T:j_splash}水花{}和{C:money}$5{}",
					"使用{C:planet}行星牌{}时创建{C:blue}水花{}",
					"{C:inactive}(需有空间)",
				},
			},
			["sleeve_tsun_splash_alt_ghost"] = {
				["name"] = "水花牌套 | 幽灵牌组",
				["text"] = {
					"开局拥有2张{C:dark_edition}负片{}{C:attention}永恒{}{C:blue,T:j_splash}水花{}和{C:money}$5{}",
					"使用{C:spectral}幽灵牌{}时创建",
					"一张{C:dark_edition}闪箔{}、{C:dark_edition}全息{}或{C:dark_edition}多彩{}",
					"{C:blue,T:j_splash}水花{}",
					"{C:inactive}(需有空间)",
				},
			},
			["sleeve_tsun_splash_alt_abandoned"] = {
				["name"] = "水花牌套 | 遗弃牌组",
				["text"] = {
					"开局拥有2张{C:dark_edition}负片{}{C:attention}永恒{}{C:blue}水花{}",
					"且牌组中没有{C:attention}2{}或{C:attention}3{}",
				},
			},
			["sleeve_tsun_splash_alt_checkered"] = {
				["name"] = "水花牌套 | 方格牌组",
				["text"] = {
					"开局拥有2张{C:dark_edition}负片{}{C:attention}永恒{}{C:blue,T:j_splash}水花{}和{C:money}$5{}",
					"打出{C:attention}同花{}时创建{C:blue}水花{}",
					"{C:inactive}(需有空间)",
				},
			},
			["sleeve_tsun_splash_alt_zodiac"] = {
				["name"] = "水花牌套 | 星座牌组",
				["text"] = {
					"开局拥有2张{C:dark_edition}负片{}{C:attention}永恒{}{C:blue,T:j_splash}水花{}和{C:money}$5{}",
					"可以从{C:purple}塔罗{}和{C:planet}行星包{}中",
					"{C:attention}多选1张牌{}",
				},
			},
			["sleeve_tsun_splash_alt_painted"] = {
				["name"] = "水花牌套 | 彩绘牌组",
				["text"] = {
					"开局拥有2张{C:dark_edition}负片{}{C:attention}永恒{}{C:blue,T:j_splash}水花{}和{C:money}$5{}",
					"{C:blue}水花{}提供{C:dark_edition}+1 选牌上限{}",
				},
			},
			["sleeve_tsun_splash_alt_anaglyph"] = {
				["name"] = "水花牌套 | 立体牌组",
				["text"] = {
					"开局拥有2张{C:dark_edition}负片{}{C:attention}永恒{}{C:blue,T:j_splash}水花{}和{C:money}$5{}",
					"每{C:attention}20张额外得分牌{}",
					"创建一个{C:attention}双倍标签{}",
					"{C:inactive}(#3#/20)",
				},
			},
			["sleeve_tsun_splash_alt_plasma"] = {
				["name"] = "水花牌套 | 等离子牌组",
				["text"] = {
					"开局拥有2张{C:dark_edition}负片{}{C:attention}永恒{}{C:blue,T:j_splash}水花{}和{C:money}$5{}",
					"{C:dark_edition}平衡{}额外得分牌的{C:attention}点数{}",
				},
			},
			["sleeve_tsun_splash_alt_erratic"] = {
				["name"] = "水花牌套 | 不稳定牌组",
				["text"] = {
					"开局拥有2张{C:dark_edition}负片{}{C:attention}永恒{}{C:blue,T:j_splash}水花{}和{C:money}$5{}",
					"且2个带有{C:blue}水花{C:黄色}融合的",
					"随机{C:attention}小丑{}",
				},
			},
			["sleeve_tsun_splash_alt_floatie"] = {
				["name"] = "水花牌套 | 漂浮牌组",
				["text"] = {
					"开局拥有2张{C:dark_edition}负片{}{C:attention}永恒{}{C:blue,T:j_splash}水花{}和{C:money}$5{}",
					"{C:attention}+1{} 选牌上限",
					"回合结束时每拥有{C:money}$5{}获得{C:money}$1{}利息",
				},
			},
			["sleeve_tsun_splash_alt_sdm_sdm0s"] = {
				["name"] = "水花牌套 | SDM_0的牌组",
				["text"] = {
					"开局拥有1张{C:dark_edition}负片{}{C:attention}永恒{}{C:blue,T:j_splash}水花{}",
					"和1张随机{C:attention}永恒{}{C:blue}水花{C:黄色}融合{}",
				},
			},
			["sleeve_tsun_splash_alt_sdm_bazaar"] = {
				["name"] = "水花牌套 | 集市牌组",
				["text"] = {
					"开局拥有2个随机{C:attention}非小丑{}{C:blue}海啸{}物品",
					"{C:inactive}(优惠券、标签、消耗品等)",
				},
			},
			["sleeve_tsun_splash_alt_sdm_sandbox"] = {
				["name"] = "水花牌套 | 沙盒牌组",
				["text"] = {
					"开局携带{C:blue,T:v_tsun_water_supply}水源{}优惠券",
					"和两张{C:dark_edition}负片{}{C:purple,T:c_tsun_aeon}永恒{}",
				},
			},
			["sleeve_tsun_splash_alt_sdm_lucky7"] = {
				["name"] = "水花牌套 | 幸运7牌组",
				["text"] = {
					"开局拥有{C:attention}永恒{}{C:money,T:j_tsun_g_ship}赌博船{}",
					"每张初始{C:attention}A{}都是{C:attention,T:m_lucky}幸运牌{}",
				},
			},
			["sleeve_tsun_splash_alt_sdm_hiero"] = {
				["name"] = "水花牌套 | 象形牌组",
				["text"] = {
					"可以从{C:spectral}幽灵包{}中",
					"{C:attention}多选1张牌{}",
					"开局携带{C:spectral,T:c_polymorph}变形怪{}",
				},
			},
			["sleeve_tsun_splash_alt_sdm_dna"] = {
				["name"] = "水花牌套 | DNA牌组",
				["text"] = {
					"当{C:blue,T:j_splash}水花{C:黄色}融合{}",
					"被{C:attention}出售{}时，",
					"创建其{C:黄色}融合素材{}",
					"{C:inactive}(需有空间)",
				},
			},
			["sleeve_tsun_splash_alt_sdm_xxl"] = {
				["name"] = "水花牌套 | XXL牌组",
				["text"] = {
					"开局拥有2张{C:dark_edition}负片{}{C:attention}永恒{}{C:blue,T:j_splash}水花{}和{C:money}$5{}",
					"回合结束时每剩余一个{C:blue}出牌{}",
					"获得{C:money}+$1{}",
				},
			},
			["sleeve_tsun_splash_alt_sdm_hoarder"] = {
				["name"] = "水花牌套 | 囤积者牌组",
				["text"] = {
					"开局拥有2张{C:dark_edition}负片{}{C:attention}永恒{}{C:blue,T:j_splash}水花{}和{C:money}$5{}",
					"{C:blue}水花{}在回合结束时获得{C:money}$2{}",
				},
			},
			["sleeve_tsun_splash_alt_sdm_stuff"] = {
				["name"] = "水花牌套 | 万物牌组",
				["text"] = {
					"{C:dark_edition}结合{}所有{C:blue}水花牌套{}效果",
					"{C:inactive}(这个开局非常混乱...)",
				},
			},
			["sleeve_tsun_splash_alt_skh_tsaunami"] = {
				["name"] = "水花牌套 | 海啸牌组",
				["text"] = {
					"开局拥有2张{C:dark_edition}负片{}{C:attention}永恒{}{C:blue,T:j_splash}水花{}和{C:money}$5{}",
					"每拥有一个{C:blue}水花{}{C:money}融合{}，",
					"所有打出的牌重触发一次",
					"{s:0.8,C:inactive}我感觉...{s:0.8,C:legendary}完整{s:0.8,C:inactive}了！！！",
				},
			},
			["sleeve_tsun_floatie"] = {
				["name"] = "漂浮牌套",
				["text"] = {
					"{C:blue}+#1# 出牌{}，",
					"{C:red}+#1# 弃牌{}，",
					"{C:attention}+#2# 手牌上限{}，",
					"{C:attention}+#2# 消耗品栏位",
					"{C:dark_edition}+#2# 小丑栏位",
					"{C:attention}+#3# 胜利需提高Ante",
				},
			},
		},
		["Enhanced"] = {
			["m_tsun_waterproof"] = {
				["name"] = "防水卡",
				["text"] = {
					"若此卡被{C:blue}水花{}效果计分，",
					"获得{X:chips,C:white}X#1#{} 筹码",
				},
			},
		},
		["Other"] = {
			["goldmarie_whitestake"] = {
				["name"] = "白色筹码",
				["text"] = {
					"回合结束时",
					"创建{C:tarot}永恒{}",
					"{C:inactive}(需有空间)",
				},
			},
			["goldmarie_redstake"] = {
				["name"] = "红色筹码",
				["text"] = {
					"{C:attention}额外得分牌{}",
					"变为{C:blue}防水卡{}",
				},
			},
			["goldmarie_greenstake"] = {
				["name"] = "绿色筹码",
				["text"] = {
					"{C:tarot}永恒{}额外创建",
					"1个{C:blue}水花{}",
				},
			},
			["goldmarie_blackstake"] = {
				["name"] = "黑色筹码",
				["text"] = {
					"回合结束时，",
					"所有{C:blue}水花{}变为{C:dark_edition}负片{}",
					"融合时此小丑变为",
					"{C:dark_edition}负片{}且{C:attention}永恒{}",
				},
			},
			["goldmarie_bluestake"] = {
				["name"] = "蓝色筹码",
				["text"] = {
					"若你拥有{C:blue}水花{}，",
					"当分数至少为要求筹码的",
					"{C:attention}25%{}时，{C:red}防止{}死亡",
					"然后{C:red}摧毁{}所有{C:blue}水花{}",
					"{C:attention}{s:0.7}永恒{C:blue}{s:0.7}水花{}{s:0.7}失去{C:attention}{s:0.7}永恒{}{s:0.7}代替",
				},
			},
			["goldmarie_purplestake"] = {
				["name"] = "紫色筹码",
				["text"] = {
					"基础能力{X:mult,C:white}{C:red}倍率{}",
					"{X:dark_edition,C:white}X1.5{} 提升",
				},
			},
			["goldmarie_orangestake"] = {
				["name"] = "橙色筹码",
				["text"] = {
					"每张{C:attention}打出{}的牌",
					"都算作",
					"{C:attention}额外得分牌{}",
				},
			},
			["goldmarie_goldstake"] = {
				["name"] = "金色筹码",
				["text"] = {
					"每张额外得分牌",
					"为每个{C:blue}水花{}",
					"或{C:blue}水花{C:黄色}融合{}",
					"提供{X:mult,C:white}X1.5{} 倍率",
					"{C:inactive+}{s:0.7}(乘法叠加)",
				},
			},

			["goldyosuke_whitestake"] = {
				["name"] = "白色筹码",
				["text"] = {
					"回合结束时",
					"创建{C:tarot}魔术师{}",
					"{C:inactive}(需有空间)",
				},
			},
			["goldyosuke_redstake"] = {
				["name"] = "红色筹码",
				["text"] = {
					"剩余的{C:red}弃牌{}",
					"在回合结束时",
					"计入{C:attention}额外得分牌{}",
				},
			},
			["goldyosuke_greenstake"] = {
				["name"] = "绿色筹码",
				["text"] = {
					"所有{C:attention}列出的{C:green,E:1,S:1.1}几率{}",
					"都{C:attention}+1{}",
					"{C:inactive,S:0.5}(例: {C:green}2/10{C:inactive} -> {C:green}3/10{C:inactive})",
				},
			},
			["goldyosuke_blackstake"] = {
				["name"] = "黑色筹码",
				["text"] = {
					"所有{C:attention}列出的",
					"{C:green,E:1,S:1.1}几率{}翻倍",
					"融合时此小丑变为",
					"{C:dark_edition}负片{}且{C:attention}永恒{}",
				},
			},
			["goldyosuke_bluestake"] = {
				["name"] = "蓝色筹码",
				["text"] = {
					"{C:attention}强化包{}包含",
					"{C:attention}1{}张额外牌，",
					"{C:attention}强化包{}中",
					"{C:attention}+1{} 选择",
				},
			},
			["goldyosuke_purplestake"] = {
				["name"] = "紫色筹码",
				["text"] = {
					"{C:attention}+1{} 商店栏位",
					"商店中{C:attention}+1{} 包",
				},
			},
			["goldyosuke_orangestake"] = {
				["name"] = "橙色筹码",
				["text"] = {
					"从商店{C:money}购买{}的牌",
					"获得随机{C:dark_edition}版本{}",
				},
			},
			["goldyosuke_goldstake"] = {
				["name"] = "金色筹码",
				["text"] = {
					"{X:mult,C:white}{C:red}倍率{}数值",
					"{C:dark_edition}翻倍{}",
				},
			},

			["goldrise_whitestake"] = {
				["name"] = "白色筹码",
				["text"] = {
					"回合结束时",
					"创建{C:tarot}恋人{}",
					"{C:inactive}(需有空间)",
				},
			},
			["goldrise_redstake"] = {
				["name"] = "红色筹码",
				["text"] = {
					"打出的{C:attention}万能牌{}",
					"获得随机{C:attention}版本{}",
				},
			},
			["goldrise_greenstake"] = {
				["name"] = "绿色筹码",
				["text"] = {
					"每个商店",
					"{C:attention}+5{} {C:money}免费重掷{}",
				},
			},
			["goldrise_blackstake"] = {
				["name"] = "黑色筹码",
				["text"] = {
					"每个{C:attention}Boss 盲注{}后，",
					"将右侧小丑变为{C:dark_edition}负片{}",
					"融合时此小丑变为",
					"{C:dark_edition}负片{}且{C:attention}永恒{}",
				},
			},
			["goldrise_bluestake"] = {
				["name"] = "蓝色筹码",
				["text"] = {
					"每个{C:attention}Boss 盲注{}开始时，",
					"获得{C:blue}+2 出牌{}",
					"和{C:red}+2 弃牌{}",
				},
			},
			["goldrise_purplestake"] = {
				["name"] = "紫色筹码",
				["text"] = {
					"每跳过{C:attention}第4个{}盲注{C:inactive}[#2#/#3#]{}，",
					"{C:attention}重触发{}打出的{C:attention}万能牌{}一次",
					"{C:inactive}(#1# 次重触发)",
				},
			},
			["goldrise_orangestake"] = {
				["name"] = "橙色筹码",
				["text"] = {
					"{C:attention}Boss 盲注{}期间",
					"提供{X:mult,C:white}X10{} 倍率",
				},
			},
			["goldrise_goldstake"] = {
				["name"] = "金色筹码",
				["text"] = {
					"{C:dark_edition}翻倍{}所有",
					"{C:dark_edition}永久增益{}的效果",
				},
			},

			["goldchie_whitestake"] = {
				["name"] = "白色筹码",
				["text"] = {
					"每个{C:attention}Boss 盲注{}后",
					"创建{C:tarot}战车{}",
					"{C:inactive}(需有空间)",
				},
			},
			["goldchie_redstake"] = {
				["name"] = "红色筹码",
				["text"] = {
					"总是复制",
					"最左侧的消耗牌",
				},
			},
			["goldchie_greenstake"] = {
				["name"] = "绿色筹码",
				["text"] = {
					"创建{C:Spectral}幽灵牌{}时，",
					"有{C:green}#1#/#2#{}几率",
					"创建{C:dark_edition}灵魂{}",
				},
			},
			["goldchie_blackstake"] = {
				["name"] = "黑色筹码",
				["text"] = {
					"每个{C:attention}Boss 盲注{}后，",
					"将最左侧消耗牌变为{C:dark_edition}负片{}",
					"融合时此小丑变为",
					"{C:dark_edition}负片{}且{C:attention}永恒{}",
				},
			},
			["goldchie_bluestake"] = {
				["name"] = "蓝色筹码",
				["text"] = {
					"+{C:attention}1{} 消耗品栏位",
					"回合结束时创建",
					"{C:attention}1{}张额外牌",
				},
			},
			["goldchie_purplestake"] = {
				["name"] = "紫色筹码",
				["text"] = {
					"{C:attention}重触发{}所有",
					"打出或持有的",
					"{C:attention}钢卡{}",
				},
			},
			["goldchie_orangestake"] = {
				["name"] = "橙色筹码",
				["text"] = {
					"+{C:attention}1{} 手牌上限",
					"{C:tarot}战车{}",
					"可以多选择{C:attention}1{}张牌",
				},
			},
			["goldchie_goldstake"] = {
				["name"] = "金色筹码",
				["text"] = {
					"{C:dark_edition}银河飞踢{}",
				},
			},

		},
		["Joker"] = {
			["j_tsun_vaporwave"] = {
				["name"] = "蒸汽波",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"跳过{C:attention}盲注{}时获得{X:mult,C:white}X#2#{} 倍率",
					"每张额外得分牌使提升值增加{X:mult,C:white}X0.01{}",
					"{C:inactive}(当前{X:mult,C:white}X#1#{} 倍率)",
					"{s:0.7}{C:inactive}(回声+水花)",
				},
			},
			["j_tsun_watering_can"] = {
				["name"] = "喷壶",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"每有{C:attention}一种{}花色，",
					"提供{X:mult,C:white}X#1#{} 倍率",
					"{s:0.7}{C:inactive}(花盆+水花){}",
				},
			},
			["j_tsun_lunar_tides"] = {
				["name"] = "月球潮汐",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"每打出的{C:attention}Q{}提供{C:red}+#1#{} 倍率",
					"手牌中的{C:attention}Q{}提供{X:mult,C:white}X#2#{} 倍率",
					"{s:0.7}{C:inactive}(射月+水花){}",
				},
			},
			["j_tsun_ride_the_sub"] = {
				["name"] = "潜水之旅",
				["text"] = {
					"连续不打出{C:attention}额外得分牌{}的手数",
					"每手提供{C:mult}+#2#{} 倍率",
					"{C:inactive}(当前{C:mult}+#1#{C:inactive} 倍率)",
					"{s:0.7}{C:inactive}(乘车+水花){}",
				},
			},
			["j_tsun_ice_tray"] = {
				["name"] = "冰托盘",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"每有{C:red}一张{}从{C:attention}出牌上限{}中",
					"未打出的牌，提供{X:mult,C:white}X#1#{} 倍率",
					"{C:inactive,s:0.7}(例:如你可以打5张牌，但只打3张，X2 倍率)",
					"{s:0.7}{C:inactive}(小丑模板+水花)",
				},
			},
			["j_tsun_deepsea_diver"] = {
				["name"] = "深海潜水员",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"有{C:green}#1#/#2#{}几率{C:attention}升级{}打出牌型的等级",
					"当前手牌每有{C:attention}一张额外打出的牌{}，",
					"{C:green}分子{}增加{C:attention}1{}",
					"{s:0.7}{C:inactive}(太空小丑+水花)",
				},
			},
			["j_tsun_banana_tree"] = {
				["name"] = "香蕉树",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"此小丑提供{C:red}+#1#{} 倍率",
					"在打出{C:attention}#2#{C:inactive}[#3#]{}张{C:attention}额外得分牌{}后{C:attention}销毁{}",
					"{s:0.7}{C:inactive}(大麦克+水花){}",
				},
			},
			["j_tsun_rainstorm"] = {
				["name"] = "暴雨",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"整个牌组中每有{C:attention}一张9{}，",
					"提供{C:money}$#2#{}",
					"{C:inactive}(当前{C:money}$#1#{})",
					"每张额外打出{C:attention}的牌{}都有",
					"{C:green}#3#/#4#{}几率变为9",
					"{s:0.7}{C:inactive}(云端9+水花){}",
				},
			},
			["j_tsun_soup"] = {
				["name"] = "汤",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"此小丑提供{X:mult,C:white}X#1#{} 倍率",
					"每有一张{C:attention}额外得分牌{}，",
					"失去{X:mult,C:white}X#2#{} 倍率",
					"{s:0.7}{C:inactive}(拉面+水花){}",
				},
			},
			["j_tsun_smart_water"] = {
				["name"] = "智能水",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"打出的{C:attention}A{}提供{C:red}+#1#{}倍率{}和{C:blue}+#2#{}筹码{}",
					"{C:attention}强化A{}还提供{X:mult,C:white}X#3#{} 倍率",
					"{s:0.5}{C:inactive}RanaPerCnome绘制{}",
					"{s:0.7}{C:inactive}(学者+水花){}",
				},
			},
			["j_tsun_banana_plantation"] = {
				["name"] = "香蕉种植园",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"此小丑提供{X:mult,C:white}X#1#{} 倍率",
					"每打出一张{C:attention}额外得分牌{}，",
					"获得{X:mult,C:white}X#2#{} 倍率",
					"回合结束时，有{C:green}#3#/#4#{}几率销毁此牌",
					"{s:0.7}{C:inactive}(小黛西+水花)",
				},
			},
			["j_tsun_gold_tsunami_marie"] = {
				["name"] = "{C:tsun_gradient_gold}玛丽{}",
				["text"] = {
					{
						"每张{C:attention}打出的牌{}都计入得分",
						"{C:blue}水花{C:attention}融合{}和{C:blue}水花{}提供{X:mult,C:white}X#1#{} 倍率",
					},
					{
						"{C:tsun_gold4}根据{C:blue}水花的{}{C:tsun_gold4}筹码贴纸",
						"{C:tsun_gold4}提供额外效果",
						"{C:blue}水花的{C:tsun_gold4}筹码贴纸：{C:attention}#2# {C:inactive}(#3#/8)",
						"{C:inactive}{s:0.7}应用之前的筹码效果",
						"{s:0.5}{C:inactive}(玛丽黄金融合)",
					},
				},
			},
			["j_tsun_gold_tsunami_yosuke"] = {
				["name"] = "{C:tsun_gradient_gold}阳介{}",
				["text"] = {
					{
						"每张{C:attention}打出的牌{}都计入得分",
						"每{C:attention}#3#{C:inactive} [#2#]{}张{C:attention}额外打出的牌{}，",
						"获得{X:mult,C:white}X#4#{C:mult} 倍率{}",
						"将计数的{C:attention}额外打出的牌{}",
						"乘以{C:red}剩余弃牌数{}",
						"{C:inactive}当前{X:mult,C:white}X#1#{C:inactive} 倍率",
					},
					{
						"{C:tsun_gold4}根据{C:dark_edition}千枝的{}{C:tsun_gold4}筹码贴纸",
						"{C:tsun_gold4}提供额外效果",
						"{C:dark_edition}千枝的{C:tsun_gold4}筹码贴纸：{C:attention}#6# {C:inactive}(#5#/8)",
						"{C:inactive}{s:0.7}应用之前的筹码效果",
						"{s:0.5}{C:inactive}(阳介黄金融合)",
					},
				},
			},
			["j_tsun_gold_tsunami_rise"] = {
				["name"] = "{C:tsun_gradient_gold}赖世{}",
				["text"] = {
					{
						"每张{C:attention}打出的牌{}都计入得分",
						"禁用每个{C:attention}Boss 盲注{}的效果",
						"禁用{C:attention}Boss 盲注{}时，",
						"获得{C:dark_edition}永久增益{}",
					},
					{
						"{C:tsun_gold4}根据{C:dark_edition}雪二的{}{C:tsun_gold4}筹码贴纸",
						"{C:tsun_gold4}提供额外效果",
						"{C:dark_edition}雪二的{C:tsun_gold4}筹码贴纸：{C:attention}#3# {C:inactive}(#4#/8)",
						"上次增益：{C:dark_edition}#2##1#",
						"{s:0.5}{C:inactive}修改后的盲注给予其他盲注的随机增益",
						"{C:inactive}{s:0.7}应用之前的筹码效果",
						"{s:0.7}{C:inactive}(赖世黄金融合)",
					},
				},
			},
			["j_tsun_gold_tsunami_chie"] = {
				["name"] = "{C:tsun_gradient_gold}千枝{}",
				["text"] = {
					{
						"每张{C:attention}打出的牌{}都计入得分",
						"离开商店时，为你拥有的",
						"{C:attention}#1#{}张随机{C:attention}消耗牌{}",
						"创建{C:dark_edition}负片{}副本",
						"回合结束时，有{C:green}#2#/#3#{}几率",
						"创建一张随机{C:blue}幽灵牌{}，",
						"否则创建一张随机{C:purple}塔罗牌{}",
						"{C:inactive}(需有空间)",
					},
					{
						"{C:tsun_gold4}根据{C:dark_edition}阳介的{}{C:tsun_gold4}筹码贴纸",
						"{C:tsun_gold4}提供额外效果",
						"{C:dark_edition}阳介的{C:tsun_gold4}筹码贴纸：{C:attention}#5# {C:inactive}(#4#/8)",
						"{C:inactive}{s:0.7}应用之前的筹码效果",
						"{s:0.7}{C:inactive}(千枝黄金融合)",
					},
				},
			},

			["j_tsun_reflection"] = {
				["name"] = "倒影",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"每有一对{C:blue}梅花{}和",
					"一个{C:attention}非梅花{}花色，",
					"提供{X:mult,C:white}X#1#{} 倍率",
					"{C:attention}额外得分牌{}对此效果",
					"算作{C:attention}2张牌{}",
					"{s:0.7}{C:inactive}(双倍+水花){}",
				},
			},
			["j_tsun_escape_artist"] = {
				["name"] = "脱逃大师",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"{C:attention}额外打出的牌{}提供{C:blue}+#1#{} 筹码",
					"{C:attention}-#2#{} 手牌上限",
					"{s:0.7}{C:inactive}(特技演员+水花){}",
				},
			},
			["j_tsun_raft"] = {
				["name"] = "木筏",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"且计分后永久获得{C:chips}+#1#{} 筹码",
					"此效果对{C:attention}额外打出的牌{}",
					"应用{C:attention}两次{}",
					"{s:0.7}{C:inactive}(徒步旅行者+水花){}",
				},
			},
			["j_tsun_soaked_joker"] = {
				["name"] = "湿透的小丑",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"{C:attention}额外得分牌{}在计分时",
					"提供{C:red}+#1#{} 倍率",
					"{s:0.7}{C:inactive}(半价小丑+水花){}",
				},
			},
			["j_tsun_oil_spill"] = {
				["name"] = "漏油",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"{C:attention}额外得分牌{}在计分时，",
					"随机提供{C:red}+#1#{}到{C:red}+#2#{} 倍率",
					"{s:0.7}{C:inactive}(错版+水花){}",
				},
			},
			["j_tsun_money_laundering"] = {
				["name"] = "洗钱",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"你可以负债至多{C:money}-$#1#{}",
					"{C:attention}负债{}期间，每打出一张额外牌，",
					"获得{C:money}$#2#{}",
					"{s:0.7}{C:inactive}(信用卡+水花){}",
				},
			},
			["j_tsun_asset_liquidation"] = {
				["name"] = "资产清算",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"选择盲注后，获得{C:blue}+3 出牌{}并失去所有{C:red}弃牌{}",
					"当{C:money}金钱{}减少时，",
					"返还失去{C:money}金钱{}的一半",
					"每个Ante最多{C:attention}#2#{C:inactive}[#1#]{}次",
					"{s:0.7}{C:inactive}(窃贼+水花){}",
				},
			},
			["j_tsun_beach_ball"] = {
				["name"] = "沙滩球",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"打出的手牌每有{C:attention}一张额外得分牌{}，",
					"有{C:green}#1#/#2#{}几率创建一张{C:purple}塔罗牌{}",
					"{C:inactive}(需有空间)",
					"{s:0.7}{C:inactive}(8号球+水花){}",
				},
			},
			["j_tsun_youth"] = {
				["name"] = "青春之泉",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"打出的牌提供{X:mult,C:white}X#1#{} 倍率，除了{V:1}#4#{}",
					"{s:0.8}花色在回合结束时改变",
					"{s:0.5}{C:inactive}Creator.png绘制{}",
					"{s:0.7}{C:inactive}(远古小丑+水花){}",
				},
			},
			["j_tsun_magical_waterfall"] = {
				["name"] = "魔法瀑布",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"提供{C:red}+#1#{} 倍率，每有一张{C:attention}额外得分牌{}，",
					"此小丑获得{C:red}~#2#{} 倍率",
					"如果有超过{C:attention}1{}张{C:red}弃牌{}，",
					"{C:red}倍率{}输出被{C:attention}剩余弃牌数{}{C:attention}除{}",
					"{C:inactive}(当前{C:red}+#3#{C:inactive} 倍率)",
					"{s:0.7}{C:inactive}(神秘峰会+水花){}",
				},
			},
			["j_tsun_dihydrogen_monoxide"] = {
				["name"] = "一氧化二氢",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"每打出的{C:attention}一张{}A、{C:attention}2{}、{C:attention}3{}、{C:attention}5{}或{C:attention}8{}，",
					"为计分手牌中每张",
					"{C:attention}A{}、{C:attention}2{}、{C:attention}3{}、{C:attention}5{}或{C:attention}8{}",
					"提供{C:red}+#1#{} 倍率",
					"{s:0.7}{C:inactive}(斐波那契+水花){}",
				},
			},
			["j_tsun_webbed_feet"] = {
				["name"] = "蹼足",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"{C:attention}重触发{}所有{C:attention}人头牌{}",
					"和额外得分牌",
					"{C:attention}重触发{}额外得分的人头牌",
					"额外一次",
					"{s:0.7}{C:inactive}(面具与悲剧+水花){}",
				},
			},
			["j_tsun_gold_reflection"] = {
				["name"] = "{C:tsun_gradient_gold}倒影{}",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入{C:tsun_gold}得分{}",
					"每有一对{C:blue}梅花{}和",
					"一个{C:attention}非梅花{}花色，",
					"提供{X:mult,C:white}X#1#{} 倍率",
					"{C:attention}额外得分牌{}对此效果",
					"算作{C:attention}2张牌{}",
					"{C:tsun_gold4}重触发{}再次为效果计算此牌",
					"{s:0.7}{C:inactive}(倒影黄金融合){}",
				},
			},
			["j_tsun_gold_asset_liquidation"] = {
				["name"] = "{C:tsun_gradient_gold}资产清算{}",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"选择盲注后，获得{C:blue}+3 出牌{}并失去所有{C:red}弃牌{}",
					"当{C:money}金钱{}减少时，",
					"返还失去{C:money}金钱{}的一半",
					"每个Ante最多{C:attention}#2#{C:inactive}[#1#]{}次",
					"{C:tsun_gold4}每由此小丑节省$10{C:inactive}[#3#]{C:tsun_gold4}，",
					"{C:tsun_gold4}额外获得一个出牌",
					"{s:0.7}{C:inactive}(资产清算黄金融合){}",
				},
			},
			["j_tsun_surfboard"] = {
				["name"] = "冲浪板",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"手牌中的{C:blue}梅花{}和{C:purple}黑桃{}",
					"提供{X:mult,C:white}X#1#{} 倍率",
					"{s:0.7}{C:inactive}(黑板+水花){}",
				},
			},
			["j_tsun_toaster"] = {
				["name"] = "烤面包机",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"{C:attention}重触发{}每张打出的",
					"{C:attention}A{}、{C:attention}2{}、{C:attention}3{}、{C:attention}4{}或{C:attention}5{}",
					"每张打出的{C:attention}6{}、{C:attention}7{}、{C:attention}8{}、{C:attention}9{}或{C:attention}10{}",
					"点数{C:attention}减半{C:inactive}(向下取整)",
					"{s:0.7}{C:inactive}(黑客+水花){}",
				},
			},
			["j_tsun_cryomancer"] = {
				["name"] = "冰霜术士",
				["text"] = {
					"选择盲注时，创建一张{C:tarot}塔罗牌{}",
					"{C:inactive}(需有空间){}",
					"若{C:attention}最右侧小丑{}是{C:blue}水花{}，",
					"回合{C:attention}结束{}时{C:red}摧毁{}它，",
					"创建{C:attention}1{}张{C:dark_edition}负片{}{C:tarot}塔罗牌{}",
					"{s:0.7}{C:inactive}(占卜师+水花){}",
				},
			},
			["j_tsun_gold_cryomancer"] = {
				["name"] = "{C:tsun_gradient_gold}冰霜术士{}",
				["text"] = {
					"选择盲注时，创建一张{C:tarot}塔罗牌{}",
					"{C:inactive}(需有空间){}",
					"若{C:attention}最右侧小丑{}是{C:blue}水花{}，",
					"回合{C:attention}结束{}时{C:red}摧毁{}它，",
					"创建{C:attention}1{}张{C:dark_edition}负片{}{C:tarot}塔罗牌{}",
					"{C:tsun_gold4}若摧毁的水花有版本，",
					"{C:tsun_gold4}额外创建一张负片塔罗",
					"{C:tsun_gold4}+#1# 消耗品栏位",
					"{s:0.7}{C:inactive}(冰霜术士黄金融合){}",
				},
			},
			["j_tsun_thermos"] = {
				["name"] = "保温杯",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"整个牌组中每有一张{C:attention}钢卡{}，",
					"此小丑获得{X:mult,C:white}X#2#{} 倍率",
					"{s:0.7}{C:inactive}(当前{X:mult,C:white}X#1#{C:inactive} 倍率)",
					"打出的{C:attention}钢卡{}每提供{X:mult,C:white}X#3#{} 倍率",
					"计分手牌中每有一张{C:attention}钢卡{}",
					"{s:0.7}{C:inactive}(钢小丑+水花){}",
				},
			},
			["j_tsun_fractured_floodgate"] = {
				["name"] = "破裂的水闸",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"{C:attention}重触发{}第一张打出的牌{C:attention}#1#{}次",
					"{C:attention}重触发{}第一张额外打出牌{C:attention}#1#{}次",
					"{s:0.7}{C:inactive}(吊牌+水花){}",
				},
			},
			["j_tsun_scuba"] = {
				["name"] = "潜水面具",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"打出的{C:attention}人头牌{}",
					"复制第一张打出牌的",
					"{C:attention}强化{}",
					"{s:0.7}{C:inactive}(黄金面具+水花){}",
				},
			},
			["j_tsun_tsunami_yu"] = {
				["name"] = "雪二",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"{C:attention}额外得分的人头牌{}被{C:red}销毁{}",
					"每{C:attention}销毁{}#3#{C:inactive}[#2#]{}张{C:attention}牌{}，",
					"{C:attention}重触发{}所有打出的牌一次",
					"{C:inactive}当前#1#次重触发",
					"{s:0.7}{C:inactive}(卡尼奥+水花)",
				},
			},
			["j_tsun_tsunami_marie"] = {
				["name"] = "玛丽",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"{C:blue}水花{C:attention}融合{}和{C:blue}水花{}",
					"提供{X:mult,C:white}X#1#{} 倍率",
					"{s:0.7}{C:inactive}(特里布莱+水花)",
				},
			},
			["j_tsun_tsunami_yosuke"] = {
				["name"] = "阳介",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"每{C:attention}#3#{C:inactive}[#2#]{}张{C:attention}额外打出的牌{}，",
					"获得{X:mult,C:white}X#4#{C:mult} 倍率{}",
					"将计数的{C:attention}额外打出的牌{}",
					"乘以{C:red}剩余弃牌数{}",
					"{C:inactive}当前{X:mult,C:white}X#1#{C:inactive} 倍率",
					"{s:0.7}{C:inactive}(约里克+水花)",
				},
			},
			["j_tsun_tsunami_rise"] = {
				["name"] = "赖世",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"禁用每个{C:attention}Boss 盲注{}的效果",
					"禁用{C:attention}Boss 盲注{}时，",
					"获得{C:dark_edition}永久增益{}",
					"上次增益：{C:dark_edition}#2##1#",
					"{s:0.7}{C:inactive}修改后的盲注给予其他盲注的随机增益",
					"{s:0.7}{C:inactive}(奇科+水花)",
				},
			},
			["j_tsun_tsunami_chie"] = {
				["name"] = "千枝",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"离开商店时，为你拥有的",
					"{C:attention}#1#{}张随机{C:attention}消耗牌{}",
					"创建{C:dark_edition}负片{}副本",
					"回合结束时，有{C:green}#2#/#3#{}几率",
					"创建一张随机{C:blue}幽灵牌{}，",
					"否则创建一张随机{C:purple}塔罗牌{}",
					"{C:inactive}(需有空间)",
					"{s:0.7}{C:inactive}(佩尔科+水花)",
				},
			},



			["j_tsun_splish_splash"] = {
				["name"] = "水花四溅",
				["text"] = {
					"选择盲注时，创建{C:blue}水花{}",
					"{C:inactive}(不需要空间){}",
					"{s:0.7}{C:inactive}(混乱+水花){}",
				},
			},
			["j_tsun_g_ship"] = {
				["name"] = "赌博船",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"将所有{C:attention}列出的{C:green,E:1,S:1.1}几率{}翻倍",
					"若{C:attention}打出牌型{}包含三个连续的{C:attention}7{}，",
					"有{C:green}1/7{}几率{C:attention}永久{}翻倍所有{C:attention}列出的{C:green,E:1,S:1.1}几率{}",
					"{s:0.7}{C:inactive}(此效果的几率无法改变){}",
					"{s:0.7}{C:inactive}(全是6！+水花){}",
				},
			},
			["j_tsun_gold_splish_splash"] = {
				["name"] = "{C:tsun_gradient_gold}水花四溅{}",
				["text"] = {
					"选择盲注时，创建一个{C:dark_edition}负片{}{C:blue}水花{}",
					"{s:0.7}{C:inactive}(水花四溅黄金融合)",
				},
			},
			["j_tsun_vending_machine"] = {
				["name"] = "自动售货机",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"每张{C:attention}额外得分牌{}",
					"有{C:green}#3#/#4#{}几率",
					"提供{X:mult,C:white}X#1#{} 倍率",
					"在{C:attention}#1#{C:inactive}[#2#]{}次失败后",
					"{C:attention}必定触发{}",
					"{s:0.7}{C:inactive}(忠诚卡+水花)",
				},
			},
			["j_tsun_waterfront_scenery"] = {
				["name"] = "滨水风景",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"第一张打出的{C:attention}人头牌{}",
					"提供{X:mult,C:white}X#1#{} 倍率",
					"加上每张{C:attention}额外打出的牌{}",
					"提供的{X:mult,C:white}X#2#{} 倍率",
					"{s:0.5}{C:inactive}Creator.png绘制{}",
					"{s:0.7}{C:inactive}(照片+水花){}",
				},
			},
			["j_tsun_holy_water"] = {
				["name"] = "圣水",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"若{C:attention}打出牌型{}包含{C:attention}对子{}，",
					"提供{C:red}+#1#{} 倍率",
					"可以选择{C:attention}额外牌{}来组成{C:attention}对子{}",
					"{s:0.7}{C:inactive}MathIsFun_编写{}",
					"{s:0.7}{C:inactive}(快乐小丑+水花){}",
				},
			},
			["j_tsun_still_water"] = {
				["name"] = "静水",
				["text"] = {
					"{C:edition,E:1}你不能{}{C:cry_ascendant,E:1}游泳...{}",
					"{C:edition,E:1}你不会{}{C:cry_ascendant,E:1}漂浮...{}",
					"{C:dark_edition,E:1}你不能呼吸...{}",
					"{C:inactive}(需有空间){}",
					"{s:0.7}{C:inactive}(克普特之泣+水花){}",
				},
			},
			["j_tsun_swimming_trunks"] = {
				["name"] = "泳裤",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"若{C:attention}打出牌型{}包含{C:attention}两对{}，",
					"获得{C:red}+#1# 倍率{}",
					"若{C:attention}打出牌型{}是带{C:attention}1张额外牌的两对{}，",
					"获得其点数的{C:attention}#2#%%{}作为倍率",
					"{C:inactive}(当前{C:red}+#3#{C:inactive} 倍率)",
					"{s:0.7}{C:inactive}(备用裤子+水花){}",
				},
			},
			["j_tsun_abrasion"] = {
				["name"] = "磨损",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"每打一张{C:attention}石牌{}，",
					"获得{C:chips}+#1# 筹码{}和{C:red}+#3# 倍率{}",
					"{C:inactive}(当前{C:chips}+#2#{C:inactive} 筹码，{C:red}+#4#{C:inactive} 倍率)",
					"{s:0.7}{C:inactive}(石头小丑+水花){}",
				},
			},
			["j_tsun_waterjet"] = {
				["name"] = "水刀切割机",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"{C:attention}石牌{}获得随机{C:attention}强化{}和{C:attention}封印{}",
					"{C:attention}额外打出的牌{}变为石牌",
					"{s:0.5}{C:inactive}Creator.png绘制{}",
					"{s:0.7}{C:inactive}(第一个效果优先)",
					"{s:0.7}{C:inactive}(大理石小丑+水花){}",
				},
			},
			["j_tsun_hygiene_card"] = {
				["name"] = "卫生卡",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"整个牌组中每有一张{C:attention}强化牌{}，",
					"提供{X:mult,C:white}X#2#{} 倍率",
					"{s:0.7}{C:inactive}(当前{X:mult,C:white}X#1#{C:inactive} 倍率)",
					"{C:attention}强化牌{}计分时提供{X:chips,C:white}X#3#{} 筹码",
					"{s:0.7}{C:inactive}(驾照+水花){}",
				},
			},

			["j_tsun_wet_floor_sign"] = {
				["name"] = "小心地滑标志",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"每张带有{V:1}#1#{}花色的",
					"得分牌提供{C:money}$#2#{}",
					"{s:0.5}{C:inactive}(花色每回合改变){}",
					"{s:0.7}{C:inactive}(待办事项清单+水花){}",
				},
			},

			["j_tsun_style_marieter"] = {
				["name"] = "玛丽特风格",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"{C:attention}额外打出的牌{}计分时",
					"获得{C:money}$#1#{}",
					"对于{C:blue}玛丽{}改为{C:money}$#2#{}",
					"{C:inactive}(谁是玛丽？)",
					"{s:0.7}{C:inactive}(保罗卡+水花){}",
				},
			},

			["j_tsun_waterfall_loop"] = {
				["name"] = "瀑布循环",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"{C:dark_edition}+#1#{} 小丑栏位",
					"{C:dark_edition}+#1#{} 选牌上限",
					"{s:0.7}{C:inactive}(哲学家小丑+水花){}",
				},
			},

			["j_tsun_gold_holy_water"] = {
				["name"] = "{C:tsun_gradient_gold}圣水{}",
				["text"] = {
					"每张{C:attention}打出的牌{}都计入得分",
					"若{C:attention}打出牌型{}包含{C:attention}对子{}，",
					"提供{C:red}+#1#{} 倍率",
					"可以选择{C:attention}额外牌{}来组成{C:attention}对子{}",
					"{s:0.7}{C:inactive}基础代码由MathIsFun_编写{}",
					"{s:0.7}{C:inactive}(圣水黄金融合){}",
				},
			},

		},
		["Tarot"] = {
			["c_tsun_aeon"] = {
				["name"] = "永恒",
				["text"] = {
					"创建{C:blue}水花{}",
					"{C:inactive}(需有空间)",
				},
			},
			["c_tsun_flood"] = {
				["name"] = "洪水",
				["text"] = {
					"将最多{C:attention}#1#{}张选中的牌",
					"强化为{C:blue}防水卡{}",
				},
			},
		},
		["Voucher"] = {
			["v_tsun_water_supply"] = {
				["name"] = "水源",
				["text"] = {
					"创建{C:attention}#1#{}张{C:dark_edition}负片{}{C:blue}水花{}",
				},
			},
			["v_tsun_water_source"] = {
				["name"] = "水源地",
				["text"] = {
					"创建{C:attention}#1#{}张{C:blue}水花{}{C:attention}融合小丑{}",
					"{C:tsun_gold1}黄金融合{}和{C:dark_edition}传奇融合{}除外",
				},
			},
		},
		["Spectral"] = {
			["c_tsun_poly"] = {
				["name"] = "变形怪",
				["text"] = {
					"创建{C:blue}水花{}和一个可以与{C:blue}水花{}",
					"{C:attention}融合{}的随机非传奇小丑",
					"{C:attention}-#1#{} 手牌上限",
					"{C:inactive}(需有空间)",
				},
			},
			["c_tsun_galactic_punt"] = {
				["name"] = "银河飞踢",
				["text"] = {
					"{C:red}摧毁{}所有选中的牌",
				},
			},
		},
		["Tag"] = {
			["tag_tsun_bubble"] = {
				["name"] = "气泡标签",
				["text"] = {
					"创建一个{C:dark_edition}闪箔{}、{C:dark_edition}全息{}",
					"或{C:dark_edition}多彩{}{C:blue}水花{}",
				},
			},
		},
	},
}
