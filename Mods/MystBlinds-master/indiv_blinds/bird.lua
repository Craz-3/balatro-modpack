local blind = {
    name = "The Bird",
    pos = { x = 0, y = 5 },
    dollars = 5, 
    mult = 2, 
    vars = {}, 
    debuff = {},
    boss = {min = 4, max = 10},
    boss_colour = HEX('9CE0F0'),
    loc_txt = {}
}

blind.drawn_to_hand = function(self)
    if G.GAME.blind.prepped then
        local available_jokers = {}
        for _, v in ipairs(G.jokers.cards) do
            if not v.ability.rental or (not v.ability.perishable and not v.ability.eternal) then
                table.insert(available_jokers, v)
            end
        end

        if #available_jokers > 0 then
            local chosen_joker = pseudorandom_element(available_jokers, pseudoseed('random_joker'))
            local stickers = {}

            if not chosen_joker.ability.perishable and not chosen_joker.ability.eternal then 
                if chosen_joker.config.center.eternal_compat then table.insert(stickers, "eternal") end
                if chosen_joker.config.center.perishable_compat then table.insert(stickers, "perishable") end
            end
            if not chosen_joker.ability.rental then table.insert(stickers, "rental") end

            if #stickers > 0 then
                local chosen_sticker = pseudorandom_element(stickers, pseudoseed('random_sticker'))
                sendDebugMessage(chosen_sticker)
                sendDebugMessage(chosen_joker.ability.name)

                if chosen_sticker == "eternal" then chosen_joker.ability.eternal = true end
                if chosen_sticker == "perishable" then chosen_joker:set_perishable(true) end
                if chosen_sticker == "rental" then chosen_joker:set_rental(true) end

                G.GAME.blind:wiggle()
                chosen_joker:juice_up()
            end
        end
    end
end

blind.press_play = function(self)
    G.GAME.blind.prepped = true
end

return blind