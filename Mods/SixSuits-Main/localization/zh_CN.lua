return {
	["misc"] = {
		["dictionary"] = {
			["k_exoplanet"] = "系外行星",
			["k_glass"] = "玻璃化！",
		},
		["suits_plural"] = {
			["six_Moons"] = "月亮",
			["six_Stars"] = "星星",
		},
		["poker_hands"] = {
			["six_Spectrum House"] = "光谱葫芦",
			["six_Straight Spectrum"] = "光谱顺子",
			["six_Spectrum"] = "光谱",
			["six_Straight Spectrum_2"] = "皇家光谱",
			["six_Spectrum Five"] = "光谱五条",
		},
		["poker_hand_descriptions"] = {
			["six_Spectrum Five"] = {
				"5张相同点数的牌，",
				"每张牌花色不同",
			},
			["six_Spectrum"] = {
				"5张不同花色的牌",
			},
			["six_Straight Spectrum"] = {
				"5张点数连续的牌",
				"且每张牌花色不同",
			},
			["six_Spectrum House"] = {
				"三条加一对，",
				"且每张牌花色不同",
			},
		},
		["suits_singular"] = {
			["six_Moons"] = "月亮",
			["six_Stars"] = "星星",
		},
	},
	["descriptions"] = {
		["Blind"] = {
			["bl_six_void"] = {
				["name"] = "虚空",
				["text"] = {
					"所有月亮花色的牌",
					"被削弱",
				},
			},
			["bl_six_eclipse"] = {
				["name"] = "日蚀",
				["text"] = {
					"所有星星花色的牌",
					"被削弱",
				},
			},
		},
		["Back"] = {
			['b_six_night'] = {
				["name"] = "夜晚牌组",
				["text"] = {
					"游戏开始时牌组仅包含",
					"{C:six_moons,E:1,S:1.1}月亮{}和{C:six_stars,E:1,S:1.1}星星{}花色",
				},
			},
			['b_six_colourful'] = {
				["name"] = "多彩牌组",
				["text"] = {
					"如果打出的牌型包含{C:attention}光谱{}",
					"则{X:mult,C:white}X#1#{}倍率",
					"有{C:green,E:1}#3#/#4#{}概率改变",
					"每张打出的",
					"{C:six_moons}月亮{}或{C:six_stars}星星{}牌的花色",
					"并获得{X:mult,C:white}X#2#{}倍率"
				},
				["unlock"] = {
					"在一局游戏中",
					"打出至少{C:attention}#1#次{}",
					"包含{C:attention}光谱{}的牌型后赢得游戏",
				}
			},
		},
		["Sleeve"] = {
			["sleeve_six_colourful"] = {
				["name"] = "多彩卡套",
				["text"] = {
					"如果打出的牌型包含{C:attention}光谱{}",
					"则{X:mult,C:white}X#1#{}倍率",
					"有{C:green,E:1}#3#/#4#{}概率改变",
					"每张打出的",
					"{C:six_moons}月亮{}或{C:six_stars}星星{}牌的花色",
					"并获得{X:mult,C:white}X#2#{}倍率"
				},
			},
			["sleeve_six_colourful_alt"] = {
				["name"] = "多彩卡套",
				["text"] = {
					"如果打出的牌型包含{C:attention}光谱{}",
					"{C:attention}重新触发{}所有打出的牌",
				}
			}
		},
		["Tarot"] = {
			["c_six_star_q"] = {
				["name"] = "星星？",
				["text"] = {
					"将最多{C:attention}#1#{}张",
					"选中的牌转换为",
					"{V:1}#2#{}",
				},
			},
			["c_six_moon_q"] = {
				["name"] = "月亮？",
				["text"] = {
					"将最多{C:attention}#1#{}张",
					"选中的牌转换为",
					"{V:1}#2#{}",
				},
			},
		},
		["Planet"] = {
			["c_six_gj_273_c"] = {
				["name"] = "GJ 273 c",
				["text"] = {
					"{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）{}升级",
					"{C:attention}#2#",
					"{C:mult}+#3#{}倍率和",
					"{C:chips}+#4#{}筹码",
				},
			},
			["c_six_trappist"] = {
				["name"] = "Trappist",
				["text"] = {
					"{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）{}升级",
					"{C:attention}#2#",
					"{C:mult}+#3#{}倍率和",
					"{C:chips}+#4#{}筹码",
				},
			},
			["c_six_proxima"] = {
				["name"] = "Proxima",
				["text"] = {
					"{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）{}升级",
					"{C:attention}#2#",
					"{C:mult}+#3#{}倍率和",
					"{C:chips}+#4#{}筹码",
				},
			},
			["c_six_kepler"] = {
				["name"] = "Kepler",
				["text"] = {
					"{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）{}升级",
					"{C:attention}#2#",
					"{C:mult}+#3#{}倍率和",
					"{C:chips}+#4#{}筹码",
				},
			},
		},
		["Joker"] = {
			["j_six_moonstone"] = {
				["name"] = "彩虹月长石",
				["text"] = {
					"有{C:green}#1#/#2#{}概率",
					"将打出的{C:six_moons}月亮{}花色的牌",
					"变为{C:attention}玻璃牌{}",
				},
			},
			["j_six_clan"] = {
				["name"] = "氏族",
				["text"] = {
					"如果打出的牌型",
					"包含{C:attention}#2#{}",
					"则{X:mult,C:white}X#1#{}倍率",
				},
			},
			["j_six_star_ruby"] = {
				["name"] = "星光红宝石",
				["text"] = {
					"有{C:green}#1#/#2#{}概率",
					"使打出的{C:six_stars}星星{}花色的牌",
					"计分时生成一张随机{C:spectral}幻灵牌{}",
				},
			},
			["j_six_slothful_joker"] = {
				["name"] = "慵懒小丑",
				["text"] = {
					"打出的{C:six_moons}#2#{}花色的牌",
					"计分时给予",
					"{C:mult}+#1#{}倍率",
				},
			},
			["j_six_manic_joker"] = {
				["name"] = "狂躁小丑",
				["text"] = {
					"如果打出的牌型",
					"包含{C:attention}#2#{}",
					"则{C:red}+#1#{}倍率",
				},
			},
			["j_six_wicked_joker"] = {
				["name"] = "邪恶小丑",
				["text"] = {
					"如果打出的牌型",
					"包含{C:attention}#2#{}",
					"则{C:chips}+#1#{}筹码",
				},
			},
			["j_six_envious_joker"] = {
				["name"] = "妒忌小丑",
				["text"] = {
					"打出的{C:stars}#2#{}花色的牌",
					"计分时给予",
					"{C:mult}+#1#{}倍率",
				},
			},
		},
		["Spectral"] = {
			["c_six_fool_q"] = {
				["name"] = "愚者？",
				["text"] = {
					"生成本局游戏中",
					"最后使用的",
					"{C:spectral}幻灵牌{}",
					"{s:0.8,C:spectral}愚者？{s:0.8}除外",
				},
			},
		},
		["Mod"] = {
			["SixSuits"] = {
				["name"] = "六花色",
				["text"] = {
					"此模组引入了{E:1,C:dark_edition}光谱{}牌型，",
					"可与两种新花色配合使用：{C:six_stars,T:c_six_star_q}星星{}和{C:six_moons,T:c_six_moon_q}月亮{}。",
					"美术由{E:1,C:attention}Crimson Heart{}和{E:1,C:attention}PeachFroggg{}制作。"
				}
			}
		}
	},
}
