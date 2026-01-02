return {
    descriptions = {
        Joker = {
            j_rh_widget = {
                name = 'Bidule',
                text = {
                    "Déclenche à nouveau la {C:attention}cinquième {}carte",
                    "jouée pour marquer des points",
                    "{C:attention}#1#{} fois supplémentaires",
                }
            },
            j_rh_onion = {
                name = 'Oignon poilu',
                text = {
                    "Lors de la défausse,",
                    "pioche {C:attention}#1#{} carte(s) supplémentaire"
                }
            },
            j_rh_sneaky_spirit = {
                name = "Esprit espiègle",
                text = {
                    "Après {C:attention}#2#{} manches,",
                    "vendez cette carte pour",
                    "ajouter {C:dark_edition}Négatif{} à",
                    "un Joker aléatoire",
                    "{C:inactive}(Actuellement {C:attention}#1#{C:inactive}/#2#)",
                }
            },
            j_rh_samurai_drummer = {
                name = "Samouraï Tom",
                text = {
                    "Jetons {C:blue}+#1#{} par",
                    "carte {C:rh_flow}Rythme{} utilisée",
                    "{C:inactive}(Actuellement {C:blue}+#2#{C:inactive})",
                }
            },
            j_rh_goat = {
                name = "Chèvre",
                text = {
                    "Gagnez une somme aléatoire",
                    "à la fin de la manche",
                    "{C:inactive}({C:money}#1# $ {C:inactive}/ {C:money}#2# $ {C:inactive}/ {C:money}#3# ${C:inactive})",
                }
            },
            j_rh_monkey = {
                name = "Singe",
                text = {
                    "Déclenche à nouveau",
                    "{C:attention}toutes{} les cartes",
                    "pour marquer des points",
                    "{C:attention}#1#{} fois supplémentaires",
                }
            },
            j_rh_lockstep = {
                name = 'Double Face',
                text = {
                    "Les cartes jouées",
                    "de valeur {C:attention}#1#{} octroient",
                    "{C:chips}+#2#{} jetons, {C:mult}+#3#{} Multi.",
                    "lorsque ces cartes",
                    "marquent des points,",
                    "la parité change",
                    "à la fin de la manche",
                }
            },
            j_rh_munchy_monk = {
                name = 'Avide ascète',
                text = {
                    "{C:blue}+#1#{} Jetons par",
                    "carte {C:rh_flow}Rythme{} utilisée, {C:red}+#2#{} Multi. ",
                    "par carte de {C:tarot}Tarot{} utilisée, et",
                    "{X:mult,C:white} X#3# {} Multi. chaque fois",
                    "qu'une carte {C:planet}Planète{} est utilisée",
                    "{C:inactive}(Actuellement : {C:blue}+#4#{} Jetons, {C:red}+#5#{} Multi., {X:mult,C:white} X#6# {C:inactive} Multi.)",
                }
            },
            j_rh_cosmic_girl = {
                name = 'Meneuse cosmique',
                text = {
                    "Ce Joker octroie {C:mult}+#1#{} Multi.",
                    "si la main jouée contient",
                    "1 {C:attention}#2#{} de {C:hearts}Cœurs{} ou de {C:diamonds}Carreaux{}",
                    "{C:inactive}(Actuellement : {C:red}+#3#{C:inactive} Multi.)",
                }
            },
            j_rh_space_gramp = {
                name = "Géronte de l'espace",
                text = {
                    "Ce Joker octroie {C:mult}+#1#{} Multi.",
                    "si la main jouée contient",
                    "1 {C:attention}#2#{} de {C:spades}Piques{} ou de {C:clubs}Trèfles{}",
                    "{C:inactive}(Actuellement : {C:red}+#3#{C:inactive} Multi.)",
                }
            },
            j_rh_songbird_egg = {
                name = 'Oeuf Cui-cui',
                text = {
                    "Multi. {C:mult}+#1#{}",
                    "Eclos après avoir utilisé",
                    "#3# {C:rh_flow}Cartes Rythme",
                    "{C:inactive}(Actuellement {C:attention}#2#{C:inactive}/#3#)"
                }
            },
            j_rh_songbird_bird = {
                name = 'Cui-cui',
                text = {
                    "Multi. {X:mult,C:white}x#1#{}",
                }
            },
            j_rh_lumbearjack = {
                name = 'Ours ron-ron',
                text = {
                    "Si la {C:attention}première main{} de la manche",
                    "ne contient qu'{C:attention}une{} carte, détruisez-la,",
                    "ajoutez #1# copies permanentes",
                    "de {C:attention}la moitié{} de leur valeur",
                    "et placez-les dans la {C:attention}main",
                }
            },
            j_rh_tibby = {
                name = 'Tibby',
                text = {
                    "Si la {C:attention}première main{} de la manche",
                    "ne contient qu'{C:attention}une{} carte,",
                    "{C:enhanced}améliore-là{}, ajoute un ",
                    "{C:attention}Sceau{}, ou une {C:dark_edition}Edition{},",
                    "en fonction de ce qu'elle a",
                }
            },
            j_rh_sick_beats = {
                name = 'Virus',
                text = {
                    "Si la main jouée ne gagne pas,",
                    "retourne {C:attention}#1# cartes aléatoires{}",
                    "à la main"
                }
            },
            j_rh_flockstep = {
                name = 'Echassiers colorés',
                text = {
                    "{C:rh_flow} +#1# carte Rythme{} si la",
                    "main de poker contient une carte",
                    "{C:diamonds}Carreau{}, une carte {C:clubs}Trèfle{},",
                    "une carte {C:hearts}Cœur{} et une carte {C:spades}Pique{}",
                    "{C:inactive}(Selon la place disponible)",
                }
            },
            j_rh_two_players = {
                name = 'Deux Joueurs',
                text = {
                    "Si toutes les valeurs jouées",
                    "ont une {C:attention}paire{},",
					"équilibre les {C:chips}Jetons{} et le {C:mult}Multi{}",
                }
            },
        },
        Flow = {
            c_rh_you = {
                name = 'Vous',
                text = {
                    "Marque la carte sélectionnée avec {C:dark_edition}Vous{}",
                }
            },
            c_rh_try_again = {
                name = 'Essayez encore...',
                text = {
                    "Défausse et repioche",
                    "toute votre main"
                }
            },
            c_rh_ok = {
                name = 'OK',
                text = {
                    "Défausse et repioche",
                    "toute votre main, à l'exception",
                    "des cartes sélectionnées"
                }
            },
            c_rh_superb = {
                name = 'Super',
                text = {
                    "Améliore les cartes sélectionnées,",
                    "joue les cartes, et défausse",
                    "le reste de votre main"
                }
            },
            c_rh_perfect = {
                name = 'Parfait',
                text = {
                    "Ecrase l'effet des cartes sélectionnées,",
                    "les joue,",
                    "puis détruit toutes les cartes en main",
                    "{s:0.6,C:green}#1# chance(s) sur #2# {s:0.6,C:inactive} de supprimer l'effet,",
                    "{s:0.6,C:inactive}sinon ajoute {s:0.6,C:dark_edition}Brillant{s:0.6,C:inactive}, {s:0.6,C:dark_edition}Holographique{s:0.6,C:inactive}, ou {s:0.6,C:dark_edition}Polychrome"
                }
            },
            c_rh_simple_tap = {
                name = 'Tactile',
                text = {
                    "Pour la prochaine manche,",
                    "les améliorations, effets,",
                    "et Jokers",
                    "affectant les {C:blue}Jetons{}",
                    "vont affecter le {C:red}Multi.{} à la place"
                }
            },
            c_rh_new_record = {
                name = 'Nouveau Record',
                text = {
                    "Si vous faites un nouveau record de main",
                    "pour cette partie,",
                    "créé un {C:red}Badge Rare",
                    "{C:inactive}(Record actuel: {C:red}#1#{C:inactive})"
                }
            },
            c_rh_pity_skip = {
                name = 'Passe',
                text = {
                    "Passe les blindes non boss sans encaisser",
                    "{s:0.6,C:dark_edition}Avez vous des difficultés avec Singe moins le quart?"
                }
            },
            c_rh_some_good_parts = {
                name = 'Des Bons Passages',
                text = {
                    "Empêche la mort",
                    "si les Jetons marqués",
                    "constituent au minimum {C:attention}#1#%",
                    "des Jetons nécessaires.",
                    "{C:green}#2# chances sur #3#"
                }
            },
            c_rh_extra_life = {
                name = 'Vie Supplémentaire',
                text = {
                    "{C:blue}+#1# main#2#{}, {C:red}+#3# défausse#4#{}"
                }
            },
            c_rh_skill_star = {
                name = 'Etoile Talent',
                text = {
                    "Pour chaque {C:attention}#1#%",
                    "du score requis",
                    "dépassé, gagnez {C:money}#2# ${}",
                    "{C:inactive}({C:money}#3# ${C:inactive} au maximum)"
                }
            },
        },
        Tag = {
            tag_rh_some_good_parts = {
                name = 'Des Bons Passages',
                text = {
                    "Empêche la mort",
                    "si les Jetons marqués",
                    "constituent au minimum {C:attention}#1#%",
                    "des Jetons nécessaires.",
                    "{C:green}#2# chances sur #3#"
                }
            },
            tag_rh_you = {
                name = 'Vous',
                text = {
                    "La carte sélectionnée a été marqué avec {C:dark_edition}Vous{}",
                }
            },
            tag_rh_skill_star = {
                name = 'Etoile Talent',
                text = {
                    "Pour chaque {C:attention}#1#%",
                    "du score requis",
                    "dépassé, gagnez {C:money}#2# ${}",
                    "{C:inactive}({C:money}$#3#{C:inactive} au maximum)"
                }
            },
            tag_rh_simple_tap = {
                name = 'Tactile',
                text = {
                    "Pour la prochaine manche,",
                    "les améliorations, effets,",
                    "et Jokers",
                    "affectant les {C:blue}Jetons{}",
                    "vont affecter le {C:red}Multi.{} à la place"
                }
            },
            tag_rh_new_record = {
                name = 'Nouveau Record',
                text = {
                    "Si vous faites un nouveau record de main",
                    "pour cette partie,",
                    "créé un {C:red}Badge Rare",
                    "{C:inactive}(Record actuel: {C:red}#1#{C:inactive})"
                }
            },
            tag_rh_random = {
                name = 'Badge Paquet Aléatoire',
                text = {
                    "Octroie un",
                    "{C:attention}Paquet Aléatoire",
                }
            },
            tag_rh_mega_flow = {
                name="Badge de rythme",
                text={
                    "Octroie un",
                    "{C:rh_flow}Paquet Jumbo Rythmé",
                },
            },
        },
        Planet = {
            c_rh_hevven_world = {
                name = 'Paradis du Rythme',
                text = {
                    "Améliore {C:attention}#1#{} mains",
                    "de poker au hasard",
                    "{C:attention}#2#{} fois"
                }                
            }
        },
        Spectral = {
            c_rh_remix = {
                name = 'Remix',
                text = {
                    "Ecrase toutes les cartes en main",
                    "avec une {C:dark_edition}amélioration{}, {C:dark_edition}Sceau{} et {C:dark_edition}édition{},",
                    "puis les joue toutes"
                }
            },
            c_rh_ascension = {
                name = 'Ascension',
                text = {
                    "{C:green}#1# chance sur #2#{}",
                    "d'ajouter {C:dark_edition}Polychrome{} à un",
                    "{C:attention}Joker{} aléatoire,",
                    "sinon le détruit"
                }
            },
            c_rh_anguish = {
                name = 'Angoisse',
                text = {
                    "Le {C:attention}Joker{} le plus à droite ",
                    "devient le {C:attention}Joker{} le plus à gauche ",
                    "+#1# à la mise initiale"
                }
            },
            c_rh_endless = {
                name = 'Infini',
                text = {
                    "{C:attention}Duplique{} un Joker aléatoire,",
                    "rends les deux {C:attention}éternel",
                    "{C:inactive}(Selon la place disponible)",
                    "{C:inactive,s:0.9}(Supprime le {C:dark_edition,s:0.9}Negatif{C:inactive,s:0.9} de la copie)",
                }
            },
            c_rh_imperfection = {
                name = 'Imperfection',
                text = {
                    "Ajoute {C:dark_edition}Négatif{} à",
                    "{C:attention}#1# carte aléatoire,",
                    "et l'améliore en",
                    "{C:attention}Carte Pierre"
                }
            },
            c_rh_finale = {
                name = 'Finale',
                text = {
                    "Applique le sticker {C:dark_edition}Remix{} au",
                    "{C:attention}Joker{}, {C:attention}consommable{}",
                    "et {C:attention}carte{} le plus à gauche",
                }
            },
        },
        Tarot = {
            c_rh_castle = {
                name = 'Le Château',
                text = {
                    "Créé une carte {C:rh_flow}Rythme{} au hasard",
                    "{C:inactive}(Selon la place disponible)",
                }
            },
            c_rh_trio = {
                name = 'Le Trio',
                text = {
                    "Créé une carte de {C:tarot}Tarot{}, {C:planet}Planète{}",
                    "et {C:rh_flow}Rythme{} aléatoire",
                    "{C:inactive}(Selon la place disponible)",
                }
            },
            c_rh_performer = {
                name = "L'Artiste",
                text = {
                    "Donne un {C:attention}badge",
                    "paquet aléatoire",
                }
            },
            c_rh_translator = {
                name = 'Le Traducteur',
                text={
                    "Améliore {C:attention}#1#{} carte",
                    "sélectionnée en",
                    "{C:attention}carte Appel et Réponse",
                },
            },
            c_rh_descendant = {
                name = 'Le Descendant',
                text={
                    "Retire tout les stickers",
                    "{C:dark_edition}Remix{} à l'écran",
                },
            },
        },
        Voucher = {
            v_rh_flow_gauge = {
                name = 'Jauge de Rythme',
                text = {
                    "Les cartes {C:rh_flow}Rythme{} apparaissent",
                    "{C:attention}#1#X{} plus fréquemment",
                    "dans le magasin",
                },
            },
            v_rh_flow_master = {
                name = 'Maître du Rythme',
                text = {
                    "Les cartes {C:rh_flow}Rythme{} apparaissent",
                    "{C:attention}#1#X{} plus fréquemment",
                    "dans le magasin",
                },
            },
            v_rh_shopkeeper_deal = {
                name = "Les affaires du commerçant",
                text = {
                    "Les cartes {C:rh_flow}Rythme{} peuvent",
                    "apparaître dans n'importe quel",
                    "{C:attention}Paquet Arcana",
                },
            },
            v_rh_gatekeeper_deal = {
                name = "Les affaires du gardien",
                text = {
                    "Des {C:rh_flow}Paquets Rythme{}",
                    "peuvent apparaître",
                    "dans le magasin",
                },
            },
        },
        Enhanced = {
            m_rh_call_response = {
                name = 'Appel et Réponse',
                text = {
                    'Copie la {C:attention}Valeur{},',
                    'la {C:attention}Couleur{} et l\'{C:attention}Amélioration',
                    'de la carte',
                    'à sa gauche' 
                }
            }
        },
		Back = {
            b_rh_flow = {
                name = "Jeu de rythme",
                text = {
                    "{C:attention}#1#{} emplacement de consommable",
                    "Après avoir battu une {C:attention}Blinde{},",
                    "obtenez une carte {C:rh_flow}Rythme{}",
                    "{s:0.8}La carte {s:0.8,C:rh_flow}Rythme{s:0.8} reçu dépends",
                    "{s:0.8}de votre {s:0.8,C:attention}réussite",
                },
            }
        },
        Sleeve = {
            sleeve_rh_flow = { 
                name = "Pochette de rythme",
                text = {
                    "{C:attention}#1#{} emplacement de consommable",
                    "Après avoir battu une {C:attention}Blinde{},",
                    "obtenez une carte {C:rh_flow}Rythme{}",
                    "{s:0.8}La carte {s:0.8,C:rh_flow}Rythme{s:0.8} reçu dépends",
                    "{s:0.8}de votre {s:0.8,C:attention}réussite",
                },
            },
            sleeve_rh_flow_alt = { 
                name = "Pochette de rhythme",
                text = { 
                    "Retournez à {C:attention}#1#{} emplacements de consommable",
                    "La carte {C:rh_flow}rythme{} générée est {C:dark_edition}Négative",
                }
            }
        },
        Other = {
            rh_you_sticker = {
                name = 'Vous',
                text = {
                    "Cette carte sera",
                    "toujours {C:attention}sélectionnée{} et {C:attention}jouée{}",
                    "à {C:attention}chaque{} main",
                    "{C:inactive,s:0.9}(Cet {C:attention,s:0.9}Autocollant{C:inactive,s:0.9} est retiré",
                    "{C:inactive,s:0.9}à la fin de la manche)"
                },
            },
            rh_remix_sticker_joker = {
                name = 'Remix',
                text = {
                    "A la fin de la manche,",
                    "transforme en un autre {C:attention}#1#{}",
                    "#2# {C:attention}#3#",
                },
            },
            rh_remix_sticker_card = {
                name = 'Remix',
                text = {
                    "Quand piochée, transforme",
                    "en une autre {C:attention}carte à jouer",
                    "{C:inactive}(Randomise le {C:attention}Rang{C:inactive}, la {C:attention}Couleur {C:inactive}et {C:attention}l'Amélioration{C:inactive})",
                },
            },
            p_rh_flow_pack_1 = {
                name = "Paquet Rythmé",
                text = {
                    "Choisissez {C:attention}#1#{} parmi",
                    "{C:attention}#2# cartes {C:rh_flow}Rythme{}",
                },
            },
            p_rh_flow_pack_2 = {
                name = "Paquet Rythmé",
                text = {
                    "Choisissez {C:attention}#1#{} parmi",
                    "{C:attention}#2# cartes {C:rh_flow}Rythme{}",
                },
            },
            p_rh_flow_jumbo = {
                name = "Paquet Jumbo Rythmé",
                text = {
                    "Choisissez {C:attention}#1#{} parmi",
                    "{C:attention}#2# cartes {C:rh_flow}Rythme{}",
                },
            },
            p_rh_flow_mega = {
                name = "Paquet Méga-Rythmé",
                text = {
                    "Choisissez {C:attention}#1#{} parmi",
                    "{C:attention}#2# cartes {C:rh_flow}Rythme{}",
                },
            },
            p_rh_legendary = {
                name = "Paquet Bouffon Légendaire",
                text = {
                    "Choisissez {C:attention}#1#{} parmi",
                    "{C:attention}#2# cartes {C:joker}Joker Légendaire{}",
                },
            },
            active_flow = {
                name="Carte Rythme (Active)",
                text={
                    "Seulement {C:attention}1{} peut être",
                    "activée par manche",
                },
            }
        }
    },
    misc = {
        dictionary = {
            rh_skip_save = "Passé par ",
            rh_skip_cash_out = "Manche passée!",
            rh_good_parts_save = "Il y a des bons passages...",
            rh_good_parts_cash_out = "Manche passée!",
            rh_pity_skip_host_barista = "le patron", 
            rh_pity_skip_host_rupert = "Naja",
            rh_even = "paire", 
            rh_odd = "impaire", 
            k_rh_flow_pack = "Paquet Rythmé",
            k_rh_legendary = "Paquet Bouffon",
            k_flow = "Rythme",
            b_flow_cards = "Cartes Rythme",
            rh_language = "Langue",
            rh_language_desc = {
                "Langue dans laquelle",
                "les sons seront joués",
                "Note: Si le son n'a pas été",
                "doublé dans cette langue,",
                "il sera par défaut en Anglais."
            },
            rh_language_options = {
                "Anglais",
                "Japonais",
                "Français (incomplet)",
                "Espagnol (incomplet)"
            },
            rh_beat_anim = "Animation de rythme",
            rh_beat_anim_desc = {
                "Active l'animation de rythme",
                "pour la carte sur le menu principal",
                "(Requiert un redémarrage)"
            },
            rh_remix_sticker_consumeable_name = "consommable",
            rh_remix_sticker_consumeable_link = "du même",
            rh_remix_sticker_consumeable_type = "type",
            rh_remix_sticker_joker_name = "Joker",
            rh_remix_sticker_joker_link = "de la même",
            rh_remix_sticker_joker_type = "rareté",
            rh_lumbearjack_axed = "Haché!",
            k_rh_endless = "Remix Infini",
            k_rh_tibby = "Allez les potos!",
            k_rh_virus_miss = "Raté!",
            k_rh_wii_badge="Beat the Beat",
        },
        v_dictionary = {
            a_mmoonk = {"+#1# Jetons,+#2# Mult,X#3# Mult"},
            k_rh_plus_flow = {"+#1# Rythme"}
        },
        v_text={
            ch_c_all_rental={
                "Tout les Jokers sont {C:eternal}Location",
            },
            ch_c_no_skip={
                "Vous ne pouvez pas {C:attention}passer la Blinde",
            },
            ch_c_all_boss={
                "Toutes les blindes sont des {C:attention}Blindes Boss{}",
            },
            ch_c_all_water={
                "Toutes les Blindes Boss deviennent {C:dark_negative}L'eau{}",
            },
        },
		challenge_names = {
			c_rh_second_contact = "Interprète terrien-martien",
			c_rh_saffron_trial = "L'épreuve d'Adagio",
			c_rh_remix_medley = "Remix des remix",
			c_rh_remix_10 = "Remix 10",
			c_rh_perfect_campaign = "Visez le parfait !",
		},
        labels = {
            rh_you_sticker = 'VOUS',
            rh_remix_sticker_joker = "Remix",
            rh_remix_sticker_card = "Remix"
        }
    }
}