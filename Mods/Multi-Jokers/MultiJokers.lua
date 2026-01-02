--- STEAMODDED HEADER
--- MOD_NAME: MultiJokersMod
--- MOD_ID: MultiJokersMod
--- MOD_AUTHOR: [John Maged, Multi, GoldenEpsilon, elbe]
--- MOD_DESCRIPTION: Adds a couple of custom jokers to the game.
--- PREFIX: multi
--- BADGE_COLOR: ad3047

----------------------------------------------
------------MOD CODE -------------------------

SMODS.Atlas({
    key = "collectors_item",
    atlas_table = "ASSET_ATLAS",
    path = "j_collectors_item.png",
    px = 71,
    py = 95
})
SMODS.Atlas({
    key = "incremental",
    atlas_table = "ASSET_ATLAS",
    path = "j_incremental.png",
    px = 71,
    py = 95
})
SMODS.Atlas({
    key = "lottery_ticket",
    atlas_table = "ASSET_ATLAS",
    path = "j_lottery_ticket.png",
    px = 71,
    py = 95
})
SMODS.Atlas({
    key = "math_homework",
    atlas_table = "ASSET_ATLAS",
    path = "j_math_homework.png",
    px = 71,
    py = 95
})
SMODS.Atlas({
    key = "sparkly",
    atlas_table = "ASSET_ATLAS",
    path = "j_sparkly.png",
    px = 71,
    py = 95
})

local math_homework = SMODS.Joker{
	name = "Math Homework",
	key = "math_homework",
    config = {
        extra = { mult = 15 },
    },
    pos = { x = 0, y = 0 },
	loc_txt = {
        name = "Math Homework",
        text = {
            "{C:red}+15{} Mult if played hand",
            "contains only",
            "{C:attention}numbered Cards{}"
        }
	},
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = false,
	blueprint_compat = true,
	perishable_compat = true,
	atlas = "math_homework",
	loc_vars = function(self, info_queue, center)
		return { vars = {  } }
	end,
	calculate = function(self, card, context)
        if context.joker_main then
            local onlyNumbered = true
            for _, v in ipairs(context.full_hand) do
                onlyNumbered = onlyNumbered and ((v.base.id >= 2 and v.base.id <= 10) or v.base.id == 14)
            end
            if not onlyNumbered then
                return nil
            end
            return {
                mult_mod = card.ability.extra.mult,
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
                card = card,
            }
        end
	end,
}
local collectors_item = SMODS.Joker{
	name = "Collector's Item",
	key = "collectors_item",
    config = {
        extra = 10,
    },
    pos = { x = 0, y = 0 },
	loc_txt = {
        name = "Collector's Item",
        text = {
            "{C:blue}+10{} Chips for every",
            "unique {C:attention}Joker{}",
            "owned this run",
            "{C:inactive}(Currently {C:blue}+#1#{C:inactive})"
        }
	},
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = false,
	blueprint_compat = true,
	perishable_compat = true,
	atlas = "collectors_item",
	loc_vars = function(self, info_queue, center)
        if G.GAME["MultiJokersMod_unique_jokers_owned"] then
            local unique_jokers_owned = table_length(G.GAME["MultiJokersMod_unique_jokers_owned"])
            return { vars = { unique_jokers_owned * center.ability.extra } }
        else
            return { vars = { 0 }}
        end
	end,
	calculate = function(self, card, context)
        if context.joker_main then
            if G.GAME["MultiJokersMod_unique_jokers_owned"] then
                local unique_jokers_owned = table_length(G.GAME["MultiJokersMod_unique_jokers_owned"])
                return {
                    chip_mod = card.ability.extra * unique_jokers_owned,
                    card = card,
                    message = localize { type = 'variable', key = 'a_chips', vars = { unique_jokers_owned * card.ability.extra } },
                }
            end
        end
	end,
}
local incremental = SMODS.Joker{
	name = "Incremental Joker",
	key = "incremental",
    config = {
        extra = {
            x_mult = 1
        },
    },
    pos = { x = 0, y = 0 },
	loc_txt = {
        name = "Incremental Joker",
        text = {
            "{C:red}x1{} Mult gains {C:red}x0.1{}",
            "at end of round",
            "{C:inactive}(Currently {C:red}x#1#{C:inactive})"
        }
	},
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = false,
	blueprint_compat = true,
	perishable_compat = true,
	atlas = "incremental",
	loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.x_mult }}
	end,
	calculate = function(self, card, context)
        if context.joker_main then
            if card.ability.extra.x_mult > 1 then
                return {
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } },
                    Xmult_mod = card.ability.extra.x_mult
                }
            end
            return nil
        end
        if context.end_of_round and not context.blueprint and not (context.individual or context.repetition) then
            card.ability.extra.x_mult = card.ability.extra.x_mult + 0.1
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.RED
            }
        end
	end,
}
local sparkly = SMODS.Joker{
	name = "Sparkly Joker",
	key = "sparkly",
    config = {
        extra = 4
    },
    pos = { x = 0, y = 0 },
	loc_txt = {
        name = "Sparkly Joker",
        text = {
            "{C:green}#1# in #2#{} chances to",
            "add a random {C:attention}edition{} to",
            "first played card of each hand"
        }
	},
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = false,
	blueprint_compat = true,
	perishable_compat = true,
	atlas = "sparkly",
	loc_vars = function(self, info_queue, center)
        return {vars = { G .GAME.probabilities.normal, center.ability.extra,}}
	end,
	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            print("hand being played")
            local first_card = context.scoring_hand[1]
            if first_card == context.other_card then
                print("first card found")
                if pseudorandom('sparkly_joker') < G.GAME.probabilities.normal / card.ability.extra then
                    if first_card.edition ~= nil then return nil end
                    local edition = poll_edition('sparkly_joker', nil, true, true)
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            first_card:set_edition(edition, true)
                            return true
                        end)
                    }))
                    local color = G.C.MULT
                    if edition ~= nil and edition.foil then color = G.C.CHIPS end
                    return {
                        extra = { message = localize('k_upgrade_ex'), colour = color },
                        colour = color,
                        card = card
                    }
                end
            end
        end
	end,
}
local lottery_ticket = SMODS.Joker{
	name = "Lottery Ticket",
	key = "lottery_ticket",
    config = {
        extra = 4
    },
    pos = { x = 0, y = 0 },
	loc_txt = {
        name = "Lottery Ticket",
        text = {
            "Jokers' sell value changes",
            "randomly every round",
        }
	},
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = false,
	blueprint_compat = true,
	perishable_compat = true,
	atlas = "lottery_ticket",
	loc_vars = function(self, info_queue, center)
        return { vars = { }}
	end,
	calculate = function(self, card, context)
        if context.end_of_round then
            if not context.blueprint then
                for i = 1, #G.jokers.cards do
                    local joker = G.jokers.cards[i]
                    local original_sell_cost = math.max(1, math.floor(joker.cost / 2)) +
                        (joker.ability.extra_value or 0)
                    joker.sell_cost = pseudorandom('lottery_ticket', 1, 3 * original_sell_cost)
                end
            end
        end
        if context.selling_self then
            -- Undo effect
            for i = 1, #G.jokers.cards do
                local joker = G.jokers.cards[i]
                if joker ~= card then
                    local original_sell_cost = math.max(1, math.floor(joker.cost / 2)) +
                        (joker.ability.extra_value or 0)
                    joker.sell_cost = original_sell_cost
                end
            end
        end
	end,
}

