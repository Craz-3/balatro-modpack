SMODS.Challenge{
    key = "trial",
    loc_txt = {
        name = "Trial of the Sword",
    },
    rules = {
        custom = {
            {id = "no_shop_jokers"},
            {id = "reverse_sword_1"},
            {id = "reverse_sword_2"},
            {id = "reverse_no_mods"},
        },
        modifiers = {
            {
                id = "joker_slots",
                value = 1
            }
        }
    },
    jokers = {
        {
            id = "j_reverse_goddess_sword",
            eternal = true
        }
    },
    restrictions = {
        banned_cards = {
            {id = "c_judgement"},
            {id = "c_reverse_c_reverse_judgement"},
            {id = "c_wraith"},
            {id = "c_ankh"},
            {id = "c_ectoplasm"},
            {id = "c_soul"},
            {id = "v_blank"},
            {id = "v_antimatter"},
            {
                id = "p_buffoon_normal_1",
                ids = {"p_buffoon_normal_1",
                "p_buffoon_normal_2",
                "p_buffoon_jumbo_1",
                "p_buffoon_mega_1"}
            }
        },
        banned_other = {
            {
                id = "bl_final_heart",
                type = "blind"
            },
            {
                id = "bl_final_leaf",
                type = "blind"
            },
            {
                id = "bl_final_acorn",
                type = "blind"
            },
            {
                id = "bl_reverse_final_beast",
                type = "blind"
            },
        }
    }
}

SMODS.Challenge{
    key = "luck_of_the_draw",
    loc_txt = {
        name = "Luck of the Draw",
    },
    rules = {
        custom = {
            {id = "no_shop_jokers"},
            {id = "no_shop_tarots"},
            {id = "reverse_no_mods"},
        },
        modifiers = {
            {
                id = "joker_slots",
                value = 1
            }
        }
    },
    jokers = {
        {
            id = "j_hologram",
            eternal = true
        }
    },
    vouchers = {
        {id = "v_hone"},
        {id = "v_glow_up"},
        {id = "v_magic_trick"},
        {id = "v_illusion"},
    },
    deck = {
        cards = {
            {s = "H", r = "2"},
            {s = "C", r = "3"},
            {s = "D", r = "4"},
            {s = "S", r = "5"},
            {s = "H", r = "6"},
            {s = "C", r = "7"},
            {s = "D", r = "8"},
            {s = "S", r = "9"},
            {s = "H", r = "T"},
            {s = "C", r = "J"},
            {s = "D", r = "Q"},
            {s = "S", r = "K"},
            {s = "H", r = "A"},
        }
    },
    restrictions = {
        banned_cards = {
            {id = "v_blank"},
            {id = "v_antimatter"},
            {id = "v_tarot_merchant"},
            {id = "v_tarot_tycoon"},
            {id = "v_reverse_zodiac_merchant"},
            {id = "v_reverse_zodiac_tycoon"},
            {
                id = "p_arcana_normal_1",
                ids = {
                    "p_arcana_normal_1",
                    "p_arcana_normal_2",
                    "p_arcana_normal_3",
                    "p_arcana_normal_4",
                    "p_arcana_jumbo_1",
                    "p_arcana_jumbo_2",
                    "p_arcana_mega_1",
                    "p_arcana_mega_2",
                }
            },
            {
                id = "p_buffoon_normal_1",
                ids = {
                    "p_buffoon_normal_1",
                    "p_buffoon_normal_2",
                    "p_buffoon_jumbo_1",
                    "p_buffoon_mega_1",
                }
            },
            {
                id = "p_spectral_normal_1",
                ids = {
                    "p_spectral_normal_1",
                    "p_spectral_normal_2",
                    "p_spectral_jumbo_1",
                    "p_spectral_mega_1",
                }
            },
            {
                id = "p_reverse_zodiac_1",
                ids = {
                    "p_reverse_zodiac_1",
                    "p_reverse_zodiac_2",
                    "p_reverse_zodiac_3",
                    "p_reverse_zodiac_4",
                }
            },
        },
        banned_tags = {
            {id = 'tag_rare'},
            {id = 'tag_uncommon'},
            {id = 'tag_holo'},
            {id = 'tag_polychrome'},
            {id = 'tag_negative'},
            {id = 'tag_foil'},
            {id = 'tag_buffoon'},
            {id = 'tag_top_up'},
            {id = 'tag_charm'},
            {id = 'tag_ethereal'},
            {id = 'tag_reverse_polaris'},
        },
        banned_other = {
            {
                id = "bl_final_heart",
                type = "blind"
            },
            {
                id = "bl_final_leaf",
                type = "blind"
            },
            {
                id = "bl_final_acorn",
                type = "blind"
            },
            {
                id = "bl_reverse_final_beast",
                type = "blind"
            },
        }
    }
}