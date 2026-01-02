

SMODS.Voucher({
    key = "flow_gauge",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.multiplier
            }
        }
    end,
    atlas = 'vouchers',
    pos = {
        x = 0,
        y = 0
    },
    config = { extra = { multiplier = 2 }},
    redeem = function(self, card)
        G.GAME.flow_rate = G.GAME.flow_rate * card.ability.extra.multiplier
    end,

    credit = {
        art = "missingnumber",
        code = "TheAltDoc",
        concept = "TheAltDoc"
    }
})

SMODS.Voucher({
    key = "flow_master",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.multiplier
            }
        }
    end,
    atlas = 'vouchers',
    pos = {
        x = 0,
        y = 1
    },
    config = { extra = { multiplier = 4 }},
    requires = {"v_rh_flow_gauge"},
    redeem = function(self, card)
        G.GAME.flow_rate = G.GAME.flow_rate * card.ability.extra.multiplier
    end,

    credit = {
        art = "missingnumber",
        code = "TheAltDoc",
        concept = "TheAltDoc"
    }
})

SMODS.Voucher({
    key = "shopkeeper_deal",
    atlas = 'vouchers',
    pos = {
        x = 1,
        y = 0
    },

    credit = {
        art = "missingnumber",
        code = "TheAltDoc",
        concept = "TheAltDoc"
    }
})
-- I'm gonna be real I don't really know how else I can do that so I take ownership
SMODS.Booster:take_ownership_by_kind('Arcana', {
    group_key = "k_arcana_pack",
    draw_hand = true,
    update_pack = SMODS.Booster.update_pack,
    ease_background_colour = function(self) ease_background_colour_blind(G.STATES.TAROT_PACK) end,
    create_UIBox = SMODS.Booster.create_UIBox,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0,0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = {G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2)},
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        local _card
        if G.GAME.used_vouchers.v_omen_globe and pseudorandom('omen_globe') > 0.8 then
            _card = {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "ar2"}
        elseif G.GAME.used_vouchers.v_rh_shopkeeper_deal and pseudorandom('rh_shopkeeper_deal') > 0.8 then
            _card = {set = "Flow", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "ar3"}
        else
            _card = {set = "Tarot", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "ar1"}
        end
        return _card
    end,
    loc_vars = pack_loc_vars,
})

SMODS.Voucher({
    key = "gatekeeper_deal",
    atlas = 'vouchers',
    requires = {"v_rh_shopkeeper_deal"},
    pos = {
        x = 1,
        y = 1
    },

    credit = {
        art = "missingnumber",
        code = "TheAltDoc",
        concept = "TheAltDoc"
    }
})