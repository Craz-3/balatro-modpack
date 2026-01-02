--- STEAMODDED HEADER
--- MOD_NAME: Pampa Joker Pack
--- MOD_ID: mtl_jkr2
--- MOD_AUTHOR: [Matelote, elbe]
--- MOD_DESCRIPTION: Adds 28 Jokers in the game


----------------------------------------------
------------MOD CODE -------------------------

SMODS.Atlas({ 
    key = "MTLJoker",
    path = "Jokers_mtl.png",
    px = 71,
    py = 95,
})

local j_jazztrio = SMODS.Joker{
	name = "Jazz Trio",
	key = "jazztrio",
	config = { extra = {}},
	pos = { x = 0, y = 0 },
	loc_txt = {
		name = "Jazz Trio",
        text = {
            "When played hand contains",
            "a scoring {C:attention}Jack{}, {C:attention}Queen{} and {C:attention}King{},",
            "upgrade {C:attention}2{} random {C:attention}Poker Hands{}"
        }
	},
	rarity = 1,
	cost = 4,
    unlocked = true,
    discovered = false,
	blueprint_compat = true,
	perishable_compat = true,
	atlas = "MTLJoker",
	loc_vars = function(self, info_queue, center)
		return { vars = {  } }
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.jokers and context.before then
            -- check if one scoring king, queen and jack are in the played hand
            local has_j = 0
            local has_q = 0
            local has_k = 0
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:get_id() == 11 then has_j=1 end
                if context.scoring_hand[i]:get_id() == 12 then has_q=1 end
                if context.scoring_hand[i]:get_id() == 13 then has_k=1 end
            end
            if has_j==1 and has_q==1 and has_k==1 then
                --Get the current poker hand
                --local k_hand,disp_text = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
                local k_hand,disp_text,poker_hands,scoring_hand,non_loc_disp_text = G.FUNCS.get_poker_hand_info(G.play.cards)
                -- Upgrade two random poker hands
                local possible_hands={}
                -- Check which poker hands can be upgraded
                for k, v in pairs(G.GAME.hands) do
                    if G.GAME.hands[k].visible then
                        table.insert(possible_hands,k)
                    end
                end
                -- Choose two random hands to upgrade (can be the same hand twice)
                for i=1,2 do
                    local k_chosen = pseudorandom_element(possible_hands, pseudoseed('jazz'))
                    update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(k_chosen, 'poker_hands'),chips = G.GAME.hands[k_chosen].chips, mult = G.GAME.hands[k_chosen].mult, level=G.GAME.hands[k_chosen].level})
                    level_up_hand(card, k_chosen, false)
                    update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(k_hand, 'poker_hands'),chips = G.GAME.hands[k_hand].chips, mult = G.GAME.hands[k_hand].mult, level=G.GAME.hands[k_hand].level})
                end
                return {
                    message = localize('k_level_up_ex')
                }
            end
        end
	end,
}

local j_subway = SMODS.Joker{
	name = "Subway Map",
	key = "subway",
	config = { extra = {mult_gain=4, mult=0, hand=0}},
	pos = { x = 3, y = 0 },
	loc_txt = {
		name = "Subway Map",
        text = {
            "Gains {C:red}+#1#{} Mult if played hand",
            "contains the highest {C:attention}Straight{} so far.",
            "{C:inactsive}(Highest rank: #3#){}",
            "{C:inactive}(Currently: +#2#){}",
        }
	},
	rarity = 1,
	cost = 5,
    unlocked = true,
    discovered = false,
	blueprint_compat = true,
	perishable_compat = true,
	atlas = "MTLJoker",
	loc_vars = function(self, info_queue, center)
        if center.ability.extra.hand== 14 then return { vars = {center.ability.extra.mult_gain, center.ability.extra.mult, "A"} }
        elseif center.ability.extra.hand== 11 then return { vars = {center.ability.extra.mult_gain, center.ability.extra.mult, "J"} }
        elseif center.ability.extra.hand== 12 then return { vars = {center.ability.extra.mult_gain, center.ability.extra.mult, "Q"} }
        elseif center.ability.extra.hand== 13 then return { vars = {center.ability.extra.mult_gain, center.ability.extra.mult, "K"} }
        else return { vars = {center.ability.extra.mult_gain, center.ability.extra.mult, center.ability.extra.hand} }
        end
	end,
	calculate = function(self, card, context)
        if context.before then
            if next(context.poker_hands["Straight"]) and not context.blueprint then
                local broadway_check=false
                local rank_table={}
                for i = 1, #context.scoring_hand do
                    table.insert(rank_table,context.scoring_hand[i]:get_id())
                    if context.scoring_hand[i]:get_id()==11 or context.scoring_hand[i]:get_id()==12 or context.scoring_hand[i]:get_id()==13 then broadway_check=true end
                end
                table.sort(rank_table, function(a,b) return a>b end)
                local highest_rank=rank_table[1]
                if highest_rank==14 and not broadway_check then
                    highest_rank=rank_table[2]
                end
                sendDebugMessage("Highest rank "..highest_rank)

                sendDebugMessage("previoous rank "..card.ability.extra.hand)
                if (highest_rank> card.ability.extra.hand) then
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                    sendDebugMessage("update")
                    card.ability.extra.hand=highest_rank
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.MULT,
                        card = card
                    }
                end
            end
        end
        
        if context.joker_main and card.ability.extra.mult ~= 0 then
            return {
                message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult}},
                mult_mod = card.ability.extra.mult,
                colour = G.C.MULT,
                card = card
            }
        end
	end,
}

