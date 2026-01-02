if not mf_config["45 Degree Rotated Tarot Cards"] then
  return nil
end
local joker = {
  name = "Cue Ball",
  config = {
    odds = 2
  },
  pos = {x = 5, y = 7},
  rarity = 2,
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  demicoloncompat = true,
  loc_vars = function(self, info_queue, center)
    return {
      vars = { G.GAME.probabilities.normal, center.ability.odds }
    }
  end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and SMODS.has_no_rank(context.other_card) then
      if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit and (pseudorandom('cueball') < G.GAME.probabilities.normal/card.ability.odds) then
          G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
          return {
            extra = {focus = card, message = localize('k_plus_rotarot'), func = function()
              G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = (function()
                    local card = create_card('Rotarot',G.consumeables, nil, nil, nil, nil, nil, 'cba')
                    card:add_to_deck()
                    G.consumeables:emplace(card)
                    G.GAME.consumeable_buffer = 0
                  return true
                end)}))
            end},
            colour = G.C.SECONDARY_SET.Tarot,
            card = card
          }
      end
    end
    if context.forcetrigger then
      if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
          G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
          return {
            extra = {focus = card, message = localize('k_plus_rotarot'), func = function()
              G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = (function()
                    local card = create_card('Rotarot',G.consumeables, nil, nil, nil, nil, nil, 'cba')
                    card:add_to_deck()
                    G.consumeables:emplace(card)
                    G.GAME.consumeable_buffer = 0
                  return true
                end)}))
            end},
            colour = G.C.SECONDARY_SET.Tarot,
            card = card
          }
      end
    end
  end
}

return joker
