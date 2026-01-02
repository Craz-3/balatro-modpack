SMODS.Back {
    key = 'mad',
    loc_txt = {
        name = 'Mad Deck',
        text = {
            'Start run with Magic trick,',
            'Illusion, and Directors Cut',
            'The cards of the first hand of every',
            'round are destroyed after scoring',
        }
    },
    atlas = 'decks',
    pos = {x = 4, y = 0},
    config = {
        discards = -1,
        hands = -1,
        hand_size = -1,
        madd = true,
        consumables = {
            'c_black_hole',
            'c_black_hole',
        }
    },

    loc_vars = function(self)
        return { vars = self.config.discards, self.config.hands, self.config.hand_size }
    end
}