local j_snecko = SMODS.Joker{
	name = "Snecko Eye",
	key = "snecko",
    config = {h_size=0,extra ={deck=false}},
    pos = { x = 5, y = 1 },
	loc_txt = {
		name = "Snecko Eye",
        text = {
            "The ranks of first drawn cards",
            "each round are permanently randomized.",
        }
	},
	rarity = 2,
	cost = 6,
    unlocked = true,
    discovered = false,
	blueprint_compat = false,
	perishable_compat = true,
	atlas = "MTLJoker",
	loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.h_size } }
	end,
	calculate = function(self, card, context)
        if context.first_hand_drawn and not context.blueprint then
            sendDebugMessage("subsequent hand drawn")
            -- Check if a hand or a discard was played
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                play_sound('tarot1')
                return true end }))

            for i=1, #G.hand.cards do
                local percent = 1.15 - (i-0.999)/(#G.hand.cards-0.998)*0.3
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.4,func = function() G.hand.cards[i]:flip();play_sound('card1', percent);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
            end

            delay(0.5)
            
            G.E_MANAGER:add_event(Event({
                func = function() 
                    for i=1, #G.hand.cards do
                        local _rank = pseudorandom_element({'2','3','4','5','6','7','8','9','T','J','Q','K','A'}, pseudoseed('ouija'))
                        local card = G.hand.cards[i]
                        print(tostring(card.base))
                        local suit_prefix = SMODS.Suits[card.base.suit].card_key..'_'
                        local rank_suffix =_rank
                        card:set_base(G.P_CARDS[suit_prefix..rank_suffix])
                        print(tostring(card.base))
                    end  
                    G.hand:sort()
                    return true
                end}))
            
            for i=1, #G.hand.cards do
                local percent = 0.85 + (i-0.999)/(#G.hand.cards-0.998)*0.3
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.4,func = function() G.hand.cards[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
            end
            delay(0.5)
        end
	end,
}

local j_sealbouquet = SMODS.Joker{
	name = "Seal Bouquet",
	key = "sealbouquet",
	config = { extra = {}},
    pos = {x=0,y=2},
	loc_txt = {
		name = "Seal Bouquet",
        text = {
            "If first card of a {C:clubs}Spades{} flush",
            "contains a {C:attention}seal{}, add a random {C:attention}seal{}",
            "to another random card."
        }
	},
	rarity = 2,
	cost = 7,
    unlocked = true,
    discovered = false,
	blueprint_compat = true,
	perishable_compat = true,
	atlas = "MTLJoker",
	loc_vars = function(self, info_queue, center)
		return { vars = {  } }
	end,
	calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.before then
            if next(context.poker_hands["Flush"]) then
                --check if first card is a spade and has a seal
                if context.scoring_hand[1]:is_suit('Spades') and context.scoring_hand[1].seal then

                    --get a random number from 2 to 5 or 4
                    possible_cards={}
                    for i = 2, #context.scoring_hand do
                        table.insert(possible_cards,i)
                    end
                    local i_card=pseudorandom_element(possible_cards)
                    local random_seal = pseudorandom_element(G.P_CENTER_POOLS.Seal, pseudoseed("sealbouquet"))
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            context.scoring_hand[i_card]:juice_up()
                            context.scoring_hand[i_card]:set_seal(random_seal.key, true)
                            return true
                        end
                    }))
                    return {
                        message = localize("b_seals"),
                        card = self
                    }
                end
            end
        end
	end,
}

local j_mixtape = SMODS.Joker{
	name = "Mixtape",
	key = "mixtape",
    config = {extra={money_gain=2, money=0}},
    pos = {x=1,y=2},
	loc_txt = {
		name = "Mixtape",
        text = {
            "Gain {C:money}$#1#{} at the end of round for each",
            "enchanced {C:clubs}Clubs{} card in your deck.",
            "(Currently {C:money}$#2#{})",
        }
	},
	rarity = 2,
	cost = 7,
    unlocked = true,
    discovered = false,
	blueprint_compat = true,
	perishable_compat = true,
	atlas = "MTLJoker",
	loc_vars = function(self, info_queue, center)
        local n_clubs=0
        if (G.playing_cards) then
            for _, v in pairs(G.playing_cards) do
                if v:is_suit('Clubs') and v.config.center ~= G.P_CENTERS.c_base then n_clubs = n_clubs + 1 end
            end
            return { vars = {center.ability.extra.money_gain, center.ability.extra.money_gain*n_clubs}}
        else
            return { vars = {center.ability.extra.money_gain, 0}}
        end
	end,
    calc_dollar_bonus = function(self, card)
        -- compute the number of enhanced clubs in deck
        local n_clubs=0
        for _, v in pairs(G.playing_cards) do
            if v:is_suit('Clubs') and v.config.center ~= G.P_CENTERS.c_base then n_clubs = n_clubs + 1 end
        end
        return n_clubs * card.ability.extra.money_gain
    end
}

local j_bikini = SMODS.Joker{
	name = "Tiger Bikini",
	key = "bikini",
    config = { extra = {mult=3, threshold=13}},
    pos = { x = 1, y = 0 },
	loc_txt = {
		name = "Tiger Bikini",
        text = {
            "{C:red}+#1#{} Mult for each",
            "{C:hearts}hearts{} card above {C:attention}#2#{}",
            "in your full deck",
            "{C:inactive}(Currently {C:red}+#3#{C:inactive} Mult)"
        }
	},
	rarity = 2,
	cost = 7,
    unlocked = true,
    discovered = false,
	blueprint_compat = true,
	perishable_compat = true,
	atlas = "MTLJoker",
	loc_vars = function(self, info_queue, center)
        --Check the number of hearts in the deck
        local heart_number=0
        if (G.playing_cards) then
            for _, v in pairs(G.playing_cards) do
                if v:is_suit('Hearts') then heart_number = heart_number + 1 end
            end
            return { vars = {center.ability.extra.mult, center.ability.extra.threshold, math.max(0, center.ability.extra.mult * (heart_number - center.ability.extra.threshold))}}
        else
            return { vars = {center.ability.extra.mult, center.ability.extra.threshold, 0}}
        end
	end,
    calculate = function(self, card, context)
        if context.joker_main then
           --Check the number of hearts in the deck
           local heart_number=0
           for _, v in pairs(G.playing_cards) do
               if v:is_suit('Hearts') then heart_number = heart_number+1 end
           end
           sendDebugMessage(heart_number)
           sendDebugMessage(card.ability.extra.threshold)
           if (heart_number > card.ability.extra.threshold) then
               return {
                   message = localize{type='variable', key='a_mult', vars={card.ability.extra.mult * (heart_number - card.ability.extra.threshold)}},
                   mult_mod = card.ability.extra.mult * (heart_number - card.ability.extra.threshold),
                   colour = G.C.MULT,
                   card = card
               }
           end
        end
    end
}

local j_flamingo = SMODS.Joker{
	name = "Flamingo",
	key = "flamingo",
    config = {extra={odds=30}},
    pos = {x=2,y=2},
	loc_txt = {
		name = "Flamingo",
        text = {
            "When played, {C:diamonds}Diamonds{} cards",
            "have {C:green}#1# in #2#{} chance",
            "to become {C:dark_edition}polychrome{}.",
        }
	},
	rarity = 2,
	cost = 7,
    unlocked = true,
    discovered = false,
	blueprint_compat = true,
	perishable_compat = true,
	atlas = "MTLJoker",
	loc_vars = function(self, info_queue, center)
        return { vars = {''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}}
	end,
    calculate = function(self, card, context)        
		if context.cardarea == G.jokers and context.before then
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_suit('Diamonds') and (pseudorandom('flamingo') < G.GAME.probabilities.normal / card.ability.extra.odds) then
                    sendDebugMessage("diamond")
                    context.scoring_hand[i]:set_edition({polychrome = true}, true,false)
                end
            end
        end
    end
}

