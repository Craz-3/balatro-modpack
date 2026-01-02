SMODS.Joker {
  key = 'schrodinger',

  config = { extra = { odds = 2, x_mult = 2 } },
  unlocked = true,
  discovered = false,
  rarity = 1, -- Common
  atlas = 'Sculio',
  pos = { x = 0, y = 0 },
  cost = 4,
  blueprint_compat = true,
  loc_vars = function(self, info_queue, card)
    return { vars = { (G.GAME.probabilities.normal or 1), card.ability.extra.odds, card.ability.extra.x_mult } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and pseudorandom('schrodinger') < G.GAME.probabilities.normal / card.ability.extra.odds then
      return {
        Xmult_mod = card.ability.extra.x_mult,
        message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } }
      }
    end
  end
}
