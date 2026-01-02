local old_shuffle = CardArea.shuffle

function contains(cards, card)
  for _, v in pairs(cards) do
    if v == card then
      return true
    end
  end

  return false
end

-- Original implementation for Verified User: Somethingcom515 {SealsOnAll}
function CardArea:shuffle(_seed)
  local g = old_shuffle(self, _seed)

  rorschach = nil
  verified_user = nil

  for i = 1, #G.jokers.cards do
    joker = G.jokers.cards[i]

    if joker and joker.ability.name == 'j_Sculio_rorschach' and #joker.ability.extra.card_ids_to_draw_next >= 1 then
      rorschach = joker
    end

    if joker and joker.ability.name == 'j_Sculio_verified' then
      verified_user = joker
    end
  end

  if self == G.deck and (rorschach or verified_user) then
    -- Later prioritizations override earlier ones.
    -- rorschach should take priority over Verified User.
    -- Therefore, we handle the Verified User logic first.
    if verified_user then
      local priorities = {}
      local others = {}

      for _, v in pairs(self.cards) do
        if v.seal == 'Blue' then
          table.insert(priorities, v)
        else
          table.insert(others, v)
        end
      end

      for _, card in ipairs(priorities) do
        table.insert(others, card)
      end
  
      self.cards = others
    end

    if rorschach then
      local priorities = {}
      local others = {}

      for _, v in pairs(self.cards) do
        if contains(rorschach.ability.extra.card_ids_to_draw_next, v.ID) then
          table.insert(priorities, v)
        else
          table.insert(others, v)
        end
      end

      for _, card in ipairs(priorities) do
        table.insert(others, card)
      end
  
      self.cards = others
      rorschach.ability.extra.cards_to_draw_next = {}
    end

    self:set_ranks()
  end

  return g
end