local j_sliding = SMODS.Joker{
	name = "Sliding Joker",
	key = "sliding",
    config = {extra={mult=0, chips=0,mult_gain=5,chip_gain=25}},
    pos = {x=4,y=0},
	loc_txt = {
		name = "Sliding Joker",
        text = {
            "Gains {C:red}+#1#{} Mult for each hand containing a {C:attention}Flush{}.",
            "Gains {C:chips}+#2#{} Chips for each hand containing a {C:attention}Straight{}.",
            "Resets at the end of each ante.",
            "(Currently: {C:red}+#3#{} Mult, {C:chips}+#4#{} Chips)"
        }
	},
	rarity = 1,
	cost = 4,
    unlocked = true,
    discovered = false,
	blueprint_compat = true,
	perishable_compat = true,
	atlas = "MTLJoker",
	loc_vars = function(self, info_queue, center)
        return { vars = {center.ability.extra.mult_gain, center.ability.extra.chip_gain, center.ability.extra.mult, center.ability.extra.chips}}
	end,
    calculate = function(self, card, context)
		if context.end_of_round  and G.GAME.blind.boss then
            card.ability.extra.mult = 0
            card.ability.extra.chips = 0
            return {
                message = localize('k_reset'),
                colour = G.C.RED
            }
        end
        if context.before and not context.blueprint then
            if next(context.poker_hands["Straight Flush"]) then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
                return {
                    message = localize('k_upgrade_ex'),
                    card = card
                }
            elseif next(context.poker_hands["Flush"]) then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                return {
                    message = localize('k_upgrade_ex'),
                    card = card
                }
            elseif next(context.poker_hands["Straight"]) then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
                return {
                    message = localize('k_upgrade_ex'),
                    card = card
                }
            end
        end
        if context.joker_main then
            return {
                message = localize{type='variable',key='sliding_joker',vars={card.ability.extra.mult,card.ability.extra.chips}},
                mult_mod = card.ability.extra.mult,
                chip_mod = card.ability.extra.chips,
                colour = G.C.MULT
            }
        end
    end
}

local j_claw = SMODS.Joker{
	name = "Claw",
	key = "claw",
    config = {extra= {chip_gain=1}},
    pos = {x=4,y=1},
	loc_txt = {
        name = "Claw",
        text = {
            "When any {C:attention}3{} is played, permanently give",
            "{C:chips}+#1#{} chips to ALL 3s in the deck."
        }
	},
	rarity = 2,
	cost = 6,
    unlocked = true,
    discovered = false,
	blueprint_compat = true,
	perishable_compat = true,
	atlas = "MTLJoker",
	loc_vars = function(self, info_queue, center)
        return { vars = {center.ability.extra.chip_gain}}
	end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 3 then
                --loop on all cards 
                for _, v in pairs(G.playing_cards) do
                    if v:get_id() == 3 then
                        v.ability.perma_bonus = v.ability.perma_bonus or 0
                        v.ability.perma_bonus = v.ability.perma_bonus + card.ability.extra.chip_gain
                    end
                end

                return {
                    extra = {message = localize('k_upgrade_ex_claw'), colour = G.C.CHIPS},
                    colour = G.C.CHIPS,
                    card = card
                }
            end
        end
    end
}

local j_mahjong = SMODS.Joker{
	name = "Mahjong Joker",
	key = "mahjong",
    config = {extra={xmult_gain=0.3,frequency=3,counter=0}, Xmult = 1},
    pos = {x=6,y=0},
	loc_txt = {
        name = "Mahjong Joker",
        text = {
            "Gains {X:mult,C:white} X#1# {} Mult for",
            "every #2# hands containing",
            "{C:attention}Three of a Kind{}",
            "{C:inactive}(#3#/#2#){}",
            "{C:inactive}(Currently {X:mult,C:white} X#4# {C:inactive} Mult)"
        }
	},
	rarity = 2,
	cost = 6,
    unlocked = true,
    discovered = false,
	blueprint_compat = true,
	perishable_compat = true,
	atlas = "MTLJoker",
	loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.xmult_gain,center.ability.extra.frequency,center.ability.extra.counter,center.ability.x_mult}}
	end,
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers then
            if next(context.poker_hands["Three of a Kind"]) then
                --check the counter
                card.ability.extra.counter=card.ability.extra.counter+1
                if (card.ability.extra.counter == card.ability.extra.frequency) then
                    card.ability.extra.counter=0
                    card.ability.x_mult=card.ability.x_mult+card.ability.extra.xmult_gain
                    G.E_MANAGER:add_event(Event({
                        func = function() card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type='variable',key='a_xmult',vars={card.ability.x_mult}}}); return true
                        end}))
                    return
                end
            end
        end
    end
}

local j_blackstar = SMODS.Joker{
	name = "Black Star",
	key = "blackstar",
    config = {extra={}},
    pos = {x=7,y=0},
	loc_txt = {
        name = "Black Star",
        text = {
            "Prevents death once.",
            "Destroy all jokers and replace them",
            "with 2 random rare jokers."
        }
	},
	rarity = 3,
	cost = 8,
    unlocked = true,
    discovered = false,
	blueprint_compat = false,
	perishable_compat = true,
	atlas = "MTLJoker",
	loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.xmult_gain,center.ability.extra.frequency,center.ability.extra.counter,center.ability.x_mult}}
	end,
    calculate = function(self, card, context)
        if context.end_of_round and not context.blueprint and context.game_over then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.hand_text_area.blind_chips:juice_up()
                    G.hand_text_area.game_chips:juice_up()

                    --First remove all jokers and keep track of rarity, and edition and eternals
                    play_sound('tarot1')
                    local n_jokers=#G.jokers.cards
                    local n_eternal=0
                    for i = 1, n_jokers do
                        --Check if the joker is eternal
                        if (G.jokers.cards[i].ability.eternal) then
                            n_eternal=n_eternal+1
                        else
                            G.jokers.cards[i]:start_dissolve()
                        end
                    end
                    
                    for i = 1, 2 do
                        if ((i + n_eternal)  <= (G.jokers.config.card_limit)) then
                            --create new rare jokers
                            play_sound('timpani')
                            --local card = create_card('Joker', G.jokers, False, nil, nil, nil, nil, True and 'jud' or 'sou')
                            local new_card = create_card('Joker', G.jokers, nil, 0.99, nil, nil, nil, 'wra')
                            new_card:add_to_deck()
                            G.jokers:emplace(new_card)
                        end
                    end
                    return true
                end
            })) 
            return {
                message = localize('k_saved_ex'),
                saved = true,
                colour = G.C.RED
            }
        end
    end
}

local j_moon = SMODS.Joker{
	name = "Moon Rabbit",
	key = "moon",
    config = {extra={odds=2}},
    pos = {x=0,y=1},
	loc_txt = {
        name = "Moon Rabbit",
        text = {
            "{C:green}#1# in #2#{} chance",
            "to generate a copy of {C:attention}The Fool{}",
            "when a hand containing a {C:attention}Full House{} is played"
        }
	},
	rarity = 1,
	cost = 5,
    unlocked = true,
    discovered = false,
	blueprint_compat = true,
	perishable_compat = true,
	atlas = "MTLJoker",
	loc_vars = function(self, info_queue, center)
        return { vars = { ''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}}
	end,
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers then
            if next(context.poker_hands["Full House"]) and (pseudorandom('moonrabbit') < G.GAME.probabilities.normal/card.ability.extra.odds) and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                --generate The Fool
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4,
                            func = function()
                                local new_card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, 'c_fool', 'car')
                                new_card:add_to_deck()
                                G.consumeables:emplace(new_card)
                                G.GAME.consumeable_buffer = 0
                                return true
                            end}))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                        return true
                    end)}))
            end
        end
    end
}

