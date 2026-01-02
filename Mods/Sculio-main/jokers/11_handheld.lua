function Card:is_suit(suit, bypass_debuff, flush_calc)
  if flush_calc then
    if self.ability.effect == 'Stone Card' then
      return false
    end

    -- Modified:
    if (self.ability.name == "Wild Card" or next(find_joker('j_Sculio_handheld'))) and not self.debuff then
      return true
    end

    if next(find_joker('Smeared Joker')) and (self.base.suit == 'Hearts' or self.base.suit == 'Diamonds') == (suit == 'Hearts' or suit == 'Diamonds') then
      return true
    end

    return self.base.suit == suit
  else
    if self.debuff and not bypass_debuff then return end

    if self.ability.effect == 'Stone Card' then
      return false
    end

    
    if self.ability.name == "Wild Card" or next(find_joker('j_Sculio_handheld')) then
      return true
    end

    if next(find_joker('Smeared Joker')) and (self.base.suit == 'Hearts' or self.base.suit == 'Diamonds') == (suit == 'Hearts' or suit == 'Diamonds') then
      return true
    end

    return self.base.suit == suit
  end
end

SMODS.Joker {
  key = 'handheld',

  unlocked = true,
  discovered = false,
  rarity = 3, -- Rare
  atlas = 'Sculio',
  pos = { x = 0, y = 1 },
  cost = 9,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.m_wild
  end
}
