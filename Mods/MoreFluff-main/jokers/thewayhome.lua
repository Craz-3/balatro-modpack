local joker = {
  name = "the way home",
  config = {
    extra = 4,
    odds = 3
  },
  pos = {x = 1, y = 8},
  rarity = 2,
  cost = 7,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,
  demicoloncompat = true,
  loc_vars = function(self, info_queue, center)
    return {
      vars = { G.GAME.probabilities.normal, center.ability.odds, center.ability.extra }
    }
  end,
  calculate = function(self, card, context)
    if (context.forcetrigger or context.setting_blind) and not (context.blueprint_card or card).getting_sliced then
      if pseudorandom('thewayhome') < G.GAME.probabilities.normal/card.ability.odds then
        return {
          message = localize("k_correct_ex"),
          func = function()
            ease_hands_played(card.ability.extra)
          end
        }
      end
    end
  end
}

return joker
