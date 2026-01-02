local blind = {
    name = "Noir Silence",
    pos = { x = 0, y = 4 },
    dollars = 8, 
    mult = 2, 
    vars = {}, 
    debuff = {},
    boss = {showdown = true, min = 10, max = 10},
    boss_colour = HEX('404040'),
    loc_txt = {}
}

blind.set_blind = function(self, reset, silent)
    G.GAME.blind.prepped = nil
    G.GAME.blind.hands_sub = math.min(G.hand.config.card_limit - 1, 4)
    G.hand:change_size(-G.GAME.blind.hands_sub)
end

blind.disable = function(self)
    G.hand:change_size(G.GAME.blind.hands_sub)
    G.FUNCS.draw_from_deck_to_hand(G.GAME.blind.hands_sub)
    G.GAME.blind.hands_sub = 0
end

blind.defeat = function(self, silent)
    G.hand:change_size(G.GAME.blind.hands_sub)
end

blind.press_play = function(self)
    G.GAME.blind.prepped = true
end

blind.drawn_to_hand = function(self)
    if G.GAME.blind.prepped and G.GAME.blind.hands_sub > 1 then
        G.hand:change_size(1)
        G.GAME.blind.hands_sub = G.GAME.blind.hands_sub - 1 -- size removed
        G.GAME.blind:wiggle()
    end
end

return blind