SMODS.Atlas({
    key = 'decks',
    path = 'decks.png',
    px = '71',
    py = '95'
})



SMODS.Back({
	key = "orange", 
	atlas = "decks",
	pos = {x = 0, y = 0}, 
	config = {hands = -1, discards = 2}, 
	loc_vars = function(self, info_queue, card)
        -- if card and not card.fake_card and Ortalab.config.artist_credits then info_queue[#info_queue+1] = {generate_ui = ortalab_artist_tooltip, key = 'crimson'} end
        return {vars = {self.config.hands, self.config.discards}}
    end,
})

SMODS.Back({
    key = "cyan", 
    atlas = "decks",
    pos = {x = 1, y = 0}, 
    config = {hands = 2, discards = -1}, 
    loc_vars = function(self, info_queue, card)
        -- info_queue[#info_queue+1] = {generate_ui = ortalab_artist_tooltip, key = 'crimson'}
        return {vars = {self.config.hands, self.config.discards}}
    end,
})

SMODS.Back({
    key = "shady", 
    atlas = "decks",
    pos = {x = 2, y = 0}, 
    config = {joker = 'j_ortalab_black_friday', tag = 'tag_ortalab_stock'}, 
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                SMODS.add_card({key = self.config.joker, stickers = {'eternal'}, force_stickers = true, edition = 'e_ortalab_greyscale'})
                local stock_tag = Tag(self.config.tag, false, 'Small')
                add_tag(stock_tag)
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                return true
            end}))
    end,
    loc_vars = function(self, info_queue, card)
        -- info_queue[#info_queue+1] = {generate_ui = ortalab_artist_tooltip, key = 'flare'}
        return {vars = {localize({key = self.config.joker, set = 'Joker', type = 'name_text'}), localize({key = self.config.tag, set = 'Tag', type = 'name_text'})}}
    end
})

