--- STEAMODDED HEADER
--- MOD_NAME: Actions
--- MOD_ID: ACT
--- PREFIX: act
--- MOD_AUTHOR: [mathguy]
--- MOD_DESCRIPTION: Actions beyond playing hands and discarding
--- VERSION: 1.0.1
----------------------------------------------
------------MOD CODE -------------------------

local actionType = SMODS.ConsumableType {
    key = 'Action',
    primary_colour = G.C.BLUE,
    secondary_colour = G.C.BLUE,
    loc_txt = {
        name = 'Action',
        collection = 'Action',
        undiscovered = {
            name = "Not Discovered",
            text = {
                "Purchase or use",
                "this card in an",
                "unseeded run to",
                "learn what it does"
            }
        }
    },
    collection_rows = { 2, 2 },
    shop_rate = 4,
    default = "c_act_hand"
}

local checking = {
    play_hand = {
        use = 'play_cards_from_highlighted',
        can_use = 'can_play',
        colour = "BLUE",
        key = 'c_act_hand'
    },
    discard = {
        use = 'discard_cards_from_highlighted',
        can_use = 'can_discard',
        colour = "RED",
        key = 'c_act_discard'
    },
    burn = {
        use = 'burn_cards_from_highlighted',
        can_use = 'can_burn',
        colour = "YELLOW",
        key = 'c_act_burn'
    },
    trick = {
        use = 'trick_cards_from_deck',
        can_use = 'can_trick',
        colour = "PURPLE",
        key = 'c_act_trick'
    },
    cry = {
        use = 'cry_cards_from_highlighted',
        can_use = 'can_cry',
        colour = "PERISHABLE",
        key = 'c_act_cry'
    },
    fall = {
        use = 'fall_cards_from_highlighted',
        can_use = 'can_fall',
        colour = "GREEN",
        key = 'c_act_fall'
    },
    exhaust = {
        use = 'exhaust_cards_from_highlighted',
        can_use = 'can_exhaust',
        colour = "ORANGE",
        key = 'c_act_exhaust'
    },
    exchange = {
        use = 'exchange_action',
        can_use = 'can_exchange',
        colour = "PALE_GREEN",
        key = 'c_act_exchange'
    },
}

SMODS.Action = SMODS.Consumable:extend {
    set = 'Action',
    use = function(self, card, area, copier)
        local prev_key = checking[G.GAME[card.ability.act_type]].key
        G.GAME[card.ability.act_type] = self.act_key
        if G.buttons then
            G.buttons:remove()
            G.buttons = UIBox{
                definition = create_UIBox_buttons(),
                config = {align="bm", offset = {x=0,y=0.3},major = G.hand, bond = 'Weak'}
            }
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            local card = create_card(card_type, G.consumeables, nil, nil, nil, nil, prev_key, 'act')
            card:add_to_deck()
            G.consumeables:emplace(card)
        return true end }))
    end,
    can_use = function()
        return true
    end,
    in_pool = function(self)
        if G.GAME and G.GAME[self.config.act_type] and (G.GAME[self.config.act_type] == self.act_key) then
            return false
        end
        return true
    end,
    config = {act_type = 'active'},
    act_key = 'play_hand',
    cost = 2
}

SMODS.Atlas({ key = "actions", atlas_table = "ASSET_ATLAS", path = "actions.png", px = 71, py = 95})

local unknown = SMODS.UndiscoveredSprite {
    key = 'Action',
    atlas = 'actions',
    pos = {x = 0, y = 2}
}

SMODS.Action {
    key = 'hand',
    loc_txt = {
        name = "Play Hand",
        text = {
            "{C:blue}-1{} Hand",
            "Play up to {C:attention}5{} cards",
            "{X:attention,C:white} Score {} then {C:red}discard{}",
            "played cards",
            "{C:inactive}({C:attention}Hand{C:inactive} action)"
        }
    },
    atlas = "actions",
    pos = {x = 0, y = 0},
    config = {act_type = 'active'},
    act_key = 'play_hand',
    req = {hands = 1}
}

