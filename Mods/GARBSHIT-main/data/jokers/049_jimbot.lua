return {
 SMODS.Joker {
    key = 'jimbot',
    loc_txt = {
      name = 'Jimbot',
      text = {
        "If played hand contains",
        "only one card,",
        "{C:attention}enhance{} it into a", 
        "{C:attention}Steel{} or {C:attention}Gold{} card"
      }
    },
    -- Extra is empty, because it only happens once. If you wanted to copy multiple cards, you'd need to restructure the code and add a for loop or something.
    config = { extra = {punk = 0} },
    rarity = 2,
    atlas = 'GarbJokers',
    pos = { x = 4, y = 10 },
    
      unlocked = true, 
      discovered = false, --whether or not it starts discovered
      blueprint_compat = true, --can it be blueprinted/brainstormed/other
      eternal_compat = true, --can it be eternal
      perishable_compat = true, --can it be perishable
      cost = 4,
      loc_vars = function(self, info_queue, card)
      info_queue[#info_queue+1] = G.P_CENTERS.m_steel
      info_queue[#info_queue+1] = G.P_CENTERS.m_gold
      return { vars = {  } }
    end,
      
     calculate = function(self, card, context)
         
      if context.before and #G.play.cards == 1 then
        G.play.cards[1]:set_ability(G.P_CENTERS[pseudorandom_element({"m_steel", "m_gold"},pseudoseed('BROBOT'))])
        G.play.cards[1]:juice_up()
        card.ability.extra.punk = card.ability.extra.punk + 1
        if card.ability.extra.punk > 4 then card.ability.extra.punk = 1 end
        local daft = {"HARDER!", "BETTER!", "FASTER!", "STRONGER!"}

        return {
          message = daft[card.ability.extra.punk]
        }
      end
    end
  },
  
  }