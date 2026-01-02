SMODS.Joker {
  key = 'effigy',

  unlocked = true,
  discovered = false,
  rarity = 2, -- Uncommon
  atlas = 'Sculio',
  pos = { x = 5, y = 2 },
  cost = 8,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.before then
      other_jokers = {}

      for i = 1, #G.jokers.cards do
        this_joker = G.jokers.cards[i]

        if this_joker ~= card then
          table.insert(other_jokers, this_joker)
        end
      end

      if #other_jokers > 0 and not random_joker then
        math.randomseed(pseudorandom('scheming_idol'))
        random_joker = other_jokers[math.random(1, #other_jokers)]
      end
    end

    if context.after then
      random_joker = nil
    end

    if random_joker then
      random_joker_ret = SMODS.blueprint_effect(card, random_joker, context)
      return random_joker_ret
    end
  end
}