local j_bell = SMODS.Joker{
	name = "Bell Curve",
	key = "bell",
    config = {extra={}},
    pos = {x=3,y=1},
	loc_txt = {
        name = "Bell Curve",
        text = {
            "Enhance one random card",
            "into a {C:attention}Lucky Card{} when",
            "first hand is drawn",
        }
	},
	rarity = 1,
	cost = 5,
    unlocked = true,
    discovered = false,
	blueprint_compat = true,
	perishable_compat = true,
	atlas = "MTLJoker",
	loc_vars = function(self, info_queue, center)
        return { vars = { ''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}}
	end,
    calculate = function(self, card, context)
        if context.first_hand_drawn then
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4,  func = function()
                    sendDebugMessage(#G.hand.cards)
                    --get non-enchanced cards in hand
                    local non_enh_list={}
                    for i=1, #G.hand.cards do
                        if G.hand.cards[i].config.center == G.P_CENTERS.c_base then table.insert(non_enh_list,G.hand.cards[i]) end
                    end
                    if #non_enh_list>0 then
                        local enhanced_card = pseudorandom_element(non_enh_list, pseudoseed('bellcurve'))
                        enhanced_card:set_ability(G.P_CENTERS.m_lucky , nil, true)
                        play_sound('tarot1')
                        enhanced_card:juice_up()
                    end
                    return true
                end
            }))
        end
    end
}

local j_konbini = SMODS.Joker{
	name = "Konbini",
	key = "konbini",
    config = {extra={mult=2}},
    pos = {x=3,y=2},
	loc_txt = {
        name = "Konbini",
        text = {
            "Gains {C:mult}+#1#{} mult",
            "per unique {C:tarot}Tarot{}",
            "card used this run",
            "{C:inactive}(Currently {C:mult}+#2#{}){}"
        }
	},
	rarity = 1,
	cost = 4,
    unlocked = true,
    discovered = false,
	blueprint_compat = true,
	perishable_compat = true,
	atlas = "MTLJoker",
	loc_vars = function(self, info_queue, center)
        if G.GAME.consumeable_usage then
            local tarots_used = 0
            for _, v in pairs(G.GAME.consumeable_usage) do
                if v.set == 'Tarot' then tarots_used = tarots_used + 1 end
            end
            return { vars = {center.ability.extra.mult, center.ability.extra.mult*tarots_used}}
        else
            return { vars = {center.ability.extra.mult, 0}}
        end
	end,
    calculate = function(self, card, context)
        if context.joker_main then
            local tarots_used = 0
            for _, v in pairs(G.GAME.consumeable_usage) do
                if v.set == 'Tarot' then tarots_used = tarots_used + 1 end
            end
            if tarots_used == 0 then return end
            return {
                message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult*tarots_used}},
                mult_mod = card.ability.extra.mult*tarots_used, 
                colour = G.C.MULT
            }
        end
    end
}

local j_3776 = SMODS.Joker{
	name = "3776",
	key = "3776",
    config = {extra={mult=6,repetitions=1}},
    pos = {x=4,y=2},
	loc_txt = {
        name = "3776",
        text = {
            "Each played {C:attention}3{},",
            "{C:attention}6{} or {C:attention}7{}, gives",
            "{C:mult}+#1#{} Mult when scored",
            "Retrigger all {C:attention}7{} "
        }
	},
	rarity = 2,
	cost = 6,
    unlocked = true,
    discovered = false,
	blueprint_compat = true,
	perishable_compat = true,
	atlas = "MTLJoker",
	loc_vars = function(self, info_queue, center)
        return { vars = {center.ability.extra.mult}}
	end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if context.other_card:get_id() == 7 then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.repetitions,
                    card = card
                }
            end
        end
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 3 or
                context.other_card:get_id() == 7 or
                context.other_card:get_id() == 6 then
                    return {
                        mult = card.ability.extra.mult,
                        card = card
                    }
            end
        end
    end
}

local j_pampa = SMODS.Joker{
	name = "Pampa",
	key = "pampa",
    config = {extra={money=10,odds = 3}},
    pos = {x=5,y=2},
	loc_txt = {
        name = "Pampa",
        text = {
            "Gain {C:money}$#1#{} at the end of round.",
            "{C:green}#2# in #3#{} chance this",
            "card is destroyed",
            "at end of round"
        }
	},
	rarity = 1,
	cost = 5,
    unlocked = true,
    discovered = false,
	blueprint_compat = false,
	perishable_compat = true,
	atlas = "MTLJoker",
    effect = "Bonus dollars",
	loc_vars = function(self, info_queue, center)
        return { vars = {center.ability.extra.money, ''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}}
	end,
    calculate = function(self, card, context)
        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            if pseudorandom('Pampa') < G.GAME.probabilities.normal/card.ability.extra.odds then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                            func = function()
                                    G.jokers:remove_card(card)
                                    card:remove()
                                    card = nil
                                return true; end}))
                        return true
                    end
                }))
                return {
                    message = localize('pampa_bye')
                }
            else
                return {
                    message = localize('k_safe_ex')
                }
            end
        end
    end,
    calc_dollar_bonus = function(self, card)
        return card.ability.extra.money
    end
}