SMODS.Back({
    key = "neon", 
    atlas = "decks",
    pos = {x = 3, y = 0}, 
    config = {vouchers = {'v_ortalab_pulse_wave'}, extra = {rate = 5}}, 
    apply = function(self)
        G.GAME.modifiers.neon_deck = true
    end,
    loc_vars = function(self, info_queue, card)
        -- info_queue[#info_queue+1] = {generate_ui = ortalab_artist_tooltip, key = 'flare'}
        return {vars = {localize({key = self.config.vouchers[1], set = 'Voucher', type = 'name_text'}), self.config.extra.rate}}
    end,
})

local ortalab_poll_edition = poll_edition
function poll_edition(key, _mod, _no_neg, _guaranteed, options)
    if G.GAME.modifiers.neon_deck then _mod = (_mod or 1) * G.GAME.selected_back.effect.config.extra.rate end
    return ortalab_poll_edition(key, _mod, _no_neg, _guaranteed, options)
end

local ortalab_card_for_shop = create_card_for_shop
function create_card_for_shop(area)
    local card = ortalab_card_for_shop(area)
    if G.GAME.modifiers.neon_deck and card.edition then
        card.ability.extra_cost = -1 * math.floor(card.cost / 2)
        G.E_MANAGER:add_event(Event({
            func = function()
                card:set_cost()
                return true
            end
        }))
    end
    
    return card
end

SMODS.Voucher:take_ownership('v_seed_money', {loc_vars = function(self, info_queue, card) return {vars = {self.config.extra/5 * G.GAME.interest_amount}} end}, true)
SMODS.Voucher:take_ownership('v_money_tree', {loc_vars = function(self, info_queue, card) return {vars = {self.config.extra/5 * G.GAME.interest_amount}} end}, true)

SMODS.Back({
    key = "express", 
    atlas = "decks",
    pos = {x = 4, y = 0}, 
    config = {vouchers = {'v_ortalab_home_delivery', 'v_ortalab_hoarding'}, extra = {skips = 7}}, 
    artist = {'gappie'},
    apply = function(self)
        G.GAME.ortalab.skips_required = true
        G.GAME.ortalab.skips = self.config.extra.skips
    end,
    loc_vars = function(self, info_queue, card)
        return {vars = {localize({key = self.config.vouchers[1], set = 'Voucher', type = 'name_text'}), localize({key = self.config.vouchers[2], set = 'Voucher', type = 'name_text'}), self.config.extra.skips}}
    end,
})

SMODS.Back({
    key = "experimental", 
    atlas = "decks",
    pos = {x = 0, y = 1}, 
    config = {xmult = 1, xmult_gain = 0.1, loterias = 4, target_loterias_keys = {}}, 
    loc_vars = function(self, info_queue, card)
        -- info_queue[#info_queue+1] = {generate_ui = ortalab_artist_tooltip, key = 'crimson'}
        return {vars = {self.config.xmult, self.config.xmult_gain, self.config.loterias}}
    end,
    apply = function(self, card)
        card.effect.config.target_loterias = {}
        for i=1, card.effect.config.loterias do
            local new_loteria = G.P_CENTER_POOLS.ortalab_loteria[math.random(1, #G.P_CENTER_POOLS.ortalab_loteria)]
            while card.effect.config.target_loterias[new_loteria.key] do
                new_loteria = G.P_CENTER_POOLS.ortalab_loteria[math.random(1, #G.P_CENTER_POOLS.ortalab_loteria)]
            end
            card.effect.config.target_loterias[new_loteria.key] = true
        end
        for key, _ in pairs(card.effect.config.target_loterias) do
            table.insert(card.effect.config.target_loterias_keys, localize({key = key, set = 'ortalab_loteria', type = 'name_text'}))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.7,
                func = function()
                    SMODS.add_card({key = key, area = G.play})
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = function()
                attention_text({
                    scale = 1, text = 'Use these cards for a bonus!', hold = 4, align = 'cm', offset = {x = 0,y = 2.1},major = G.play
                })
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 5,
            func = function()
                for _, card in ipairs(G.play.cards) do
                    card:start_dissolve()
                end              
                return true
            end
        }))   
    end,
    calculate = function(self, card, context)
        if context.final_scoring_step then
            return {
                xmult = card.effect.config.xmult
            }
        end
        if context.using_consumeable and card.effect.config.target_loterias[context.consumeable.config.center_key] then
            card.effect.config.xmult = card.effect.config.xmult + card.effect.config.xmult_gain
            return {
                message = localize('ortalab_joker_miles'),
                colour = G.C.RED,
            }
        end
    end
})

function Ortalab.experimental_deck_tooltip(deck)
    local nodes = {}
    if Ortalab.loteria_targets then
        Ortalab.loteria_targets:remove()
    end
    Ortalab.loteria_targets = CardArea(G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h, 2 * G.CARD_W, 0.7 * G.CARD_H,
			{card_limit = 4, type = 'title', highlight_limit = 0, collection = true})
    for key, _ in pairs(deck.effect.config.target_loterias) do
        local card = Card(Ortalab.loteria_targets.T.x + Ortalab.loteria_targets.T.w / 2, Ortalab.loteria_targets.T.y, 0.6*G.CARD_W, 0.6*G.CARD_H, nil, G.P_CENTERS[key])
        card.ignore_shadow = {tooltip = true}
        Ortalab.loteria_targets:emplace(card)
    end
    
    localize{type = 'descriptions', key = 'b_ortalab_experimental_tooltip', set = 'Back', nodes = nodes, vars = {deck.effect.config.xmult, deck.effect.config.xmult_gain}}
    return {n=G.UIT.ROOT, config={align = "cm", minw = 3.5, minh = 1.75, id = deck.name, colour = G.C.CLEAR}, nodes={
        desc_from_rows(nodes, true, 3.5),
        {n = G.UIT.R, config = {align = "cm", padding = 0, no_fill = true}, nodes = {{n = G.UIT.O, config = {object = Ortalab.loteria_targets}}}}
    }}
end

local ortalab_card_hover = Card.hover
function Card:hover()
    if self.area == G.deck and G.GAME.selected_back.effect.center.key == 'b_ortalab_experimental' then
        self.config.h_popup = {n=G.UIT.C, config={align = "cm", padding=0.1}, nodes={
            {n=G.UIT.R, config={align=(self.params.deck_preview and 'bm' or 'cm')}, nodes = {
                {n=G.UIT.C, config={align = "cm", minh = 1.5, r = 0.1, colour = G.C.L_BLACK, padding = 0.1, outline=1}, nodes={
                    {n=G.UIT.R, config={align = "cm", r = 0.1, minw = 3, maxw = 4, minh = 0.4}, nodes={
                        {n=G.UIT.O, config={object = UIBox{definition =
                            {n=G.UIT.ROOT, config={align = "cm", colour = G.C.CLEAR}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = G.GAME.selected_back:get_name(),maxw = 4, colours = {G.C.WHITE}, shadow = true, bump = true, scale = 0.5, pop_in = 0, silent = true})}},
                            }},
                        config = {offset = {x=0,y=0}, align = 'cm', parent = e}}}
                        },
                    }},
                    {n=G.UIT.R, config={align = "cm", colour = G.C.WHITE, minh = 1.3, maxh = 3, minw = 3, maxw = 4, r = 0.1}, nodes={
                        {n=G.UIT.O, config={object = UIBox{definition = Ortalab.experimental_deck_tooltip(G.GAME.selected_back), config = {offset = {x=0,y=0}}}}}
                    }},
                }}
            }},            
        }}
        self.config.h_popup_config = self:align_h_popup()
        Node.hover(self)
    else
        ortalab_card_hover(self)
    end
