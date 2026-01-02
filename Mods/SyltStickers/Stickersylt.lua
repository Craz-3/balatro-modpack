--- STEAMODDED HEADER
--- MOD_NAME: stickersylt
--- MOD_ID: stickersylt
--- MOD_AUTHOR: [sishui]
--- MOD_DESCRIPTION: Adds interesting stickers
--- BADGE_COLOUR: 00009C

SMODS.Atlas {
    key = 'stickersylt',
    px = 71,
    py = 95,
    path = 'stickersylt.png'
}

SMODS.Sticker {
	key = "wall",
	loc_txt = {
        name = "Hoard",
        text = {
            "Gain {C:money}$8{} at the end of each round",
            "Score requirement {C:mult}X4",
            "When {C:attention}Boss Blind{} is selected"
        },
        label = "Hoard",
    },
	rate = 0.03,
    atlas = 'stickersylt',
	pos = { x = 0, y = 0 },
	badge_colour = HEX 'B26CBB',
	default_compat = true,
	compat_exceptions = {},
	sets = { Joker = true },
	needs_enable_flag = false,
    calculate = function(self, card, context)
        if context.end_of_round and not (context.individual or context.repetition) then
            ease_dollars(8)
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+$8", colour = G.C.MONEY})
        end
        if context.setting_blind and context.blind.boss then
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 4)
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                
                local chips_UI = G.hand_text_area.blind_chips
                G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
                G.HUD_blind:recalculate() 
                chips_UI:juice_up()

                return true end }))
        end
    end
}

SMODS.Sticker {
	key = "overreroll",
	loc_txt = {
        name = "Hefty",
        text = {
            "Reroll cost {C:money}$1{} more",
            "In this run",
            "if played hand is {C:attention}High Card"
        },
        label = "Hefty",
    },
	rate = 0.03,
    atlas = 'stickersylt',
	pos = { x = 1, y = 0 },
	badge_colour = HEX 'B26CBB',
	default_compat = true,
	compat_exceptions = {},
	sets = { Joker = true },
	needs_enable_flag = false,
    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            if context.scoring_name == "High Card" then
                G.E_MANAGER:add_event(Event({func = function()
                    G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + 1
                    G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost + 1)
                    return true end }))
            end
        end
    end
}

SMODS.Sticker {
	key = "mplanet",
	loc_txt = {
        name = "Minor Star",
        text = {
            "When skipping {C:attention}Booster Pack",
            "Create a {C:planet}Planet Card{}",
            "{C:inactive}(Must have room){}",
        },
        label = "Minor Star",
    },
	rate = 0.02,
    atlas = 'stickersylt',
	pos = { x = 2, y = 0 },
	badge_colour = G.C.DARK_EDITION,
	default_compat = true,
	compat_exceptions = {},
	sets = { Joker = true },
	needs_enable_flag = false,
    calculate = function(self, card, context)
        if context.skipping_booster and not context.blueprint then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                            local tarot = create_card('Planet',G.consumeables, nil, nil, nil, nil, nil, 'mpl')
                            tarot:add_to_deck()
                            G.consumeables:emplace(tarot)
                            G.GAME.consumeable_buffer = 0
                        return true
                    end)}))
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_planet'), colour = G.C.BLUE})
            end
        end
    end
}



SMODS.Sticker {
	key = "sppinned",
	loc_txt = {
        name = "Heresy",
        text = {
            "Add {C:attention}Pinned{} to this card",
            "At the end of each round",
            "Create a {C:dark_edition}Negative{} {C:tarot}Wheel of Fortune",
        },
        label = "Heresy",
    },
	rate = 0.02,
    atlas = 'stickersylt',
	pos = { x = 1, y = 2 },
	badge_colour = G.C.DARK_EDITION,
	default_compat = true,
	compat_exceptions = {},
	sets = { Joker = true },
	needs_enable_flag = false,
    calculate = function(self, card, context)
        card.pinned = true
        if context.end_of_round and not (context.individual or context.repetition) then
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = (function()
                        local _card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, 'c_wheel_of_fortune', 'spp')
                        _card:set_edition({negative = true}, true)
                        _card:add_to_deck()
                        G.consumeables:emplace(_card)
                    return true
                end)}))
        end
    end
}
----------------------------------------------
------------MOD CODE END----------------------