local j_voodoo = SMODS.Joker{
	name = "3776",
	key = "voodoo",
    config = {extra={hand="", hand_array={},x_mult_gain=0.8}},
    pos = {x=9,y=1},
	loc_txt = {
        name = "Voodoo Doll",
        text = {
            "{X:mult,C:white}X#1# {} Mult",
            "for each unique played rank",
            "already played this round.",
            "(Played ranks: {C:attention}#2#{})"
        }
	},
	rarity = 2,
	cost = 6,
    unlocked = true,
    discovered = false,
	blueprint_compat = true,
	perishable_compat = true,
	atlas = "MTLJoker",
	loc_vars = function(self, info_queue, center)
        return { vars = {center.ability.extra.x_mult_gain,center.ability.extra.hand}}
	end,
    calculate = function(self, card, context)
        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            card.ability.extra.hand_array={}
            card.ability.extra.hand=""
        end
        if context.joker_main then
            local common_ranks={}
            if G.GAME.current_round.hands_played == 0 then --first hand: scoring is not possible
                --reset the round rank array
                card.ability.extra.hand_array={}
            else --scoring is possible
                --Check if played cards are in the rank array
                for i = 1, #context.scoring_hand do
                    local rank=context.scoring_hand[i]:get_id()
                    --loop on ranks played in previous hands
                    for j = 1, #card.ability.extra.hand_array do
                        if card.ability.extra.hand_array[j] == rank then
                            -- before adding the rank to the list of shared ranks, check if this is a duplicate 
                            local duplicate_flag=false
                            for k=1, #common_ranks do
                                if common_ranks[k]==rank then duplicate_flag=true end
                            end
                            if not duplicate_flag then
                                table.insert(common_ranks,rank)
                            end
                        end
                    end
                end
            end

            -- Then, add played cards to this round rank array
            for i = 1, #context.scoring_hand do
                local rank=context.scoring_hand[i]:get_id()
                --check for duplicates already in the array
                local duplicate_flag=false
                for k=1, #card.ability.extra.hand_array do
                    if card.ability.extra.hand_array[k]==rank then duplicate_flag=true end
                end
                if not duplicate_flag then
                    table.insert(card.ability.extra.hand_array, rank)
                end
            end

            -- Update the string self.ability.extra.hand to indicate what ranks were played
            --first sort the ranks
            table.sort(card.ability.extra.hand_array)
            --then convert to string
            card.ability.extra.hand=""
            for i = 1, #card.ability.extra.hand_array do
                if i>1 then card.ability.extra.hand=card.ability.extra.hand .. "-" end
                if (card.ability.extra.hand_array[i]<11) then
                    card.ability.extra.hand=card.ability.extra.hand .. tostring(card.ability.extra.hand_array[i])
                elseif (card.ability.extra.hand_array[i]==11) then
                    card.ability.extra.hand=card.ability.extra.hand .. "J"
                elseif (card.ability.extra.hand_array[i]==12) then
                    card.ability.extra.hand=card.ability.extra.hand .. "Q"
                elseif (card.ability.extra.hand_array[i]==13) then
                    card.ability.extra.hand=card.ability.extra.hand .. "K"
                elseif (card.ability.extra.hand_array[i]==14) then
                    card.ability.extra.hand=card.ability.extra.hand .. "A"
                end

            end

            --Finally, send the score using the number of ranks in common_ranks
            return {
                message = localize{type='variable',key='a_xmult',vars={1+(#common_ranks * card.ability.extra.x_mult_gain)}},
                Xmult_mod = 1+(#common_ranks * card.ability.extra.x_mult_gain)
            }
        end
    end
}

local j_cherry = SMODS.Joker{
	name = "Cherry",
	key = "cherry",
    config = {extra={mult_gain=2,pairs_discarded=0,hands_limit=12}},
    pos = {x=2,y=0},
	loc_txt = {
        name = "Cherry",
        text = {
            "Gains {C:red}+#1#{} Mult whenever a pair",
            "is discarded. Destroyed",
            "after #3# pairs discarded",
            "{C:inactive}(Currently: {C:red}+#2#{} Mult){}"
        }
	},
	rarity = 1,
	cost = 4,
    unlocked = true,
    discovered = false,
	blueprint_compat = true,
	perishable_compat = true,
	atlas = "MTLJoker",
	loc_vars = function(self, info_queue, center)
        return { vars = {center.ability.extra.mult_gain, center.ability.extra.pairs_discarded*center.ability.extra.mult_gain, center.ability.extra.hands_limit-center.ability.extra.pairs_discarded}}
	end,
    calculate = function(self, card, context)
        if context.pre_discard then
            local text,_ = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
            if text=="Pair" then
                card.ability.extra.pairs_discarded=card.ability.extra.pairs_discarded+1
                if (card.ability.extra.hands_limit-card.ability.extra.pairs_discarded) <= 0 then 
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound('tarot1')
                            card.T.r = -0.2
                            card:juice_up(0.3, 0.4)
                            card.states.drag.is = true
                            card.children.center.pinch.x = true
                            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                                func = function()
                                        G.jokers:remove_card(card)
                                        card:remove()
                                        card = nil
                                    return true; end}))
                            return true
                        end
                    }))
                    return {
                        message = localize('k_eaten_ex'),
                        colour = G.C.FILTER
                    }
                else
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
                end
            end
        end
        if context.joker_main then
            return {
                message = localize{type='variable',key='a_mult',vars={card.ability.extra.pairs_discarded*card.ability.extra.mult_gain}},
                mult_mod = card.ability.extra.pairs_discarded*card.ability.extra.mult_gain, 
                colour = G.C.MULT
            }
        end
    end,
}

local j_cafeg = SMODS.Joker{
	name = "Café Gourmand",
	key = "cafeg",
    config = {extra= {chips=80,n=3}},
    pos = {x=8,y=1},
	loc_txt = {
        name = "Café Gourmand",
        text = {
            "{C:chips}+#1#{} chips",
            "if hand has been played",
            "#2# times or less."
        }
	},
	rarity = 1,
	cost = 4,
    unlocked = true,
    discovered = false,
	blueprint_compat = true,
	perishable_compat = true,
	atlas = "MTLJoker",
	loc_vars = function(self, info_queue, center)
        return { vars = {center.ability.extra.chips,center.ability.extra.n}}
	end,
    calculate = function(self, card, context)
        if context.joker_main and G.GAME.hands[context.scoring_name] then
            if (G.GAME.hands[context.scoring_name].played<(card.ability.extra.n+1)) then
                return {
                    message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
                    chip_mod = card.ability.extra.chips,
                    colour = G.C.CHIPS
                }
            else
                -- Nope !
                return
            end
        end
    end,
}

local j_pimpbus = SMODS.Joker{
	name = "Pimp The Bus",
	key = "pimpbus",
    config = {extra= {x_mult_gain=0.1}},
    pos = {x=7,y=1},
	loc_txt = {
        name = "Pimp The Bus",
        text = {
            "Gains {X:mult,C:white}x#1#{} Mult",
            "for each consecutive scoring hand",
            "with at least one",
            "enhancement, edition or seal",
            "{C:inactive}(Currently {X:mult,C:white}x#2#{}){}"
        }
	},
	rarity = 2,
	cost = 6,
    unlocked = true,
    discovered = false,
	blueprint_compat = true,
	perishable_compat = true,
	atlas = "MTLJoker",
	loc_vars = function(self, info_queue, center)
        return { vars = {center.ability.extra.x_mult_gain,center.ability.x_mult}}
	end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.before and not context.blueprint then
            local enhanced = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i].config.center ~= G.P_CENTERS.c_base then enhanced=true end
                if context.scoring_hand[i].edition then enhanced=true end
                if context.scoring_hand[i].seal then enhanced=true end
            end
            if not enhanced then
                local last_mult = card.ability.x_mult
                card.ability.x_mult = 1
                if last_mult > 1 then 
                    return {
                        card = card,
                        message = localize('k_reset')
                    }
                end
            else
                card.ability.x_mult = card.ability.x_mult + card.ability.extra.x_mult_gain
            end
        end
        if context.joker_main and card.ability.x_mult > 0 then
            return {
                message = localize{type='variable',key='a_xmult',vars={card.ability.x_mult}},
                Xmult_mod = card.ability.x_mult
            }
        end
    end,
}

