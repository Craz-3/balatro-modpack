local blind = {
    name = "The Monster",
    pos = { x = 0, y = 2 },
    dollars = 5, 
    mult = 2, 
    vars = {}, 
    debuff = {},
    boss = {min = 2, max = 10},
    boss_colour = HEX('3C074D'),
    loc_txt = {}
}


blind.set_blind = function(self, reset, silent)
    G.GAME.consumeable_buffer = 0
    G.GAME.blind.hands_sub = 0

    ---- check for Chicot
    if not next(find_joker("Chicot")) then
        for k, v in ipairs(G.consumeables.cards) do
            v:start_dissolve(nil, (k ~= 1))
        end

        G.E_MANAGER:add_event(Event({trigger = 'immediate', func = function()
            G.GAME.blind.hands_sub = G.consumeables.config.card_limit
            G.consumeables.config.card_limit = G.consumeables.config.card_limit - G.GAME.blind.hands_sub
            return true
        end}))
    end
end

blind.disable = function(self)
    G.consumeables.config.card_limit = G.consumeables.config.card_limit + G.GAME.blind.hands_sub
end

blind.defeat = function(self)
    G.consumeables.config.card_limit = G.consumeables.config.card_limit + G.GAME.blind.hands_sub
end

return blind