SMODS.Enhancement({
    key = "call_response",
    atlas="enhancements",
    no_rank = true,
    no_suit = true,
    always_scores = true,
    replace_base_card = true,
	credit = {
        art = "missingnumber",
        code = "TheAltDoc",
		concept = "TheAltDoc"
    }
})

-- Flow Deck/Sleeve values
local flow_deck_config={
    points = {
        hands = 2, -- How many points to award per leftover hand
        discards = 1, -- How many points to award per leftover discard
        blind = 0.5, -- How many xPoints to add to the blind multiplier, eg. 1.0/1.5/2.0 for small/big/boss
        showdown = 4, -- How many xPoints to add when Showdown is defeated (does not take boss reward into account)
        score = 0.9 -- (Score/Requirement) * thisValue - This is a points multiplier
    },
    rewards = {
        c_rh_pity_skip = 0,
        c_rh_try_again = 5,
        c_rh_some_good_parts = 7,
        c_rh_extra_life = 9,
        c_rh_simple_tap = 12,
        c_rh_ok = 15,
        c_rh_you = 18,
        c_rh_skill_star = 20,
        c_rh_superb = 23,
        c_rh_new_record = 25,
        c_rh_perfect = 50,
        random = 300
    }
}

-- Flow Deck
SMODS.Back({
    key = "flow",
    atlas = "back",
    pos = {x = 0, y = 0},
    loc_vars = function(self)
		return { vars = { self.config.consumable_slot } }
	end,
	config = {
		consumable_slot = -1,
    },
    apply = function(self, back)
        G.GAME.rh_reward_system = flow_deck_config
    end
})

-- Flow Sleeve
if CardSleeves then
    CardSleeves.Sleeve {
		key = "flow",
		atlas = "sleeve",
		pos = { x = 0, y = 0 },
		loc_txt = {
            name ="Flow Sleeve",
            text={
                "{C:attention}#1#{} consumable slots",
                "After defeating each {C:attention}Blind,",
                "gain a {C:rh_flow}Flow{} card",
                "{s:0.8}The {s:0.8,C:rh_flow}Flow{s:0.8} card received depends",
                "{s:0.8}on {s:0.8,C:attention}how well{s:0.8} you did",
            },
		},
		config = {
            consumable_slot = -1,
            consumable_slot_alt = 1,
		},
		loc_vars = function(self)
			local key, vars
			if self.get_current_deck_key() == "b_rh_flow" then
				key = self.key .. "_alt"
                vars = {self.config.consumable_slot_alt + 1}
			else
				key = self.key
                vars = {self.config.consumable_slot}
			end
			return { key = key, vars = vars }
		end,
        apply = function(self)
			if self.get_current_deck_key() == "b_rh_flow" then
                G.GAME.starting_params.consumable_slots = G.GAME.starting_params.consumable_slots + self.config.consumable_slot_alt
            else
                G.GAME.starting_params.consumable_slots = G.GAME.starting_params.consumable_slots + self.config.consumable_slot
            end
            G.GAME.rh_reward_system = flow_deck_config
        end
	}
end