local j_selfpaint = SMODS.Joker{
	name = "Self Portrait",
	key = "selfpaint",
    config = {extra= {}},
    pos = {x=8,y=2},
	loc_txt = {
        name = "Self Portrait",
        text = {
            "First unscoring face card turns",
            "into a random non-face rank."
        }
	},
	rarity = 2,
	cost = 6,
    unlocked = true,
    discovered = false,
	blueprint_compat = true,
	perishable_compat = true,
	atlas = "MTLJoker",
	loc_vars = function(self, info_queue, center)
        return { vars = {}}
	end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.before and not context.blueprint then
            local first_face=true
            for i = 1, #context.full_hand do
                local scoring=false
                if context.full_hand[i]:is_face() then
                    --check the card is not scoring
                    for j = 1, #context.scoring_hand do
                        if (context.scoring_hand[j] == context.full_hand[i]) then
                            scoring=true
                        end
                    end
                    if not scoring then --do the effect
                        if first_face then
                            first_face=false
                            local suit_prefix = string.sub(context.full_hand[i].base.suit, 1, 1)..'_'
                            local percent = 1.15 - (1-0.999)/(#G.hand.cards-0.998)*0.3
                            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() context.full_hand[i]:flip();play_sound('card1', percent);context.full_hand[i]:juice_up(0.3, 0.3);return true end }))
                            delay(0.5)
                    
                            G.E_MANAGER:add_event(Event({
                                func = function() 
                                    local _rank = pseudorandom_element({'2','3','4','5','6','7','8','9','T','A'}, pseudoseed('selfportrait'))
                                    local rank_suffix =_rank
                                    context.full_hand[i]:set_base(G.P_CARDS[suit_prefix..rank_suffix])
                                    return true
                                end}))
                            
                            local percent = 0.85 + (1-0.999)/(#G.hand.cards-0.998)*0.3
                            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() context.full_hand[i]:flip();play_sound('tarot2', percent, 0.6);context.full_hand[i]:juice_up(0.3, 0.3);return true end }))
                        end
                    end
                end
            end
        end
    end,
}

local j_matry = SMODS.Joker{
	name = "Matryoshka",
	key = "matry",
    config = {extra={chips=30,size_list={}}},
    pos = {x=2,y=1},
	loc_txt = {
        name = "Matryoshka",
        text = {
            "{C:blue}+#1#{} chips for each unique",
             "scoring hand size played this round"
        }
	},
	rarity = 1,
	cost = 5,
    unlocked = true,
    discovered = false,
	blueprint_compat = true,
	perishable_compat = true,
	atlas = "MTLJoker",
	loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.chips }}  
	end,
    calculate = function(self, card, context)
        if context.joker_main then
            if G.GAME.current_round.hands_played == 0 then --first hand: reset
                card.ability.extra.size_list={}
            end
            --get hand size
            local duplicate_flag=false
            for k =1, #card.ability.extra.size_list do
                if #context.scoring_hand == card.ability.extra.size_list[k] then
                    duplicate_flag=true
                end
            end
            if not duplicate_flag then
                table.insert(card.ability.extra.size_list, #context.scoring_hand )
            end
            -- compute score using the number of elements in the list
            return {
                message = localize{type='variable',key='a_chips',vars={#card.ability.extra.size_list*card.ability.extra.chips}},
                chip_mod = #card.ability.extra.size_list*card.ability.extra.chips
            }
        end
    end,
}

local j_trick = SMODS.Joker{
	name = "Trick or Treat",
	key = "trick",
    config = {extra={x_mult_gain=1}},
    pos = { x = 9, y = 0 },
	loc_txt = {
        name = "Trick or Treat",
        text = {
            "Gains {X:mult,C:white}x#1#{} Mult for each",
            "{C:spectral}Spectral{} card used",
            "{C:inactive}(Currently {X:mult,C:white}x#2#{}){}"
        }
	},
	rarity = 3,
	cost = 8,
    unlocked = true,
    discovered = false,
	blueprint_compat = true,
	perishable_compat = true,
	atlas = "MTLJoker",
	loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.x_mult_gain, (G.GAME.consumeable_usage_total and math.max(1,center.ability.x_mult+G.GAME.consumeable_usage_total.spectral*center.ability.extra.x_mult_gain) or 1) }}
	end,
    calculate = function(self, card, context)
        if context.joker_main and G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.spectral > 0 then
            return {
                message = localize{type='variable',key='a_xmult',vars={math.max(1,card.ability.x_mult + G.GAME.consumeable_usage_total.spectral*card.ability.extra.x_mult_gain)}},
                Xmult_mod = math.max(1,card.ability.x_mult+G.GAME.consumeable_usage_total.spectral*card.ability.extra.x_mult_gain)
            }
        end
    end,
}

