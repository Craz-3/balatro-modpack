return {
 SMODS.Back {
        key = 'albert',
        config = {},
        atlas = 'GarbDecks',
        pos = { x = 1, y = 0 },    
        unlocked = false,
        discovered = false,
        config = { ante_scaling = 1.5},
        loc_vars = function(self, info_queue, card)
            local key = G.ALBERT_LEGENDARY and (self.key .. "_alt") or self.key
            local loctab
            return {key = key, vars = {self.config.ante_scaling, G.ALBERT_LEGENDARY and G.localization.descriptions['Joker'][G.ALBERT_LEGENDARY].name}}
        end,
        apply = function(self, back)
            G.E_MANAGER:add_event(Event({
                func = function()
                    if G.jokers then
                        if G.ALBERT_LEGENDARY then 
                            card = SMODS.create_card({key = G.ALBERT_LEGENDARY}) 
                        else 
                            local selectables = {}
                            for k, v in pairs(G.P_CENTER_POOLS['Joker']) do
                                if v and v.rarity == 4 and v.unlocked then
                                    selectables[#selectables+1] = v.key
                                end
                            end
                            local key = pseudorandom_element(selectables,pseudoseed('albert'))
                            card = SMODS.create_card({key = key}) 
                        end
                        card:add_to_deck()
                        card:start_materialize()
                        G.jokers:emplace(card)
                        return true
                    end
                end,
            }))
            end,
        check_for_unlock = function(self, args)
                if args.type == "albert_deck" then
                  return true
                end
              end,    
    },

    }