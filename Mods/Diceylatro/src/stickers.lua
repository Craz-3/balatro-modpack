
SMODS.Atlas {
    key = 'stickers',
    path = 'Stickers.png',
    px = 71,
    py = 95
}

local all_sets = {}
for i,k in pairs(G.P_CENTER_POOLS) do
    all_sets[i] = true
end

SMODS.Sticker{
    key = 'temporary',
    atlas = 'stickers',
    pos = {x = 0, y = 0},
    loc_txt = {
        name="Temporary",
        label='Temporary',
                text = {
        		"It's {C:attention}destroyed{}",
			"after the blind"
        	},
            },
    badge_colour = HEX 'a95e22',
    hide_badge = false,
    default_compat = true,
    needs_enable_flag = false,
    sets =  all_sets,
    rate = 0,
    calculate = function(self, card, context)
    end,
    apply = function(self, card, val)
        card.ability[self.key] = val
	card.ability.temporary = val
    end,
}

function Card:set_temporary(_temporary)
    SMODS.Stickers['dd_temporary']:apply(self, true)
    self.ability.temporary = _temporary
    if next(find_joker('The Thief')) and self.ability.set == 'Joker' then
    	edition = {negative=true}
    	self:set_edition({negative=true})
    	self.cost = 0
    	self.extra_cost = 0
    	self.sell_cost = 0
    end
    if self.ability.eternal and _temporary then 
        self.ability.eternal = false
    end
    if self.ability.perishable and _temporary then 
        self.ability.perishable = false
    end
end