SMODS.Action {
    key = 'discard',
    loc_txt = {
        name = "Discard",
        text = {
            "{C:red}-1{} Discard",
            "{C:red}Discard{} up to ",
            "{C:attention}5{} cards",
            "{C:inactive}({C:attention}Discard{C:inactive} action)"
        }
    },
    atlas = "actions",
    pos = {x = 1, y = 0},
    config = {act_type = 'passive'},
    act_key = 'discard',
    req = {discards = 1}
}

SMODS.Action {
    key = 'burn',
    loc_txt = {
        name = "Burn",
        text = {
            "{C:blue}-1{} Hand, {C:red}-1{} Discard",
            "{C:attention}Destroy{} up to ",
            "{C:attention}3{} cards",
            "{C:inactive}({C:attention}Discard{C:inactive} action)"
        }
    },
    atlas = "actions",
    pos = {x = 2, y = 0},
    config = {act_type = 'passive'},
    act_key = 'burn',
    req = {hands = 1, discards = 1}
}

SMODS.Action {
    key = 'trick',
    loc_txt = {
        name = "Trick",
        text = {
            "{C:red}-1{} Discard",
            "{C:attention}Draw{} and {C:attention}enhance{}",
            "{C:attention}2{} cards from {C:attention}deck{}",
            "{C:inactive}({C:attention}Discard{C:inactive} action)"
        }
    },
    atlas = "actions",
    pos = {x = 0, y = 1},
    config = {act_type = 'passive'},
    act_key = 'trick',
    req = {discards = 1}
}

SMODS.Action {
    key = 'cry',
    loc_txt = {
        name = "Cry",
        text = {
            "{C:blue}-2{} Hands",
            "{X:attention,C:white} Score {} {C:blue}50%{} of {C:attention}remaining{}",
            "{C:attention}chips{} needed to win",
            "{C:attention}destroy{} non-selected cards",
            "{C:inactive}({C:attention}Hand{C:inactive} action)",
        }
    },
    atlas = "actions",
    pos = {x = 1, y = 1},
    config = {act_type = 'active'},
    act_key = 'cry',
    req = {hands = 2}
}

SMODS.Action {
    key = 'fall',
    loc_txt = {
        name = "Fall",
        text = {
            "{C:blue}-1{} Hand, {C:red}-1{} Discard",
            "Play up to {C:attention}4{} cards",
            "{C:attention}duplicate{} a random card",
            "{X:attention,C:white} Score {} then {C:red}discard{}",
            "played cards",
            "{C:inactive}({C:attention}Hand{C:inactive} action)",
        }
    },
    atlas = "actions",
    pos = {x = 2, y = 1},
    config = {act_type = 'active'},
    act_key = 'fall',
    req = {hands = 1, discards = 1}
}

SMODS.Action {
    key = 'exhaust',
    loc_txt = {
        name = "Exhaust",
        text = {
            "{C:blue}-1{} Hand, {C:red}-1{} Discards",
            "Play up to {C:attention}5{} cards",
            "{X:attention,C:white} Score {} then {C:red}discard{}",
            "played cards. cards in",
            "{C:attention}deck{} score base {C:blue}chips{}",
            "{C:inactive}({C:attention}Hand{C:inactive} action)",
        }
    },
    atlas = "actions",
    pos = {x = 1, y = 2},
    config = {act_type = 'active'},
    act_key = 'exhaust',
    req = {hands = 1, discards = 1}
}

SMODS.Action {
    key = 'exchange',
    loc_txt = {
        name = "Exchange",
        text = {
            "{C:blue}+1{} Hand, {C:red}-1{} Discard",
            "Costs {C:money}$2{}",
            "{C:inactive}({C:attention}Discard{C:inactive} action)"
        }
    },
    atlas = "actions",
    pos = {x = 2, y = 2},
    config = {act_type = 'passive'},
    act_key = 'exchange',
    req = {hands = -1, discards = 1}
}

