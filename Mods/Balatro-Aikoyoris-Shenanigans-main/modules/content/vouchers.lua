SMODS.Voucher {
    key = "alphabet_soup",
    atlas = 'aikoyoriVouchers', pos = { x = 2, y = 0 } ,
    cost = 10,
    config = {
        extras = {
            addentum = 2
        }
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extras.addentum
            }
        }
    end,
    redeem = function (self, card) 
        G.GAME.akyrs_character_stickers_enabled = true
        G.GAME.akyrs_wording_enabled = true
        SMODS.change_play_limit(card.ability.extras.addentum)
        SMODS.change_discard_limit(card.ability.extras.addentum)
        for _,c in ipairs(G.playing_cards) do
            c:set_sprites(c.config.center,c.config.card)
        end
    end,
    unredeem = function (self, card) 
        G.GAME.akyrs_character_stickers_enabled = false
        SMODS.change_play_limit(-card.ability.extras.addentum)
        SMODS.change_discard_limit(-card.ability.extras.addentum)
        G.GAME.akyrs_wording_enabled = false
        for _,c in ipairs(G.playing_cards) do
            c:set_sprites(c.config.center,c.config.card)
        end
    end,
    in_pool = function (self, args)
        return not G.GAME.akyrs_mathematics_enabled
    end
}

SMODS.Voucher {
    key = "crossing_field",
    atlas = 'aikoyoriVouchers', pos = { x = 3, y = 0 } ,
    cost = 10,
    config = {
        extras = {
            addentum = 3
        }
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extras.addentum
            }
        }
    end,
    requires = { "v_akyrs_alphabet_soup" },
    redeem = function (self, card) 
        G.GAME.akyrs_letters_mult_enabled = true
        SMODS.change_play_limit(card.ability.extras.addentum)
        SMODS.change_discard_limit(card.ability.extras.addentum)
    end,
    unredeem = function (self, card) 
        G.GAME.akyrs_letters_mult_enabled = false
        SMODS.change_play_limit(-card.ability.extras.addentum)
        SMODS.change_discard_limit(-card.ability.extras.addentum)
    end,
    in_pool = function (self, args)
        return not G.GAME.akyrs_mathematics_enabled
    end
}

SMODS.Voucher {
    key = "banquet",
    atlas = 'aikoyoriVouchers', pos = { x = 0, y = 0 } ,
    cost = 10,
    config = {
        extras = {
            addentum = 1
        }
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extras.addentum
            }
        }
    end,
    redeem = function (self, card) 
        SMODS.change_play_limit(card.ability.extras.addentum)
        SMODS.change_discard_limit(card.ability.extras.addentum)
        G.hand:change_size(card.ability.extras.addentum)
    end,
    unredeem = function (self, card) 
        SMODS.change_play_limit(-card.ability.extras.addentum)
        SMODS.change_discard_limit(-card.ability.extras.addentum)
        G.hand:change_size(-card.ability.extras.addentum)
    end,
}

SMODS.Voucher {
    key = "worlds_end",
    atlas = 'aikoyoriVouchers', pos = { x = 1, y = 0 } ,
    cost = 10,
    config = {
        extras = {
            addentum = 2
        }
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extras.addentum
            }
        }
    end,
    requires = { "v_akyrs_banquet" },
    redeem = function (self, card) 
        SMODS.change_play_limit(card.ability.extras.addentum)
        SMODS.change_discard_limit(card.ability.extras.addentum)
        G.hand:change_size(card.ability.extras.addentum)
    end,
    unredeem = function (self, card) 
        SMODS.change_play_limit(-card.ability.extras.addentum)
        SMODS.change_discard_limit(-card.ability.extras.addentum)
        G.hand:change_size(-card.ability.extras.addentum)
    end,
}