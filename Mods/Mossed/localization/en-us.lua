return {
    descriptions = {
        Back = {
			b_moss_henry = {
				name = "Double Deck",
				text = {
					"Start run with {C:attention,T:v_overstock_norm}Overstock{}",
					"and {C:attention,T:v_overstock_plus}Overstock Plus{}",
					"{C:attention}+2{} Joker slots",
					"{C:attention}+2{} Hand size",
					"{C:red}x2{} Base blind size",
				},
			},
			b_moss_fitzgerald = {
				name = "Casino Deck",
				text = {
					"Start run with",
					"{C:tarot,T:c_wheel_of_fortune}Wheel of Fortune",
					"{C:blue}Hands{} and {C:red}Discards{} are",
					"{C:attention}Randomized{} at the start",
					"of a Round"
				},
			},
		},
        Blind = {},
        Edition = {
			e_moss_green = {
				name = "Green",
				label = "Green",
				text = {
					"{C:attention}+#2#{} sell value at",
					"the end of a round",
				},
			},
			e_moss_greenalt = {
				name = "Green",
				label = "Green",
				text = {
					"{C:blue}+#1#{} extra chips",
					"when card is scored",
				},
			},
			e_moss_greenalt2 = {
				name = "Green",
				label = "Green",
				text = {
					"{C:attention}+#2#{} sell value at the end of a round if put on a {C:attention}Joker{}",
					"{C:blue}+#1#{} extra chips when card is scored if put on a {C:attention}Playing Card{}",
				},
			},
		},
        Enhanced={},
        Joker = {
			j_moss_mossy = {
				name = "Mossy Joker",
				text = {
					"After {C:attention}#1#{} rounds,",
					"sell this joker to apply",
					"{C:green}Green{} to a random joker",
					"{C:inactive}(Currently{} {C:attention}#2#{}{C:inactive}/#1#){}",
				},
			},
			j_moss_kitchen = {
				name = "Kitchen Tiles",
				text = {
					"All {C:attention}Stone Cards{} are",
					"considered to be {V:1}#1#{}",
					"{s:0.8}Suit changes at end of round",
				},
			},
			j_moss_jeb = {
				name = "jeb",
				text = {
					"This Joker gains {C:red}+#2#{} mult",
					"whenever a pack is opened",
					"Resets when {C:attention}Boss Blind{}",
					"is {C:attention}defeated{}",
					"{C:inactive}(Currently {}{C:red}+#1#{}{C:inactive} Mult){}",
				},
			},
			j_moss_d9volt = {
				name = "{s:0.75}a 9-volt battery with dice numbers etched onto it{}",
				text = {
					"Gives mult depending",
					"on the run's {C:attention}current seed{}",
					"{C:inactive}(Currently {}{C:red}+#2#{}{C:inactive} Mult){}",
				},
			},
			j_moss_lara = {
				name = "Lara",
				text = {
					"{C:attention}Editions{} on playing cards",
					"now trigger when {C:attention}held in hand{}",
				},
			},
			j_moss_bittergiggle = {
				name = "Ultimate Jokester",
				text = {
					"{C:attention}Enhanced Queens{} give",
					"{X:mult,C:white}X#1#{} Mult when scored",
				},
			},
			j_moss_blueberry = {
				name = "Blueberry",
				text = {
					"{C:blue}+#2#{} Chips per Blueberries",
					"obtained this run",
					"Destroys itself after {C:attention}#1#{} rounds",
					"{C:inactive}(Currently {}{C:blue}+#3#{}{C:inactive} Chips){}",
					"{s:0.8}This Joker can appear mutiple times without {s:0.8,C:attention}Showman{}",
				},
			},
			j_moss_strawberry = {
				name = "Strawberry",
				text = {
					"{C:red}+#2#{} Mult per Strawberries",
					"obtained this run",
					"Destroys itself after {C:attention}#1#{} rounds",
					"{C:inactive}(Currently {}{C:red}+#3#{}{C:inactive} Mult){}",
					"{s:0.8}This Joker can appear mutiple times without {s:0.8,C:attention}Showman{}",
				},
			},
			j_moss_followsuit = {
				name = "Follow Suit",
				text = {
					"Earn {C:money}money{} equal to the amount",
					"of {C:attention}suits{} in your deck whenever",
					"the first scoring {V:1}#1#{}",
					"in your hand is scored",
					"{C:inactive}(Currently {}{C:money}$#2#{}{C:inactive}){}",
					"{s:0.8}Suit changes every round{}",
				},
			},
			j_moss_fourfold = {
				name = "Four-Fold Symmetry",
				text = {
					"{C:blue}+#1#{} chips on every",
					"{C:attention}Odd-Numbered{} hand",
					"{C:red}+#2#{} mult on every",
					"{C:attention}Even-Numbered{} hand",
				},
			},
			j_moss_pixel = {
				name = "Pixel Perfect",
				text = {
					"This Joker Gains {C:blue}+#2#{} chips",
					"at end of round for",
					"every {C:attention}8{} in your full deck",
					"{C:inactive}(Currently {}{C:blue}+#1#{}{C:inactive} Chips){}",
				},
			},
			j_moss_luigi = {
				name = "Cowardly Plumber",
				text = {
					"This Joker gains {X:mult,C:white}X#3#{} Mult",
					" every time a {C:spectral}Spectral{} card is used",
					"{C:green}#4# in #1#{} chance to",
					"{C:attention}destroy{} itself instead",
					"{C:inactive}(Currently {}{X:mult,C:white}X#2#{}{C:inactive} Mult{})",
				},
			},
			j_moss_impractical = {
				name = "Tonight's Biggest Loser",
				text = {
					"This Joker gains {C:red}+#1#{} Mult and",
					"destroys the {C:attention}lowest ranked card{}",
					"{C:attention}held in hand{} on final hand of round",
					"{C:inactive}(Currently {}{C:red}+#2#{}{C:inactive} Mult){}",
				},
			},
			j_moss_split = {
				name = "Split Joker",
				text = {
					"This Joker gains {C:blue}+#1#{} chips",
					"when {C:attention}discarding{} a hand that",
					"contains {C:attention}3{} or fewer cards",
					"{C:inactive}(Currently {}{C:blue}+#2#{}{C:inactive} Chips){}",
				},
			},
			j_moss_jet = {
				name = "Jetziel",
				text = {
					"Retriggers all playing",
					"cards with {C:attention}Enhancements{}",
				},
			},
			j_moss_glamorous = {
				name = "Glamorous Joker",
				text = {
					"{C:attention}Queen Pair{} can be made",
					"with any {C:attention}Face Card{}", 
					"{C:inactive}(ex: {C:attention}J 5 5{C:inactive})",
				},
				unlock = {
					"Play a {C:attention}????? ????{}"
				},
			},
		},
        Other={},
        Planet={
			c_moss_iris = {
                name="Iris",
                text={
                    "{S:0.8}({S:0.8,V:1}lvl.#2#{S:0.8}){} Level up",
                    "{C:attention}#1#{}",
                    "{C:red}+#3#{} Mult and",
                    "{C:blue}+#4#{} chips",
                },
            },
		},
        Spectral={
			c_moss_plague = {
				name = "Plague",
				text = {
					"{C:green}#3# in #2#{} chance to",
					"apply {C:green}Green{} to up to",
					"{C:attention}#1#{} selected {C:attention}playing cards{}", 
					"if this chance fails",
					"{C:attention}destroy{} the card instead.",
				},
			},
			c_moss_avarice = {
				name = "Avarice",
				text = {
					"Add {C:green}Green{} to",
					"a random {C:attention}Joker{}",
				},
			},
		},
        Stake={},
        Tag={
			tag_moss_greentag = {
					name = "Green Tag",
					text = {
						"Next base edition shop",
						"Joker is free and",
						"becomes {C:green}Green{}",
					},
			},
		},
        Tarot={},
        Voucher={},
		Mod = {
			mossed = {
				name = "Mossed",
				text = {
					"                                                                              ",
					"{s:1.25}This mod adds {C:red,s:1.25}16 Jokers{s:1.25},",
					"{C:attention,s:1.25}2 Decks{s:1.25},",
					"{C:spectral,s:1.25}2 Spectral Cards{s:1.25},",
					"{C:green,s:1.25}a new Edtion{s:1.25},",
					"{s:1.25}and so much more!",
					" ",
					"{s:1.25}Art - {C:green,E:1,s:1.25}Larantula{}",
					" ",
					"{s:1.25}Coding - {C:blue,E:1,s:1.25}Jetziel{}",
					" ",
					"{s:1.25}Special Thanks - {C:tarot,E:1,s:1.25}Balatro Discord{s:1.25}, {C:red,E:1,s:1.25}ITDEER{s:1.25}, {C:blue,E:1,s:1.25}jeb_yoshi{s:1.25}, {C:blue,E:1,s:1.25}MilesB24{}",
					" ",
				},
			},
		},
    },
    misc = {
        achievement_descriptions={},
        achievement_names={},
        blind_states={},
        challenge_names={},
        collabs={},
        dictionary={
			k_green_ex="Green!",
			k_destroyed="Destroyed!",
			k_good_night="Good Night...",
		},
        high_scores={},
        labels={},
        poker_hand_descriptions={
			["moss_Queen Pair"]={
                "2 cards that share the same rank, plus a Queen.",
                "They may be played with up to 2 other unscored cards",
            },
		},
        poker_hands={
			["moss_Queen Pair"]="Queen Pair",
		},
        quips={},
        ranks={},
        suits_plural={},
        suits_singular={},
        tutorial={},
        v_dictionary={},
        v_text={},
    },
}