local j_fabric = SMODS.Joker{
	name = "Fabric Design",
	key = "fabric",
    config = {extra={added_to_deck=false}},
    pos = { x = 7, y = 2 },
	loc_txt = {
        name = "Fabric Design",
        text = {
            "When {C:attention}Blind{} is selected",
            "lose all {C:red}Discards{} and apply a random ",
            "{C:attention}enhancement{} to all cards in the deck.",
            "When removed, turn all cards back to normal."
        }
	},
	rarity = 3,
	cost = 8,
    unlocked = true,
    discovered = false,
	blueprint_compat = false,
	perishable_compat = true,
	atlas = "MTLJoker",
	loc_vars = function(self, info_queue, center)
        return { vars = { }}
	end,
    calculate = function(self, card, context)
        if context.first_hand_drawn then
            card.ability.extra.added_to_deck = true --not the right place for this but eh
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                play_sound('tarot1')
                return true end }))
            for i=1, #G.hand.cards do
                local percent = 1.15 - (i-0.999)/(#G.hand.cards-0.998)*0.3
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.4,func = function() G.hand.cards[i]:flip();play_sound('card1', percent);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
            end

            delay(0.5)
            G.E_MANAGER:add_event(Event({
                func = function() 
                    for i=1, #G.playing_cards do
                        local card = G.playing_cards[i]
                        local cen_pool = {}
                        for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                            cen_pool[#cen_pool+1] = v
                        end
                        center = pseudorandom_element(cen_pool, pseudoseed('spe_card'))

                        card:set_ability(center, nil, true)
                    end  
                    return true
                end}))
            
            for i=1, #G.hand.cards do
                local percent = 0.85 + (i-0.999)/(#G.hand.cards-0.998)*0.3
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.4,func = function() G.hand.cards[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
            end
            delay(0.5)
        end
        if context.setting_blind and not card.getting_sliced and not (context.blueprint_card or card).getting_sliced then
            G.E_MANAGER:add_event(Event({func = function()
                ease_discard(-G.GAME.current_round.discards_left, nil, true)
            return true end }))
        end
    end,
    remove_from_deck = function(self, card, area, copier)
        if card.ability.extra.added_to_deck then --dirty workaround because self.added_to_deck doesn't work ??
            --turn cards to normal
            if (G.playing_cards) then
                for i=1, #G.playing_cards do
                    local playing_card = G.playing_cards[i]
                    playing_card:set_ability(G.P_CENTERS.c_base, nil, true)
                end
            end
        end
    end
}

local j_open = SMODS.Joker{
	name = "Grand Slam",
	key = "open",
    config = {extra={xmult_gain=0.5,played_suits={},n_played_suits=0}},
    pos = {x=8,y=0},
	loc_txt = {
        name = "Grand Slam",
        text = {
            "{X:mult,C:white}x#1#{} Mult for each",
            "unique flush suit played this round ",
            "{C:inactive}(Played suits: #3# ){}",
            "{C:inactive}(Currently {X:mult,C:white}x#2#{} Mult){}"
        }
	},
	rarity = 2,
	cost = 6,
    unlocked = true,
    discovered = false,
	blueprint_compat = true,
	perishable_compat = true,
	atlas = "MTLJoker",
	loc_vars = function(self, info_queue, center)
        local suit_string=""
        if (center.ability.extra.played_suits) then
            for i=1, #center.ability.extra.played_suits do
                suit_string=suit_string .. center.ability.extra.played_suits[i] .. " "
            end
        end
        return { vars = { center.ability.extra.xmult_gain,math.max(1+center.ability.extra.n_played_suits*center.ability.extra.xmult_gain,1),suit_string }}
	end,
    calculate = function(self, card, context)
        if context.end_of_round and context.individual and context.repetition and not not context.blueprint then
            card.ability.extra.n_played_suits=0
            card.ability.extra.played_suits={}
        end
        if context.joker_main then
            if G.GAME.current_round.hands_played == 0 then --first hand: reset
                card.ability.extra.n_played_suits=0
                card.ability.extra.played_suits={}
            end

            if next(context.poker_hands["Flush"]) then
                --Get the flush suit
                local suit
                if context.scoring_hand[1]:is_suit('Hearts') then suit="Hearts" end
                if context.scoring_hand[1]:is_suit('Spades') then suit="Spades" end
                if context.scoring_hand[1]:is_suit('Clubs') then suit="Clubs" end
                if context.scoring_hand[1]:is_suit('Diamonds') then suit="Diamonds" end
                --check if suit is in the list
                local is_here=false
                for k =1, #card.ability.extra.played_suits do
                    if suit == card.ability.extra.played_suits[k] then
                        is_here=true
                    end
                end
                -- if it's not there, add the suit to the list
                if not is_here then 
                    table.insert(card.ability.extra.played_suits, suit)
                    card.ability.extra.n_played_suits=card.ability.extra.n_played_suits+1
                end
            end

            -- compute score using the number of suits in the list
            return {
                message = localize{type='variable',key='a_xmult',vars={math.max(1+card.ability.extra.n_played_suits*card.ability.extra.xmult_gain,1)}},
                Xmult_mod = math.max(1+card.ability.extra.n_played_suits*card.ability.extra.xmult_gain,1)
            }
        end
    end,
}

local j_thedream = SMODS.Joker{
	name = "The Dream",
	key = "thedream",
    config = {extra={}},
    pos = {x=0,y=3},
	loc_txt = {
        name = "The Dream",
        text = {
            "{C:attention}Level Up{} secret poker hands",
            "when played"
        }
	},
	rarity = 3,
	cost = 8,
    unlocked = true,
    discovered = false,
	blueprint_compat = true,
	perishable_compat = true,
	atlas = "MTLJoker",
	loc_vars = function(self, info_queue, center)
        return { vars = {  }}
	end,
    calculate = function(self, card, context)
        if context.before then
            if next(context.poker_hands["Flush House"]) then
                --level up flush house
                level_up_hand(card, "Flush House", false)
            elseif next(context.poker_hands["Five of a Kind"]) then
                --check if that is also a flush five
                if next(context.poker_hands["Flush Five"]) then
                    --level up flush five
                    level_up_hand(card, "Flush Five", false)
                else
                    --level up 5oak
                    level_up_hand(card, "Five of a Kind", false)
                end
            end
        end
    end,
}

local j_ishihara = SMODS.Joker{
	name = "Ishihara Test",
	key = "ishihara",
    config = {extra={}},
    pos = {x=9,y=2},
	loc_txt = {
        name = "Ishihara Test",
        text = {
            "All {C:attention}9{} and {C:attention}6{} become",
            "{C:attention}Wild{} cards when played."
        }
	},
	rarity = 1,
	cost = 5,
    unlocked = true,
    discovered = false,
	blueprint_compat = false,
	perishable_compat = true,
	atlas = "MTLJoker",
	loc_vars = function(self, info_queue, center)
        return { vars = {  }}
	end,
    calculate = function(self, card, context)
        if context.joker_main and not context.blueprint then
            local found_cards = {}
            for _, v in ipairs(context.full_hand) do
                if v:get_id()==6 or v:get_id()==9 then
                    found_cards[#found_cards+1] = v
                    v:set_ability(G.P_CENTERS.m_wild, nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            v:juice_up()
                            return true
                        end
                    }))
                end
            end
            if #found_cards > 0 then
                return {
                    colour = G.C.MONEY,
                    card = card
                }
            end
        end
    end,
}

local j_scopedog = SMODS.Joker{
	name = "Scopedog",
	key = "scopedog",
    config = {extra={}},
    pos = {x=5,y=0},
	loc_txt = {
        name = "Scopedog",
        text = {
            "Playing a hand containing an",
            "{C:attention}Aces Three of a Kind{}",
            "disables the {C:attention}Boss Blind{}"
        }
	},
	rarity = 2,
	cost = 6,
    unlocked = true,
    discovered = false,
	blueprint_compat = false,
	perishable_compat = true,
	atlas = "MTLJoker",
	loc_vars = function(self, info_queue, center)
        return { vars = {  }}
	end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.before then
            if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind:get_type() == 'Boss')) then
                --check hand
                local aces=0
                for i = 1, #context.scoring_hand do
                    if context.scoring_hand[i]:get_id()==14 then
                        aces=aces+1
                    end
                end
                if aces > 2 then
                    G.GAME.blind:disable()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                end
            end
        end
    end,
}


function SMODS.INIT.MtlJokers()

     -- Localization
    G.localization.misc.dictionary.pampa_bye = "Bye Bye !"
    G.localization.misc.dictionary.k_upgrade_ex_claw = "Upgrade all 3s !"
    G.localization.misc.dictionary.ph_black_star = "Saved by Black Star"
    G.localization.misc.v_dictionary.sliding_joker = {"+#1# mult ! +#2# chips !"}

    init_localization()

    local mtlJokers = {
        -- j_mathurine = {
        --     order = 6,
        --     unlocked = true,
        --     discovered = false,
        --     blueprint_compat = true,
        --     eternal_compat = true,
        --     rarity = 4,
        --     cost = 15,
        --     name = "Mathurine",
        --     set = "Joker",
        --     config = {extra={already_moved=false}},
        --     pos = {x=6,y=1},
        --     atlas = "MTLJoker"
        -- },
        -- j_13 = {
        --     order = 3,
        --     unlocked = true,
        --     discovered = false,
        --     blueprint_compat = true,
        --     eternal_compat = true,
        --     rarity = 3,
        --     cost = 8,
        --     name = "Number 13",
        --     set = "Joker",
        --     config = {},
        --     pos = { x = 1, y = 1 },
        --     atlas = "MTLJoker"}
        -- , 
    }

    -- Localization
    local jokerLocalization = {
        j_13 = {
            name = "Number 13",
            text = {
                "When any {C:attention}Glass Card{} breaks",
                "add one {C:attention}Glass Rank 13{}",
                "card to your deck"
            }
        },
        j_mathurine = {
            name = "Mathurine",
            text = {
                "{C:attention}Pins{} all jokers and copies",
                "ability of joker to the right thrice.",
                "Each time a hand is played, move {C:dark_edition}Mathurine{}",
                "one step to the right.",
            }
        },
    }

    -- Add Rank 13
    -- This rank can only be created by the joker Number 13
    -- Note: Suffix B will be picked by the function, for instance 13 of heart will be called "H_B"
    -- local cards_rank13 = SMODS.Sprite:new('cards_rank13', mtl_jkr_mod.path, 'cards_rank13.png', 71, 95, 'asset_atli')
    -- local cards_rank13_opt2 = SMODS.Sprite:new('cards_rank13_opt2', mtl_jkr_mod.path, 'cards_rank13_opt2.png', 71, 95, 'asset_atli')
    -- cards_rank13:register()
    -- cards_rank13_opt2:register()
    -- SMODS.Card:new_rank('13', 13, 'cards_rank13', 'cards_rank13_opt2', { x = 0 }, {
    --     Hearts = { y = 0 },
    --     Clubs = { y = 1 },
    --     Diamonds = { y = 2 },
    --     Spades = { y = 3 }
    -- }, {
    --     next= {},
    --     strength_effect = { ignore = true }
    -- })   


