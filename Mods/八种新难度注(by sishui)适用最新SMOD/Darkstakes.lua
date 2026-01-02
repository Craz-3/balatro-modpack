--- STEAMODDED HEADER
--- MOD_NAME: dkstakes
--- MOD_ID: dkstakes
--- MOD_AUTHOR: [sishui]
--- MOD_DESCRIPTION: Adds new dark stakes
--- BADGE_COLOUR: 3FC7EB
--- PRIORITY: 500


local Backapply_to_runRef = Back.apply_to_run
function Back.apply_to_run(self)
    if G.GAME.modifiers.dkst_dkgreen then
    G.P_BLINDS.bl_small.mult = 1.2
    G.P_BLINDS.bl_big.mult = 1.6
      if G.GAME.modifiers.dkst_dkpurple then
         G.P_BLINDS.bl_small.mult = 1.25
         G.P_BLINDS.bl_big.mult = 1.8
      end
    else
    G.P_BLINDS.bl_small.mult = 1
    G.P_BLINDS.bl_big.mult = 1.5
    end
    Backapply_to_runRef(self)
end



function Card:set_eternal(_eternal)
    self.ability.eternal = nil
    if self.config.center.eternal_compat and not self.ability.perishable then
        self.ability.eternal = _eternal
      if G.GAME.modifiers.dkst_dkblack then
        if pseudorandom('eternalpinned') < 1/2 then
            self.pinned = _eternal
        end
      end
    end
end



SMODS.Atlas {  
    key = 'dkstakes',
    px = 29,
    py = 29,
    path = 'dkstakes.png'
}

SMODS.Atlas {  
    key = 'stdkstake',
    px = 71,
    py = 95,
    path = 'stdkstake.png'
}

SMODS.Stake {
    key = "dkwhite",
    unlocked = true,
    applied_stakes = { "gold" },
    --above_stake = "gold",
    prefix_config = { applied_stakes = { mod = false } },
    --prefix_config = { above_stake = {{ "gold" }, mod = false }},
    atlas = 'dkstakes',
    pos = { x = 0, y = 0 },
    sticker_atlas = 'stdkstake',
    sticker_pos = { x = 1, y = 0 },
    shiny = true,
    colour = G.C.ETERNAL,
    modifiers = function()
        G.GAME.interest_cap = 15
    end,
    loc_txt = {
        sticker = {
            name = "暗白注标贴",
            text = {
                "使用这个小丑牌",
                    "在{C:attention}暗白注",
                    "难度下获胜"
            }
        },
            name = "暗白注",
            text = {
            "初始{C:attention}利息上限{}改为{C:money}$3"
            },
    },
}

SMODS.Stake {
    key = "dkred",
    unlocked = true,
    applied_stakes = { "dkst_dkwhite" },
    atlas = 'dkstakes',
    pos = { x = 1, y = 0 },
    sticker_atlas = 'stdkstake',
    sticker_pos = { x = 2, y = 0 },
    shiny = true,
    colour = G.C.MULT,
    modifiers = function()
        G.GAME.inflation = 1
    end,
    loc_txt = {
        sticker = {
            name = "暗红注标贴",
            text = {
                "使用这个小丑牌",
                    "在{C:attention}暗红注",
                    "难度下获胜"
            }
        },
            name = "暗红注",
            text = {
            "商店内所有物品",
            "购买{C:attention}成本{}增加{C:money}$1"
            },
    },
}

SMODS.Stake {
    key = "dkgreen",
    unlocked = true,
    applied_stakes = { "dkst_dkred" },
    atlas = 'dkstakes',
    pos = { x = 2, y = 0 },
    sticker_atlas = 'stdkstake',
    sticker_pos = { x = 3, y = 0 },
    shiny = true,
    colour = G.C.GREY,
    modifiers = function()
        G.GAME.modifiers.dkst_dkgreen = true
    end,
    loc_txt = {
        sticker = {
            name = "暗绿注标贴",
            text = {
                "使用这个小丑牌",
                    "在{C:attention}暗绿注",
                    "难度下获胜"
            }
        },
            name = "暗绿注",
            text = {
            "{C:attention}小盲注{}和{C:attention}大盲注{}的",
            "过关需求分数略微提高"
            },
    },
}

