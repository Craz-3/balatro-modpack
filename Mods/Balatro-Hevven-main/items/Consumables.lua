-- Trio
SMODS.Consumable({
    key = "trio",
    set = 'Tarot',
    cost=3,
    atlas = 'consumables',
    pos = {
        x = 0,
        y = 0
    },

    use = function(self, card, area, copier)
        -- Tarot
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            if G.consumeables.config.card_limit > #G.consumeables.cards then
                play_sound('timpani')
                local card_t = {
                    set = "Tarot",
                    area = G.consumeables
                }
                local new_card = SMODS.create_card(card_t)
                new_card:add_to_deck()
                G.consumeables:emplace(new_card)
                card:juice_up(0.3, 0.5)
            end
            return true 
        end }))

        --Planet
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            if G.consumeables.config.card_limit > #G.consumeables.cards then
                play_sound('timpani')
                local card_t = {
                    set = "Planet",
                    area = G.consumeables
                }
                local new_card = SMODS.create_card(card_t)
                new_card:add_to_deck()
                G.consumeables:emplace(new_card)
                card:juice_up(0.3, 0.5)
            end
            return true 
        end }))

        --Flow
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            if G.consumeables.config.card_limit > #G.consumeables.cards then
                local card_t = {
                    set = "Flow",
                    area = G.consumeables
                }
                local new_card = SMODS.create_card(card_t)
                new_card:add_to_deck()
                G.consumeables:emplace(new_card)
                card:juice_up(0.3, 0.5)
            end
            return true 
        end }))
    end,

    can_use = function (self, card) 
        return G.consumeables.config.card_limit >= #G.consumeables.cards
    end,
    credit = {
        art = "missingnumber",
        code = "TheAltDoc",
        concept = "TheAltDoc"
    }
})

-- Castle
SMODS.Consumable({
    key = "castle",
    set = 'Tarot',
    cost=3,
    atlas = 'consumables',
    pos = {
        x = 1,
        y = 0
    },

    use = function(self, card, area, copier)
        --Flow
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            if G.consumeables.config.card_limit > #G.consumeables.cards then
                local card_t = {
                    set = "Flow",
                    area = G.consumeables
                }
                local new_card = SMODS.create_card(card_t)
                new_card:add_to_deck()
                G.consumeables:emplace(new_card)
                card:juice_up(0.3, 0.5)
            end
            return true 
        end }))
    end,

    can_use = function (self, card) 
        return G.consumeables.config.card_limit >= #G.consumeables.cards
    end,
    credit = {
        art = "missingnumber",
        code = "TheAltDoc",
        concept = "patataofcourse"
    }
})

-- Translator
SMODS.Consumable({
    key = "translator",
    set = 'Tarot',
    cost=3,
    atlas = 'consumables',
    pos = {
        x = 2,
        y = 0
    },
    config = { mod_conv = "m_rh_call_response", max_highlighted = 1 },
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_rh_call_response

		return { vars = { card and card.ability.max_highlighted or self.config.max_highlighted } }
	end,
    credit = {
        art = "Nate Candles",
        code = "TheAltDoc",
        concept = "TheAltDoc"
    }
})

-- Hevven World
SMODS.Consumable({
    key = "hevven_world",
    set = 'Planet',
    cost=3,
    loc_vars = function(self, info_queue, card)
        return {
            vars= {
                card.ability.extra.hands,
                card.ability.extra.times,
            }
        }
    end,
    config = {extra = {hands=3,times=2}},
    atlas = 'consumables',
    pos = {
        x = 0,
        y = 2
    },

    use = function(self, card, area, copier)
        for i = 1, card.ability.extra.hands do
            local hand = poll_poker_hand({}, "hevven", false)
            update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {
                handname= localize(hand, "poker_hands"),
                chips = G.GAME.hands[hand].chips,
                mult = G.GAME.hands[hand].mult,
                level= G.GAME.hands[hand].level})
            level_up_hand(card, hand, nil, card.ability.extra.times)
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
        end
	end,

    can_use = function (self, card)
		return true
	end,
    credit = {
        art = "missingnumber",
        code = "TheAltDoc",
        concept = "TheAltDoc"
    }
})

