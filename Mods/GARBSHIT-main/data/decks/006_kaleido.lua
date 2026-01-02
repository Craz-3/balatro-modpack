return {
 SMODS.Back {
        key = 'kaleido',
        config = {},
        atlas = 'GarbDecks',
        pos = { x = 2, y = 1 },    
        unlocked = false,
        discovered = false,
        config = { },
        loc_vars = function(self, info_queue, card)
            return {vars = {pseudorandom_element(G.KaleidoQuips,pseudoseed('lols'))}}
        end,
        locked_loc_vars = function(self, info_queue, card)
          local key = G.PROFILES[G.SETTINGS.profile].MINIGAME_TUTORIAL_COMPLETED and (self.key .. '_alt') or self.key
          return {key = key}
        end,
        apply = function(self, back)
            G.E_MANAGER:add_event(Event({
                    func = (function()
                        add_tag(Tag('tag_garb_rainbow'))
                        return true
                    end)}))
            end,
        check_for_unlock = function(self, args)
                if args.type == "kaleido_deck" then
                  return true
                end
              end,    
    },

    }