SMODS.Stake {
    key = "dkblue",
    unlocked = true,
    applied_stakes = { "dkst_dkgreen" },
    atlas = 'dkstakes',
    pos = { x = 3, y = 0 },
    sticker_atlas = 'stdkstake',
    sticker_pos = { x = 4, y = 0 },
    shiny = true,
    colour = G.C.CHIPS,
    modifiers = function()
        G.GAME.modifiers.booster_ante_scaling = true
    end,
    loc_txt = {
        sticker = {
            name = "暗蓝注标贴",
            text = {
                "使用这个小丑牌",
                    "在{C:attention}暗蓝注",
                    "难度下获胜"
            }
        },
            name = "暗蓝注",
            text = {
            "{C:attention}补充包{}成本",
            "每个底注增加{C:money}$1{}",
            },
    },
}

SMODS.Stake {
    key = "dkblack",
    unlocked = true,
    applied_stakes = { "dkst_dkblue" },
    atlas = 'dkstakes',
    pos = { x = 4, y = 0 },
    sticker_atlas = 'stdkstake',
    sticker_pos = { x = 0, y = 1 },
    shiny = true,
    colour = G.C.RENTAL,
    modifiers = function()
        G.GAME.modifiers.dkst_dkblack = true
    end,
    loc_txt = {
        sticker = {
            name = "暗黑注标贴",
            text = {
                "使用这个小丑牌",
                    "在{C:attention}暗黑注",
                    "难度下获胜"
            }
        },
            name = "暗黑注",
            text = {
            "商店出现的{C:attention}永恒{}小丑牌",
            "还有可能附带{C:attention}固定{}效果",
            "{C:inactive,s:0.8}(被固定在小丑栏最左侧)"
            },
    },
}

SMODS.Stake {
    key = "dkpurple",
    unlocked = true,
    applied_stakes = { "dkst_dkblack" },
    atlas = 'dkstakes',
    pos = { x = 0, y = 1 },
    sticker_atlas = 'stdkstake',
    sticker_pos = { x = 1, y = 1 },
    shiny = true,
    colour = G.C.MONEY,
    modifiers = function()
        G.GAME.modifiers.dkst_dkpurple = true
    end,
    loc_txt = {
        sticker = {
            name = "暗紫注标贴",
            text = {
                "使用这个小丑牌",
                    "在{C:attention}暗紫注",
                    "难度下获胜"
            }
        },
            name = "暗紫注",
            text = {
            "{C:attention}小盲注{}和{C:attention}大盲注{}的",
            "过关需求分数进一步提高"
            },
    },
}

SMODS.Stake {
    key = "dkorange",
    unlocked = true,
    applied_stakes = { "dkst_dkpurple" },
    atlas = 'dkstakes',
    pos = { x = 1, y = 1 },
    sticker_atlas = 'stdkstake',
    sticker_pos = { x = 2, y = 1 },
    shiny = true,
    colour = G.C.PERISHABLE,
    modifiers = function()
        G.GAME.perishable_rounds = 3
    end,
    loc_txt = {
        sticker = {
            name = "暗橙注标贴",
            text = {
                "使用这个小丑牌",
                    "在{C:attention}暗橙注",
                    "难度下获胜"
            }
        },
            name = "暗橙注",
            text = {
            "商店出现的{C:attention}易腐{}小丑牌",
            "经过{C:attention}3{}回合后就被削弱",
            },
    },
}

SMODS.Stake {
    key = "dkgold",
    unlocked = true,
    applied_stakes = { "dkst_dkorange" },
    atlas = 'dkstakes',
    pos = { x = 2, y = 1 },
    sticker_atlas = 'stdkstake',
    sticker_pos = { x = 3, y = 1 },
    shiny = true,
    colour = G.C.DARK_EDITION,
    modifiers = function()
        G.GAME.rental_rate = 5
    end,
    loc_txt = {
        sticker = {
            name = "暗金注标贴",
            text = {
                "使用这个小丑牌",
                    "在{C:attention}暗金注",
                    "难度下获胜"
            }
        },
            name = "暗金注",
            text = {
            "商店出现的{C:attention}租用{}小丑牌",
            "改为每回合花费{C:money}$5{}",
            },
    },
}
----------------------------------------------
------------MOD CODE END----------------------
