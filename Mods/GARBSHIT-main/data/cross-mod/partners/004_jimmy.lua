if not Partner_API then return false else return
{
    Partner_API.Partner{
    key = "jimmy",
    name = "Jimmy",
    unlocked = true,
    discovered = true,
    no_quips = true,
    pos = {x = 0, y = 1},
    loc_txt = {},
    atlas = "GarbPartner",
    config = {extra = {related_card = "j_garb_Jim", Xmult = 1.10, cost = 4, benefits = 1}},
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.cost, card.ability.extra.cost/card.ability.extra.benefits/2, card.ability.extra.Xmult+0.05*card.ability.extra.benefits} }
    end,
    update = function(self, card)
        card.ability.extra.benefits = next(SMODS.find_card(card.ability.extra.related_card)) and 2 or 1
    end,
    calculate = function(self, card, context)
        if context.partner_main then
          return {
            Xmult = card.ability.extra.Xmult + 0.05 * card.ability.extra.benefits
          }
        end

        if context.partner_click and to_big(G.GAME.dollars) >= to_big(card.ability.extra.cost) then
          G.GAME.jimmies = G.GAME.jimmies or {}
          ease_dollars(-card.ability.extra.cost)
          local xpos = G.deck.T.x + pseudorandom("pos", -20, 1)
          local ypos = G.deck.T.y + pseudorandom("pos", -5, 5)
          local _card = Card(xpos+G.deck.T.w-G.CARD_W*0.6, ypos-G.CARD_H*1.6, G.CARD_W*46/71, G.CARD_H*58/95, G.P_CARDS.empty, G.P_CENTERS.pnr_garb_jimmy)
          _card:start_materialize()
          table.insert(G.GAME.jimmies, _card)
        end

        if context.partner_R_click and #G.GAME.jimmies > 0 then
          local first_dissolve = false
          local cashback = card.ability.extra.cost*#G.GAME.jimmies/2
          ease_dollars(cashback)
          for k, v in pairs(G.GAME.jimmies) do
            v:start_dissolve(nil, first_dissolve)
            first_dissolve = true
          end
          G.GAME.jimmies = {}
          card_eval_status_text(card, "extra", nil, nil, nil, {message = localize("$")..cashback, colour = G.C.MONEY})
        end
    end,
}

}
end