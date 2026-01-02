if not Partner_API then return false else return
{
    Partner_API.Partner{
    key = "handshake",
    name = "Handshake",
    unlocked = true,
    discovered = true,
    no_quips = true,
    pos = {x = 3, y = 0},
    loc_txt = {},
    atlas = "GarbPartner",
    config = {extra = {related_card = "j_garb_devils", money = 2, created = 6, limit = 6, benefits = 1}},
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.money*card.ability.extra.benefits, card.ability.extra.limit} }
    end,
    update = function(self, card)
        card.ability.extra.benefits = next(SMODS.find_card(card.ability.extra.related_card)) and 2 or 1
    end,
    calculate = function(self, card, context)
        if context.partner_setting_blind then
          card.ability.extra.created = 0
        end

        if context.partner_click and card.ability.extra.created < card.ability.extra.limit then
          card.ability.extra.created = card.ability.extra.created + 1
          ease_dollars(card.ability.extra.money*card.ability.extra.benefits)
          local _card = create_playing_card({ front = pseudorandom_element(G.P_CARDS, pseudoseed('marb_fr')), center = G.P_CENTERS.m_stone }, G.deck, nil, nil, { G.C.RED })
          _card.ability.perma_debuff, _card.debuff = true
          G.deck.config.card_limit = G.deck.config.card_limit + 1
        end
    end,
}

}
end