SMODS.Joker {
  key = 'anatomy',
  loc_txt = {
    name = 'Anatomy',
    text = {
      'Scored {C:attention}number cards{} have',
      '{C:green}#1#% of their rank out of #2#{}',
      'to be retriggered once'
    }
  },

  config = { extra = { odds = 10 } },
  unlocked = true,
  discovered = false,
  rarity = 2, -- Uncommon
  atlas = 'Sculio',
  pos = { x = 9, y = 0 },
  cost = 7,
  blueprint_compat = true,
  loc_vars = function(self, info_queue, card)
    return { vars = { (G.GAME.probabilities.normal or 1) * 100, card.ability.extra.odds } }
  end,
  calculate = function(self, card, context)
    if context.cardarea == G.play and context.repetition and not context.repetition_only then
      card_id = context.other_card:get_id()

      if card_id < 11 and pseudorandom('anatomy') < (G.GAME.probabilities.normal * card_id) / card.ability.extra.odds then
        return {
          message = localize('k_again_ex'),
          repetitions = 1
        }
      end
    end
  end
}
