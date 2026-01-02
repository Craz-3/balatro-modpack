--- STEAMODDED HEADER
--- MOD_NAME: odddoor
--- MOD_ID: odddoor
--- MOD_AUTHOR: [sishui]
--- MOD_DESCRIPTION: a new deck
--- BADGE_COLOUR: 00009C
--- PREFIX: oddd
--- VERSION: 1.0.0

----------------------------------------------
------------MOD CODE -------------------------

SMODS.Atlas{
    key = 'odddoor',
    px = 71,
    py = 95,
    path = 'door.png'
}

SMODS.Back{
    key = "odddoorback",
    discovered = true,
    unlocked = true,
    atlas = 'odddoor',
    pos = { x = 0, y = 0 },
    config = {oddd=true},
    loc_txt = {},
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    apply = function(self)
        if self.config.oddd then
            G.E_MANAGER:add_event(Event({
                func = function()
                    for i = #G.playing_cards, 1, -1 do
                        G.playing_cards[i]:start_dissolve(nil, true)
                    end
                    G.GAME.starting_deck_size = 60
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.01,
                func = function()
                    play_sound('negative')
                    attention_text({scale = 2, text = '传送门开启中...', colour = G.C.DARK_EDITION, hold = 6, align = 'cm', offset = {x = 0,y = -2.7},major = G.play})
                    local cards = {}
                    for i = 1, G.GAME.starting_deck_size do
                        cards[i] = true
                        local numbers = {}
                        for _, v in ipairs(SMODS.Rank.obj_buffer) do
                            local r = SMODS.Ranks[v]
                            table.insert(numbers, r)
                        end
                        local _suit, _rank =
                            pseudorandom_element(SMODS.Suits, pseudoseed('odddd_create')).card_key,
                            pseudorandom_element(numbers, pseudoseed('odddd_create')).card_key
                        local cen_pool = {}
                        for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                            cen_pool[#cen_pool + 1] = v
                        end
                        card_init = card_init or {}
                        card_init.front = G.P_CARDS[_suit .. '_' .. _rank] or pseudorandom_element(G.P_CARDS, pseudoseed('front'))
                        if pseudorandom(pseudoseed('odddd')) < 0.25 then
                        card_init.center = pseudorandom_element(cen_pool, pseudoseed('oddd_card')) or G.P_CENTERS.c_base
                        else
                        card_init.center = G.P_CENTERS.c_base
                        end
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                        local edition_rate = 1
                        local edition = poll_edition('odddd_editionst'..G.GAME.round_resets.ante, edition_rate, true)
                        local _area = G.deck
                        local card = Card(_area.T.x, _area.T.y, G.CARD_W, G.CARD_H, card_init.front, card_init.center, {playing_card = G.playing_card})
                        card:set_edition(edition)
                        card:set_seal(SMODS.poll_seal({mod = 9}))
                        --card.ability.perma_bonus = math.max(2, G.GAME.round_resets.ante*2) or 2
                        table.insert(G.playing_cards, card)
                        card.playing_card = G.playing_card
                        G.deck:emplace(card)
                            --create_playing_card({
                                --front = G.P_CARDS[_suit .. '_' .. _rank],
                                --center = pseudorandom_element(cen_pool, pseudoseed('oddd_card'))
                            --}, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Spectral })
                    end
                    return true
                end
            }))
        end
    end,
    trigger_effect = function(self, args)
        if args.context == 'eval' and G.GAME.last_blind then
            G.E_MANAGER:add_event(Event({
                func = function()
                    for i = #G.playing_cards, 1, -1 do
                        G.playing_cards[i]:start_dissolve(nil, true)
                    end
                    G.GAME.starting_deck_size = 60
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    play_sound('negative')
                    attention_text({scale = 2, text = '传送门重置中...', colour = G.C.DARK_EDITION, hold = 6, align = 'cm', offset = {x = 0,y = -2.7},major = G.play})
                    local cards = {}
                    for i = 1, G.GAME.starting_deck_size do
                        cards[i] = true
                        local numbers = {}
                        for _, v in ipairs(SMODS.Rank.obj_buffer) do
                            local r = SMODS.Ranks[v]
                            table.insert(numbers, r)
                        end
                        local _suit, _rank =
                            pseudorandom_element(SMODS.Suits, pseudoseed('odddd_create')).card_key,
                            pseudorandom_element(numbers, pseudoseed('odddd_create')).card_key
                        local cen_pool = {}
                        for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                            cen_pool[#cen_pool + 1] = v
                        end
                        card_init = card_init or {}
                        card_init.front = G.P_CARDS[_suit .. '_' .. _rank] or pseudorandom_element(G.P_CARDS, pseudoseed('front'))
                        if pseudorandom(pseudoseed('odddd')) < 0.25 then
                        card_init.center = pseudorandom_element(cen_pool, pseudoseed('oddd_card')) or G.P_CENTERS.c_base
                        else
                        card_init.center = G.P_CENTERS.c_base
                        end
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                        local edition_rate = 1
                        local edition = poll_edition('odddd_edition'..G.GAME.round_resets.ante, edition_rate, true)
                        local _area = G.deck
                        local card = Card(_area.T.x, _area.T.y, G.CARD_W, G.CARD_H, card_init.front, card_init.center, {playing_card = G.playing_card})
                        card:set_edition(edition)
                        card:set_seal(SMODS.poll_seal({mod = 9}))
                        card.ability.perma_bonus = math.max(2, G.GAME.round*2) or 2
                        table.insert(G.playing_cards, card)
                        card.playing_card = G.playing_card
                        G.deck:emplace(card)
                            --create_playing_card({
                                --front = G.P_CARDS[_suit .. '_' .. _rank],
                                --center = pseudorandom_element(cen_pool, pseudoseed('oddd_card'))
                            --}, G.deck, nil, i ~= 1, { G.C.SECONDARY_SET.Spectral })
                    end
                    return true
                end
            }))
        end
    end
}

----------------------------------------------
------------MOD CODE END----------------------