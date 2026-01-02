return {
    descriptions = {
        Ability = {
            c_betmma_spell_switch = {
                name = "切换",
                text = {
                    "切换所选法术的",
                    "当前元素",
                    "冷却时间：{C:mult}#1#/#2# #3#{}"
                }
            }
        },
        Spell = {
            c_betm_spells_dark = {
                name = "暗",
                text = {
                    "{C:chips}+#1#{} 筹码",
                },
                before_desc = "2 种不同的暗属性花色"
            },
            c_betm_spells_light = {
                name = "光",
                text = {
                    "{C:mult}+#1#{} 倍率",
                },
                before_desc = "2 种不同的光属性花色"
            },
            c_betm_spells_earth = {
                name = "土",
                text = {
                    "{C:money}+$#1#{}",
                },
                before_desc = "2 张相同点数的牌"
            },
            c_betm_spells_air = {
                name = "风",
                text = {
                    "{C:green}#1# / #2#{} 几率",
                    "复制第二张牌",
                },
                before_desc = "2 张点数差大于 4 的牌"
            },
            c_betm_spells_water = {
                name = "水",
                text = {
                    "使第二张牌的",
                    "点数{C:attention}降低{} 1",
                },
                before_desc = "2 张点数递减的牌 (x 和 x-1)"
            },
            c_betm_spells_fire = {
                name = "火",
                text = {
                    "{C:attention}摧毁{} 第二张牌",
                },
                before_desc = "2 张点数递增的牌 (x 和 x+1)"
            },
            c_betm_spells_shadow = {
                name = "影",
                text = {
                    "{X:mult,C:white}X#1#{} 倍率",
                },
                before_desc = "1 种暗属性和 1 种光属性花色"
            },
            c_betm_spells_inferno = {
                name = "炼狱",
                text = {
                    "{C:attention}摧毁{} 第三张牌",
                    "并获得 {C:chips}+#1#{} 筹码",
                },
                before_desc = "2 张递增点数 x, x+1 及 1 种暗属性花色"
            },
            c_betm_spells_abyss = {
                name = "深渊",
                text = {
                    "获得 {C:chips}+#1#*a{} 筹码，",
                    "其中 a 等于第三张牌的点数",
                },
                before_desc = "2 张递减点数 x, x-1 及 1 种暗属性花色"
            },
            c_betm_spells_cavern = {
                name = "洞窟",
                text = {
                    "{C:money}+$#1#{}",
                },
                before_desc = "2 种相同的暗属性花色"
            },
            c_betm_spells_smoke = {
                name = "烟雾",
                text = {
                    "将第二张牌",
                    "{C:attention}转换{} 为 {C:attention}#1#{}",
                },
                before_desc = "1 种暗属性和 1 种非暗属性花色"
            },
            c_betm_spells_radiance = {
                name = "光辉",
                text = {
                    "{C:attention}第三张牌{} 获得 {C:mult}-#1#{} 倍率，",
                    "{C:attention}其它出牌{} 获得 {C:mult}+#2#{} 倍率，",
                    "{C:attention}持有的手牌{} 获得 {C:mult}+#3#{} 倍率",
                },
                before_desc = "2 张递增点数 x, x+1 及 1 种光属性花色"
            },
            c_betm_spells_reflection = {
                name = "反射",
                text = {
                    "将 {C:attention}第三张牌{} 的点数",
                    "变为与 {C:attention}第一张牌{} 相同",
                },
                before_desc = "3 种光属性花色 X, Y, X"
            },
            c_betm_spells_crystal = {
                name = "水晶",
                text = {
                    "将 {C:attention}第二张牌{} 强化为 {C:attention}玻璃牌{}。",
                    "如果是 {C:attention}玻璃牌{}，则获得 {C:money}+$#1#{}",
                },
                before_desc = "2 种相同的光属性花色"
            },
            c_betm_spells_halo = {
                name = "光环",
                text = {
                    "{C:attention}第二张牌{} 获得 {C:mult}+#1#{} 倍率",
                },
                before_desc = "1 种光属性和 1 种非光属性花色"
            },
            c_betm_spells_steam = {
                name = "蒸汽",
                text = {
                    "{X:mult,C:white}X#1#{} 倍率，但此手牌中的牌",
                    "将在 {C:attention}#2#{} 轮后被减益",
                },
                before_desc = "3 张点数为 x, x+1, x-1 的牌"
            },
            c_betm_spells_magma = {
                name = "岩浆",
                text = {
                    "将牌组中 #1# 张未强化的牌",
                    "变为 {C:attention}黄金牌{}",
                },
                before_desc = "4 张点数为 x, x, x+1, x+1 的牌"
            },
            c_betm_spells_ember = {
                name = "余烬",
                text = {
                    "{C:attention}摧毁{} 所有出的牌，并将",
                    "第四张牌的 {C:attention}#1#{} 张复制品加入牌组",
                },
                before_desc = "交替出现的 2 张奇数和 2 张偶数点牌"
            },
            c_betm_spells_mud = {
                name = "泥沼",
                text = {
                    "{C:attention}持有的手牌{} 在计分时",
                    "获得 {C:money}+$#1#{}",
                },
                before_desc = "4 张点数为 x, x, x-1, x-1 的牌"
            },
            c_betm_spells_dust = {
                name = "尘埃",
                text = {
                    "复制 {C:attention}第四张牌{} 并获得 {C:money}+$#1#{}，",
                    "倍率为以此法术复制的牌数",
                    "{C:inactive}(当前为 {C:money}$#2#{C:inactive}){}",
                },
                before_desc = "4 张点数为 x, x, y, y 且差值大于 4 的牌"
            },
            c_betm_spells_cloud = {
                name = "云雾",
                text = {
                    "转移永久 {C:attention}奖励{}",
                    "{C:inactive,s:0.8}(+筹码, +倍率, +$)",
                    "从出的牌转移到 {C:attention}第三张牌{}",
                },
                before_desc = "3 张点数为 x, x-2, x-4 的牌"
            },
            c_betm_spells_ripple = {
                name = "涟漪",
                text = {
                    "{X:mult,C:white}X#1#{} 倍率",
                },
                before_desc = "3 张点数为 x, x-1, x 的牌"
            },
            c_betm_spells_lava = {
                name = "熔岩",
                text = {
                    "将手中第一张未强化的牌变为 {C:attention}黄金牌{}。",
                    "手中每有一张 {C:attention}黄金牌{}，获得 {X:mult,C:white}X#1#{} 倍率",
                },
                before_desc = "4 张点数为 x, x, 以及 2 张数字牌"
            }
        },
        Voucher = {
            v_betm_spells_magic_scroll = {
                name = "魔法卷轴",
                text = {
                    "{C:attention}+#1#{} 法术槽位",
                }
            },
            v_betm_spells_magic_wheel = {
                name = "魔法之轮",
                text = {
                    "{C:attention}+#1#{} 法术槽位",
                    "你可以花费 {C:money}$#2#{} 来",
                    "重投一个法术的序列",
                }
            }
        },
        Other = {
            card_extra_mult = {
                text = {
                    "{C:mult}+#1#{} 额外倍率"
                }
            },
            card_extra_p_dollars = {
                text = {
                    "{C:money}+$#1#{}"
                }
            },
            card_extra_mult_neg = {
                text = {
                    "{C:red}#1#{} 额外倍率"
                }
            },
            card_extra_p_dollars_neg = {
                text = {
                    "{C:red}$#1#{}"
                }
            },
        }
    },
    misc = {
        dictionary = {
            b_spell_cards = "法术牌",
            k_spell = "法术",
            b_fuse = "融合",
            b_reroll = "重投",
            spell_not = "非 ",
            spell_Heart = "红桃",
            spell_Diamond = "方片",
            spell_Club = "梅花",
            spell_Spade = "黑桃",
            spell_Ace = "Ace",
            spell_Face = "人头牌",
            spell_Numbered = "数字牌",
            k_betmma_spell_pack = "法术包",
            k_betmma_smoke = "烟雾！",
            k_betmma_downgrade_ex = "降级！",
            k_betmma_reflection = "反射！",
            k_betmma_crystal = "结晶！",
            k_spell_collection = "法术",
            k_spell_name = "法术",
            k_spell_undiscovered_name = "未发现",
            k_spell_undiscovered_text = {
                "在非种子序列游戏中",
                "融合此法术以",
                "了解其作用"
            },
        }
    }
}
