local blind = {
    name = "The Market",
    pos = { x = 0, y = 0 },
    dollars = 5, 
    mult = 2, 
    vars = {}, 
    debuff = {},
    boss = {min = 2, max = 10},
    boss_colour = HEX('76C860'),
    loc_txt = {}
}

blind.set_blind = function(self, reset, silent)
    G.GAME.blind.prepped = nil
end

blind.press_play = function(self)
    G.GAME.blind.prepped = true
end

blind.drawn_to_hand = function(self)
    if G.GAME.blind.prepped then
        G.GAME.blind:wiggle()
        G.E_MANAGER:add_event(Event({
            trigger = 'ease',
            blocking = false,
            ref_table = G.GAME,
            ref_value = 'chips',
            ease_to = G.GAME.chips - math.floor(G.GAME.chips/4),
            delay =  0.5,
            func = (function(t) return math.floor(t) end)
        }))
    end
end

return blind