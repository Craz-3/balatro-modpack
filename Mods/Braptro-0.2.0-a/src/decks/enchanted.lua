SMODS.Back {
    key = 'enchanted',
    loc_txt = {
        name = 'Enchantment Deck',
        text = {
            'Start run with',
            'Hone and Glow Up',
            '-1 discards',
        }
    },
    atlas = 'decks',
    pos = {x = 1, y = 0},
    config = {
        discards = -1,
        enchanted = true,
        vouchers = {
            'v_hone',
            'v_glow_up',
        }
    },

    loc_vars = function(self)
        return { vars = self.config.discards }
    end,
}