end

SMODS.Back({
    key = "eclipse", 
    atlas = "decks",
    pos = {x = 1, y = 1}, 
    config = {hand_level = 1}, 
    loc_vars = function(self, info_queue, card)
        -- info_queue[#info_queue+1] = {generate_ui = ortalab_artist_tooltip, key = 'shai'}
        return {vars = {self.config.hand_level}}
    end,
    apply = function(self)
        G.GAME.ortalab.zodiacs.reduction = 2
    end
})

SMODS.Back({
    key = "sacred", 
    atlas = "decks",
    pos = {x = 2, y = 1}, 
    config = {vouchers = {'v_ortalab_fates_coin'}, extra = {select_reduction = 1}}, 
    artist_credits = {'kosze'},
    loc_vars = function(self, info_queue, card)
        return {vars = {self.config.extra.select_reduction, localize({type = 'name_text', set = 'Voucher', key = self.config.vouchers[1]})}}
    end,
    apply = function(self)
        G.GAME.ortalab.mythos.extra_select = -self.config.extra.select_reduction
    end
})

SMODS.Back({
    key = "royal", 
    atlas = "decks",
    pos = {x = 3, y = 1}, 
    config = {},
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                local faces = {}
                for k, rank in pairs(SMODS.Ranks) do
                    if rank.face then faces[#faces + 1] = k end
                end
                for k, v in pairs(G.playing_cards) do
                    if not v:is_face() then 
                        v.to_remove = true
                    end
                end
                local i = 1
                while i <= #G.playing_cards do
                    if G.playing_cards[i].to_remove then
                        G.playing_cards[i]:remove()
                    else
                        i = i + 1
                    end
                end
                G.GAME.starting_deck_size = #G.playing_cards
                G.deck.config.true_card_limit = #G.playing_cards
                return true
            end
        }))
    end,
    after_round = function(self, args)
        if args.context == 'eval' then
            local faces = {}
            for k, rank in pairs(SMODS.Ranks) do
                if rank.face then faces[#faces + 1] = k end
            end
            local new_card = create_playing_card(nil, G.deck)
            new_card:add_to_deck()
            SMODS.change_base(new_card, nil, pseudorandom_element(faces, pseudoseed('royal_deck_spawn')), nil)
            bottle_randomise(new_card)
            playing_card_joker_effects({new_card})
        end
    end,
    loc_vars = function(self, info_queue, card)
        -- info_queue[#info_queue+1] = {generate_ui = ortalab_artist_tooltip, key = 'salad'}
    end,
})

SMODS.Back({
    key = "prismatic", 
    atlas = "decks",
    pos = {x = 4, y = 1}, 
    config = {vouchers = {'v_ortalab_chisel'}},
    loc_vars = function(self, info_queue, card)
        -- info_queue[#info_queue+1] = {generate_ui = ortalab_artist_tooltip, key = 'crimson'}
        return {vars = {localize({type = 'name_text', set = 'Voucher', key = self.config.vouchers[1]})}}
    end,
})

SMODS.Back({
    key = "membership", 
    atlas = "decks",
    pos = {x = 0, y = 2}, 
    config = {vouchers = {'v_ortalab_catalog', 'v_ortalab_window_shopping'}}, 
    loc_vars = function(self, info_queue, card)
        -- info_queue[#info_queue+1] = {generate_ui = ortalab_artist_tooltip, key = 'crimson'}
        return {vars = {localize({type = 'name_text', set = 'Voucher', key = self.config.vouchers[1]}), localize({type = 'name_text', set = 'Voucher', key = self.config.vouchers[2]}), localize({type = 'name_text', set = 'Voucher', key = self.config.vouchers[3]})}}
    end,
})

SMODS.Back({
	key = "sketched", 
	atlas = "decks",
	pos = {x = 1, y = 2}, 
	config = {hand_size = -1, joker_slot = 1}, 
	loc_vars = function(self, info_queue, card)
        -- info_queue[#info_queue+1] = {generate_ui = ortalab_artist_tooltip, key = 'flare'}
        return {vars = {self.config.hand_size, self.config.joker_slot}}
    end,
})

SMODS.Back({
    key = 'hoarder',
    atlas = 'decks',
    pos = {x = 2, y = 2},
    config = {amount = 2},
    trigger_effect = function(self, args)
        if args.context == 'eval' and G.GAME.last_blind and G.GAME.last_blind.boss then
            for i=1, self.config.amount do
                local tag_pool = get_current_pool('Tag')
                local selected_tag = pseudorandom_element(tag_pool, pseudoseed('ortalab_hoarder'))
                local it = 1
                while selected_tag == 'UNAVAILABLE' do
                    it = it + 1
                    selected_tag = pseudorandom_element(tag_pool, pseudoseed('ortalab_hoarder_resample'..it))
                end
                G.E_MANAGER:add_event(Event({
                    trigger = 'after', delay = 0.4,
                    func = (function()
                        local new_tag = Tag(selected_tag, false, 'Small')
                        if selected_tag == 'tag_orbital' then
                            local _poker_hands = {}
                            for k, v in pairs(G.GAME.hands) do
                                if v.visible then _poker_hands[#_poker_hands+1] = k end
                            end
                            new_tag.ability.orbital_hand = pseudorandom_element(_poker_hands, pseudoseed('orbital'))
                        end
                        add_tag(new_tag)
                        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                        return true
                    end)
                }))
            end
        end
    end,
    loc_vars = function(self, info_queue, card)
        -- info_queue[#info_queue+1] = {generate_ui = ortalab_artist_tooltip, key = 'gappie'}
        return {vars = {self.config.amount}}
    end,
})

SMODS.Back({
    key = 'frozen',
    atlas = 'decks',
    pos = {x = 3, y = 2},
    config = {round = 1},
    calculate = function(self, card, context)
        if context.final_scoring_step then
            if G.GAME.current_round.hands_played == 0 then
                G.GAME.modifiers.frozen_deck = true
            else
                G.GAME.modifiers.frozen_deck = false
            end
        end
    end,
    loc_vars = function(self, info_queue, card)
        -- info_queue[#info_queue+1] = {generate_ui = ortalab_artist_tooltip, key = 'crimson'}
        return {vars = {self.config.round}}
    end,
})

local blind_defeat = Blind.defeat
Blind.defeat = function(silent)
    blind_defeat(silent)
    local obj = G.GAME.selected_back.effect.center
    if obj.after_round then
        local args = {
            context = 'eval'
        }
        obj:after_round(args)
    end
end
--[[
SMODS.Back({
    key = "restored", 
    atlas = "decks",
    pos = {x = 4, y = 2}, 
    config = {extra = {reduction = 2}},
    apply = function(self)
        G.GAME.ortalab.no_reshuffle = true
        G.GAME.ortalab.zodiacs.reduction = self.config.extra.reduction
        local card_protos = {}
        for k, v in pairs(G.P_CARDS) do
            if type(SMODS.Ranks[v.value].in_pool) == 'function' and not SMODS.Ranks[v.value]:in_pool({initial_deck = true, suit = v.suit})
            or type(SMODS.Suits[v.suit].in_pool) == 'function' and not SMODS.Suits[v.suit]:in_pool({initial_deck = true, rank = v.value}) then
                goto continue
            end
            local _ = nil
            local _r, _s = SMODS.Ranks[v.value].card_key, SMODS.Suits[v.suit].card_key
         
            card_protos[#card_protos+1] = {s=_s,r=_r}
            ::continue::
        end
        G.GAME.starting_params.extra_cards = card_protos
    end,
    loc_vars = function(self, info_queue, card)
        -- info_queue[#info_queue+1] = {generate_ui = ortalab_artist_tooltip, key = 'salad'}
        return {vars = {self.config.extra.reduction}}
    end,
})]]

SMODS.Back({
    key = "restored", 
    atlas = "decks",
    pos = {x = 4, y = 2}, 
    config = {bonus_slots = 1}, 
    apply = function(self)
        G.GAME.ortalab.no_reshuffle = true
        --[[local card_protos = {}]]
        G.E_MANAGER:add_event(Event({
            func = function()
                G.jokers.config.card_limit = G.jokers.config.card_limit + self.config.bonus_slots
                return true
            end,}))
    end,
    loc_vars = function(self, info_queue, card)
        -- info_queue[#info_queue+1] = {generate_ui = ortalab_artist_tooltip, key = 'salad'}
        return {vars = {self.config.bonus_slots}}
    end,
})

SMODS.Back({
	key = "challenge", 
	atlas = "decks",
	pos = {x = 0, y = 3},
    omit = true
})