-- Ascension
SMODS.Consumable({
    key = "ascension",
    set = 'Spectral',
    cost=4,
    atlas = 'consumables',
    pos = {
        x = 3,
        y = 1
    },
    config = {extra = {base_chance=1, max_chance=4}},
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome
                    return {
                        vars = {
                            card.ability.extra.base_chance* G.GAME.probabilities.normal,
                            card.ability.extra.max_chance,
                        }
                    }
        end,

    use = function(self, card, area, copier)
        -- Creating Joker pool and selecting a Joker
        self.eligible_editionless_jokers = EMPTY(self.eligible_editionless_jokers)
        for k, v in pairs(G.jokers.cards) do
            if v.ability.set == 'Joker' and (not v.edition) then
                table.insert(self.eligible_editionless_jokers, v)
            end
        end
        local eligible_card = pseudorandom_element(self.eligible_editionless_jokers, pseudoseed("ascension"))

        local chance = pseudorandom(pseudoseed('ascension'), 1, card.ability.extra.max_chance)
        if chance > card.ability.extra.base_chance* G.GAME.probabilities.normal then
            -- Destroy Joker!
            if not eligible_card.ability.eternal then
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                    eligible_card:start_dissolve(nil, nil)
                    card:juice_up(0.3, 0.5)
                return true end }))
            end
        else
            -- Add Polychrome!
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                eligible_card:set_edition({polychrome = true}, true)
                card:juice_up(0.3, 0.5)
            return true end }))
        end
    end,

    can_use = function (self, card) 
        for k, v in pairs(G.jokers.cards) do
            if v.ability.set == 'Joker' and (not v.edition) then
                return true
            end
        end
        return false
    end,
    credit = {
        art = "missingnumber",
        code = "TheAltDoc",
        concept = "missingnumber"
    }
})

-- Anguish
SMODS.Consumable({
    key = "anguish",
    set = 'Spectral',
    cost=4,
    atlas = 'consumables',
    pos = {
        x = 1,
        y = 1
    },
    config = {extra = {antes=1}},
        loc_vars = function(self, info_queue, card)
                    return {
                        vars = {
                            card.ability.extra.antes
                        }
                    }
        end,

    use = function(self, card, area, copier)
        local rightmost = G.jokers.cards[#G.jokers.cards]
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()
                play_sound("tarot1")
                card:juice_up(0.3, 0.5)
                return true
            end,
        }))
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.15,
            func = function()
                rightmost:flip()
                play_sound("card1", percent)
                rightmost:juice_up(0.3, 0.3)
                return true
            end,
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                copy_card(G.jokers.cards[1], rightmost)
                return true
            end
        }))
        delay(0.2)
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.15,
            func = function()
                rightmost:flip()
                play_sound("tarot2", percent)
                rightmost:juice_up(0.3, 0.3)
                return true
            end,
        }))
        ease_ante(card.ability.extra.antes)
    end,

    can_use = function (self, card) 
        return #G.jokers.cards > 1
    end,
    credit = {
        art = "missingnumber",
        code = "TheAltDoc",
        concept = "TheAltDoc"
    }
})

-- Endless
SMODS.Consumable({
    key = "endless",
    set = 'Spectral',
    cost=4,
    atlas = 'consumables',
    pos = {
        x = 2,
        y = 1
    },
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { key = "eternal", set = "Other" }
	end,

    use = function(self, card, area, copier)
        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_duplicated_ex')})
        local chosen_joker = pseudorandom_element(G.jokers.cards, pseudoseed('endless'))
        local card = copy_card(chosen_joker, nil, nil, nil, chosen_joker.edition and chosen_joker.edition.negative)
        card:add_sticker("eternal", true)
        card:add_to_deck()
        chosen_joker:add_sticker("eternal", true)
        G.jokers:emplace(card)
    end,

    can_use = function (self, card) 
        return #G.jokers.cards > 0 and #G.jokers.cards < G.jokers.config.card_limit
    end,
    credit = {
        art = "missingnumber",
        code = "TheAltDoc",
        concept = "TheAltDoc"
    }
})

-- Performer
SMODS.Consumable({
    key = "performer",
    set = 'Tarot',
    cost= 3,
    atlas = 'consumables',
    pos = {
        x = 3,
        y = 0
    },
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { key = "tag_rh_random", set = "Tag" }
	end,

    use = function(self, card, area, copier)
        add_tag(Tag('tag_rh_random'))
        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
    end,

    can_use = function (self, card) 
        return true
    end,
    credit = {
        art = "missingnumber",
        code = "TheAltDoc",
        concept = "missingnumber"
    }
})

-- Imperfection
SMODS.Consumable({
    key = "imperfection",
    set = 'Spectral',
    cost=4,
    atlas = 'consumables',
    pos = {
        x = 1,
        y = 2
    },
    config = {extra = {max_cards=1}},
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
		info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
		return { vars = { card.ability.extra.max_cards } }
	end,

    use = function(self, card, area, copier)
        for i=1, card.ability.extra.max_cards do
            local card_id = pseudorandom(pseudoseed('imperfection'), 1, #G.hand.cards)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function() 
                    G.hand.cards[card_id]:flip()
                    play_sound('card1')
                    G.hand.cards[card_id]:juice_up(0.3, 0.3)
                    return true 
                end 
            }))   
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function() 
                    G.hand.cards[card_id]:set_ability("m_stone")
                    G.hand.cards[card_id]:set_edition({negative = true}, true)
                    return true 
                end 
            }))        
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function() 
                    G.hand.cards[card_id]:flip()
                    play_sound('tarot2', 1, 0.6)
                    G.hand.cards[card_id]:juice_up(0.3, 0.3)
                    return true 
                end 
            }))
        end
    end,

    can_use = function (self, card) 
        return (G.STATE == G.STATES.SPECTRAL_PACK or 
        G.STATE == G.STATES.TAROT_PACK or
        G.STATE == G.STATES.PLANET_PACK or
        G.STATE == G.STATES.SMODS_BOOSTER_OPENED or
        G.STATE == G.STATES.SELECTING_HAND)
    end,
    credit = {
        art = "missingnumber",
        code = "TheAltDoc",
        concept = "TheAltDoc"
    }
})

