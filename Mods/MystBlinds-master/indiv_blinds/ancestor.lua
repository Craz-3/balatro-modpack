local blind = {
    name = "The Ancestor",
    pos = { x = 0, y = 6 },
    dollars = 5, 
    mult = 2, 
    vars = {}, 
    debuff = {},
    boss = {min = 2, max = 10},
    boss_colour = HEX('E67CDA'),
    loc_txt = {},
}

blind.set_blind = function(self, reset, silent)
    G.GAME.blind.discards_sub = math.ceil(G.GAME.round * 1.5)
    local available_cards = {}

    for _, v in ipairs(G.playing_cards) do
        available_cards[#available_cards+1] = v
    end

    for i = 1, math.min(G.GAME.blind.discards_sub, math.ceil(#available_cards/2)) do
        local chosen_card, chosen_card_key = pseudorandom_element(available_cards, pseudoseed("random_card"))
        chosen_card.ability.wheel_flipped = true
        table.remove(available_cards, chosen_card_key)
        -- sendDebugMessage("debuffed a "..chosen_card.base.value.." of "..chosen_card.base.suit)
    end
end

blind.stay_flipped = function(self, area, card)
    if area == G.hand and card.ability.wheel_flipped then
        return true
    end
end

blind.disable = function(self)
    for i = 1, #G.hand.cards do
        if G.hand.cards[i].facing == 'back' then
            G.hand.cards[i]:flip()
        end
    end
    for k, v in pairs(G.playing_cards) do
        v.ability.wheel_flipped = nil
    end
end

blind.loc_vars = function(self)
    return { vars = {math.min(math.ceil((G.GAME.round+1) * 1.5), math.ceil(#G.playing_cards/2))} } 
end

blind.collection_loc_vars = function(self)
    return { vars = {localize('ph_myst_ancestor')} }
end

return blind