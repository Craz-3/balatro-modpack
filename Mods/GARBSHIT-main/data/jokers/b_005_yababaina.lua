return {
    SMODS.Joker {
        key = 'yababaina',
        loc_txt = {
            name = 'YABABAINA',
            text = {
                "{C:attention}Playing cards{} scored",
                "have {C:garb_color_rainbow}random{} effects"
            }
        },
        config = {
            extra = {
                mult = 0,
                chips = 0,
                Xmult = 1,
                hand = 1,
                discards = 1,
                money = 0
            }
        },
        loc_vars = function(self, info_queue, card) return {vars = {}} end,
        rarity = "garb_rainbow",
        atlas = 'GarbJokers',
        pos = {x = 2, y = 11},
        cost = 10,

        unlocked = true,
        discovered = false, -- whether or not it starts discovered
        blueprint_compat = true, -- can it be blueprinted/brainstormed/other
        eternal_compat = false, -- can it be eternal
        perishable_compat = false, -- can it be perishable

        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play then
                local mults = {4, 10, 50}
                local chips = {30, 50, 75, 250}
                local xmults = {0.5, 1.5, 2, 3, 4, 10}
                local money = {-10, 3, 5, 10}
                local h_size = {-1, 1}
                local sounds = {
                    "garb_explosion", "garb_squeak", "garb_gong", "garb_ping"
                }

                local mult_payout = function()
                    card.ability.extra.mult = pseudorandom_element(mults)
                    return {
                        mult = card.ability.extra.mult,
                        message_card = context.other_card
                    }
                end

                local chips_payout = function()
                    card.ability.extra.chips = pseudorandom_element(chips)
                    return {
                        chips = card.ability.extra.chips,
                        message_card = context.other_card
                    }
                end

                local xmult_payout = function()
                    card.ability.extra.xmult = pseudorandom_element(xmults)
                    return {
                        Xmult = card.ability.extra.xmult,
                        message_card = context.other_card
                    }
                end

                local money_payout = function()
                    card.ability.extra.money = pseudorandom_element(money)
                    return {
                        dollars = card.ability.extra.money,
                        message_card = context.other_card
                    }
                end

                local hand_discard_payout = function()
                    if pseudorandom("pipis", 0.0, 1.0) > 0.5 then
                        G.GAME.round_resets.temp_hands =
                            (G.GAME.round_resets.temp_hands or 0) +
                                card.ability.extra.hand
                        G.GAME.round_resets.hands =
                            G.GAME.round_resets.hands + card.ability.extra.hand
                        ease_hands_played(card.ability.extra.hand)
                        return {
                            message = "+1 Hand!",
                            colour = G.C.BLUE,
                            message_card = context.other_card
                        }
                    else
                        G.GAME.round_resets.temp_discards =
                            (G.GAME.round_resets.temp_discards or 0) +
                                card.ability.extra.discards
                        G.GAME.round_resets.discards = G.GAME.round_resets
                                                           .discards +
                                                           card.ability.extra
                                                               .discards
                        ease_discard(card.ability.extra.discards)
                        return {
                            message = "+1 Discard!",
                            colour = G.C.RED,
                            message_card = context.other_card
                        }

                    end
                end

                local sound_payout = function()
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.2,
                        func = function()
                            play_sound(pseudorandom_element(sounds), 1, 0.8)
                            return true
                        end
                    }))
                    return {message = "SFX!", message_card = context.other_card}
                end

                local buff_payout = function()
                    local randoms = pseudorandom("pipis", 0.0, 1.0)
                    local v = context.other_card
                    v:juice_up()
                    if (randoms > 0.3) and (randoms < 0.6) then
                        v:set_seal(SMODS.poll_seal({guaranteed = true}), nil,
                                   true)
                    elseif randoms > 0.6 then
                        v:set_edition(poll_edition("Abadeus", nil, true, true),
                                      true, true)
                    else
                        local new_enhancement =
                            SMODS.poll_enhancement {
                                key = "abadeus",
                                guaranteed = true
                            }
                        v:set_ability(G.P_CENTERS[new_enhancement])
                    end
                    return {message = "Buffed!", message_card = v}
                end

                local h_size_payout = function()
                    if pseudorandom("pipis", 0.0, 1.0) > 0.5 then
                        G.GAME.round_resets.temp_handsize =
                            (G.GAME.round_resets.temp_handsize or 0) +
                                card.ability.extra.hand
                        G.hand:change_size(card.ability.extra.hand)
                        return {
                            message = "+1 Hand Size!",
                            colour = G.C.ATTENTION,
                            message_card = context.other_card
                        }
                    else
                        G.GAME.round_resets.temp_handsize =
                            (G.GAME.round_resets.temp_handsize or 0) -
                                card.ability.extra.hand
                        G.hand:change_size(-card.ability.extra.hand)
                        return {
                            message = "-1 Hand Size!",
                            colour = G.C.RED,
                            message_card = context.other_card
                        }
                    end
                end

                local consum_payout = function()
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.2,
                        func = function()
                            if #G.consumeables.cards + G.GAME.consumeable_buffer <
                                G.consumeables.config.card_limit then
                                local c = SMODS.add_card {
                                    set = "Consumeables",
                                    area = G.consumeables
                                }
                                card:juice_up()
                                c:juice_up()
                                play_sound('timpani',
                                           1 + pseudorandom("yaoi", 0, 0.5))
                                return {
                                    message = "+1 Consumable!",
                                    message_card = context.other_card
                                }
                            else
                                return {
                                    message = "No Room!",
                                    message_card = context.other_card
                                }
                            end
                            return true
                        end
                    }))
                end

                local joker_payout = function()
                    if #G.jokers.cards + G.GAME.consumeable_buffer <
                        G.jokers.config.card_limit then

                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.2,
                            func = function()
                                local c = SMODS.add_card {
                                    set = "Joker",
                                    area = G.jokers
                                }
                                card:juice_up()
                                c:juice_up()
                                play_sound('timpani',
                                           1 + pseudorandom("yaoi", 0, 0.5))

                                return true
                            end
                        }))
                        return {
                            message = "+1 Joker!",
                            message_card = context.other_card
                        }
                    end
                end

                local tag_payout = function()
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.2,
                        func = function()
                            local tagkey = get_next_tag_key()
                            local tag = Tag(tagkey)
                            if tagkey == 'tag_orbital' then
                                local _poker_hands = {}
                                for k, v in pairs(G.GAME.hands) do
                                    if v.visible then
                                        _poker_hands[#_poker_hands + 1] = k
                                    end
                                end

                                tag.ability.orbital_hand =
                                    pseudorandom_element(_poker_hands,
                                                         pseudoseed('orbital'))
                            end
                            play_sound('timpani')
                            add_tag(tag)
                            return true
                        end
                    }))
                    return {
                        message = "+1 Tag!",
                        message_card = context.other_card
                    }

                end

                effects = {
                    mult_payout, chips_payout, xmult_payout, money_payout,
                    hand_discard_payout, sound_payout, buff_payout,
                    h_size_payout, consum_payout, joker_payout, tag_payout
                }
                return pseudorandom_element(effects)()
            end
        end
    }

}
