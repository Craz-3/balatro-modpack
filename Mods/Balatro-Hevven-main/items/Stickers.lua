
-- You (Sticker)
SMODS.Sticker({
    key="you_sticker",
    badge_colour=G.C.BLACK,
    atlas='stickers',
    default_compat=true,
    rate=0,
    calculate = function(self, card, context)
        if context.end_of_round then
            card:remove_sticker("rh_you_sticker")
        end
        
    end,
	credit = {
        art = "missingnumber",
        code = "TheAltDoc",
		concept = "TheAltDoc"
    }
})

-- Remix (Joker & consumable)
SMODS.Sticker({
    key="remix_sticker_joker",
    badge_colour=HEX('CD00CD'),
    atlas='stickers',
    default_compat=true,
    rate=0,
    pos={x=1,y=0},
    loc_vars = function(self, info_queue, card)
        -- Since it applies and differs between types...
        if card.config.center.set == 'Joker' then
            return {
                vars = {
                    localize("rh_remix_sticker_joker_name"),
                    localize("rh_remix_sticker_joker_link"),
                    localize("rh_remix_sticker_joker_type"),
                }
            }
        else
            return {
                vars = {
                    localize("rh_remix_sticker_consumeable_name"),
                    localize("rh_remix_sticker_consumeable_link"),
                    localize("rh_remix_sticker_consumeable_type"),
                }
            }
        end
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function() 
                    card:flip()
                    play_sound('card1')
                    card:juice_up(0.3, 0.3)
                    return true 
                end 
            }))   
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function() 
                    local card_info = card.config.center
                    local remixed_config = {set = card_info.set, stickers = card_info.stickers, skip_materialize = false}
                    if card_info.rarity then
                        if card_info.rarity == 1 then
                            remixed_config.rarity = 0.6
                        elseif card_info.rarity == 2 then
                            remixed_config.rarity = 0.8
                        elseif card_info.rarity == 3 then
                            remixed_config.rarity = 1
                        elseif card_info.rarity == 4 then
                            remixed_config.legendary = true
                        else
                            remixed_config.rarity = card_info.rarity
                        end
                    end
                    if card.edition then
                        remixed_config.edition = card.edition.key
                    else 
                        remixed_config.no_edition = true
                    end
                    local remixed = rh_create_card_silent(remixed_config)
                    local pos = remixed.T
                    pos.x = 1000
                    pos.y = 1000
                    pos.w = 0
                    pos.h = 0
                    remixed.T = pos
                    remixed.CT = pos
                    remixed.VT = pos
                    while G.GAME.blind.boss and remixed.ability.name == "Chicot" do
                        sendDebugMessage("Rolled into Chicot during a boss blind!", "rhRemixSticker")
                        remixed:start_dissolve(nil,true)
                        remixed = rh_create_card_silent(remixed_config)
                        sendDebugMessage("Rolled "..remixed.ability.name, "rhRemixSticker")
                        pos = remixed.T
                        pos.x = 1000
                        pos.y = 1000
                        pos.w = 0
                        pos.h = 0
                        remixed.T = pos
                        remixed.CT = pos
                        remixed.VT = pos
                    end
                    rh_copy_card(remixed, card)
                    remixed:start_dissolve(nil,true)
                    return true 
                end 
            }))        
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function() 
                    card:flip()
                    play_sound('tarot2', 1, 0.6)
                    card:juice_up(0.3, 0.3)
                    return true 
                end 
            }))
        end
    end,
	credit = {
        art = "missingnumber",
        code = "TheAltDoc",
		concept = "TheAltDoc"
    }
})

-- Remix (Card)
SMODS.Sticker({
    key="remix_sticker_card",
    badge_colour=HEX('CD00CD'),
    atlas='stickers',
    default_compat=true,
    rate=0,
	config = {
        extra = {
            round = 0
        }
    },
    pos={x=1,y=0},
    calculate = function(self, card, context)
        if context.hand_drawn and G.GAME.round ~= card.config.center.remix_round then
            card.config.center.remix_round = G.GAME.round
            -- G.E_MANAGER:add_event(Event({
            --     trigger = 'after',
            --     delay = 0.1,
            --     func = function() 
                    local ranks = {}
                    local suits = {}
                    for k, v in pairs(SMODS.Ranks) do
                        ranks[#ranks+1] = k
                    end
                    for k, v in pairs(SMODS.Suits) do
                        suits[#suits+1] = v.card_key
                    end
                    local new_rank =  pseudorandom(pseudoseed('remix_sticker'), 1, #ranks)
                    local new_suit =  pseudorandom(pseudoseed('remix_sticker'), 1, #suits)
                    sendDebugMessage("Remixing into a "..suits[new_suit].."_"..ranks[new_rank])
                    local new_card = G.P_CARDS[suits[new_suit].."_"..ranks[new_rank]]
                    card:set_base(new_card)
                    G.GAME.blind:debuff_card(card)
                    
                    local seal_rate = 10
                    local seal_poll = pseudorandom(pseudoseed('remix_sticker'..G.GAME.round_resets.ante))
                    if seal_poll > 1 - 0.02*seal_rate then
                        seal = SMODS.poll_seal({guaranteed = true, type_key = "remix_sticker"})
                        card:set_seal(seal, true, true)
                    else
                        card.seal = nil
                    end
                    
                    local enhancement_rate = 10
                    local enhancement_poll = pseudorandom(pseudoseed('stdseal'..G.GAME.round_resets.ante))
                    if enhancement_poll > 1 - 0.02*enhancement_rate then
                        enhancement = SMODS.poll_enhancement({guaranteed = true, type_key = "remix_sticker"})
                        card:set_ability(G.P_CENTERS[enhancement], nil, true)
                    else
                        card:set_ability(G.P_CENTERS.c_base, nil, true)
                    end
                    
            --         return true 
            --     end 
            -- }))
        end
    end,
    apply = function(self, card, val)
        card.ability[self.key] = val
        card.config.center.remix_round = G.GAME.round
    end,
	credit = {
        art = "missingnumber",
        code = "TheAltDoc",
		concept = "TheAltDoc"
    }
})