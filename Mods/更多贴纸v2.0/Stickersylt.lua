--- STEAMODDED HEADER
--- MOD_NAME: stickersylt
--- MOD_ID: stickersylt
--- MOD_AUTHOR: [sishui]
--- MOD_DESCRIPTION: Adds interesting stickers
--- BADGE_COLOUR: 00009C
--- PRIORITY: 100

SMODS.Atlas {  
    key = 'stickersylt',
    px = 71,
    py = 95,
    path = 'stickersylt.png'
}

SMODS.Sticker {
	key = "wall",
	loc_txt = {
            name = "囤积",
            text = {
                "选择{C:attention}Boss盲注{}时",
                "得分要求{C:mult}X4",
                "每回合结束获得{C:money}$8"
            },
        label = "囤积",
    },
	rate = 0.001,
    atlas = 'stickersylt',
	pos = { x = 0, y = 0 },
    order = 1,
	badge_colour = HEX 'dbdb70',
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
            name = "沉重",
            text = {
                "打出{C:attention}高牌{}时",
                "本赛局重掷费用",
                "永久增加{C:money}$1{}"
            },
        label = "沉重",
    },
	rate = 0.001,
    atlas = 'stickersylt',
	pos = { x = 1, y = 0 },
    order = 2,
	badge_colour = HEX '5c4033',
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
            name = "微星",
            text = {
                "当跳过{C:attention}补充包{}时",
                "生成一张{C:planet}星球牌{}",
                "{C:inactive}(必须有空位!){}",
            },
        label = "微星",
    },
	rate = 0.002,
    atlas = 'stickersylt',
	pos = { x = 2, y = 0 },
    order = 3,
	badge_colour = HEX("70dbdb"),
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
	key = "splucky",
	loc_txt = {
            name = "赌博",
            text = {
                "打出的每张计分",
                "{C:attention}幸运牌{}将使得",
                "此牌售价提高{C:money}$7",
                "手中有{C:attention}钢铁牌{}时",
                "你失去所有资金",
            },
        label = "赌博",
    },
	rate = 0.001,
    atlas = 'stickersylt',
	pos = { x = 3, y = 0 },
    order = 4,
	badge_colour = HEX("8e6b23"),
	default_compat = true,
	compat_exceptions = {},
	sets = { Joker = true },
	needs_enable_flag = false,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.ability.effect == "Lucky Card" then
                card.ability.extra_value = card.ability.extra_value + 7
			    card:set_cost()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_val_up'), colour = G.C.MONEY})
			end
        end
        if context.cardarea == G.hand and context.individual and not context.end_of_round then
            if context.other_card.ability.effect == "Steel Card" then
                ease_dollars(-G.GAME.dollars, true)
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "归零!"..G.GAME.dollars, colour = G.C.MONEY})
            end
        end
    end
}

SMODS.Sticker {
	key = "shadow",
	loc_txt = {
            name = "阴影",
            text = {
                "打出{C:attention}同花{}牌型后",
                "降低所有牌型等级",
                "打出{C:attention}顺子{}牌型时",
                "牌组中所有{C:hearts}红桃{}",
                "获得{C:chips}+1额外筹码{}",
            },
        label = "阴影",
    },
	rate = 0.001,
    atlas = 'stickersylt',
	pos = { x = 4, y = 0 },
    order = 5,
	badge_colour = HEX("00009c"),
	default_compat = true,
	compat_exceptions = {},
	sets = { Joker = true },
	needs_enable_flag = false,
    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            if context.scoring_name == "Flush" then
                for k, v in pairs(G.GAME.hands) do
                    level_up_hand(card, k, true, -1)
                end
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "降低牌型等级", colour = G.C.MULT})
            end
            if context.scoring_name == "Straight" then
                for k, v in pairs(G.playing_cards) do
                    if v:is_suit('Hearts') then
                        v.ability.perma_bonus = v.ability.perma_bonus or 0
                        v.ability.perma_bonus = v.ability.perma_bonus + 1
                    end
                end
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "红桃获得筹码", colour = G.C.CHIPS})
            end
        end
    end
}

SMODS.Sticker {
	key = "sppinned",
	loc_txt = {
            name = "异端",
            text = {
                "此牌被添加{C:attention}固定{}",
                "每回合结束时生成",
                "一张{C:dark_edition}负片{}{C:tarot}命运之轮",
            },
        label = "异端",
    },
	rate = 0.002,
    atlas = 'stickersylt',
	pos = { x = 1, y = 2 },
    order = 6,
	badge_colour = HEX("8e2323"),
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