-- Descendant
SMODS.Consumable({
    key = "descendant",
    set = 'Tarot',
    cost=3,
    atlas = 'consumables',
    pos = {
        x = 2,
        y = 2
    },

    use = function(self, card, area, copier)
        for k, v in ipairs(G.jokers.cards) do
            if v.ability["rh_remix_sticker_joker"] then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.6,
                    func = function() 
                        v:juice_up()
                        v:remove_sticker("rh_remix_sticker_joker")
                        play_sound('gold_seal', 1.2, 0.4)
                        return true 
                    end 
                }))
            end
        end
        for k, v in ipairs(G.consumeables.cards) do
            if v.ability["rh_remix_sticker_joker"] then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.6,
                    func = function() 
                        v:juice_up()
                        v:remove_sticker("rh_remix_sticker_joker")
                        play_sound('gold_seal', 1.2, 0.4)
                        return true 
                    end 
                }))
            end
        end
        for k, v in ipairs(G.hand.cards) do
            if v.ability["rh_remix_sticker_card"] then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.6,
                    func = function() 
                        v:juice_up()
                        v:remove_sticker("rh_remix_sticker_card")
                        play_sound('gold_seal', 1.2, 0.4)
                        return true 
                    end 
                }))
            end
        end
    end,

    can_use = function (self, card) 
        local stickers = 0
        for k, v in ipairs(G.jokers.cards) do
            if v.ability["rh_remix_sticker_joker"] then
                stickers = stickers + 1
            end
        end
        for k, v in ipairs(G.consumeables.cards) do
            if v.ability["rh_remix_sticker_joker"] then
                stickers = stickers + 1
            end
        end
        for k, v in ipairs(G.hand.cards) do
            if v.ability["rh_remix_sticker_card"] then
                stickers = stickers + 1
            end
        end
        return stickers > 0
    end,

    in_pool = function(self, args)
        local stickers = 0
        for k, v in ipairs(G.jokers.cards) do
            if v.ability["rh_remix_sticker_joker"] then
                stickers = stickers + 1
            end
        end
        for k, v in ipairs(G.consumeables.cards) do
            if v.ability["rh_remix_sticker_joker"] then
                stickers = stickers + 1
            end
        end
        for k, v in ipairs(G.deck.cards) do
            if v.ability["rh_remix_sticker_card"] then
                stickers = stickers + 1
            end
        end
        return stickers > 0
    end,

    credit = {
        art = "missingnumber",
        code = "TheAltDoc",
        concept = "TheAltDoc"
    }
})

-- Finale
SMODS.Consumable({
    key = "finale",
    set = 'Spectral',
    cost=3,
    atlas = 'consumables',
    pos = {
        x = 0,
        y = 1
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'rh_remix_sticker_joker', set = 'Other', vars = {
            localize("rh_remix_sticker_joker_name"),
            localize("rh_remix_sticker_joker_link"),
            localize("rh_remix_sticker_joker_type"),
        }}
        info_queue[#info_queue+1] = {key = 'rh_remix_sticker_card', set = 'Other'}
        return {
            vars = {
                "1"
            }
        }
    end,
    
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.6,
            func = function() 
                if #G.jokers.cards > 0 then
                    G.jokers.cards[1]:juice_up()
                    G.jokers.cards[1]:add_sticker("rh_remix_sticker_joker", true)
                    play_sound('gold_seal', 1.2, 0.4)
                end
                return true 
            end 
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.6,
            func = function() 
                if #G.consumeables.cards > 0 then
                    G.consumeables.cards[1]:juice_up()
                    G.consumeables.cards[1]:add_sticker("rh_remix_sticker_joker", true)
                    play_sound('gold_seal', 1.2, 0.4)
                end
                return true 
            end 
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.6,
            func = function() 
                if #G.hand.cards > 0 then
                    G.hand.cards[1]:juice_up()
                    G.hand.cards[1]:add_sticker("rh_remix_sticker_card", true)
                    play_sound('gold_seal', 1.2, 0.4)
                end
                return true 
            end 
        }))
    end,

    can_use = function (self, card) 
        return true
    end,
    credit = {
        art = "missingnumber",
        code = "TheAltDoc",
        concept = "NoahAmp"
    }
})