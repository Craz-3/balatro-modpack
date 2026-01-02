return {
 SMODS.Joker {
      key = 'truehivemind',
      loc_txt = {
        name = 'True Hivemind',
        text = {
          "Infected Cards give X3 Mult",
          "Standard Packs are compromised"
          },
      },
      config = { extra = { Xmult = 3, Xmult_gain = 0.25 } },
      loc_vars = function(self, info_queue, card)
        local returntable = {vars = {card.ability.extra.Xmult, card.ability.extra.Xmult_gain*2} }
        local key, vars
        returntable.key = self.key .. "_" .. (G.GAME.hivemind_stage or 1)
        return returntable
      end,
      rarity = "garb_rainbow",
      atlas = 'GarbJokers',
      pos = {x = 5, y = 11},
      cost = 10,
      
        unlocked = true, 
        discovered = false, --whether or not it starts discovered
        blueprint_compat = true, --can it be blueprinted/brainstormed/other
        eternal_compat = true, --can it be eternal
        perishable_compat = false, --can it be perishable

      add_to_deck = function(self,card)
        G.GAME.hivemind_stage = G.GAME.hivemind_stage or 1
      end,

      calculate = function(self, card, context)
        if context.ante_end then
          card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain

          local change = G.GAME.hivemind_stage or 1
          G.GAME.hivemind_stage = math.floor((G.GAME.round_resets.ante+2)/2)
          if G.GAME.hivemind_stage > 3 then G.FORCE_TAG = "tag_standard" end

          if change < G.GAME.hivemind_stage then 
              card:juice_up()
              play_sound('garb_snap', 1)
              play_sound('garb_infect', 0.4 + math.random()*0.1, 0.8)
          end

          if G.GAME.hivemind_stage > 2 then
            card:set_eternal(true)
          end

          if G.GAME.hivemind_stage > 4 then
            for k, v in pairs(G.playing_cards) do
              v:set_ability(G.P_CENTERS["m_garb_infected"])
            end
          end

          if G.GAME.hivemind_stage > 6 then 
            G.SETTINGS.HIVE = true
            G:save_progress()
            G.FILE_HANDLER.force = true

          G.E_MANAGER:add_event(Event({trigger = "after", delay = 10, func = function()
            G.STATE = G.STATES.GAME_OVER; G.STATE_COMPLETE = false
            if G.SETTINGS.HIVE then
              check_for_unlock({type = 'thehive'})
              love.event.quit()
            end
          return true end}))
          end

          return {message = G.GAME.hivemind_stage > 4 and "UPGRADE" or "Upgraded!"}
        end

      if context.starting_shop or context.reroll_shop and not context.blueprint then
        for k, v in pairs(G.shop_jokers.cards) do
          G.E_MANAGER:add_event(Event({trigger = "after", delay = 0.5, func = function()
          if G.GAME.hivemind_stage > 5 then
            card_transform(v, "j_garb_truehivemind")
          end
          return true end}))
        end

        for k, v in pairs(G.shop_booster.cards) do
          G.E_MANAGER:add_event(Event({trigger = "after", delay = 0.5, func = function()
          if G.GAME.hivemind_stage > 5 and not context.reroll_shop then
            v:start_dissolve()
          end
          return true end}))
        end

        for k, v in pairs(G.shop_vouchers.cards) do
          G.E_MANAGER:add_event(Event({trigger = "after", delay = 0.5, func = function()
          if G.GAME.hivemind_stage > 5 and not context.reroll_shop then
            v:start_dissolve()
          end
          return true end}))
        end
      end

        if context.playing_card_added then
          if G.GAME.hivemind_stage > 4 then
            for k, v in pairs(G.playing_cards) do
              v:set_ability(G.P_CENTERS["m_garb_infected"])
            end
          end
        end

        if context.individual and context.cardarea == G.play then
          if context.other_card and SMODS.get_enhancements(context.other_card).m_garb_infected then
              return {
              Xmult_mod = card.ability.extra.Xmult,
              message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } },
              message_card = context.other_card,
            }
          end
        end
      end,
    },
  
  }