end

---------------------
-- Joker abilities --
---------------------
local set_abilityref = Card.set_ability
function Card.set_ability(self, center, initial, delay_sprites)
    set_abilityref(self, center, initial, delay_sprites)
    if 1 == 0 then
    elseif self.ability.name == "Number 13" then
        self:set_sprites(center)
    elseif self.ability.name == "Mathurine" then
        self:set_sprites(center)
    end
end

local calculate_jokerref = Card.calculate_joker
function Card.calculate_joker(self, context)
    local calc_ref = calculate_jokerref(self, context)
    if self.ability.set == "Joker" and not self.debuff then
        if context.open_booster then
        elseif context.buying_card then
        elseif context.selling_self then
        elseif context.selling_card then
        elseif context.reroll_shop then
        elseif context.ending_shop then
        elseif context.skip_blind then
        elseif context.skipping_booster then
        elseif context.playing_card_added and not self.getting_sliced then
        elseif context.destroying_card then
        elseif context.cards_destroyed then
            -- if self.ability.name == 'Number 13' then
            --     --count number of cards destroyed
            --     local glasses = 0
            --     for k, v in ipairs(context.glass_shattered) do
            --          if v.shattered then
            --              glasses = glasses + 1
            --          end
            --     end
            --     sendDebugMessage("entering cards_destroyed")
            --     sendDebugMessage(glasses)
            --     -- Create card(s) - CAN be blueprinted
            --     if glasses > 0 then
            --         for i=1, glasses do
            --             sendDebugMessage("create card")
            --             G.deck.config.card_limit = G.deck.config.card_limit + 1
            --             G.E_MANAGER:add_event(Event({
            --                 func = function() 
            --                     _suit = pseudorandom_element({'S','H','D','C'}, pseudoseed('13_create'))
            --                     local _card =  create_playing_card({front = G.P_CARDS[_suit..'_'..'B'], center = G.P_CENTERS.m_glass}, G.hand)
            --                     if context.blueprint_card then context.blueprint_card:juice_up() else self:juice_up() end
            --                     return true
            --             end}))  
            --         end
            --     end

            --     return {
            --         message = localize('k_copied_ex'),
            --         colour = G.C.CHIPS,
            --         card = self,
            --         playing_cards_created = {true}
            --     }
            -- end
        elseif context.remove_playing_cards then
            if self.ability.name == 'Number 13'  then
                --count number of cards destroyed
                local glasses = 0
                for k, val in ipairs(context.removed) do
                    if val.shattered then glasses = glasses + 1 end
                end
                sendDebugMessage("entering cards_removed")
                sendDebugMessage(glasses)
                -- Create card(s) - CAN be blueprinted
                if glasses > 0 then
                    for i=1, glasses do
                        sendDebugMessage("create card")
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                _suit = pseudorandom_element({'S','H','D','C'}, pseudoseed('13_create'))
                                local _card =  create_playing_card({front = G.P_CARDS[_suit..'_'..'B'], center = G.P_CENTERS.m_glass}, G.hand)
                                if context.blueprint_card then context.blueprint_card:juice_up() else self:juice_up() end
                                return true
                        end}))
                    end
                end
                return
            end
        elseif context.using_consumeable  then
            -- if self.ability.name == 'Number 13' and not context.blueprint and context.consumeable.ability.name == 'The Hanged Man' then
            --     --count number of cards destroyed
            --     local glasses = 0
            --     if not context.blueprint then
            --         for k, val in ipairs(G.hand.highlighted) do
            --             if val.ability.name == 'Glass Card' then glasses = glasses + 1 end
            --         end
            --     end
            --     sendDebugMessage("ok")
            --     sendDebugMessage(glasses)
            --     -- Create card(s) - CAN be blueprinted
            --     if glasses > 0 then
            --         for i=1, glasses do
            --             sendDebugMessage("create card")
            --             G.deck.config.card_limit = G.deck.config.card_limit + 1
            --             G.E_MANAGER:add_event(Event({
            --                 func = function() 
            --                     _suit = pseudorandom_element({'S','H','D','C'}, pseudoseed('13_create'))
            --                     local _card =  create_playing_card({front = G.P_CARDS[_suit..'_'..'B'], center = G.P_CENTERS.m_glass}, G.hand)
            --                     if context.blueprint_card then context.blueprint_card:juice_up() else self:juice_up() end
            --                     return true
            --             end}))  
            --         end
            --     end

            --     return
            -- end            
        elseif context.debuffed_hand then
        elseif context.pre_discard then
        elseif context.discard then
        elseif context.other_joker then
        elseif context.adding_to_deck then
        else
            if context.cardarea == G.jokers then
                if context.before then
                    if self.ability.name == 'Mathurine' then
                        self.ability.extra.already_moved=false
                    end
                elseif context.after then
                    if self.ability.name == 'Mathurine' and not self.ability.extra.already_moved then --mathurine moves at the end of round, only once to prevent infinite moving loop
                            self.ability.extra.already_moved=true
                            G.E_MANAGER:add_event(Event({ func = function()
                                for i = 1, #G.jokers.cards do
                                    G.jokers.cards[i].pinned=false
                                end
                                local mathurine_pos
                                for i = 1, #G.jokers.cards do
                                    if G.jokers.cards[i].ability.name == 'Mathurine' then mathurine_pos=i end
                                end
                                if mathurine_pos <#G.jokers.cards then
                                    G.jokers.cards[mathurine_pos], G.jokers.cards[mathurine_pos+1] = G.jokers.cards[mathurine_pos+1], G.jokers.cards[mathurine_pos]
                                else
                                    G.jokers.cards[mathurine_pos], G.jokers.cards[1] = G.jokers.cards[1], G.jokers.cards[mathurine_pos]
                                end

                                play_sound('cardSlide1', 0.85)

                                for i = #G.jokers.cards,1,-1  do
                                    G.jokers.cards[i].pinned=true
                                end
                                return true
                            end }))
                    end
                end
            end
        end
    end

    return calc_ref
end

local mod_path = SMODS.current_mod.path
-- JokerDisplay mod support
if _G["JokerDisplay"] then
	NFS.load(mod_path .. "PampaJokers_Definitions.lua")()
end

----------------------------------------------
------------MOD CODE END----------------------
