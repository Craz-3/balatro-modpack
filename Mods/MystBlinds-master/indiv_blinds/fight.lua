local blind = {
    name = "The Fight",
    pos = { x = 0, y = 14 },
    dollars = 5, 
    mult = 2, 
    vars = {}, 
    debuff = {},
    boss = {min = 1, max = 10},
    boss_colour = HEX('E63232'),
    loc_txt = {}
}

blind.calculate = function(self, card, context)
    if context.other_joker then
        G.E_MANAGER:add_event(Event({
            func = function()
                context.other_joker:juice_up(0.5, 0.5)
                return true
            end
        }))
        return {
            x_mult = 0.95,
            message = localize{type = 'variable', key = 'a_xmult', vars = {0.95}},
            card = context.other_joker,
            colour = G.C.PURPLE,
            sound = "tarot2",
            volume = 0.6,
            pitch = 0.7,
            remove_default_message = true
        }
    end
end

return blind