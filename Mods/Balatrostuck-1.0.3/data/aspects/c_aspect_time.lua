function Balatrostuck.INIT.Aspects.c_aspect_time()
    Balatrostuck.Aspect{
        key = "time",
        name = "Time",
        loc_txt = {
            name = "Time",
            text = {
                "{C:blue}+#1#{} hand#2# each round",
            }
        },
        pos = {
            x = 3,
            y = 0
        },
        soul_pos = {
            x = 3,
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
        key = 'time',
        atlas = 'HomestuckAspectSlabs',
        pos = {
            x = 3,
            y = 0
        },
        config = {},
        name = 'Aspect of Time',
        apply = function(self, slab, context) 
            if context.setting_blind then
                ease_hands_played(summation(slab:level()))
            end
        end
    }
end