local old_buttons = create_UIBox_buttons
function create_UIBox_buttons()
    local t = old_buttons()
    if not G.GAME or not G.GAME.modifiers or not G.GAME.modifiers.dungeon then
        if G and G.GAME and G.GAME.active then
            local index = 3
            if G.SETTINGS.play_button_pos ~= 1 then
                index = 1
            end
            local button = t.nodes[index]
            button.nodes[1].nodes[1].config.text = localize("b_" .. G.GAME.active)
            button.config.button = checking[G.GAME.active].use
            button.config.func = checking[G.GAME.active].can_use
            button.config.color = G.C[checking[G.GAME.active].colour]
        end
        if G and G.GAME and G.GAME.passive then
            local index = 1
            if G.SETTINGS.play_button_pos ~= 1 then
                index = 3
            end
            local button = t.nodes[index]
            button.nodes[1].nodes[1].config.text = localize("b_" .. G.GAME.passive)
            button.config.button = checking[G.GAME.passive].use
            button.config.func = checking[G.GAME.passive].can_use
            button.config.color = G.C[checking[G.GAME.passive].colour]
        end
    end
    return t
end

G.FUNCS.burn_cards_from_highlighted = function(e)
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            G.STATE_COMPLETE = true
            return true
        end
    }))
    local remaining = G.GAME.current_round.hands_left
    ease_hands_played(-1)
    ease_discard(-1)
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.1,
        func = function() 
            for i=#G.hand.highlighted, 1, -1 do
                local card = G.hand.highlighted[i]
                if card.ability.name == 'Glass Card' then 
                    card:shatter()
                else
                    card:start_dissolve(nil, i == #G.hand.highlighted)
                end
            end
    return true end }))
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            if remaining <= 1 then
                G.STATE = G.STATES.NEW_ROUND
            else
                G.STATE = G.STATES.DRAW_TO_HAND
            end
            G.STATE_COMPLETE = false
            return true
        end
    }))
end

G.FUNCS.can_burn = function(e)
    if (#G.hand.highlighted <= 0) or (#G.hand.highlighted > 3) or (G.GAME.current_round.discards_left <= 0)  then
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        e.config.colour = G.C.YELLOW
        e.config.button = 'burn_cards_from_highlighted'
    end
end

G.FUNCS.trick_cards_from_deck = function(e)
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            G.STATE_COMPLETE = true
            return true
        end
    }))
    ease_discard(-1)
    local cen_pool = {}
    for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
        cen_pool[#cen_pool + 1] = v
    end
    local used = {}
    local do_this = {}
    for i = 1, 2 do
        local deck_pool = {}
        for i, j in ipairs(G.deck.cards) do
            if not used[i] then
                table.insert(deck_pool, {i, j})
            end
        end
        if #deck_pool ~= 0 then
            local card = pseudorandom_element(deck_pool, pseudoseed('trick'))
            local enhance = pseudorandom_element(cen_pool, pseudoseed('trick'))
            used[card[1]] = true
            table.insert(do_this, {card[2], enhance})
        end
    end
    local i = 1
    for i, j in ipairs(do_this) do
        j[1]:set_ability(j[2])
        draw_card(G.deck, G.hand, i*100/2, 'up', true, j[1])
        i = i + 1
    end
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            G.STATE = G.STATES.DRAW_TO_HAND
            G.STATE_COMPLETE = false
            return true
        end
    }))
end

G.FUNCS.can_trick = function(e)
    if (#G.deck.cards <= 0) or (G.GAME.current_round.discards_left <= 0)  then
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        e.config.colour = G.C.PURPLE
        e.config.button = 'trick_cards_from_deck'
    end
end

G.FUNCS.cry_cards_from_highlighted = function(e)
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            G.STATE_COMPLETE = true
            return true
        end
    }))
    local remaining = G.GAME.current_round.hands_left
    ease_hands_played(-2)
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.1,
        func = function() 
            for i=#G.hand.highlighted, 1, -1 do  
                local card = G.hand.highlighted[i]
                card.keep_flag = true
            end
            for i=#G.hand.cards, 1, -1 do
                local card = G.hand.cards[i]
                if card.keep_flag then
                    card.keep_flag = nil
                else
                    if card.ability.name == 'Glass Card' then 
                        card:shatter()
                    else
                        card:start_dissolve(nil, i == #G.hand.cards)
                    end 
                end
            end
    return true end }))
    G.E_MANAGER:add_event(Event({
      trigger = 'ease',
      blocking = false,
      ref_table = G.GAME,
      ref_value = 'chips',
      ease_to = G.GAME.chips + math.max(0, 0.5 * (G.GAME.blind.chips - G.GAME.chips)),
      delay =  0.5,
      func = (function(t) return math.floor(t) end)
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            if remaining <= 2 then
                G.STATE = G.STATES.NEW_ROUND
            else
                G.STATE = G.STATES.DRAW_TO_HAND
            end
            G.STATE_COMPLETE = false
            return true
        end
    }))
