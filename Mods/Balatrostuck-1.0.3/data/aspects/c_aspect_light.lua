function Balatrostuck.INIT.Aspects.c_aspect_light()
    Balatrostuck.Aspect{
        key = "light",
        name = "Light",
        loc_txt = {
            name = "Light",
            text = {
                'Cards in your {C:attention}consumable',
                'area give {X:mult,C:white}X#1#{} Mult',
            }
        },
        pos = {
            x = 0,
            y = 0
        },
        soul_pos = {
            x = 0,
            y = 2
        },
        cost = 4,
        discovered = false,
        atlas = "HomestuckAspects",
        use = function(self, context)
            self:switch_slab()
        end,
        can_use = function(self)
            return true
        end
    }



    Balatrostuck.Slab{
        key = 'light',
        atlas = 'HomestuckAspectSlabs',
        pos = {
            x = 0,
            y = 0
        },
        config = {},
        name = 'Aspect of Light',
        apply = function(self, slab, context) 
            if context.other_consumeable then
                return {
                    Xmult_mod = 1 + (slab:level() * 0.3),
                    message = localize{type = 'variable', key = 'a_xmult', vars = {1 + (slab:level() * 0.3)}},
                    card = context.other_consumeable              
                }
            end
        end
    }
end