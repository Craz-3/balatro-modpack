SMODS.Back {
    key = 'investment',
    loc_txt = {
        name = 'Investment Deck',
        text = {
            'Start run with Seed Money',
            'and an extra $10',
            'Every joker becomes',
            'rental after boss blind' ,
        }
    },
    atlas = 'decks',
    pos = {x = 2, y = 0},
    config = {
        dollars = 10,
        investment = true,
        vouchers = {
            'v_seed_money',
        }
    },

    calculate = function(self, card, context)
        if G.GAME.blind.boss and context.end_of_round then
            for i, v in ipairs(G.jokers.cards) do
                v:set_rental(true)
            end
        end
    end,

    loc_vars = function(self)
        return { vars = self.config.dollars }
    end,
}
