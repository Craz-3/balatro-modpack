if not mf_config["Colour Cards"] then
  return nil
end
local joker = {
  name = "Paint Can",
  config = {
    extra = {
      odds = 2
    }
  },
  pos = {x = 1, y = 7},
  rarity = 2,
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = false,
  eternal_compat = true,
  perishable_compat = true,
  demicoloncompat = true,
  loc_vars = function(self, info_queue, center)
    return {
      vars = { G.GAME.probabilities.normal, center.ability.extra.odds }
    }
  end,
  calculate = function(self, card, context)
    if context.forcetrigger then
      colour_end_of_round_effects()
    end 
  end
}

return joker