if JokerDisplay then
    local jd_def = JokerDisplay.Definitions

    jd_def["j_multi_math_homework"] = { -- Jokester
        text = {
            { text = "+" },
            { ref_table = "card.joker_display_values", ref_value = "mult" }
        },
        text_config = { colour = G.C.MULT },
        calc_function = function(card)
            local has_face = false
            local has_selected = false
            if G.hand and G.hand.cards then
                for _, selected_card in ipairs(G.hand.cards) do
                    if selected_card.highlighted then
                        has_selected = true
                        if selected_card:get_id() then
                            if not ((selected_card:get_id() <= 10  and selected_card:get_id() >= 2) or selected_card:get_id() == 14) then
                                has_face = true
                            end
                        end
                    end
                end
            end
            if has_face or not has_selected then
                card.joker_display_values.mult = 0
            else
                card.joker_display_values.mult = card.ability.extra.mult
            end
        end
    }

    jd_def["j_multi_collectors_item"] = { -- Top 5
        text = {
            { text = "+" },
            { ref_table = "card.joker_display_values", ref_value = "chips" }
        },
        text_config = { colour = G.C.CHIPS },
        calc_function = function(card)
            local unique_jokers_owned = 1
            if G.GAME["MultiJokersMod_unique_jokers_owned"] then
                unique_jokers_owned = table_length(G.GAME["MultiJokersMod_unique_jokers_owned"])
            end
            card.joker_display_values.chips = card.ability.extra * unique_jokers_owned
        end
    }

    jd_def['j_multi_incremental'] = {
        text = {
            {
                border_nodes = {
                    { text = 'X'},
                    { ref_table = 'card.ability.extra', ref_value = 'x_mult', retrigger_type = 'exp' },
                }
            }
        }
    }
end

local add_to_deck_ref = Card.add_to_deck
function Card:add_to_deck()
    if G.GAME and self.ability.set == "Joker" then
        if G.GAME["MultiJokersMod_unique_jokers_owned"] == nil then
            G.GAME["MultiJokersMod_unique_jokers_owned"] = {}
        end
        G.GAME["MultiJokersMod_unique_jokers_owned"][self.ability.name] = true
    end
    return add_to_deck_ref(self)
end

----------------------------------------------
------------MOD CODE END----------------------
