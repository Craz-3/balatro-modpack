SMODS.Challenge{
    key = "second_contact",
    jokers = {
        { id = "j_ramen"}
    },
	restrictions = {
		banned_cards = {
			{ id = "j_vampire" },
			{ id = "j_marble" },
			{ id = "j_certificate" },
			{ id = "j_midas_mask" },
			{ id = "c_death" },
			{ id = "c_magician" },
			{ id = "c_empress" },
			{ id = "c_heirophant" },
			{ id = "c_lovers" },
			{ id = "c_chariot" },
			{ id = "c_justice" },
			{ id = "c_devil" },
			{ id = "c_tower" },
			{ id = "c_familiar" },
			{ id = "c_grim" },
			{ id = "c_incantation" },
			{ id = "c_rh_superb" },
            {id = 'p_standard_normal_1', ids = {
                'p_standard_normal_1','p_standard_normal_2','p_standard_normal_3','p_standard_normal_4','p_standard_jumbo_1','p_standard_jumbo_2','p_standard_mega_1','p_standard_mega_2',
            }},
		},
        banned_tags = {
            {id = 'tag_standard'},
        },
		banned_other = {
            {id = "bl_club",type = "blind"},
            {id = "bl_goad",type = "blind"},
            {id = "bl_window",type = "blind"},
            {id = "bl_head",type = "blind"},
            {id = "bl_plant",type = "blind"},
            {id = "bl_eye",type = "blind"},
            {id = "bl_water",type = "blind"},
            {id = "bl_pillar",type = "blind"}
        },
    },
    deck = {
        type = 'Challenge Deck',
		cards = {
			{ s = "C", r = "J" },
			{ s = "C", r = "J", e = "m_rh_call_response" },
			{ s = "C", r = "J", e = "m_rh_call_response" },
			{ s = "C", r = "J", e = "m_rh_call_response" },
			{ s = "C", r = "J", e = "m_rh_call_response" },
			{ s = "C", r = "J", e = "m_rh_call_response" },
			{ s = "C", r = "J", e = "m_rh_call_response" },
			{ s = "C", r = "J", e = "m_rh_call_response" },
			{ s = "C", r = "J", e = "m_rh_call_response" },
			{ s = "C", r = "J", e = "m_rh_call_response" },
			{ s = "C", r = "J", e = "m_rh_call_response" },
			{ s = "C", r = "J", e = "m_rh_call_response" },
			{ s = "C", r = "J", e = "m_rh_call_response" },
			{ s = "D", r = "J", e = "m_rh_call_response" },
			{ s = "D", r = "J", e = "m_rh_call_response" },
			{ s = "D", r = "J", e = "m_rh_call_response" },
			{ s = "D", r = "J", e = "m_rh_call_response" },
			{ s = "D", r = "J", e = "m_rh_call_response" },
			{ s = "D", r = "J", e = "m_rh_call_response" },
			{ s = "D", r = "J", e = "m_rh_call_response" },
			{ s = "D", r = "J", e = "m_rh_call_response" },
			{ s = "D", r = "J", e = "m_rh_call_response" },
			{ s = "D", r = "J", e = "m_rh_call_response" },
			{ s = "D", r = "J", e = "m_rh_call_response" },
			{ s = "D", r = "J", e = "m_rh_call_response" },
			{ s = "D", r = "J", e = "m_rh_call_response" },
		},
    }
}

SMODS.Challenge{
    key = "saffron_trial",
    rules = {
        custom = {
            {id = 'all_rental'},
            {id = 'cry_all_rental'}, -- Fix for Cryptid since it overrides the normal card creation
        },
        modifiers = {
        }
    },
    jokers = {
        { id = "j_rh_goat", rental = true}
    },
	restrictions = {
		banned_cards = {
		},
    },
}

SMODS.Challenge{
    key = "remix_medley",
    jokers = {
        { id = "j_rh_endless_common", eternal = true},
        { id = "j_rh_endless_uncommon", eternal = true},
        { id = "j_rh_endless_rare", eternal = true}
    },
	restrictions = {
		banned_cards = {
		},
    },
    -- deck = {
    --     type = 'Challenge Deck',
    -- }
}

SMODS.Challenge{
    key = "remix_10",
    rules = {
        custom = {
            {id = 'no_skip'},
            {id = 'all_boss'},
        },
        modifiers = {
        }
    },
	restrictions = {
        banned_cards = {
			{ id = "c_rh_pity_skip" },
        },
		banned_other = {
            {id = "bl_small",type = "blind"},
            {id = "bl_big",type = "blind"},
		},
    },
    jokers = {
        { id = "j_rh_endless_rare"},
        { id = "j_rh_endless_rare"}
    },
}

SMODS.Challenge{
    key = "perfect_campaign",
    rules = {
        custom = {
            {id = 'all_water'},
        },
        modifiers = {
        }
    },
	restrictions = {
        banned_cards = {
			{ id = "c_rh_extra_life" },
        },
    },
    jokers = {
    },
}