end

G.FUNCS.can_cry = function(e)
    if (G.GAME.current_round.hands_left <= 1) then 
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        e.config.colour = G.C.PERISHABLE
        e.config.button = 'cry_cards_from_highlighted'
    end
end

G.FUNCS.fall_cards_from_highlighted = function(e)
    act_custom_decrement = {
        hands = 1,
        discards = 1
    }
    act_fall_action = true
    G.FUNCS.play_cards_from_highlighted(e)
    act_fall_action = nil
end

G.FUNCS.can_fall = function(e)
    if (#G.hand.highlighted <= 0) or (#G.hand.highlighted > 4) or (G.GAME.current_round.discards_left <= 0)  then
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        e.config.colour = G.C.GREEN
        e.config.button = 'fall_cards_from_highlighted'
    end
end

G.FUNCS.exhaust_cards_from_highlighted = function(e)
    act_custom_decrement = {
        hands = 1,
        discards = 1
    }
    G.GAME.score_deck = true
    G.FUNCS.play_cards_from_highlighted(e)
end

G.FUNCS.can_exhaust = function(e)
    if (#G.hand.highlighted <= 0) or (G.GAME.current_round.discards_left <= 0)  then
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        e.config.colour = G.C.ORANGE
        e.config.button = 'exhaust_cards_from_highlighted'
    end
end

G.FUNCS.exchange_action = function(e)
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            G.STATE_COMPLETE = true
            return true
        end
    }))
    ease_hands_played(1)
    ease_discard(-1)
    ease_dollars(-2)
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            G.STATE = G.STATES.DRAW_TO_HAND
            G.STATE_COMPLETE = false
            return true
        end
    }))
end

G.FUNCS.can_exchange = function(e)
    if ((G.GAME.dollars-G.GAME.bankrupt_at) - 2 < 0) or (G.GAME.current_round.discards_left <= 0)  then
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        e.config.colour = G.C.PALE_GREEN
        e.config.button = 'exchange_action'
    end
end

function SMODS.current_mod.process_loc_text()
    G.localization.misc.dictionary["b_burn"] = "Burn"
    G.localization.misc.dictionary["b_trick"] = "Trick"
    G.localization.misc.dictionary["b_cry"] = "Cry"
    G.localization.misc.dictionary["b_fall"] = "Fall"
    G.localization.misc.dictionary["b_exhaust"] = "Exhaust"
    G.localization.misc.dictionary["b_exchange"] = "Exchange"
end

local old_calculate_main_scoring = SMODS.calculate_main_scoring
function SMODS.calculate_main_scoring(context, scoring_hand)
    local flags = old_calculate_main_scoring(context, scoring_hand)
    if G.GAME.score_deck then
        local chip_total = 0
        for i=1, #G.deck.cards do
            local the_card = G.deck.cards[i]
            if the_card.ability.effect == 'Stone Card' then
                chip_total = chip_total + the_card.ability.bonus
            else
                chip_total = chip_total + the_card.base.nominal
            end
        end
        if chip_total > 0 then
            hand_chips = mod_chips(hand_chips + chip_total)
            update_hand_text({delay = 0}, {chips = hand_chips})
            card_eval_status_text(G.deck.cards[1], 'chips', chip_total, percent)
        end
        G.GAME.score_deck = nil
    end
    return flags
end

----------------------------------------------
------------MOD CODE END----------------------