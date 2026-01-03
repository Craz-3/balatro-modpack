return {
	["misc"] = {
		["dictionary"] = {
            ["k_fusion"] = "融合",
			["k_fuse_fusion"] = "融合",
            ["k_flipped_ex"] = "翻转！",
            ["k_copied_ex"] = "克隆！",
            ["k_in_tact_ex"] = "完好！",
            ["b_fuse"] = "融合",
		},
		["labels"] = {
			["k_fuse_fusion"] = "融合",
		},
	},
	["descriptions"] = {
		["Joker"] = {
			["j_fuse_diamond_bard"] = {
				["name"] = "方片吟游诗人",
				["text"] = {
                    "打出的{C:diamonds}方片{}花色的牌计分时",
                    "给予{C:money}$#1#{}，以及每拥有",
                    "{C:money}$#3#{}就给予{C:mult}+#2#{}倍率",
                    "{C:inactive}(#4# + #5#)",
				},
			},
			["j_fuse_heart_paladin"] = {
				["name"] = "红桃圣骑士",
				["text"] = {
                    "打出的{C:hearts}红桃{}花色的牌",
                    "计分时给予{X:mult,C:white}X#1#{}倍率",
                    "有{C:green}#2#/#3#{}概率重新触发",
                    "{C:inactive}(#4# + #5#)",
				},
			},
			["j_fuse_spade_archer"] = {
				["name"] = "黑桃弓箭手",
				["text"] = {
                    "打出的{C:spades}黑桃{}花色的牌",
                    "计分时给予{C:chips}+#1#{}筹码。",
                    "当打出5张或更多{C:spades}黑桃{}时获得{C:chips}+#2#{}筹码",
                    "{C:inactive}(#3# + #4#)",
				},
			},
			["j_fuse_club_wizard"] = {
				["name"] = "梅花巫师",
				["text"] = {
                    "打出的{C:clubs}梅花{}花色的牌",
                    "计分时给予{C:mult}+#1#{}倍率",
                    "{C:inactive}(#2# + #3#)",
				},
			},
			["j_fuse_big_bang"] = {
				["name"] = "大爆炸",
				["text"] = {
                    "根据{C:attention}牌型{}的使用次数",
                    "加上{C:attention}牌型{}的等级",
                    "给予{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}(#2# + #3#)",
				},
			},
			["j_fuse_dynamic_duo"] = {
				["name"] = "活力二人组",
				["text"] = {
                    "打出的{C:attention}数字牌{}计分时",
                    "给予{C:mult}+#1#{}倍率和{C:chips}+#2#{}筹码",
                    "{C:inactive}(#3# + #4#)",
				},
			},
			["j_fuse_collectible_chaos_card"] = {
				["name"] = "收藏版混沌卡",
				["text"] = {
                    "商店中每{C:attention}刷新{}一次",
                    "给予{C:mult}+#1#{}倍率",
                    "每个商店有{C:attention}#2#{}次免费{C:green}刷新{}",
                    "{C:inactive}（当前{C:mult}+#3#{C:inactive}倍率）",
                    "{C:inactive}(#4# + #5#)",
				},
			},
			["j_fuse_flip_flop"] = {
				["name"] = "翻转",
				["text"] = {
                    "{C:attention}+#1#{}手牌上限。{C:red}+#2#{}倍率",
                    "每个盲注后{C:attention}翻转{}",
                    "{C:inactive}(#3# + #4#)",
				},
			},
			["j_fuse_flip_flop_mult"] = {
				["name"] = "翻转",
				["text"] = {
                    "{C:attention}+#1#{}手牌上限。{C:red}+#2#{}倍率",
                    "每个盲注后{C:attention}翻转{}",
                    "{C:inactive}(#3# + #4#)",
				},
			},
			["j_fuse_flip_flop_chips"] = {
				["name"] = "翻转",
				["text"] = {
                    "{C:red}+#1#{}次弃牌。{C:chips}+#2#{}筹码",
                    "每个盲注后{C:attention}翻转{}",
                    "{C:inactive}(#3# + #4#)",
				},
			},
			["j_fuse_royal_decree"] = {
				["name"] = "皇室法令",
				["text"] = {
                    "打出的{C:attention}人头牌{}计分时给予{C:money}$#1#{}",
                    "回合结束时留在手中的每张",
                    "{C:attention}人头牌{}给予{C:money}$#1#{}",
                    "{C:inactive}(#2# + #3#)",
				},
			},
			["j_fuse_dementia_joker"] = {
				["name"] = "痴呆小丑",
				["text"] = {
                    "每张{C:attention}小丑牌{}给予{C:mult}+#1#{}倍率",
                    "击败盲注后，如果不是{C:dark_edition}负面{}，",
                    "有{C:green}#2#/#3#{}概率{C:attention}克隆{}自身",
                    "{C:inactive}（当前{C:mult}+#4#{C:inactive}倍率）",
                    "{C:inactive}(#5# + #6#)",
				},
			},
			["j_fuse_golden_egg"] = {
				["name"] = "金蛋",
				["text"] = {
                    "回合结束时获得{C:money}$#1#{}",
                    "的{C:attention}售出价值{}",
                    "回合结束时获得{C:money}$#1#{}",
                    "{C:inactive}(#2# + #3#)",
				},
			},
			["j_fuse_flag_bearer"] = {
				["name"] = "旗手",
				["text"] = {
                    "每出牌一次{C:mult}+#1#{}倍率，每弃牌一次{C:mult}-#2#{}倍率",
                    "倍率乘以剩余的",
                    "{C:attention}弃牌次数{}",
                    "{C:inactive}（当前{C:mult}+#3#{C:inactive}倍率）",
                    "{C:inactive}(#4# + #5#)",
				},
			},
			["j_fuse_uncanny_face"] = {
				["name"] = "诡异面孔",
				["text"] = {
                    "打出的{C:attention}人头牌{}计分时",
                    "根据计分手牌中的{C:attention}人头牌{}数量",
                    "给予{C:chips}+#1#{}筹码和{C:mult}+#2#{}倍率",
                    "{C:inactive}(#3# + #4#)",
				},
			},
			["j_fuse_commercial_driver"] = {
				["name"] = "商用司机",
				["text"] = {
                    "每连续出牌一次包含计分的{C:attention}增强牌{}",
                    "此小丑牌给予{X:mult,C:white}X#1#{}倍率",
                    "{C:inactive}（当前{X:mult,C:white}X#2#{C:inactive}倍率）",
                    "{C:inactive}(#3# + #4#)",
				},
			},
			["j_fuse_camping_trip"] = {
				["name"] = "露营之旅",
				["text"] = {
                    "打出的{C:attention}牌{}计分时",
                    "永久获得{C:chips}+#1#{}筹码",
                    "（最后一次出牌时为{C:chips}+#2#{}）",
                    "你的最后一次出牌触发两次",
                    "{C:inactive}(#3# + #4#)",
				},
			},
			["j_fuse_star_oracle"] = {
				["name"] = "星辰神谕",
				["text"] = {
                    "{C:attention}+2{}消耗品槽位",
                    "打出的{C:stars}星星{}花色的牌",
                    "有{C:green}#1#/#2#{}概率在计分时",
                    "生成一张随机{C:spectral}幻灵牌{}",
                    "{C:inactive}(#3# + #4#)",
				},
			},
			["j_fuse_moon_marauder"] = {
				["name"] = "月亮掠夺者",
				["text"] = {
                    "打出的{C:moons}月亮{}花色的牌",
                    "有{C:green}#1#/#2#{}概率变为{C:attention}玻璃牌{}",
                    "打出的{C:moons}月亮{}{C:attention}玻璃牌{}永不破碎",
                    "{C:inactive}(#3# + #4#)",
				},
			},
		},
	},
}
