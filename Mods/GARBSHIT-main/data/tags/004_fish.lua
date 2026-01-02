return {
    SMODS.Tag {
        key = 'fish',
        loc_txt = {
          name = 'Fish Tag',
          text = {
            "Leeftmost {C:attention}Joker{}",
            "becomes {C:dark_edition}Aquatic",
            "{C:inactive,s:0.6}(Aquatic edition may not work on all Jokers)"
        }
        },
        atlas = 'GarbTags', 
        pos = { x = 3, y = 0 },
        in_pool = function()
		    return (G.jokers and #G.jokers.cards >= 1)
	    end,
        apply = function(self, tag, context)
        if context.type == "new_blind_choice" then
            if G.jokers.cards[1] then
                tag:yep("", G.C.ATTENTION, function()
                G.jokers.cards[1]:set_edition("e_garb_fish", true)
                return true
                end)
                tag.triggered = true
                return true
            end
        end
        end,
      }
    }