LOVELY_INTEGRITY = 'd9460056a70d26c555b1b09cb35e313925ed8c778ca52ac89f4660e10f71f727'

function win_game()
    if (not G.GAME.seeded and not G.GAME.challenge) or SMODS.config.seeded_unlocks then
        set_joker_win()
        set_deck_win()
        set_skill_win()
        
        check_and_set_high_score('win_streak', G.PROFILES[G.SETTINGS.profile].high_scores.current_streak.amt+1)
        check_and_set_high_score('current_streak', G.PROFILES[G.SETTINGS.profile].high_scores.current_streak.amt+1)
        check_for_unlock({type = 'win_no_hand'})
        check_for_unlock({type = 'win_no'})
        check_for_unlock({type = 'win_custom'})
        check_for_unlock({type = 'win_deck'})
        check_for_unlock({type = 'win_stake'})
        check_for_unlock({type = 'win'})
        inc_career_stat('c_wins', 1)
    end

    set_profile_progress()

    if G.GAME.challenge then
        G.PROFILES[G.SETTINGS.profile].challenge_progress.completed[G.GAME.challenge] = true
        set_challenge_unlock()
        check_for_unlock({type = 'win_challenge'})
        G:save_settings()
    end

    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = (function()
            for k, v in pairs(G.I.CARD) do
                v.sticker_run = nil
            end
            
            play_sound('win')
            G.SETTINGS.paused = true

            G.FUNCS.overlay_menu{
                definition = create_UIBox_win(),
                config = {no_esc = true}
            }
            local Jimbo = nil

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 2.5,
                blocking = false,
                func = (function()
                    if G.OVERLAY_MENU and G.OVERLAY_MENU:get_UIE_by_ID('jimbo_spot') then 
                        local quip, extra = SMODS.quip("win")
                        extra.x = 0
                        extra.y = 5
                        Jimbo = Card_Character(extra)
                        local spot = G.OVERLAY_MENU:get_UIE_by_ID('jimbo_spot')
                        spot.config.object:remove()
                        spot.config.object = Jimbo
                        Jimbo.ui_object_updated = true
                        Jimbo:add_speech_bubble(quip, nil, {quip = true}, extra)
                        Jimbo:say_stuff((extra and extra.times) or 5, false, quip)
                        if G.F_JAN_CTA then 
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    Jimbo:add_button(localize('b_wishlist'), 'wishlist_steam', G.C.DARK_EDITION, nil, true, 1.6)
                                    return true
                                end}))
                        end
                        end
                    return true
                end)
            }))
            
            return true
        end)
    }))

    if (not G.GAME.seeded and not G.GAME.challenge) or SMODS.config.seeded_unlocks then
        G.PROFILES[G.SETTINGS.profile].stake = math.max(G.PROFILES[G.SETTINGS.profile].stake or 1, (G.GAME.stake or 1)+1)
    end
    G:save_progress()
    G.FILE_HANDLER.force = true
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = (function()
            if not G.SETTINGS.paused then
                G.GAME.current_round.round_text = 'Endless Round '
                return true
            end
        end)
    }))
end

function end_round()
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        AKYRS.end_round_event()
        G.GAME.blind.in_blind = false
        local game_over = true
        local game_won = false
        G.RESET_BLIND_STATES = true
        local delete_these = {}
        for i = 1, #G.playing_cards do
            if G.playing_cards[i].ability.fleeting then
                table.insert(delete_these, G.playing_cards[i])
            end
        end
        for i = 1, #delete_these do
            delete_these[i]:remove()
        end
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] and G.jokers.cards[i].ability and G.jokers.cards[i].ability.hit_rival then
                SMODS.destroy_cards(G.jokers.cards[i], true, nil, true)
            end
        end
        local pool = {}
        for i = 1, #G.consumeables.cards do
            table.insert(pool, G.consumeables.cards[i])
        end
        for i = 1, #pool do
            if pool[i].config.card and hit_minor_arcana_suits[pool[i].config.card.suit] then
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = function()
                    draw_card(G.consumeables,G.deck, 90,'down', nil, pool[i])
                    return true
                end
            }))
            end
        end
        G.RESET_JIGGLES = true
        G.GAME.blind_attack = nil
        local skill_saved = false
        for i, j in pairs(G.GAME.skills) do
            local saved = calculate_skill(i, {end_of_round = true, game_over = game_over})
            if saved then
                skill_saved = true
            end
        end
        if game_over and skill_saved then
            game_over = false
        end
        if (G.GAME.special_levels) and (G.GAME.special_levels["money"] > 0) and (to_big and to_big(G.GAME.dollars) or (G.GAME.dollars)) < (to_big and to_big(G.GAME.grim_boss_dollars) or (G.GAME.grim_boss_dollars)) then
            ease_dollars(math.ceil(0.1 * G.GAME.special_levels["money"] * (G.GAME.grim_boss_dollars - G.GAME.dollars)))
        end
        if (G.GAME.blind_on_deck == "Boss") and G.GAME.special_levels and (G.GAME.special_levels["overshoot"] > 0) then
            local big_func = to_big or (function(x) return x end)
            if big_func(math.abs((G.GAME.blind.chips - G.GAME.chips) / G.GAME.blind.chips)) <= big_func(.015 * G.GAME.special_levels["overshoot"]) then
                add_tag(Tag("tag_negative"))
            end
        end
        if (G.GAME.special_levels) and (G.GAME.special_levels["boss"] > 0) and (G.GAME.blind_on_deck == "Boss") and G.GAME.blind and G.GAME.blind.config.blind.boss.showdown then
            local glass = {}
            local pool = {}
            for i = 1, #G.playing_cards do
                if not G.playing_cards[i].ability.name ~= 'Glass Card' then
                    table.insert(pool, G.playing_cards[i])
                end
            end
            if #pool > G.GAME.special_levels["boss"] then
                for i = 1, G.GAME.special_levels["boss"] do
                    local card, index = pseudorandom_element(pool, pseudoseed('deimos'))
                    table.insert(glass, card)
                    table.remove(pool, index)
                end
            else
                glass = pool
            end
            for i, j in ipairs(glass) do
                j:set_ability(G.P_CENTERS["m_glass"])
            end
        end
        if skill_active("sk_grm_cl_explorer") and (G.GAME.blind_on_deck == "Boss") then
            add_tag(Tag("tag_grm_grid"))
        end
        if (G.GAME.blind_on_deck == "Boss") and (G.GAME.special_levels) and (G.GAME.special_levels["grind"] > 0) then
            for i = 1, G.GAME.special_levels["grind"] do
                local rng = pseudorandom('grind')
                local reward = ""
                if rng > 0.66 then
                    reward = SMODS.create_card {set = "Lunar", no_edition = true}
                elseif rng > 0.33 then
                    reward = SMODS.create_card {set = "Stellar", no_edition = true}
                else
                    reward = SMODS.create_card {set = "Planet", no_edition = true}
                end
                reward:set_edition('e_negative')
                reward:add_to_deck()
                reward.ability.no_sell_value = true
                reward:set_cost()
                G.consumeables:emplace(reward)
            end
        end
        if skill_active("sk_cry_sticky_4") then
            for j, k in ipairs({G.jokers, G.consumeables, G.hand, G.deck, G.discard}) do
                local dupe_these = {}
                for i = 1, #k.cards do
                    if k.cards[i].ability.banana and (pseudorandom('sticky') < G.GAME.probabilities.normal/8) then
                        table.insert(dupe_these, k.cards[i])
                    end
                end
                for i = 1, math.min(((((k == G.jokers) or (k == G.consumeables)) and k.config.card_limit) or 1e15) - #k.cards, #dupe_these) do
                    card_eval_status_text(dupe_these[i], 'extra', nil, nil, nil, {message = localize('k_duplicated_ex')})
                    local card = copy_card(dupe_these[i], nil, nil, nil, dupe_these[i].edition and dupe_these[i].edition.negative)
                    card:add_to_deck()
                    if k.cards[i].playing_card then
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        table.insert(G.playing_cards, card)
                    end
                    k:emplace(card)
                end
            end
        end
        if (G.GAME.blind_on_deck == "Boss") and skill_active("sk_mf_painted_2") then
            local pool = {}
            for i = 1, #G.consumeables.cards do
                if G.consumeables.cards[i].ability and (G.consumeables.cards[i].ability.set == "Colour") then
                    table.insert(pool, G.consumeables.cards[i])
                end
            end
            if #pool > 0 then
                local card = pseudorandom_element(pool, pseudoseed('painted'))
                card.ability.val = card.ability.val + 1
                G.E_MANAGER:add_event(Event({
                func = function() 
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.SECONDARY_SET.ColourCard,
                    card = card
                    }) 
                    return true
                end}))
            end
        end
        if skill_active("sk_ortalab_starry_1") then
            if G.zodiacs then
                for i, j in pairs(G.zodiacs) do
                    if j.ability.grm_unactivated then
                        j.config.extra.temp_level = j.config.extra.temp_level + 1
                        G.E_MANAGER:add_event(Event({
                            delay = 0.4,
                            trigger = 'after',
                            func = (function()
                                attention_text({
                                    text = '+1',
                                    colour = G.C.WHITE,
                                    scale = 1, 
                                    hold = 1/G.SETTINGS.GAMESPEED,
                                    cover = j.HUD_zodiac,
                                    cover_colour = G.ARGS.LOC_COLOURS.Zodiac,
                                    align = 'cm',
                                    })
                                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                                play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                                return true
                            end)
                        }))
                    end
                end
            end
        end
        game_over = rh_flow_good_parts_save()
        if G.GAME.current_round.rh_flow_pity_skip then
            game_over = false
        end
            if G.GAME.chips - G.GAME.blind.chips >= 0 then
                game_over = false
            end
                if G.GAME.current_round.advanced_blind then
                    if G.GAME.aiko_puzzle_win then
                        game_over = false
                    else
                        game_over = true
                    end
                elseif G.GAME.akyrs_mathematics_enabled and G.GAME.akyrs_character_stickers_enabled then
                    if G.GAME.blind and AKYRS.is_value_within_threshold(G.GAME.blind.chips,G.GAME.chips,G.GAME.akyrs_math_threshold) then
                        game_over = false
                    else
                        game_over = true
                    end
                end
            -- context.end_of_round calculations
            SMODS.saved = false
            G.GAME.saved_text = nil
            SMODS.calculate_context({end_of_round = true, game_over = game_over, beat_boss = G.GAME.blind.boss })
            AKYRS.copper_eval_calculation = true
            SMODS.calculate_context({akyrs_copper_end_of_round = true, game_over = game_over, beat_boss = G.GAME.blind.boss })
            AKYRS.simple_event_add(function() AKYRS.copper_eval_calculation = nil return true end, 0)
            if SMODS.saved then game_over = false end
            -- TARGET: main end_of_round evaluation
            G.GAME.prism_cards_played = 0
            G.GAME.prism_extra_draw = 0
            for k,v in pairs(G.playing_cards or {}) do
            	if v.ability.greened then v.ability.greened = nil end
            end
            for _, value in pairs(G.playing_cards or {}) do
                if value.config.center == G.P_CENTERS.m_sarc_strawberry then
                    if value.ability.extra and value.ability.extra.played == false then
                       
                        value.ability.extra.active = true
                        value.children.center:set_sprite_pos({x = 0, y = 0})
                    end
                    if value.ability.extra then value.ability.extra.played = false end
                end
            end
            if G.GAME.round_resets.ante == G.GAME.win_ante and G.GAME.blind:get_type() == 'Boss' and not G.GAME.superboss_active then
              game_won = true
              G.GAME.won = true
            end
            if G.GAME.round_resets.ante == G.GAME.win_ante and (
              G.GAME.blind.debuff.superboss or G.GAME.blind.debuff.akyrs_blind_difficulty == "expert"
            ) and G.GAME.superboss_active then
              game_won = true
              G.GAME.won = true
            
              G.GAME.superboss_active = false
              G.GAME.modifiers.scaling = math.max((G.GAME.modifiers.scaling - G.GAME.modifiers.bonus_scaling), 1)
              G.GAME.modifiers.bonus_scaling = 0
            
              G.GAME.round_resets.blind_choices.Small = "bl_small"
              G.GAME.round_resets.blind_choices.Big = "bl_big"
            end
            if (G.GAME.ccc_golden_progress and G.GAME.ccc_golden_progress > 1) then
            	game_won = false
            	G.GAME.won = false
            end
            if game_over then
                G.STATE = G.STATES.GAME_OVER
                if not G.GAME.won and not G.GAME.seeded and not G.GAME.challenge then 
                    G.PROFILES[G.SETTINGS.profile].high_scores.current_streak.amt = 0
                end
                G:save_settings()
                G.FILE_HANDLER.force = true
                G.STATE_COMPLETE = false
            else
                G.GAME.unused_discards = (G.GAME.unused_discards or 0) + G.GAME.current_round.discards_left
                        G.GAME.word_todo = nil
                if G.GAME.blind and G.GAME.blind.config.blind then 
                    discover_card(G.GAME.blind.config.blind)
                end

                if G.GAME.blind_on_deck == 'Boss' then
                    local _handname, _played, _order = 'High Card', -1, 100
                    for k, v in pairs(G.GAME.hands) do
                        if v.played > _played or (v.played == _played and _order > v.order) then 
                            _played = v.played
                            _handname = k
                        end
                    end
                    G.GAME.current_round.most_played_poker_hand = _handname
                end

                if G.GAME.blind:get_type() == 'Boss' and not G.GAME.seeded and not G.GAME.challenge  then
                    G.GAME.current_boss_streak = G.GAME.current_boss_streak + 1
                    check_and_set_high_score('boss_streak', G.GAME.current_boss_streak)
                end
                
                if G.GAME.current_round.hands_played == 1 then 
                    inc_career_stat('c_single_hand_round_streak', 1)
                else
                    if not G.GAME.seeded and not G.GAME.challenge  then
                        G.PROFILES[G.SETTINGS.profile].career_stats.c_single_hand_round_streak = 0
                        G:save_settings()
                    end
                end

                check_for_unlock({type = 'round_win'})
                set_joker_usage()
                if game_won and not G.GAME.win_notified then
                    G.GAME.win_notified = true
                    G.E_MANAGER:add_event(Event({
                        trigger = 'immediate',
                        blocking = false,
                        blockable = false,
                        func = (function()
                            if G.STATE == G.STATES.ROUND_EVAL then 
                                win_game()
                                G.GAME.won = true
                                return true
                            end
                        end)
                    }))
                end
                for _,v in ipairs(SMODS.get_card_areas('playing_cards', 'end_of_round')) do
                    SMODS.calculate_end_of_round_effects({ cardarea = v, end_of_round = true, beat_boss = G.GAME.blind.boss })
                end



                local destroyed_cards = {}
                for _, c in ipairs(G.hand.cards) do
                  if BPlus.u.getting_destroyed(c) then
                    destroyed_cards[#destroyed_cards + 1] = c
                  end
                end
                if next(destroyed_cards) then
                  for i = 1, #G.jokers.cards do
                    G.jokers.cards[i]:calculate_joker({remove_playing_cards = true, removed = destroyed_cards})
                  end
                end
                
                for i = #G.hand.cards,1,-1 do
                    if G.hand.cards[i].ability and G.hand.cards[i].ability.decayed then
                        G.hand.cards[i]:start_dissolve()
                    end
                end
                G.FUNCS.draw_from_hand_to_discard()
                if not (G.GAME.ccc_golden_progress and G.GAME.ccc_golden_progress > 1) then
                if 
                  (not G.GAME.superboss_active and G.GAME.blind:get_type() == 'Boss') or
                  (G.GAME.superboss_active and (G.GAME.blind.debuff.superboss or G.GAME.blind.debuff.akyrs_blind_difficulty == "expert"))
                then
                    G.FUNCS.cere_draw_from_burnt_to_discard()
                    G.GAME.voucher_restock = nil
                    for k, v in pairs(G.GAME.hands) do
                        v.played_this_ante = 0
                    end
                    if G.GAME.modifiers.set_eternal_ante and (G.GAME.round_resets.ante == G.GAME.modifiers.set_eternal_ante) then 
                        for k, v in ipairs(G.jokers.cards) do
                            v:set_eternal(true)
                        end
                    end
                    if G.GAME.modifiers.set_joker_slots_ante and (G.GAME.round_resets.ante == G.GAME.modifiers.set_joker_slots_ante) then 
                        G.jokers.config.card_limit = 0
                    end
                    delay(0.4); SMODS.ante_end = true; ease_ante(1); SMODS.ante_end = nil; delay(0.4); check_for_unlock({type = 'ante_up', ante = G.GAME.round_resets.ante + 1})
                end
                G.FUNCS.draw_from_discard_to_deck()
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.3,
                    func = function()
                        G.STATE = G.STATES.ROUND_EVAL
                        G.STATE_COMPLETE = false

                        if G.GAME.akyrs_default_blind_handler then
                        if G.GAME.blind_on_deck == 'Small' then
                            G.GAME.round_resets.blind_states.Small = 'Defeated'
                        elseif G.GAME.blind_on_deck == 'Dungeon' then
                            
                        elseif G.GAME.round_resets.blind == G.P_BLINDS.bl_mf_bigger_blind then 
                          G.GAME.round_resets.blind_states.Small = 'Defeated'
                        elseif G.GAME.blind_on_deck == 'Dungeon' then
                            
                        elseif G.GAME.superboss_active and 
                          (G.GAME.blind:get_type() == 'Boss' and not G.GAME.blind.debuff.superboss and G.GAME.blind.debuff.akyrs_blind_difficulty ~= "expert") then
                            G.GAME.round_resets.blind_states.Big = 'Defeated'
                        elseif G.GAME.blind_on_deck == 'Additional' then
                            additional_present(G.GAME.blind.config.prize)
                        elseif G.GAME.blind_on_deck == 'Big' then
                            G.GAME.round_resets.blind_states.Big = 'Defeated'
                        elseif G.GAME.blind_on_deck == 'Additional' then
                            additional_present(G.GAME.blind.config.prize)
                        else
                            G.GAME.current_round.Bakery_charm = Bakery_API.get_next_charms()
                            G.GAME.current_round.voucher = SMODS.get_next_vouchers()
                            G.GAME.round_resets.blind_states.Boss = 'Defeated'
                            G.GAME.paperback.ranks_scored_this_ante = {}
                            for k, v in ipairs(G.playing_cards) do
                                v.ability.played_this_ante = nil
                            end
                        end

                        else
                            AKYRS.blind_handler()
                        end
                        if G.GAME.round_resets.temp_handsize then G.hand:change_size(-G.GAME.round_resets.temp_handsize); G.GAME.round_resets.temp_handsize = nil end
                        if G.GAME.round_resets.temp_discards then G.GAME.round_resets.discards = G.GAME.round_resets.discards - G.GAME.round_resets.temp_discards; G.GAME.round_resets.temp_discards = nil end
                        if G.GAME.round_resets.temp_hands then G.GAME.round_resets.hands = G.GAME.round_resets.hands - G.GAME.round_resets.temp_hands; G.GAME.round_resets.temp_hands = nil end
                        if G.GAME.round_resets.temp_reroll_cost then G.GAME.round_resets.temp_reroll_cost = nil; calculate_reroll_cost(true) end

                        reset_idol_card()
                        reset_tuxedo_card()
                        reset_farmer_card()
                        reset_fish_rank()
                        reset_mail_rank()
                        reset_ancient_card()
                        reset_castle_card()                        
                        for _, mod in ipairs(SMODS.mod_list) do
                        	if mod.reset_game_globals and type(mod.reset_game_globals) == 'function' then
                        		mod.reset_game_globals(false)
                        	end
                        end
                        for k, v in ipairs(G.playing_cards) do
                            v.ability.discarded = nil
                            if v.ability.revert_base then
                                if v.ability.revert_base[2] > 1 then
                                    v.ability.revert_base[2] = v.ability.revert_base[2] - 1
                                else
                                    v:set_base(v.ability.revert_base[1])
                                    G.GAME.blind:debuff_card(v)
                                    v.ability.revert_base = nil
                                end
                            end
                            v.ability.hit_hermit_indicator = nil
                            v.ability.hit_moon_indicator = nil
                            v.ability['4_W_uses'] = nil
                            G.GAME.suits_drawn = nil
                            v.ability.hit_has_original_suit = nil
                            if v.debuff then
                                v.ability.temp_debuff = nil
                                v:set_debuff()
                            end
                            if v.debuff then
                                v.ability.temp_debuff = nil
                                v:set_debuff()
                            end
                            v.ability.forced_selection = nil
                        end
                    return true
                    end
                }))
            else
            	G.FUNCS.draw_from_discard_to_deck()
            	delay(0.8)
            	local function _reset()
            		G.GAME.chips = 0
            		if G.GAME.modifiers["blind_attack"] then
            		    G.GAME.blind_attack = random_attack()
            		end
            		if G.zodiacs then
            		    for _, zodiac in pairs(G.zodiacs) do
            		        zodiac.ability.grm_unactivated = true
            		    end
            		end
            		if not G.GAME.modifiers["no_hand_discard_reset"] then
            		if not G.GAME.modifiers["ante_hand_discard_reset"] then
            		G.GAME.current_round.discards_left = math.max(0, G.GAME.round_resets.discards + G.GAME.round_bonus.discards)
            		G.GAME.current_round.hands_left = (math.max(1, G.GAME.round_resets.hands + G.GAME.round_bonus.next_hands))
            		if used_voucher and used_voucher('garbage_bag') then
            		    G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + (G.GAME.betmma_discards_left_ref or 0)
            		end
            		if used_voucher and used_voucher('handbag') then
            		    G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + (G.GAME.betmma_hands_left_ref or 0)
            		end
            		end
            		end
            		G.GAME.current_round.hands_played = 0
            		G.GAME.current_round.discards_used = 0
            		for k, v in pairs(G.GAME.hands) do 
            			v.played_this_round = 0
            		end
            		G.GAME.ccc_golden_progress = G.GAME.ccc_golden_progress - 1
            		G.GAME.blind:set_text()
            		if (G.GAME.modifiers.ccc_bside and G.GAME.modifiers.ccc_bside >= 1) then
            			G.GAME.ccc_bonus_blind:set_text()
            		end
            	end
            	G.E_MANAGER:add_event(Event({
            		trigger = 'immediate',
            		func = function()
            			for i, v in ipairs({'blind', 'ccc_bonus_blind'}) do
            				if G.GAME[v].name == 'ccc_Golden Crown' then
            					SMODS.juice_up_blind(v)
            				end
            			end
            			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
            				play_sound('tarot2', 0.76, 0.4);_reset();return true end}))
            			play_sound('tarot2', 1, 0.4)
            			return true
            		end
            	}))
            	delay(0.8)
            
            	-- literally just copypasted an entire set_blind chunk (i can't run the rest of it)
            	if (G.GAME.modifiers.ccc_bside and G.GAME.modifiers.ccc_bside >= 1) then
            		for i, v in ipairs({'blind', 'ccc_bonus_blind'}) do
            			local self = G.GAME[v]
            			local obj = self.config.blind
            			self.disabled = false
            			if self.name == 'The Eye' and not reset then
            				obj = G.P_BLINDS['bl_small']	-- nuke obj to avoid smods ownership
            				self.hands = {}
            				for _, v in ipairs(G.handlist) do
            					self.hands[v] = false
            				end
            			end
            			if not self.name == 'ccc_Golden Crown' and obj.set_blind and type(obj.set_blind) == 'function' then
            				obj:set_blind()
            			elseif self.name == 'The Mouth' and not reset then
            				self.only_hand = false
            			elseif self.name == 'The Fish' and not reset then 
            				self.prepped = nil
            			elseif self.name == 'The Water' and not reset then 
            				self.discards_sub = G.GAME.current_round.discards_left
            				ease_discard(-self.discards_sub)
            			elseif self.name == 'The Needle' and not reset then 
            				self.hands_sub = G.GAME.round_resets.hands - 1
            				ease_hands_played(-self.hands_sub)
            			elseif self.name == 'The Manacle' and not reset then
            				G.hand:change_size(-1)
            			elseif self.name == 'Amber Acorn' and not reset and #G.jokers.cards > 0 then
            				G.jokers:unhighlight_all()
            				for k, v in ipairs(G.jokers.cards) do
            					if v.facing == 'front' then
            						v:flip()
            					end
            				end
            				if #G.jokers.cards > 1 then 
            					G.E_MANAGER:add_event(Event({ trigger = 'after', delay = 0.2, func = function() 
            						G.E_MANAGER:add_event(Event({ func = function() G.jokers:shuffle('aajk'); play_sound('cardSlide1', 0.85);return true end })) 
            						delay(0.15)
            						G.E_MANAGER:add_event(Event({ func = function() G.jokers:shuffle('aajk'); play_sound('cardSlide1', 1.15);return true end })) 
            						delay(0.15)
            						G.E_MANAGER:add_event(Event({ func = function() G.jokers:shuffle('aajk'); play_sound('cardSlide1', 1);return true end })) 
            						delay(0.5)
            					return true end })) 
            				end
            			end
            		end
            		for _, v in ipairs(G.playing_cards) do
            			G.GAME.blind:debuff_card(v)
            		end
            		for _, v in ipairs(G.jokers.cards) do
            			if not reset then G.GAME.blind:debuff_card(v, true) end
            		end
            	end
            
            	G.GAME.blind:alert_debuff(true)
            	if (G.GAME.modifiers.ccc_bside and G.GAME.modifiers.ccc_bside >= 1) then
            		G.GAME.ccc_bonus_blind:alert_debuff(true)
            	end
            	
            	-- TARGET: setting_blind effects
            	Bakery_API.on_set_blind(G.GAME.blind)
            	delay(0.4)
	local destroyed_jokers = {}
	for _, card in ipairs(G.jokers.cards) do
	  if BPlus.u.getting_destroyed(card) then
	    destroyed_jokers[#destroyed_jokers + 1] = card
	  end
	end
	
	if next(destroyed_jokers) then
	  SMODS.calculate_context { bplus_joker_destroyed = true, destroyed_cards = destroyed_jokers }
	end
	
            	G.E_MANAGER:add_event(Event({
            		trigger = 'immediate',
            		func = function()
            			G.STATE = G.STATES.DRAW_TO_HAND
            			G.deck:shuffle('nr'..G.GAME.round_resets.ante)
            			local cards = {}
            			for i=1, #G.deck.cards - 1 do
            			    while i <= #G.deck.cards and G.deck.cards[i].seal == "prism_green_old" do
            			        table.insert(cards, G.deck.cards[i])
            			        table.remove(G.deck.cards,i)
            			    end
            			end
            			for _, card in pairs(cards) do
            			    local pos = (pseudorandom('green') < 0.5 and #G.deck.cards) or pseudorandom('green_pos', 1, #G.deck.cards + 1)
            			    table.insert(G.deck.cards,pos,card)
            			end
            			for i = 1, #G.deck.cards do
            			    if G.deck.cards[i].ability and G.deck.cards[i].ability.shuffle_bottom then
            			        G.deck.cards[i].ability.hit_hermit_indicator = G.deck.cards[i].ability.shuffle_bottom
            			        G.deck.cards[i].ability.shuffle_bottom = G.deck.cards[i].ability.shuffle_bottom - 1
            			        if G.deck.cards[i].ability.shuffle_bottom == 0 then
            			            G.deck.cards[i].ability.shuffle_bottom = nil
            			        end
            			        local card = G.deck.cards[i]
            			        table.remove(G.deck.cards, i)
            			        table.insert(G.deck.cards, 1, card)
            			    end
            			    G.deck:set_ranks()
            			end
            			for i = #G.deck.cards, 1, -1 do
            			    if G.deck.cards[i].ability and G.deck.cards[i].ability.shuffle_top then
            			        G.deck.cards[i].ability.hit_moon_indicator = G.deck.cards[i].ability.shuffle_top
            			        G.deck.cards[i].ability.shuffle_top = G.deck.cards[i].ability.shuffle_top - 1
            			        if G.deck.cards[i].ability.shuffle_top == 0 then
            			            G.deck.cards[i].ability.shuffle_top = nil
            			        end
            			        local card = G.deck.cards[i]
            			        table.remove(G.deck.cards, i)
            			        table.insert(G.deck.cards, card)
            			    end
            			    G.deck:set_ranks()
            			end
            			G.deck:hard_set_T()
            			G.STATE_COMPLETE = false
            			return true
            		end
            	}))
            end
            end
        return true
      end
    }))
  end
  
function new_round()
G.GAME.mf_tree_three = false
    G.RESET_JIGGLES = nil
    delay(0.4)
    G.E_MANAGER:add_event(Event({
      trigger = 'immediate',
      func = function()
            if G.GAME.modifiers["blind_attack"] then
                G.GAME.blind_attack = random_attack()
            end
            if G.zodiacs then
                for _, zodiac in pairs(G.zodiacs) do
                    zodiac.ability.grm_unactivated = true
                end
            end
            if not G.GAME.modifiers["no_hand_discard_reset"] then
            if not G.GAME.modifiers["ante_hand_discard_reset"] then
            G.GAME.current_round.discards_left = math.max(0, G.GAME.round_resets.discards + G.GAME.round_bonus.discards)
            G.GAME.current_round.hands_left = (math.max(1, G.GAME.round_resets.hands + G.GAME.round_bonus.next_hands))
            if used_voucher and used_voucher('garbage_bag') then
                G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + (G.GAME.betmma_discards_left_ref or 0)
            end
            if used_voucher and used_voucher('handbag') then
                G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + (G.GAME.betmma_hands_left_ref or 0)
            end
            end
            end
            G.GAME.current_round.hands_played = 0
            G.GAME.current_round.discards_used = 0
            G.GAME.current_round.any_hand_drawn = nil
            G.GAME.current_round.reroll_cost_increase = 0
            G.GAME.current_round.used_packs = {}

            for k, v in pairs(G.GAME.hands) do 
                v.played_this_round = 0
            end

            for k, v in pairs(G.playing_cards) do
                v.ability.wheel_flipped = nil
            end

            G.GAME.current_round.free_rerolls = G.GAME.round_resets.free_rerolls
            calculate_reroll_cost(true)

            G.GAME.round_bonus.next_hands = 0
            G.GAME.round_bonus.discards = 0
            G.GAME.grim_boss_dollars = G.GAME.dollars

            local blhash = ''
            if G.GAME.blind_on_deck == 'Small' then
                G.GAME.round_resets.blind_states.Small = 'Current'
                G.GAME.current_boss_streak = 0
                blhash = 'S'
            elseif G.GAME.blind_on_deck == 'Big' then
                G.GAME.round_resets.blind_states.Big = 'Current'
                G.GAME.current_boss_streak = 0
                blhash = 'B'
            elseif G.GAME.blind_on_deck == "akyrs_Solo" then
                G.GAME.round_resets.blind_states.akyrs_Solo = 'Current'
                --G.GAME.current_boss_streak = 0
                blhash = 'akyrs_Solo'
            else
                G.GAME.round_resets.blind_states.Boss = 'Current'
                blhash = 'L'
            end
            G.GAME.subhash = (G.GAME.round_resets.ante)..(blhash)

            if G.GAME.round_resets.ccc_bonus_blind then
            	G.GAME.ccc_bonus_blind:set_blind(G.GAME.round_resets.ccc_bonus_blind)
            end
            G.GAME.blind:set_blind(G.GAME.round_resets.blind)
            G.E_MANAGER:add_event(Event({trigger = 'immediate',func = function()
                if G.GAME.nullified_blinds[G.GAME.blind.config.blind.key] then G.GAME.blind:disable() end
                return true
            end}))
            for i2, j2 in pairs(G.GAME.skills) do
                calculate_skill(i2, {selecting_blind = true})
            end
            G.GAME.current_round.rh_flow_pity_skip = false
            G.GAME.current_round.rh_flow_simple_tap = false
            G.GAME.current_round.rh_flow_good_parts = false
            G.GAME.current_round.rh_flow_good_parts_saved = false
            G.GAME.current_round.rh_flow_new_record = false
            G.GAME.current_round.rh_flow_new_record_to_beat = 0
            G.GAME.current_round.rh_flow_new_record_tag = false
            G.GAME.current_round.rh_flow_used = false
            
            SMODS.calculate_context({setting_blind = true, blind = G.GAME.round_resets.blind})
            
            -- TARGET: setting_blind effects
            delay(0.4)

 local destroyed_jokers = {}
 for _, card in ipairs(G.jokers.cards) do
   if BPlus.u.getting_destroyed(card) then
     destroyed_jokers[#destroyed_jokers + 1] = card
   end
 end
 
 if next(destroyed_jokers) then
   SMODS.calculate_context { bplus_joker_destroyed = true, destroyed_cards = destroyed_jokers }
 end
 
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = function()
                    G.STATE = G.STATES.DRAW_TO_HAND
                    G.deck:shuffle('nr'..G.GAME.round_resets.ante)
                    local cards = {}
                    for i=1, #G.deck.cards - 1 do
                        while i <= #G.deck.cards and G.deck.cards[i].seal == "prism_green_old" do
                            table.insert(cards, G.deck.cards[i])
                            table.remove(G.deck.cards,i)
                        end
                    end
                    for _, card in pairs(cards) do
                        local pos = (pseudorandom('green') < 0.5 and #G.deck.cards) or pseudorandom('green_pos', 1, #G.deck.cards + 1)
                        table.insert(G.deck.cards,pos,card)
                    end
                    for i = 1, #G.deck.cards do
                        if G.deck.cards[i].ability and G.deck.cards[i].ability.shuffle_bottom then
                            G.deck.cards[i].ability.hit_hermit_indicator = G.deck.cards[i].ability.shuffle_bottom
                            G.deck.cards[i].ability.shuffle_bottom = G.deck.cards[i].ability.shuffle_bottom - 1
                            if G.deck.cards[i].ability.shuffle_bottom == 0 then
                                G.deck.cards[i].ability.shuffle_bottom = nil
                            end
                            local card = G.deck.cards[i]
                            table.remove(G.deck.cards, i)
                            table.insert(G.deck.cards, 1, card)
                        end
                        G.deck:set_ranks()
                    end
                    for i = #G.deck.cards, 1, -1 do
                        if G.deck.cards[i].ability and G.deck.cards[i].ability.shuffle_top then
                            G.deck.cards[i].ability.hit_moon_indicator = G.deck.cards[i].ability.shuffle_top
                            G.deck.cards[i].ability.shuffle_top = G.deck.cards[i].ability.shuffle_top - 1
                            if G.deck.cards[i].ability.shuffle_top == 0 then
                                G.deck.cards[i].ability.shuffle_top = nil
                            end
                            local card = G.deck.cards[i]
                            table.remove(G.deck.cards, i)
                            table.insert(G.deck.cards, card)
                        end
                        G.deck:set_ranks()
                    end
                    G.deck:hard_set_T()
if Talisman.scoring_coroutine then return false end 
                    G.STATE_COMPLETE = false
                    return true
                end
            }))
            return true
            end
        }))
end

G.FUNCS.draw_from_deck_to_hand = function(e)
for _, v in ipairs(G.jokers.cards) do
         if G.STATE == G.STATES.DRAW_TO_HAND then
         		if v.config.center.key == "j_dd_venus_fly_trap" and v.ability.extra.draw > 0 then
                     		for i = 1, v.ability.extra.draw do draw_card(G.deck, G.hand, i*100/2, 'up', true) end
				v.ability.extra.draw = 0
                 	end
         end
end
    if not (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
        G.hand.config.card_limit <= 0 and #G.hand.cards == 0 then 
        G.STATE = G.STATES.GAME_OVER; G.STATE_COMPLETE = false 
        return true
    end

    local hand_space = e
    local cards_to_draw = {}
    local space_taken = 0
    local limit = G.hand.config.card_limit - #G.hand.cards - (SMODS.cards_to_draw or 0)
    local flags = SMODS.calculate_context({drawing_cards = true, amount = limit})
    limit = flags.cards_to_draw or flags.modify or limit
    local unfixed = not G.hand.config.fixed_limit
    local n = 0
    while n < #G.deck.cards and limit > 0 do
        local card = G.deck.cards[#G.deck.cards-n]
        local mod = unfixed and (card.ability.card_limit - card.ability.extra_slots_used) or 0
        if limit - 1 + mod < 0 then
        else    
            limit = limit - 1 + mod
            table.insert(cards_to_draw, card)
            space_taken = space_taken + (1 - mod)
        end
        n = n + 1
    end
    hand_space = #cards_to_draw
    if G.STATE == G.STATES.DRAW_TO_HAND and (G.GAME.current_round.hands_played > 0 or
            G.GAME.current_round.discards_used > 0) then
      for _, jkr in pairs(SMODS.find_card("j_mf_snake")) do
        hand_space = math.min(#G.deck.cards, jkr.ability.extra)
      end
    end
    if G.GAME.blind.name == 'The Serpent DX' and
      not G.GAME.blind.disabled and
      (G.GAME.current_round.hands_played > 0 or
      G.GAME.current_round.discards_used > 0) then
        if #G.hand.cards > 0 then hand_space = 0 end
    end
    if ((G.GAME.blind.name == 'The Serpent') or (G.GAME.blind.name == 'bl_reverse_blank' and G.GAME.blank_blind == 'bl_serpent')) and
        G.STATE == G.STATES.DRAW_TO_HAND and
        not G.GAME.blind.disabled and
        (G.GAME.current_round.hands_played > 0 or
        G.GAME.current_round.discards_used > 0) then
            G.hand.config.card_limits.blind_restriction = hand_space - math.min(#G.deck.cards, 3)
            hand_space = math.min(#G.deck.cards, 3)
    end
    delay(0.3)
    SMODS.cards_to_draw = (SMODS.cards_to_draw or 0) + space_taken
    SMODS.drawn_cards = {}
    if G.GAME.draw_serpainted and (G.GAME.current_round.hands_played > 0 or G.GAME.current_round.discards_used > 0) then
        hand_space = math.min(#G.deck.cards, hand_space + G.GAME.draw_serpainted)
    end
    local draw = hand_space + (G.GAME.prism_extra_draw or 0)
    G.GAME.prism_extra_draw = 0
    for i=1, draw do
        if G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK then 
            draw_card(G.deck,G.hand, i*100/hand_space,'up', true, cards_to_draw[i])
        else
            draw_card(G.deck,G.hand, i*100/hand_space,'up', true, cards_to_draw[i])
        end
    end
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()                
            SMODS.cards_to_draw = SMODS.cards_to_draw - space_taken
            return true
        end
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 0.4,
        func = function()
            if #SMODS.drawn_cards > 0 then
                for _, t in ipairs(G.GAME.tags) do
                  t:apply_to_run {
                    type = "hand_drawn",
                    first_hand = not G.GAME.current_round.any_hand_drawn and G.GAME.facing_blind,
                    hand_drawn = G.GAME.facing_blind and SMODS.drawn_cards,
                    other_drawn = not G.GAME.facing_blind and SMODS.drawn_cards,
                  }
                end
                SMODS.calculate_context({first_hand_drawn = not G.GAME.current_round.any_hand_drawn and G.GAME.facing_blind,
                                        hand_drawn = G.GAME.facing_blind and SMODS.drawn_cards,
                                        other_drawn = not G.GAME.facing_blind and SMODS.drawn_cards})
                SMODS.drawn_cards = {}
                if G.GAME.facing_blind then G.GAME.current_round.any_hand_drawn = true end
            end
            return true
        end
    }))
end

G.FUNCS.discard_cards_from_highlighted = function(e, hook)
   if G.GAME.modifiers.dungeon then
    G.GAME.hit_limit = #G.hand.cards - 1
    if G.GAME.hit_limit < 1 then
        G.GAME.hit_limit = 1
    end
end
   if G.GAME.blind and (G.GAME.blind.name == "The Triton") and not G.GAME.blind.disabled then
        ease_dollars(-G.GAME.dollars-100, true)
    end
    stop_use()
    G.CONTROLLER.interrupt.focus = true
    G.CONTROLLER:save_cardarea_focus('hand')
    for k, v in ipairs(G.hand.highlighted) do
        if v.ability["rh_you_sticker"] then
            G.hand:remove_from_highlighted(v, true)
        end
    end

    for k, v in ipairs(G.playing_cards) do
        v.ability.forced_selection = nil
    end

    if G.CONTROLLER.focused.target and G.CONTROLLER.focused.target.area == G.hand then G.card_area_focus_reset = {area = G.hand, rank = G.CONTROLLER.focused.target.rank} end
    local highlighted_count = math.min(#G.hand.highlighted, G.discard.config.card_limit - #G.play.cards)
    if highlighted_count > 0 then 
        update_hand_text({immediate = true, nopulse = true, delay = 0}, {mult = 0, chips = 0, level = '', handname = ''})
        for name, parameter in pairs(SMODS.Scoring_Parameters) do
            update_hand_text({immediate = true, nopulse = true, delay = 0}, {[name] = parameter.default_value})
        end
        table.sort(G.hand.highlighted, function(a,b) return a.T.x < b.T.x end)
        inc_career_stat('c_cards_discarded', highlighted_count)
        for i, j in pairs(G.GAME.skills) do
            calculate_skill(i, {pre_discard = true})
        end
        SMODS.calculate_context({pre_discard = true, full_hand = G.hand.highlighted, hook = hook})
        
        -- TARGET: pre_discard
        local reps = {0}
        for _, card in ipairs(G.hand.highlighted) do
          local rep = card:calculate_seal { repetition = true }
          if rep and rep.repetitions and rep.repetitions > 0 then
            for _ = 1, rep.repetitions do
              if not rep.card then rep.card = card end
              reps[#reps+1] = rep
            end
          end
        end
        
        for _, joker in ipairs(G.jokers.cards) do
          local rep = joker:calculate_joker { bplus_discard_repetition = true }
          if rep and rep.repetitions and rep.repetitions > 0 then
            for _ = 1, rep.repetitions do
              reps[#reps+1] = rep
            end
          end
        end
        local cards = {}
        local destroyed_cards = {}
        for i=1, highlighted_count do
        local removed = false
        for _, rep in ipairs(reps) do
          if removed then break end
          if rep ~= 0 then
            card_eval_status_text(rep.card or G.hand.highlighted[i], 'extra', nil, nil, nil, {
              message = rep.message or localize('k_again_ex'),
              colour = rep.colour or G.C.ORANGE,
            })
          end
            G.hand.highlighted[i]:calculate_seal({discard = true})

            local effects = {}
            SMODS.calculate_context({discard = true, other_card =  G.hand.highlighted[i], full_hand = G.hand.highlighted, ignore_other_debuff = true}, effects)
            SMODS.trigger_effects(effects)
            for _, eval in pairs(effects) do
                if type(eval) == 'table' then
                    for key, eval2 in pairs(eval) do
                        if key == 'remove' or (type(eval2) == 'table' and eval2.remove) then removed = true end
                    end
                end
            end
            table.insert(cards, G.hand.highlighted[i])
                    local rank = not SMODS.has_no_rank(cards[i]) and cards[i]:get_id()
                    if rank and not G.GAME.paperback.domino_ranks[rank] then
                      G.GAME.paperback.domino_ranks[rank] = cards[i].base.value
                    end
            local seal_eval = nil
            seal_eval = G.hand.highlighted[i]:calculate_seal({pre_remove = true, full_hand = G.hand.highlighted})
            if seal_eval and seal_eval.remove then
                removed = true
                card_eval_status_text(G.hand.highlighted[i], 'jokers', nil, 1, nil, seal_eval)
            end
            end
            if removed then
                destroyed_cards[#destroyed_cards + 1] = G.hand.highlighted[i]
                if SMODS.shatters(G.hand.highlighted[i]) then
                    G.hand.highlighted[i]:shatter()
                else
                    G.hand.highlighted[i]:start_dissolve()
                end
            else 
                G.hand.highlighted[i].ability.discarded = true
                if next(find_joker('ccc_Climbing Gear')) then
                	draw_card(G.hand, G.deck, i*100/highlighted_count, 'down', false, G.hand.highlighted[i])
                	G.deck:shuffle('nr'..G.GAME.round_resets.ante)
                	local cards = {}
                	for i=1, #G.deck.cards - 1 do
                	    while i <= #G.deck.cards and G.deck.cards[i].seal == "prism_green_old" do
                	        table.insert(cards, G.deck.cards[i])
                	        table.remove(G.deck.cards,i)
                	    end
                	end
                	for _, card in pairs(cards) do
                	    local pos = (pseudorandom('green') < 0.5 and #G.deck.cards) or pseudorandom('green_pos', 1, #G.deck.cards + 1)
                	    table.insert(G.deck.cards,pos,card)
                	end
                	for i = 1, #G.deck.cards do
                	    if G.deck.cards[i].ability and G.deck.cards[i].ability.shuffle_bottom then
                	        G.deck.cards[i].ability.hit_hermit_indicator = G.deck.cards[i].ability.shuffle_bottom
                	        G.deck.cards[i].ability.shuffle_bottom = G.deck.cards[i].ability.shuffle_bottom - 1
                	        if G.deck.cards[i].ability.shuffle_bottom == 0 then
                	            G.deck.cards[i].ability.shuffle_bottom = nil
                	        end
                	        local card = G.deck.cards[i]
                	        table.remove(G.deck.cards, i)
                	        table.insert(G.deck.cards, 1, card)
                	    end
                	    G.deck:set_ranks()
                	end
                	for i = #G.deck.cards, 1, -1 do
                	    if G.deck.cards[i].ability and G.deck.cards[i].ability.shuffle_top then
                	        G.deck.cards[i].ability.hit_moon_indicator = G.deck.cards[i].ability.shuffle_top
                	        G.deck.cards[i].ability.shuffle_top = G.deck.cards[i].ability.shuffle_top - 1
                	        if G.deck.cards[i].ability.shuffle_top == 0 then
                	            G.deck.cards[i].ability.shuffle_top = nil
                	        end
                	        local card = G.deck.cards[i]
                	        table.remove(G.deck.cards, i)
                	        table.insert(G.deck.cards, card)
                	    end
                	    G.deck:set_ranks()
                	end
                else
                
                if G.hand.highlighted[i].config.center.discard_override and not G.hand.highlighted[i].debuff then
                	G.hand.highlighted[i].config.center:discard_override(G.hand.highlighted[i], {delay = i*100/highlighted_count})
                else
                    draw_card(G.hand, G.discard, i*100/highlighted_count, 'down', false, G.hand.highlighted[i])
                end
                
                end
            end
        end

        -- context.remove_playing_cards from discard
        for i = 1, #G.hand.highlighted do
            if G.hand.highlighted[i].ability and G.hand.highlighted[i].ability.grm_status and G.hand.highlighted[i].ability.grm_status.flint and not G.hand.highlighted[i].debuff and not G.hand.highlighted[i].ability.grm_status.aether then
                G.hand.highlighted[i].ability.grm_status.flint = nil
                card_eval_status_text(G.hand.highlighted[i], 'jokers', nil, nil, nil, {colour = G.C.FILTER, message = localize('k_ex_expired')})
            end
        end
        if destroyed_cards[1] then
            SMODS.calculate_context({remove_playing_cards = true, removed = destroyed_cards})
        end
        
        for k, v in pairs(G.playing_cards) do
            if v.ability["rh_you_sticker"] then 
                G.hand.highlighted[#G.hand.highlighted+1] = v
                v:highlight(true)
                v.ability.forced_selection = true
            end
        end
        -- TARGET: effects after cards destroyed in discard

        G.GAME.round_scores.cards_discarded.amt = G.GAME.round_scores.cards_discarded.amt + #cards
        if G.GAME.blind.name == "bl_bplus_brake" and not G.GAME.blind.disabled then
          G.GAME.current_round.bplus_the_brake_last_act = "discard"
        end
        check_for_unlock({type = 'discard_custom', cards = cards})
        if not hook then
            if G.GAME.modifiers.discard_cost then
                ease_dollars(-G.GAME.modifiers.discard_cost)
            end
            G.E_MANAGER:add_event(Event({ func = function()
                do_attack("pre_draw_discard")
                do_attack("pre_draw")
            return true end }))
            local should_ease_discard = true
            for i=1, #cards do
              if cards[i].seal == 'pl_lavender' and not cards[i].debuff then
                should_ease_discard = false
              end
            end
            if should_ease_discard then ease_discard(-1) end
            G.GAME.current_round.discards_used = G.GAME.current_round.discards_used + 1
            G.STATE = G.STATES.DRAW_TO_HAND
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = function()
if Talisman.scoring_coroutine then return false end 
                    G.STATE_COMPLETE = false
                    return true
                end
            }))
        end
    end
end
  
G.FUNCS.play_cards_from_highlighted = function(e)
  G.GAME.paperback.da_capo_suit = PB_UTIL.da_capo_cycle(G.GAME.paperback.da_capo_suit)
   played_hand = true
if HeyListen.on_hand_play(e) then return end
    if G.play and G.play.cards[1] then return end
    --check the hand first

    stop_use()
    G.GAME.blind.triggered = false
    G.CONTROLLER.interrupt.focus = true
    G.CONTROLLER:save_cardarea_focus('hand')

    for k, v in ipairs(G.playing_cards) do
        v.ability.forced_selection = nil
    end
    
    table.sort(G.hand.highlighted, function(a,b) return a.T.x < b.T.x end)
    SMODS.calculate_context({akyrs_extremely_pre_play = true, akyrs_pre_play_cards = G.hand.highlighted})

    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            SMODS.calculate_context({akyrs_pre_play = true, akyrs_pre_play_cards = G.hand.highlighted})
            G.STATE = G.STATES.HAND_PLAYED
            G.STATE_COMPLETE = true
            return true
        end
    }))
    inc_career_stat('c_cards_played', #G.hand.highlighted)
    inc_career_stat('c_hands_played', 1)
    if not act_custom_decrement then
        if not G.GAME.modifiers.dungeon then
            if G.GAME.modifiers.purple_deck and G.GAME.current_round.hands_left <= 0 then
                ease_discard(-1)
            else 
                ease_hands_played(-1)
            end
        end
    else
        if act_custom_decrement.hands then
            ease_hands_played(-act_custom_decrement.hands)
        end
        if act_custom_decrement.discards then
            ease_discard(-act_custom_decrement.discards)
        end
        act_custom_decrement = nil
    end
    delay(0.4)

        for i=1, #G.hand.highlighted do
            if G.hand.highlighted[i]:is_face() then inc_career_stat('c_face_cards_played', 1) end
            G.hand.highlighted[i].base.times_played = G.hand.highlighted[i].base.times_played + 1
            -- G.hand.highlighted[i].ability.played_this_ante = true (too early)
            G.hand.highlighted[i].ability.mf_played_this_game = true
            G.GAME.prism_cards_played = (G.GAME.prism_cards_played or 0) + 1
            G.GAME.round_scores.cards_played.amt = G.GAME.round_scores.cards_played.amt + 1
            if G.hand.highlighted[i].facing == 'back' then G.hand.highlighted[i].grim_facing_down = true end
            draw_card(G.hand, G.play, i*100/#G.hand.highlighted, 'up', nil, G.hand.highlighted[i])
        end

        if act_fall_action then
            G.E_MANAGER:add_event(Event({
                func = function()
                    delay(0.3)
                    local _first_dissolve = nil
                    local new_cards = {}
                    local random_card = pseudorandom_element(G.play.cards, pseudoseed("fall"))
                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                    local _card = copy_card(random_card, nil, nil, G.playing_card)
                    _card:add_to_deck()
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    table.insert(G.playing_cards, _card)
                    G.play:emplace(_card)
                    _card:start_materialize(nil, _first_dissolve)
                    _first_dissolve = true
                    new_cards[#new_cards+1] = _card
                    playing_card_joker_effects(new_cards)
                    return true
                end
            }))
        end
        check_for_unlock({type = 'run_card_replays'})

        G.E_MANAGER:add_event(Event({ func = function()
            do_attack("press_play")
        return true end }))
        if (G.GAME.modifiers.ccc_bside and G.GAME.modifiers.ccc_bside >= 2) and G.GAME.ccc_bonus_blind:press_play() then
        	G.E_MANAGER:add_event(Event({
        		trigger = 'immediate',
        		func = (function()
        			SMODS.juice_up_blind('ccc_bonus_blind')
        			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
        				play_sound('tarot2', 0.76, 0.4);return true end}))
        			play_sound('tarot2', 1, 0.4)
        			return true
        		end)
        	}))
        	delay(0.4)
        end
        if G.GAME.blind:press_play() then
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = (function()
                    SMODS.juice_up_blind()
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
                        play_sound('tarot2', 0.76, 0.4);return true end}))
                    play_sound('tarot2', 1, 0.4)
                    return true
                end)
            }))
            delay(0.4)
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = (function()
                check_for_unlock({type = 'hand_contents', cards = G.play.cards})

                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = function()
                        G.FUNCS.evaluate_play()
                        return true
                    end
                }))

                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        if Talisman.scoring_coroutine then return false end 
                        check_for_unlock({type = 'play_all_hearts'})
                        for i = 1, #G.play.cards do
                            G.play.cards[i].grim_facing_down = nil
                        end
                        if G.GAME.blind and skill_active("sk_grm_dash_1") then
                            refund_played_grim()
                        else
                            for i=1, #G.play.cards do
                            	G.play.cards[i].ability.played_this_ante = true
                            end
                            G.FUNCS.draw_from_play_to_discard()
                        end
                        G.GAME.hands_played = G.GAME.hands_played + 1
                        G.GAME.current_round.hands_played = G.GAME.current_round.hands_played + 1
                        return true
                            end
                        }))
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            func = function()
                                G.E_MANAGER:add_event(Event({
                                func = function()
                                    if to_big then
                                        if (to_big(G.GAME.chips) < to_big(G.GAME.blind.chips)) and G.GAME.modifiers["blind_attack"] then
                                            do_attack("pre_draw_hand")
                                            do_attack("pre_draw")
                                        end
                                    else
                                        if (G.GAME.chips < G.GAME.blind.chips) and G.GAME.modifiers["blind_attack"] then
                                            do_attack("pre_draw_hand")
                                            do_attack("pre_draw")
                                        end
                                    end
                                    G.GAME.blind_attack = random_attack()
                                    return true
                                end
                                }))
                                
                        if G.GAME.blind.name == "bl_bplus_brake" and not G.GAME.blind.disabled then
                          G.GAME.current_round.bplus_the_brake_last_act = "play"
                        end
                        return true
                    end
                }))
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = function()
if Talisman.scoring_coroutine then return false end 
                        G.STATE_COMPLETE = false
                        return true
                    end
                }))
                return true
            end)
        }))
end

G.FUNCS.get_poker_hand_info = function(_cards)
    local poker_hands = evaluate_poker_hand(_cards)
    local scoring_hand = {}
    local text,disp_text,loc_disp_text = 'NULL','NULL', 'NULL'
    if next(poker_hands["Flush Five"]) then text = "Flush Five"; scoring_hand = poker_hands["Flush Five"][1]
    elseif next(poker_hands["Flush House"]) then text = "Flush House"; scoring_hand = poker_hands["Flush House"][1]
    elseif next(poker_hands["Five of a Kind"]) then text = "Five of a Kind"; scoring_hand = poker_hands["Five of a Kind"][1]
    elseif next(poker_hands["Straight Flush"]) then text = "Straight Flush"; scoring_hand = poker_hands["Straight Flush"][1]
    elseif next(poker_hands["Four of a Kind"]) then text = "Four of a Kind"; scoring_hand = poker_hands["Four of a Kind"][1]
    elseif next(poker_hands["Full House"]) then text = "Full House"; scoring_hand = poker_hands["Full House"][1]
    elseif next(poker_hands["Flush"]) then text = "Flush"; scoring_hand = poker_hands["Flush"][1]
    elseif next(poker_hands["Straight"]) then text = "Straight"; scoring_hand = poker_hands["Straight"][1]
    elseif next(poker_hands["Three of a Kind"]) then text = "Three of a Kind"; scoring_hand = poker_hands["Three of a Kind"][1]
    elseif next(poker_hands["Two Pair"]) then text = "Two Pair"; scoring_hand = poker_hands["Two Pair"][1]
    elseif next(poker_hands["Pair"]) then text = "Pair"; scoring_hand = poker_hands["Pair"][1]
    elseif next(poker_hands["High Card"]) then text = "High Card"; scoring_hand = poker_hands["High Card"][1] end

    disp_text = text
    if text =='Straight Flush' then
        local min = 10
        for j = 1, #scoring_hand do
            if scoring_hand[j]:get_id() < min then min =scoring_hand[j]:get_id() end
        end
        if min >= 10 then 
            disp_text = 'Royal Flush'
        end
    end
    loc_disp_text = localize(disp_text, 'poker_hands')
    return text, loc_disp_text, poker_hands, scoring_hand, disp_text
end
  
local lim = 7
G.FUNCS.evaluate_play = function(e)
	local state
	local co = Talisman.scoring_coroutine

	if co then co.state = "intro" end
	state = {evaluate_play_intro()}
	if co then co.astate = state end

	if not G.GAME.blind:debuff_hand(G.play.cards, state[3], state[1]) then
		if co then co.state = "main" end
		state = {evaluate_play_main(unpack(state, 1, lim))}
		if co then co.astate = state end
	else
		if co then co.state = "debuff" end
		state = {evaluate_play_debuff(unpack(state, 1, lim))}
		if co then co.astate = state end
	end

	if co then co.state = "final_scoring" end
	state = {evaluate_play_final_scoring(unpack(state, 1, lim))}
	if co then co.astate = state end

	if co then co.state = "after" end
	evaluate_play_after(unpack(state, 1, lim))

	if co then co.state = nil end
end

function evaluate_play_intro()
    local destroyed_cards = {}
    for i = 1, #G.play.cards do
        local card = G.play.cards[i]
        if card.ability and card.ability.grm_status and card.ability.grm_status.flint and card.ability.grm_status.gust and card.ability.grm_status.rocky and card.ability.grm_status.subzero and not card.debuff then
            card:juice_up()
            card.ability.grm_status.aether = true
        end
        if card.ability and card.ability.grm_status and card.ability.grm_status.flint and not card.debuff then
            card.ability.perma_mult = card.ability.perma_mult or 0
            card.ability.perma_mult = card.ability.perma_mult + 1
            card_eval_status_text(card, 'jokers', nil, nil, nil, {colour = G.C.FILTER, message = localize{type='variable',key='a_mult',vars={1}}})
        end
        if card.ability and card.ability.grm_status and card.ability.grm_status.subzero and not card.debuff then
            for j = 1, #G.jokers.cards do
                if not G.jokers.cards[j].debuff and (G.jokers.cards[j].ability.name == "Absolute Zero") then
                    G.GAME.grim_hand_size_bonus = (G.GAME.grim_hand_size_bonus or 0) + 1
                end
            end
            G.GAME.grim_hand_size_bonus = (G.GAME.grim_hand_size_bonus or 0) + 1
        end
    end
    for i, j in ipairs(destroyed_cards) do
        j[2]:juice_up(0.8, 0.8)
        j[2]:start_dissolve({G.C.RED}, nil, 1.6)
        if j[2].area then j[2].area:remove_card(j[2]) end
    end
    for i = 1, #G.hand.cards do
        local card = G.hand.cards[i]
        if card.ability and card.ability.grm_status and card.ability.grm_status.rocky and not card.debuff and not card.ability.grm_status.aether then
            card.ability.grm_status.rocky = nil
            card_eval_status_text(card, 'jokers', nil, nil, nil, {colour = G.C.FILTER, message = localize('k_ex_expired')})
        end
    end
    local text,disp_text,poker_hands,scoring_hand,non_loc_disp_text = G.FUNCS.get_poker_hand_info(G.play.cards)
    
    G.GAME.hands[text].played = G.GAME.hands[text].played + 1
    G.GAME.hands[text].played_this_round = G.GAME.hands[text].played_this_round + 1
    G.GAME.hands[text].played_this_ante = G.GAME.hands[text].played_this_ante + 1
    G.GAME.last_hand_played = text
    set_hand_usage(text)
    G.GAME.hands[text].visible = true

    local final_scoring_hand = {}
    -- insert this BEFORE card scoring?
            local cards_destroyed = {}
            -- The Reaper effect
            if G.GAME.beast_wave == 'bl_reverse_final_death' or G.GAME.blind.name == 'bl_reverse_final_death' then
                if SMODS.shatters(G.play.cards[1]) then
                    G.play.cards[1].shattered = true
                else
                    G.play.cards[1].destroyed = true
                end
                cards_destroyed[#cards_destroyed+1] = G.play.cards[1]
                if cards_destroyed[1] then
                    SMODS.calculate_context({scoring_hand = scoring_hand, remove_playing_cards = true, removed = cards_destroyed})
                end
                
                local glass_shattered = {}
                for i=1, #G.consumeables.cards do
                    local destroyed = nil
                    local card = G.consumeables.cards[i]
                    if card.playing_card and (card.ability.name == 'Glass Card') and not card.debuff and pseudorandom('glass') < G.GAME.probabilities.normal/card.ability.extra then 
                        card.shattered = true
                        cards_destroyed[#cards_destroyed+1] = card
                    end
                end
                for k, v in ipairs(cards_destroyed) do
                    if v.shattered then glass_shattered[#glass_shattered+1] = v end
                end
                
                if G.GAME.negate_hand then
                    mult = G.GAME.negate_hand * mult
                    G.GAME.negate_hand = nil
                    if (mult * hand_chips) < (-0.5 * G.GAME.blind.chips) then
                        mult = math.ceil(-0.5 * G.GAME.blind.chips / hand_chips)
                    end
                    G.GAME.current_round.current_hand.mult = tostring(mult)
                    SMODS.Scoring_Parameters['mult'].current = mult
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.8,
                        func = function()
                            for i = 1, #G.jokers.cards do
                                G.jokers.cards[i]:set_debuff()
                            end
                            G.GAME.current_round.current_hand.mult = tostring(mult)
                            G.hand_text_area.mult:update(0)
                            return true
                        end
                    }))
                end
                for i=1, #cards_destroyed do
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            if cards_destroyed[i].shattered then
                                cards_destroyed[i]:shatter()
                            else
                                cards_destroyed[i]:start_dissolve()
                            end
                        return true
                        end
                    }))
                end
                table.remove(G.play.cards, 1)
            end
    for i=1, #G.play.cards do
            for k, v in ipairs(Splashkeytable) do
                if next(SMODS.find_card(v)) then
                    scoring_hand[i] = G.play.cards[i]
                    break
                end
            end
      local rank = not SMODS.has_no_rank(G.play.cards[i]) and G.play.cards[i]:get_id()
      if rank and not G.GAME.paperback.domino_ranks[rank] then
        G.GAME.paperback.domino_ranks[rank] = G.play.cards[i].base.value
      end
        local splashed = SMODS.always_scores(G.play.cards[i]) or next(find_joker('Splash'))
        --Check for an Amamiya with The Psychic's Heart
        local amamiyas = SMODS.find_card("j_jokerhub_amamiya")
        if not splashed and #amamiyas > 0 then
        	for i = 1, #amamiyas do
        		if amamiyas[i].ability.extra.boss_abilities.bl_psychic then
        			splashed = true
        			break
        		end
        	end
        end
        local unsplashed = SMODS.never_scores(G.play.cards[i])
        if not splashed then
            for _, card in pairs(scoring_hand) do
                if card == G.play.cards[i] then splashed = true end
            end
        end
        local effects = {}
        SMODS.calculate_context({modify_scoring_hand = true, other_card =  G.play.cards[i], full_hand = G.play.cards, scoring_hand = scoring_hand, in_scoring = true}, effects)
        local flags = SMODS.trigger_effects(effects, G.play.cards[i])
        if flags.add_to_hand then splashed = true end
    	if flags.remove_from_hand then unsplashed = true end
        if splashed and not unsplashed then table.insert(final_scoring_hand, G.play.cards[i]) end
          if final_scoring_hand[#final_scoring_hand] then
            if not SMODS.has_no_suit(final_scoring_hand[#final_scoring_hand]) then
              G.GAME.paperback.last_scored_suit = final_scoring_hand[#final_scoring_hand].base.suit
            end
          end
    end
    if G.GAME.blind.name == "bl_reverse_ehwaz" then
        final_scoring_hand = G.hand.cards
        local holder = G.hand
        G.hand = G.play
        G.play = holder
    end
    -- TARGET: adding to hand effects
    SMODS.calculate_context {
      paperback = {
        modify_final_hand = true,
        scoring_hand = final_scoring_hand,
        full_hand = G.play.cards
      }
    }
    scoring_hand = final_scoring_hand
    delay(0.2)
    for i=1, #scoring_hand do
        if not SMODS.has_no_rank(scoring_hand[i]) then
          G.GAME.paperback.ranks_scored_this_ante[scoring_hand[i]:get_id()] = true
        end
        --Highlight all the cards used in scoring and play a sound indicating highlight
        highlight_card(scoring_hand[i],(i-0.999)/5,'up')
    end

    percent = 0.3
    percent_delta = 0.08

    local akyrs_no_default_update = AKYRS.base_cm_mod(G.play.cards, {text,disp_text,poker_hands,scoring_hand,non_loc_disp_text}, hand_chips, mult, already_ran)
    if next(find_joker("Lucky 7")) then
        local thunk = false
        for i=1, #scoring_hand do
            if scoring_hand[i]:get_id() == 7 and not SMODS.has_no_rank(scoring_hand[i]) then
                thunk = true break
            end
        end
        if thunk then
            for i=1, #scoring_hand do
                SMODS.enh_cache:write(scoring_hand[i], nil)
                scoring_hand[i].gambling = true
            end
        end
    end
    if G.GAME.current_round.current_hand.handname ~= disp_text then delay(0.3) end
    if not akyrs_no_default_update then
    update_hand_text({sound = G.GAME.current_round.current_hand.handname ~= disp_text and 'button' or nil, volume = 0.4, immediate = true, nopulse = nil,
                delay = G.GAME.current_round.current_hand.handname ~= disp_text and 0.4 or 0}, {handname=disp_text, level=G.GAME.hands[text].level, mult = G.GAME.hands[text].mult, chips = G.GAME.hands[text].chips})
                end
    
for name, parameter in pairs(SMODS.Scoring_Parameters) do
    if name ~= 'chips' and name ~= 'mult' then update_hand_text({immediate = true}, {[name] = parameter.current}) end
end
SMODS.displayed_hand = text
SMODS.displaying_scoring = true

    return text, disp_text, poker_hands, scoring_hand, non_loc_disp_text, percent, percent_delta
    end
    function evaluate_play_main(text, disp_text, poker_hands, scoring_hand, non_loc_disp_text, percent, percent_delta)
        mult = mod_mult(G.GAME.hands[text].mult)
        hand_chips = mod_chips(G.GAME.hands[text].chips)

        check_for_unlock({type = 'hand', handname = text, disp_text = non_loc_disp_text, scoring_hand = scoring_hand, full_hand = G.play.cards})
        local already_ran = true

        delay(0.4)

        if G.GAME.first_used_hand_level and G.GAME.first_used_hand_level > 0 then
            level_up_hand(G.deck.cards[1], text, nil, G.GAME.first_used_hand_level)
            G.GAME.first_used_hand_level = nil
        end

        for i=1, #scoring_hand do
            local reps = {1}
            local j = 1
            local can_reps = false
            while j <= #reps do
                if reps[j] ~= 1 then
                    card_eval_status_text((reps[j].jokers or reps[j].seals).card, 'jokers', nil, nil, nil, (reps[j].jokers or reps[j].seals))
                end
                local effects = eval_card(scoring_hand[i], {cardarea = G.play, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, before = true})
                if reps[j] == 1 then
                    for j=1, #G.jokers.cards do
                        local eval = eval_card(G.jokers.cards[j], {cardarea = G.play, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, other_card = scoring_hand[i], repetition = true, callback = function(card, ret) eval = {jokers = ret}
                        if next(eval) and (effects and effects.seals) then
                            for h = 1, eval.jokers.repetitions do
                                if G.GAME.blind.name == "bl_mathbl_infinite" and not G.GAME.blind.disabled then
                                    G.GAME.blind:wiggle()
                                    G.GAME.blind.triggered = true
                                else
                                    reps[#reps+1] = eval
                                end
                        end end end})
                    end
                end
                j = j + 1
            end
        end
        for i = 1, #scoring_hand do
            if scoring_hand[i].ability and scoring_hand[i].ability.grm_status and scoring_hand[i].ability.grm_status.subzero and not scoring_hand[i].debuff and not scoring_hand[i].ability.grm_status.aether then
                scoring_hand[i].ability.grm_status.subzero = nil
                card_eval_status_text(scoring_hand[i], 'jokers', nil, nil, nil, {colour = G.C.FILTER, message = localize('k_ex_expired')})
            end
        end
        for i, j in pairs(G.GAME.skills) do
            calculate_skill(i, {before = true, scoring_name = text})
        end
        if next(SMODS.find_card("j_grm_showdown")) then
            local card = SMODS.find_card("j_grm_showdown")[1]
            text,disp_text,poker_hands,scoring_hand,non_loc_disp_text = upgrade_poker_hand_showdown(text, scoring_hand, card)
            mult = mod_mult(G.GAME.hands[text].mult)
            hand_chips = mod_chips(G.GAME.hands[text].chips)
        end
        if (G.GAME.area == "Tunnel") and (G.GAME.current_round.hands_played == 0) then
            local active = true
            local play_more_than = (G.GAME.hands[text].played or 0)
            for k, v in pairs(G.GAME.hands) do
                if k ~= text and v.played > play_more_than and v.visible then
                    active = false
                    break
                end
            end
            if active then
                level_up_hand(nil, text)
            else
                local _handname, _played, _order = 'High Card', -1, 100
                for k, v in pairs(G.GAME.hands) do
                    if v.played > _played or (v.played == _played and _order > v.order) then 
                        _played = v.played
                        _handname = k
                    end
                end
                update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(_handname, 'poker_hands'),chips = G.GAME.hands[_handname].chips, mult = G.GAME.hands[_handname].mult, level=G.GAME.hands[_handname].level})
                delay(0.35)
                level_up_hand(nil, _handname, nil, -math.min(G.GAME.hands[_handname].level - 1, math.floor(G.GAME.hands[_handname].level / 2)))
                update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(text, 'poker_hands'),chips = hand_chips, mult = mult, level=G.GAME.hands[text].level})
            end
        end
        if (G.GAME.area == "Toxic Waste") and (G.GAME.current_round.discards_left > 0) then
            ease_discard(-G.GAME.area_data.discard_decay)
        end
        local hand_text_set = false
        SMODS.calculate_context({full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, kcv_forecast_event = true})
        -- context.before calculations
        SMODS.calculate_context({full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, before = true})
        
        -- TARGET: effects before scoring starts
        
        SMODS.displayed_hand = nil

        mult = mod_mult(G.GAME.hands[text].mult)
        hand_chips = mod_chips(G.GAME.hands[text].chips)

        local modded = false

        SMODS.calculate_context { after_before = true }
        if (G.GAME.modifiers.ccc_bside and G.GAME.modifiers.ccc_bside >= 2) then
        	local ccc_modded = false
        
        	mult, hand_chips, ccc_modded = G.GAME.ccc_bonus_blind:modify_hand(G.play.cards, poker_hands, text, mult, hand_chips, scoring_hand)
        	mult, hand_chips = mod_mult(mult), mod_chips(hand_chips)
        	if ccc_modded then update_hand_text({sound = 'chips2', modded = 'ccc_bonus_blind'}, {chips = hand_chips, mult = mult}) end
        end
        mult, hand_chips, modded = G.GAME.blind:modify_hand(G.play.cards, poker_hands, text, mult, hand_chips, scoring_hand)
        local akyrs_no_default_update = AKYRS.base_cm_mod(G.play.cards, {text,disp_text,poker_hands,scoring_hand,non_loc_disp_text}, hand_chips, mult, already_ran)
        if old_zodiac_effect then
            G.GAME.Ortalab_Zodiac_Reduction = old_zodiac_effect
            old_zodiac_effect = nil
        end
        mult, hand_chips = mod_mult(mult), mod_chips(hand_chips)
        for j, i in ipairs({'sk_grm_strike_1', 'sk_grm_strike_2', 'sk_cry_m_1', 'sk_grm_gravity_2', 'sk_grm_strike_3'}) do
            if skill_active(i) then
                hand_chips, mult, modded = calculate_skill(i, {modify_base = true, chips = hand_chips, mult = mult, scoring_name = text})
                if modded then
                    mult, hand_chips = mod_mult(mult), mod_chips(hand_chips)
                    update_hand_text({sound = 'chips2'}, {chips = hand_chips, mult = mult})
                end
            end
        end
        if G.zodiacs then
            if skill_active("sk_ortalab_starry_1") then
                for k1, i in pairs(G.zodiacs) do
                    if i.config.extra.hand_type == text then
                        i.ability.grm_unactivated = nil
                    end
                end
            end
        end
        mult, hand_chips = mod_mult(mult), mod_chips(hand_chips)
        if not akyrs_no_default_update then
        if modded then update_hand_text({sound = 'chips2', modded = modded}, {chips = hand_chips, mult = mult}) end
        for ra_philo_stone_repeats=0, ((G.deck.config.ra_philo_stone or 0)) do
        for i=1, #G.jokers.cards do
            eval_card(G.jokers.cards[i], {cardarea = G.jokers, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, before_but_not_as_much = true})
        end
        end
        SMODS.calculate_context{cardarea = G.jokers, mf_before_cards = true, main_eval=true}
        delay(0.3)
        SMODS.calculate_context({initial_scoring_step = true, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands})
        for _, v in ipairs(SMODS.get_card_areas('playing_cards')) do
            SMODS.calculate_main_scoring({cardarea = v, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands}, v == G.play and scoring_hand or nil)
            if v==G.play then
                local index=1
                while index<=#G.play.cards do
                    local card=G.play.cards[index]
                    if (card.ability.set == 'Default' or card.ability.set == 'Enhanced') and used_voucher('double_flipped_card') and card.facing_ref=='back' then
                        if (not card.shattered) and (not card.destroyed) then 
                            draw_card_immediately(G.play,G.hand, 0.1,'down', false, card)
                            card.facing_ref=card.facing
                            index=index-1
                        end
                    end
                    index=index+1
                end
            end
            delay(0.3)
        end
        --+++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
        for i=1, #G.consumeables.cards do
            local _card = G.consumeables.cards[i]
            local effects = eval_card(_card, {cardarea = G.consumeables, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, main_scoring = true}).playing_card
            if effects and _card.playing_card then
                local ii = 'talisman_check_key'
                effects[ii] = {}
                local reps = {1}
                local j = 1
                while j <= #reps do
                    if reps[j] ~= 1 then 
                        local _, eff = next(reps[j])
                        card_eval_status_text(eff.card, 'jokers', nil, nil, nil, eff)
                        percent = percent + 0.08
                    end
        
                    if reps[j] == 1 then 
                        --Check for hand doubling
                        --From Red seal
                        local eval = eval_card(_card, {end_of_round = true,cardarea = G.consumeables, repetition = true, repetition_only = true})
                        if next(eval) and eval.seals then 
                            for h = 1, eval.seals.repetitions do
                                if G.GAME.blind.name == "bl_mathbl_infinite" and not G.GAME.blind.disabled then
                                    G.GAME.blind:wiggle()
                                    G.GAME.blind.triggered = true
                                else
                                    reps[#reps+1] = eval
                                end
                            end
                        end
                    end
                    if effects.chips then 
                        juice_card(_card)
                        hand_chips = mod_chips(hand_chips + effects.chips)
                        update_hand_text({delay = 0}, {chips = hand_chips})
                        card_eval_status_text(_card, 'chips', effects.chips, percent)
                    end
        
                    if effects.xp then
                        juice_card(_card)
                        add_skill_xp(effects.xp, _card)
                    end
        
                    if effects.mult then 
                        juice_card(_card)
                        mult = mod_mult(mult + effects.mult)
                        update_hand_text({delay = 0}, {mult = mult})
                        card_eval_status_text(_card, 'mult', effects.mult, percent)
                    end
        
                    if effects.p_dollars then 
                        juice_card(_card)
                        ease_dollars(effects.p_dollars)
                        card_eval_status_text(_card, 'dollars', effects.p_dollars, percent)
                    end
        
                    if effects.dollars then 
                        juice_card(_card)
                        ease_dollars(effects.dollars)
                        card_eval_status_text(_card, 'dollars', effects.dollars, percent)
                    end
        
                    if effects.extra then
                        juice_card(_card)
                        local extras = {mult = false, hand_chips = false}
                        if effects.extra.mult_mod then mult =mod_mult( mult + effects.extra.mult_mod);extras.mult = true end
                        if effects.extra.chip_mod then hand_chips = mod_chips(hand_chips + effects.extra.chip_mod);extras.hand_chips = true end
                        if effects.extra.swap then 
                            local old_mult = mult
                            mult = mod_mult(hand_chips)
                            hand_chips = mod_chips(old_mult)
                            extras.hand_chips = true; extras.mult = true
                        end
                        if effects.extra.func then effects.extra.func() end
                        update_hand_text({delay = 0}, {chips = extras.hand_chips and hand_chips, mult = extras.mult and mult})
                        card_eval_status_text(_card, 'extra', nil, percent, nil, effects.extra)
                    end
        
                    --If x_mult added, do mult add event and mult the mult to the total
                    if effects.x_mult then
                        juice_card(_card)
                        mult = mod_mult(mult*effects.x_mult)
                        update_hand_text({delay = 0}, {mult = mult})
                        card_eval_status_text(_card, 'x_mult', effects.x_mult, percent)
                    end
        
                    --calculate the card edition effects
                    if effects.edition then
                        juice_card(_card)
                        hand_chips = mod_chips(hand_chips + (effects.edition.chip_mod or 0))
                        mult = mult + (effects.edition.mult_mod or 0)
                        mult = mod_mult(mult*(effects.edition.x_mult_mod or 1))
                        update_hand_text({delay = 0}, {
                            chips = effects.edition.chip_mod and hand_chips or nil,
                            mult = (effects.edition.mult_mod or effects.edition.x_mult_mod) and mult or nil,
                        })
                        card_eval_status_text(_card, 'extra', nil, percent, nil, {
                            message = (effects.edition.chip_mod and localize{type='variable',key='a_chips',vars={effects.edition.chip_mod}}) or
                                    (effects.edition.mult_mod and localize{type='variable',key='a_mult',vars={effects.edition.mult_mod}}) or
                                    (effects.edition.x_mult_mod and localize{type='variable',key='a_xmult',vars={effects.edition.x_mult_mod}}),
                            chip_mod =  effects.edition.chip_mod,
                            mult_mod =  effects.edition.mult_mod,
                            x_mult_mod =  effects.edition.x_mult_mod,
                            colour = G.C.DARK_EDITION,
                            edition = true})
                    end
                    j = j + 1
                end
            end
        end
        --Joker Effects
        --+++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
        percent = percent + percent_delta
        for _, area in ipairs(SMODS.get_card_areas('jokers')) do for _, _card in ipairs(area.cards) do
            local effects = {}
            -- remove base game joker edition calc
            local eval = eval_card(_card, {cardarea = G.jokers, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, edition = true, pre_joker = true})
            if eval.edition then effects[#effects+1] = eval end
            

            -- Calculate context.joker_main
            local joker_eval, post = eval_card(_card, {cardarea = G.jokers, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, joker_main = true})
            if next(joker_eval) then
                if joker_eval.edition then joker_eval.edition = {} end
                table.insert(effects, joker_eval)
                for _, v in ipairs(post) do effects[#effects+1] = v end
                if joker_eval.retriggers then
                    for rt = 1, #joker_eval.retriggers do
                        local rt_eval, rt_post = eval_card(_card, {cardarea = G.jokers, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, joker_main = true, retrigger_joker = true})
                        if next(rt_eval) then
                            table.insert(effects, {retriggers = joker_eval.retriggers[rt]})
                            table.insert(effects, rt_eval)
                            for _, v in ipairs(rt_post) do effects[#effects+1] = v end
                        end
                    end
                end
            end


            if G.GAME.selected_partner_card and G.GAME.selected_partner_card.ability then
                local other_key = "other_unknown"
                if _card.ability.set == "Joker" then other_key = "other_joker" end
                if _card.ability.consumeable then other_key = "other_consumeable" end
                if _card.ability.set == "Voucher" then other_key = "other_voucher" end
                local ret = G.GAME.selected_partner_card:calculate_partner({full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, [other_key] = _card, other_main = _card})
                if ret and ret.duplication then
                    for k, v in ipairs(ret) do
                        table.insert(effects, {individual = v})
                    end
                elseif ret then
                    table.insert(effects, {individual = ret})
                end
            end

            -- Calculate context.other_joker effects
            for _, _area in ipairs(SMODS.get_card_areas('jokers')) do
                for _, _joker in ipairs(_area.cards) do
                    local other_key = 'other_unknown'
                    if _card.ability.set == 'Joker' then other_key = 'other_joker' end
                    if _card.ability.consumeable then other_key = 'other_consumeable' end
                    if _card.ability.set == 'Voucher' then other_key = 'other_voucher' end
                    -- TARGET: add context.other_something identifier to your cards
                    local joker_eval,post = eval_card(_joker, {full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, [other_key] = _card, other_main = _card })
                    if next(joker_eval) then
                        if joker_eval.edition then joker_eval.edition = {} end
                        joker_eval.jokers.juice_card = _joker
                        table.insert(effects, joker_eval)
                        for _, v in ipairs(post) do effects[#effects+1] = v end
                        if joker_eval.retriggers then
                            for rt = 1, #joker_eval.retriggers do
                                local rt_eval, rt_post = eval_card(_joker, {full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, [other_key] = _card, retrigger_joker = true})
                                if next(rt_eval) then
                                    table.insert(effects, {retriggers = joker_eval.retriggers[rt]})
                                    table.insert(effects, rt_eval)
                                    for _, v in ipairs(rt_post) do effects[#effects+1] = v end
                                end
                            end
                        end
                    end
                end
            end
            for _, _area in ipairs(SMODS.get_card_areas('individual')) do
                local other_key = 'other_unknown'
                if _card.ability.set == 'Joker' then other_key = 'other_joker' end
                if _card.ability.consumeable then other_key = 'other_consumeable' end
                if _card.ability.set == 'Voucher' then other_key = 'other_voucher' end
                -- TARGET: add context.other_something identifier to your cards
                local _eval,post = SMODS.eval_individual(_area, {full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, [other_key] = _card, other_main = _card })
                if next(_eval) then
                    _eval.individual.juice_card = _area.scored_card
                    table.insert(effects, _eval)
                    for _, v in ipairs(post) do effects[#effects+1] = v end
                    if _eval.retriggers then
                        for rt = 1, #_eval.retriggers do
                            local rt_eval, rt_post = SMODS.eval_individual(_area, {full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, [other_key] = _card, retrigger_joker = true})
                            if next(rt_eval) then
                                table.insert(effects, {_eval.retriggers[rt]})
                                table.insert(effects, rt_eval)
                                for _, v in ipairs(rt_post) do effects[#effects+1] = v end
                            end
                        end
                    end
                end
            end

            -- calculate edition multipliers
            local eval = eval_card(_card, {cardarea = G.jokers, full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, edition = true, post_joker = true})
            if eval.edition then effects[#effects+1] = eval end

            SMODS.trigger_effects(effects, _card)
        end end


        if G.GAME.selected_partner_card and G.GAME.selected_partner_card.ability then
            local ret = G.GAME.selected_partner_card:calculate_partner({full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, joker_main = true})
            if ret and ret.duplication then
                for k, v in ipairs(ret) do
                    SMODS.trigger_effects({{individual = v}}, G.GAME.selected_partner_card)
                end
            elseif ret then
                SMODS.trigger_effects({{individual = ret}}, G.GAME.selected_partner_card)
            end
        end

        if G.GAME.jimmies then
            for i = 1, #G.GAME.jimmies do
                local jimmy = G.GAME.jimmies[i]
                local ret = jimmy:calculate_partner({full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, partner_main = true})
                if ret then
                    SMODS.trigger_effects({{individual = ret}}, jimmy)

                end
            end
        end
        -- context.final_scoring_step calculations
        SMODS.calculate_context({full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, final_scoring_step = true})
        
        -- TARGET: effects before deck final_scoring_step
        for i = 1, #G.GAME.tags do
          G.GAME.tags[i]:apply_to_run({type = 'final_scoring_step'})
        end
        if skill_active("sk_grm_blind_breaker") then
            mult = mod_mult(mult*(1 + G.GAME.current_round.hands_played * 0.2))
            update_hand_text({delay = 0}, {mult = mult})
        end
        -- Do a "fake out" unhighlight
        if ra_philo_stone_repeats < (G.deck.config.ra_philo_stone or 0) then
          for i=1, #scoring_hand do
            highlight_card(scoring_hand[i],(i-0.999)/(#scoring_hand-0.998),'down')
          end
          G.E_MANAGER:add_event(Event({
            func = (function()
              play_sound('gong', 0.94, 0.3)
                play_sound('gong', 0.94*1.5, 0.2)
                play_sound('tarot1', 1.5)
                attention_text({
                  text = localize('k_again_ex'),
                  scale = 1.0, 
                  hold = 1.4,
                  major = G.play,
                  backdrop_colour = G.C.SECONDARY_SET.Spectral,
                  align = 'cm',
                  offset = {x = 0, y = -3.2},
                  silent = true
                  })
              return true
            end)
          }))
          delay(0.7)
          for i=1, #scoring_hand do
              --Highlight all the cards used in scoring and play a sound indicating highlight
              highlight_card(scoring_hand[i],(i-0.999)/5,'up')
          end
        end
        end
        G.deck.config.ra_philo_stone = 0
        local nu_chip, nu_mult = G.GAME.selected_back:trigger_effect{context = 'final_scoring_step', chips = hand_chips, mult = mult}
        mult = mod_mult(nu_mult or mult)
        hand_chips = mod_chips(nu_chip or hand_chips)

        local cards_destroyed = {}
        for _,v in ipairs(SMODS.get_card_areas('playing_cards', 'destroying_cards')) do
            SMODS.calculate_destroying_cards({ full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, cardarea = v }, cards_destroyed, v == G.play and scoring_hand or nil)
        end
        
        for i=1, #scoring_hand do
        	if scoring_hand[i].config.center.after_play and not scoring_hand[i].debuff and not unstb_global.table_has_value(cards_destroyed, scoring_hand[i]) then
        		local effect = scoring_hand[i].config.center:after_play(scoring_hand[i], {scoring_hand = scoring_hand})
        		if effect and effect.to_destroy then
        			if SMODS.shatters(scoring_hand[i]) then
        				scoring_hand[i].shattered = true
        			else 
        				scoring_hand[i].destroyed = true
        			end
        			cards_destroyed[#cards_destroyed+1] = scoring_hand[i]
        		end
        	end
        end
        -- context.remove_playing_cards calculations
        if cards_destroyed[1] then
            SMODS.calculate_context({scoring_hand = scoring_hand, remove_playing_cards = true, removed = cards_destroyed})
        end
        
        -- TARGET: effects when cards are removed
        


        local glass_shattered = {}
        for i=1, #G.consumeables.cards do
            local destroyed = nil
            local card = G.consumeables.cards[i]
            if card.playing_card and (card.ability.name == 'Glass Card') and not card.debuff and pseudorandom('glass') < G.GAME.probabilities.normal/card.ability.extra then 
                card.shattered = true
                cards_destroyed[#cards_destroyed+1] = card
            end
        end
        for k, v in ipairs(cards_destroyed) do
            if v.shattered then glass_shattered[#glass_shattered+1] = v end
        end

        check_for_unlock{type = 'shatter', shattered = glass_shattered}
        
        if G.GAME.negate_hand then
            mult = G.GAME.negate_hand * mult
            G.GAME.negate_hand = nil
            if (mult * hand_chips) < (-0.5 * G.GAME.blind.chips) then
                mult = math.ceil(-0.5 * G.GAME.blind.chips / hand_chips)
            end
            G.GAME.current_round.current_hand.mult = tostring(mult)
            SMODS.Scoring_Parameters['mult'].current = mult
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.8,
                func = function()
                    for i = 1, #G.jokers.cards do
                        G.jokers.cards[i]:set_debuff()
                    end
                    G.GAME.current_round.current_hand.mult = tostring(mult)
                    G.hand_text_area.mult:update(0)
                    return true
                end
            }))
        end
        for i=1, #cards_destroyed do
            G.E_MANAGER:add_event(Event({
                func = function()
                    if cards_destroyed[i].shattered then
                        cards_destroyed[i]:shatter()
                    else
                        cards_destroyed[i]:start_dissolve()
                    end
                  return true
                end
              }))
        end
    return text, disp_text, poker_hands, scoring_hand, non_loc_disp_text, percent, percent_delta
    end
    function evaluate_play_debuff(text, disp_text, poker_hands, scoring_hand, non_loc_disp_text, percent, percent_delta)
    	mult = mod_mult(0)
        hand_chips = mod_chips(0)
        SMODS.displayed_hand = nil
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = (function()
                	if SMODS.hand_debuff_source then SMODS.hand_debuff_source:juice_up(0.3,0) else
                		if (G.GAME.modifiers.ccc_bside and G.GAME.modifiers.ccc_bside >= 2) and G.GAME.ccc_bonus_blind:debuff_hand(G.play.cards, poker_hands, text, true) then
                			SMODS.juice_up_blind('ccc_bonus_blind')
                		end
                		if G.GAME.blind:debuff_hand(G.play.cards, poker_hands, text, true) then
                			SMODS.juice_up_blind()
                		end
                	end
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
                    play_sound('tarot2', 0.76, 0.4);return true end}))
                play_sound('tarot2', 1, 0.4)
                return true
            end)
        }))

        play_area_status_text("Not Allowed!")--localize('k_not_allowed_ex'), true)
        if G.GAME.special_levels and (G.GAME.special_levels["not_allowed"] > 0) then
            if pseudorandom('rhea') < G.GAME.probabilities.normal * ((G.GAME.special_levels["not_allowed"]) % 2) / 2 then
                level_up_hand(used_tarot, text, nil, math.ceil((G.GAME.special_levels["not_allowed"]) / 2))
            elseif G.GAME.special_levels["not_allowed"] >= 2 then
                level_up_hand(used_tarot, text, nil, math.floor((G.GAME.special_levels["not_allowed"]) / 2))
            end
        end
        --+++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
        --Joker Debuff Effects
        --+++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
        -- context.debuffed_hand calculations
        SMODS.calculate_context({full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, debuffed_hand = true})
        
        -- TARGET: effects after hand debuffed by blind
    return text, disp_text, poker_hands, scoring_hand, non_loc_disp_text, percent, percent_delta
    end
    function evaluate_play_final_scoring(text, disp_text, poker_hands, scoring_hand, non_loc_disp_text, percent, percent_delta)
    G.E_MANAGER:add_event(Event({
    	trigger = 'after',delay = 0.4,
        func = (function()  update_hand_text({delay = 0, immediate = true}, {mult = 0, chips = 0, chip_total = math.floor( SMODS.calculate_round_score() ), level = '', handname = ''});play_sound('button', 0.9, 0.6);return true end)
      }))
      for name, parameter in pairs(SMODS.Scoring_Parameters) do
          update_hand_text({delay = 0}, {[name] = parameter.default_value})
      end
      check_and_set_high_score('hand',  SMODS.calculate_round_score() )

      check_for_unlock({type = 'chip_score', chips = math.floor( SMODS.calculate_round_score() )})
   
    if  SMODS.calculate_round_score()  > 0 then 
        delay(0.8)
        G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = (function() play_sound('chips2');return true end)
        }))
    end
    G.E_MANAGER:add_event(Event({
      trigger = 'ease',
      blocking = false,
      ref_table = G.GAME,
      ref_value = 'chips',
      ease_to = G.GAME.chips + math.floor( SMODS.calculate_round_score() ),
      delay =  0.5,
      func = (function(t) return math.floor(t) end)
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'ease',
      blocking = true,
      ref_table = G.GAME.current_round.current_hand,
      ref_value = 'chip_total',
      ease_to = 0,
      delay =  0.5,
      func = (function(t) return math.floor(t) end)
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'immediate',
      	func = (function() G.GAME.current_round.current_hand.handname = '';return true end)
      }))
      delay(0.3)
      return text, disp_text, poker_hands, scoring_hand, non_loc_disp_text, percent, percent_delta
      end
      function evaluate_play_after(text, disp_text, poker_hands, scoring_hand, non_loc_disp_text, percent, percent_delta)
    SMODS.last_hand_oneshot = SMODS.calculate_round_score() > G.GAME.blind.chips
    G.E_MANAGER:add_event(Event({
      trigger = 'immediate',
      func = (function() 
        for name, parameter in pairs(SMODS.Scoring_Parameters) do
            parameter.current = parameter.default_value
        end
        return true 
      end)
    }))
    
    SMODS.displaying_scoring = nil

    if G.GAME.temporary_bust_limit then
        G.GAME.hit_bust_limit = ( G.GAME.hit_bust_limit or 21) - G.GAME.temporary_bust_limit
        G.GAME.temporary_bust_limit = nil
        G.GAME.blind:set_text()
    end
    -- context.after calculations
    SMODS.calculate_context({full_hand = G.play.cards, scoring_hand = scoring_hand, scoring_name = text, poker_hands = poker_hands, after = true})
    
    -- TARGET: effects after hand evaluation
    local blindlist = {
    	'blind',
    	'ccc_bonus_blind',
    }
    
    for _, v in ipairs(blindlist) do
    	if not G.GAME[v].disabled and G.GAME[v].name == 'ccc_The Shriek' then
    		delay(0.3)
    		G.E_MANAGER:add_event(Event({
            		trigger = 'immediate',
            		func = (function()
    				for i = 1, #G.hand.cards do
    					G.hand.cards[i].ability.ccc_shriek = true
    					G.GAME[v]:debuff_card(G.hand.cards[i], true)
    				end
    				SMODS.juice_up_blind(v)
            			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
            				play_sound('tarot2', 0.76, 0.4);return true end}))
            			play_sound('tarot2', 1, 0.4)
            			return true
            		end)
            	}))
    		delay(0.3)
    	end
    end
    if (G.GAME.beast_wave == 'bl_reverse_final_pestilence' or G.GAME.blind.name == 'bl_reverse_final_pestilence') and not G.GAME.blind.disabled then
        for k, v in pairs(G.play.cards) do
            SMODS.debuff_card(v, true, 'bl_reverse_final_pestilence')
                                        G.E_MANAGER:add_event(Event({
                                            func = function()
                                                v:juice_up()
                                                return true
                                            end
                                        }))
        end
    end
    if G.GAME.blind.name == 'bl_reverse_black' then
        for k, v in pairs(G.play.cards) do
            v:set_ability(G.P_CENTERS.c_base, nil, true)
                                        G.E_MANAGER:add_event(Event({
                                            func = function()
                                                v:juice_up()
                                                return true
                                            end
                                        }))
        end
    end
    if G.GAME.blind.name == "bl_reverse_ehwaz" then
        local holder = G.hand
        G.hand = G.play
        G.play = holder
    end
    G.GAME.current_round.akyrs_hands_played = G.GAME.current_round.akyrs_hands_played or {}
    G.GAME.current_round.akyrs_hands_played[text] = true

    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = (function()     
            if G.GAME.modifiers.debuff_played_cards then 
                for k, v in ipairs(scoring_hand) do v.ability.perma_debuff = true end
            end
        return true end)
      }))

  end
  
  G.FUNCS.draw_from_play_to_discard = function(e)
  local to_hand = rh_draw_from_play_to_hand()
    local play_count = #G.play.cards
    local it = 1
    for k, v in ipairs(G.play.cards) do
        if (not v.shattered) and (not v.destroyed) and (not v.burnt) and (not v.shredded) then
            local to_discard = true
            for kh, vh in ipairs(to_hand) do
                if v == vh then
                    to_discard = false
                end
            end
            if to_discard then
                if next(find_joker('ccc_Climbing Gear')) then
                	draw_card(G.play,G.deck, it*100/play_count,'down', false, v)
                	G.deck:shuffle('nr'..G.GAME.round_resets.ante)
                	local cards = {}
                	for i=1, #G.deck.cards - 1 do
                	    while i <= #G.deck.cards and G.deck.cards[i].seal == "prism_green_old" do
                	        table.insert(cards, G.deck.cards[i])
                	        table.remove(G.deck.cards,i)
                	    end
                	end
                	for _, card in pairs(cards) do
                	    local pos = (pseudorandom('green') < 0.5 and #G.deck.cards) or pseudorandom('green_pos', 1, #G.deck.cards + 1)
                	    table.insert(G.deck.cards,pos,card)
                	end
                	for i = 1, #G.deck.cards do
                	    if G.deck.cards[i].ability and G.deck.cards[i].ability.shuffle_bottom then
                	        G.deck.cards[i].ability.hit_hermit_indicator = G.deck.cards[i].ability.shuffle_bottom
                	        G.deck.cards[i].ability.shuffle_bottom = G.deck.cards[i].ability.shuffle_bottom - 1
                	        if G.deck.cards[i].ability.shuffle_bottom == 0 then
                	            G.deck.cards[i].ability.shuffle_bottom = nil
                	        end
                	        local card = G.deck.cards[i]
                	        table.remove(G.deck.cards, i)
                	        table.insert(G.deck.cards, 1, card)
                	    end
                	    G.deck:set_ranks()
                	end
                	for i = #G.deck.cards, 1, -1 do
                	    if G.deck.cards[i].ability and G.deck.cards[i].ability.shuffle_top then
                	        G.deck.cards[i].ability.hit_moon_indicator = G.deck.cards[i].ability.shuffle_top
                	        G.deck.cards[i].ability.shuffle_top = G.deck.cards[i].ability.shuffle_top - 1
                	        if G.deck.cards[i].ability.shuffle_top == 0 then
                	            G.deck.cards[i].ability.shuffle_top = nil
                	        end
                	        local card = G.deck.cards[i]
                	        table.remove(G.deck.cards, i)
                	        table.insert(G.deck.cards, card)
                	    end
                	    G.deck:set_ranks()
                	end
                else
                if v.seal == "prism_green" and not v.ability.greened then
                    v.ability.greened = true
                	draw_card(G.play,G.hand, it*100/play_count,'up', true, v)
                elseif v.config.cycling then
                    v.config.cycling = false
                	draw_card(G.play,G.deck, it*100/play_count,'down', false, v)
                	G.deck:shuffle('hitr'..G.GAME.round_resets.ante)
                else
                draw_card(G.play,G.discard, it*100/play_count,'down', false, v)
                end
                end
            end 
            it = it + 1
        end
    end
  end

  G.FUNCS.draw_from_play_to_hand = function(cards)
    local gold_count = #cards
    for i=1, gold_count do --draw cards from play
        if not cards[i].shattered and not cards[i].destroyed then
            draw_card(G.play,G.hand, i*100/gold_count,'up', true, cards[i])
        end
    end
  end
  
  G.FUNCS.draw_from_discard_to_deck = function(e)
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            local discard_count = #G.discard.cards
            for i=1, discard_count do --draw cards from deck
                draw_card(G.discard, G.deck, i*100/discard_count,'up', nil ,nil, 0.005, i%2==0, nil, math.max((21-i)/20,0.7))
            end
            return true
        end
      }))
  end

  G.FUNCS.draw_from_hand_to_deck = function(e)
    local hand_count = #G.hand.cards
    for i=1, hand_count do --draw cards from deck
        draw_card(G.hand, G.deck, i*100/hand_count,'down', nil, nil,  0.08)
    end
  end
  
  G.FUNCS.draw_from_hand_to_discard = function(e)
    local hand_count = #G.hand.cards
    for i=1, hand_count do
        draw_card(G.hand,G.discard, i*100/hand_count,'down', nil, nil, 0.07)
    end
end

G.FUNCS.evaluate_round = function()
    total_cashout_rows = 0
    local pitch = 0.95
    local dollars = 0

    if G.GAME.chips - G.GAME.blind.chips >= 0 then
        add_round_eval_row({dollars = G.GAME.blind.dollars, name='blind1', pitch = pitch})
        pitch = pitch + 0.06
        dollars = dollars + G.GAME.blind.dollars
    else
        local should_win = false
        if G.GAME.blind.debuff.special_blind and G.GAME.aiko_puzzle_win then
            if G.GAME.aiko_puzzle_win then
                --print("win")
                should_win = true
            end
        elseif G.GAME.akyrs_mathematics_enabled and G.GAME.akyrs_character_stickers_enabled then
            if (G.GAME.blind and AKYRS.is_value_within_threshold(G.GAME.blind.chips, G.GAME.chips, G.GAME.akyrs_math_threshold)) or AKYRS.compare(G.GAME.current_round.hands_left,"<",1) or AKYRS.does_hand_only_contain_symbols(G.hand) then
                should_win = true
            end
        end
        if should_win then 
            add_round_eval_row({dollars = G.GAME.blind.dollars, name='blind1', pitch = pitch})
            dollars = dollars + G.GAME.blind.dollars
        else
        add_round_eval_row({dollars = 0, name='blind1', pitch = pitch, saved = true})
        end
        pitch = pitch + 0.06
    end

    G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 1.3*math.min(G.GAME.blind.dollars+2, 7)/2*0.15 + 0.5,
        func = function()
          if (G.GAME.modifiers.ccc_bside and G.GAME.modifiers.ccc_bside >= 2) then
          	G.GAME.ccc_bonus_blind:defeat(true)
          end
          G.GAME.blind:defeat()
          return true
        end
      }))
    delay(0.2)
    G.E_MANAGER:add_event(Event({
        func = function()
            ease_background_colour_blind(G.STATES.ROUND_EVAL, '')
            return true
        end
    }))
    SMODS.calculate_context{round_eval = true}
    G.GAME.selected_back:trigger_effect({context = 'eval'})
    G.GAME.paperback.domino_ranks = {}

    if G.GAME.current_round.hands_left > 0 and not G.GAME.modifiers.no_extra_hand_money then
        add_round_eval_row({dollars = G.GAME.current_round.hands_left*(G.GAME.modifiers.money_per_hand or 1), disp = G.GAME.current_round.hands_left, bonus = true, name='hands', pitch = pitch})
        pitch = pitch + 0.06
        dollars = dollars + G.GAME.current_round.hands_left*(G.GAME.modifiers.money_per_hand or 1)
    end
    if G.GAME.current_round.discards_left > 0 and G.GAME.modifiers.money_per_discard then
        add_round_eval_row({dollars = G.GAME.current_round.discards_left*(G.GAME.modifiers.money_per_discard), disp = G.GAME.current_round.discards_left, bonus = true, name='discards', pitch = pitch})
        pitch = pitch + 0.06
        dollars = dollars +  G.GAME.current_round.discards_left*(G.GAME.modifiers.money_per_discard)
    end
    if G.GAME.selected_partner_card and G.GAME.selected_partner_card.ability then
        local ret = G.GAME.selected_partner_card:calculate_partner_cash()
        if ret then
            add_round_eval_row({dollars = ret, bonus = true, name = "partner", pitch = pitch, card = G.GAME.selected_partner_card})
            pitch = pitch + 0.06
            dollars = dollars + ret
        end
    end
    local i = 0
    for _, area in ipairs(SMODS.get_card_areas('jokers')) do
            for _, _card in ipairs(area.cards) do
            local ret = _card:calculate_dollar_bonus()
    
            -- TARGET: calc_dollar_bonus per card
            if ret then
                i = i+1
                add_round_eval_row({dollars = ret, bonus = true, name='joker'..i, pitch = pitch, card = _card})
                pitch = pitch + 0.06
                dollars = dollars + ret
            end
        end
    end
    for i = 1, #G.GAME.tags do
        local ret = G.GAME.tags[i]:apply_to_run({type = 'eval'})
        if ret then
            add_round_eval_row({dollars = ret.dollars, bonus = true, name='tag'..i, pitch = pitch, condition = ret.condition, pos = ret.pos, tag = ret.tag})
            pitch = pitch + 0.06
            dollars = dollars + ret.dollars
        end
    end
    if G.GAME.dollars >= 5 and not G.GAME.modifiers.no_interest and not next(SMODS.find_card('j_paperback_better_call_jimbo', false))  then
    if not next(SMODS.find_card("j_jokerhub_broker")) then
        add_round_eval_row({bonus = true, name='interest', pitch = pitch, dollars = G.GAME.interest_amount*math.min(math.floor(G.GAME.dollars/Bakery_API.interest_scale()), G.GAME.interest_cap/5)})
        pitch = pitch + 0.06
        if (not G.GAME.seeded and not G.GAME.challenge) or SMODS.config.seeded_unlocks then
            if G.GAME.interest_amount*math.min(math.floor(G.GAME.dollars/Bakery_API.interest_scale()), G.GAME.interest_cap/5) == G.GAME.interest_amount*G.GAME.interest_cap/5 then 
                G.PROFILES[G.SETTINGS.profile].career_stats.c_round_interest_cap_streak = G.PROFILES[G.SETTINGS.profile].career_stats.c_round_interest_cap_streak + 1
            else
                G.PROFILES[G.SETTINGS.profile].career_stats.c_round_interest_cap_streak = 0
            end
        end
        check_for_unlock({type = 'interest_streak'})
        dollars = dollars + G.GAME.interest_amount*math.min(math.floor(G.GAME.dollars/Bakery_API.interest_scale()), G.GAME.interest_cap/5)
        else
        local brokers = SMODS.find_card("j_jokerhub_broker")
        for i = 1, #brokers do
        	SMODS.scale_card(brokers[i], {
        		ref_table = brokers[i].ability.extra,
        		ref_value = "chips",
        		scalar_value = "scaling",
        		message_colour = G.C.CHIPS,
        		operation = function(ref_table, ref_value, initial, change)
        			ref_table[ref_value] = initial + G.GAME.interest_amount*math.min(math.floor(G.GAME.dollars/Bakery_API.interest_scale()), G.GAME.interest_cap/5)*change
        		end
        	})
        end
        end
    end

    pitch = pitch + 0.06

    if total_cashout_rows > 7 then
        local total_hidden = total_cashout_rows - 7
    
        G.E_MANAGER:add_event(Event({
            trigger = 'before',delay = 0.38,
            func = function()
                local hidden = {n=G.UIT.R, config={align = "cm"}, nodes={
                    {n=G.UIT.O, config={object = DynaText({
                        string = {localize{type = 'variable', key = 'cashout_hidden', vars = {total_hidden}}}, 
                        colours = {G.C.WHITE}, shadow = true, float = false, 
                        scale = 0.45,
                        font = G.LANGUAGES['en-us'].font, pop_in = 0
                    })}}
                }}
    
                G.round_eval:add_child(hidden, G.round_eval:get_UIE_by_ID('bonus_round_eval'))
                return true
            end
        }))
    end
    cash_out_xp = 0
    if (G.GAME.area == "Ghost Town") and G.GAME.area_data and (pseudorandom('ghost') < G.GAME.probabilities.normal/(G.GAME.area_data.ghost_odds or 3)) then
        add_custom_round_eval_row("Ghost Town" , "$".. G.GAME.area_data.ghost_dollars, nil, G.C.MONEY)
        pitch = pitch + 0.06
        dollars = dollars + G.GAME.area_data.ghost_dollars
    end
    if (G.GAME.blind_on_deck == "Boss") then
        local stake_key = G.P_CENTER_POOLS.Stake[G.GAME.stake].key
        local plus_xp = 100
        local name = localize('boss_blind')
        if G.GAME.modifiers and G.GAME.modifiers.force_stake_xp then
            plus_xp = G.GAME.modifiers.force_stake_xp
        end
        if G.GAME.blind and G.GAME.blind.config.blind.boss.showdown then
            plus_xp = math.floor(plus_xp * 2)
            name = localize('showdown_blind')
        end
        if plus_xp and (plus_xp > 0) then
            add_custom_round_eval_row(name , tostring(get_modded_xp(plus_xp)) .. " XP")
            cash_out_xp = cash_out_xp + get_modded_xp(plus_xp)
        end
    end
    if skill_active("sk_grm_skillful_1") then
        add_custom_round_eval_row("Skillful I" , tostring(get_modded_xp(30)) .. " XP")
        cash_out_xp = cash_out_xp + get_modded_xp(30)
    end
    for i0 = 1, #G.jokers.cards do
        local ret0 = G.jokers.cards[i0]:calculate_xp_bonus()
        if ret0 then
            local joker_name = localize {type = 'name_text', key = G.jokers.cards[i0].config.center.key, set = 'Joker'}
            G.jokers.cards[i0]:juice_up(0.7, 0.46)
            add_custom_round_eval_row(joker_name , tostring(get_modded_xp(ret0)) .. " XP")
            cash_out_xp = cash_out_xp + get_modded_xp(ret0)
        end
    end
    if G.GAME.used_vouchers['v_grm_progress'] or G.GAME.used_vouchers['v_grm_complete'] then
        local intrest = math.min(G.GAME.xp_interest_max, math.floor(G.GAME.skill_xp / G.GAME.xp_interest_rate) * G.GAME.xp_interest)
        if intrest < 0 then
            intrest = 0
        end
        local intrest_text = " "..localize{type = 'variable', key = 'xp_interest', vars = {G.GAME.xp_interest, G.GAME.xp_interest_rate, G.GAME.xp_interest_max}}
        intrest = get_modded_xp(intrest)
        if intrest ~= 0 then
            add_custom_round_eval_row(intrest_text , tostring(intrest) .. " XP", intrest)
            cash_out_xp = cash_out_xp + intrest
        end
    end
    add_round_eval_row({name = 'bottom', dollars = dollars})
    Talisman.dollars = dollars
    
    for i = 1, #G.jokers.cards do
    	SMODS.debuff_card(G.jokers.cards[i], false, "jh_syphon")
    end
end

G.FUNCS.tutorial_controller = function()
    if G.F_SKIP_TUTORIAL then
        G.SETTINGS.tutorial_complete = true
        G.SETTINGS.tutorial_progress = nil
        return
    end
    G.SETTINGS.tutorial_progress = G.SETTINGS.tutorial_progress or 
    {
        forced_shop = {'j_joker', 'c_empress'},
        forced_voucher = 'v_grabber',
        forced_tags = {'tag_handy', 'tag_garbage'},
        hold_parts = {},
        completed_parts = {},
    }
    if not G.SETTINGS.paused and (not G.SETTINGS.tutorial_complete) then
        if G.STATE == G.STATES.BLIND_SELECT and G.blind_select and not G.SETTINGS.tutorial_progress.completed_parts['small_blind'] then
            G.SETTINGS.tutorial_progress.section = 'small_blind'
            G.FUNCS.tutorial_part('small_blind')
            G.SETTINGS.tutorial_progress.completed_parts['small_blind']  = true
            G:save_progress()
        end
        if G.STATE == G.STATES.BLIND_SELECT and G.blind_select and not G.SETTINGS.tutorial_progress.completed_parts['big_blind'] and G.GAME.round > 0 then
            G.SETTINGS.tutorial_progress.section = 'big_blind'
            G.FUNCS.tutorial_part('big_blind')
            G.SETTINGS.tutorial_progress.completed_parts['big_blind']  = true
            G.SETTINGS.tutorial_progress.forced_tags = nil
            G:save_progress()
        end
        if G.STATE == G.STATES.SELECTING_HAND and not G.SETTINGS.tutorial_progress.completed_parts['second_hand'] and G.SETTINGS.tutorial_progress.hold_parts['big_blind'] then
            G.SETTINGS.tutorial_progress.section = 'second_hand'
            G.FUNCS.tutorial_part('second_hand')
            G.SETTINGS.tutorial_progress.completed_parts['second_hand']  = true
            G:save_progress()
        end
        if G.SETTINGS.tutorial_progress.hold_parts['second_hand'] then
            G.SETTINGS.tutorial_complete = true
        end
        if not G.SETTINGS.tutorial_progress.completed_parts['first_hand_section'] then 
            if G.STATE == G.STATES.SELECTING_HAND and not G.SETTINGS.tutorial_progress.completed_parts['first_hand'] then
                G.SETTINGS.tutorial_progress.section = 'first_hand'
                G.FUNCS.tutorial_part('first_hand')
                G.SETTINGS.tutorial_progress.completed_parts['first_hand']  = true
                G:save_progress()
            end
            if G.STATE == G.STATES.SELECTING_HAND and not G.SETTINGS.tutorial_progress.completed_parts['first_hand_2'] and G.SETTINGS.tutorial_progress.hold_parts['first_hand']  then
                G.FUNCS.tutorial_part('first_hand_2')
                G.SETTINGS.tutorial_progress.completed_parts['first_hand_2']  = true
                G:save_progress()
            end
            if G.STATE == G.STATES.SELECTING_HAND and not G.SETTINGS.tutorial_progress.completed_parts['first_hand_3'] and G.SETTINGS.tutorial_progress.hold_parts['first_hand_2']  then
                G.FUNCS.tutorial_part('first_hand_3')
                G.SETTINGS.tutorial_progress.completed_parts['first_hand_3']  = true
                G:save_progress()
            end
            if G.STATE == G.STATES.SELECTING_HAND and not G.SETTINGS.tutorial_progress.completed_parts['first_hand_4'] and G.SETTINGS.tutorial_progress.hold_parts['first_hand_3']  then
                G.FUNCS.tutorial_part('first_hand_4')
                G.SETTINGS.tutorial_progress.completed_parts['first_hand_4']  = true
                G.SETTINGS.tutorial_progress.completed_parts['first_hand_section']  = true
                G:save_progress()
            end
        end
         if G.STATE == G.STATES.SHOP and G.shop and G.shop.VT.y < 5 and not G.SETTINGS.tutorial_progress.completed_parts['shop_1'] then
            G.SETTINGS.tutorial_progress.section = 'shop'
            G.FUNCS.tutorial_part('shop_1')
            G.SETTINGS.tutorial_progress.completed_parts['shop_1']  = true
            G.SETTINGS.tutorial_progress.forced_voucher = nil
            G:save_progress()
        end
    end
end

G.FUNCS.tutorial_part = function(_part)
    local step = 1
    G.SETTINGS.paused = true
    if _part == 'small_blind' then 
        step = tutorial_info({
            text_key = 'sb_1',
            attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = 0}},
            step = step,
        })
        step = tutorial_info({
            text_key = 'sb_2',
            attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = 0}},
            step = step,
        })
        step = tutorial_info({
            text_key = 'sb_3',
            highlight = {
                G.blind_select.UIRoot.children[1].children[1].config.object:get_UIE_by_ID('blind_name'),
                G.blind_select.UIRoot.children[1].children[1].config.object:get_UIE_by_ID('blind_desc'),
            },
            attach = {major =  G.blind_select.UIRoot.children[1].children[1], type = 'tr', offset = {x = 2, y = 4}},
            step = step,
        })
        step = tutorial_info({
            text_key = 'sb_4',
            highlight = {
                G.blind_select.UIRoot.children[1].children[1]
            },
            snap_to = function() 
                if G.blind_select and G.blind_select.UIRoot and G.blind_select.UIRoot.children[1] and G.blind_select.UIRoot.children[1].children[1] and G.blind_select.UIRoot.children[1].children[1].config.object then 
                    return G.blind_select.UIRoot.children[1].children[1].config.object:get_UIE_by_ID('select_blind_button') end
                end,
            attach = {major =  G.blind_select.UIRoot.children[1].children[1], type = 'tr', offset = {x = 2, y = 4}},
            step = step,
            no_button = true,
            button_listen = 'select_blind'
        })
    elseif _part == 'big_blind' then 
        step = tutorial_info({
            text_key = 'bb_1',
            highlight = {
                G.blind_select.UIRoot.children[1].children[2].config.object:get_UIE_by_ID('blind_name'),
                G.blind_select.UIRoot.children[1].children[2].config.object:get_UIE_by_ID('blind_desc'),
            },
            hard_set = true,
            attach = {major =  G.HUD, type = 'cm', offset = {x = 0, y = -2}},
            step = step,
        })
        step = tutorial_info({
            text_key = 'bb_2',
            highlight = {
                G.blind_select.UIRoot.children[1].children[2].config.object:get_UIE_by_ID('blind_name'),
                G.blind_select.UIRoot.children[1].children[2].config.object:get_UIE_by_ID('tag_desc'),
            },
            attach = {major =  G.HUD, type = 'cm', offset = {x = 0, y = -2}},
            step = step,
        })
        step = tutorial_info({
            text_key = 'bb_3',
            highlight = {
                G.blind_select.UIRoot.children[1].children[3].config.object:get_UIE_by_ID('blind_name'),
                G.blind_select.UIRoot.children[1].children[3].config.object:get_UIE_by_ID('blind_desc'),
            },
            attach = {major =  G.HUD, type = 'cm', offset = {x = 0, y = -2}},
            step = step,
        })
        step = tutorial_info({
            text_key = 'bb_4',
            highlight = {
                G.blind_select.UIRoot.children[1].children[3].config.object:get_UIE_by_ID('blind_name'),
                G.blind_select.UIRoot.children[1].children[3].config.object:get_UIE_by_ID('blind_desc'),
                G.blind_select.UIRoot.children[1].children[3].config.object:get_UIE_by_ID('blind_extras'),
                G.HUD:get_UIE_by_ID('hud_ante')
            },
            attach = {major =  G.HUD, type = 'cm', offset = {x = 0, y = -2}},
            step = step,
        })
        step = tutorial_info({
            text_key = 'bb_5',
            loc_vars = {G.GAME.win_ante},
            highlight = {
                G.blind_select,
                G.HUD:get_UIE_by_ID('hud_ante')
            },
            attach = {major =  G.HUD, type = 'cm', offset = {x = 0, y = -2}},
            step = step,
            no_button = true,
            snap_to = function() 
                if G.blind_select and G.blind_select.UIRoot and G.blind_select.UIRoot.children[1] and G.blind_select.UIRoot.children[1].children[2] and
                G.blind_select.UIRoot.children[1].children[2].config.object then 
                    return G.blind_select.UIRoot.children[1].children[2].config.object:get_UIE_by_ID('select_blind_button') end
                end,
            button_listen = 'select_blind'
        })
    elseif _part == 'first_hand' then
        step = tutorial_info({
            text_key = 'fh_1',
            attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = 0}},
            step = step,
        })
        step = tutorial_info({
            text_key = 'fh_2',
            highlight = {
                G.HUD:get_UIE_by_ID('hand_text_area')
            },
            attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = 0}},
            step = step,
        })
        step = tutorial_info({
            text_key = 'fh_3',
            attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = 0}},
            highlight = {
                G.HUD:get_UIE_by_ID('run_info_button')
            },
            no_button = true,
            button_listen = 'run_info',
            snap_to = function() return G.HUD:get_UIE_by_ID('run_info_button') end,
            step = step,
        })
    elseif _part == 'first_hand_2' then
        step = tutorial_info({
            hard_set = true,
            text_key = 'fh_4',
            highlight = {
                G.hand,
                G.HUD:get_UIE_by_ID('run_info_button')
            },
            attach = {major = G.hand, type = 'cl', offset = {x = -1.5, y = 0}},
            snap_to = function() return G.hand.cards[1] end,
            step = step,
        })
        step = tutorial_info({
            text_key = 'fh_5',
            highlight = {
                G.hand,
                G.buttons:get_UIE_by_ID('play_button'),
                G.HUD:get_UIE_by_ID('run_info_button')
            },
            attach = {major = G.hand, type = 'cl', offset = {x = -1.5, y = 0}},
            no_button = true,
            button_listen = 'play_cards_from_highlighted',
            step = step,
        })
    elseif _part == 'first_hand_3' then
        step = tutorial_info({
            hard_set = true,
            text_key = 'fh_6',
            highlight = {
                G.hand,
                G.buttons:get_UIE_by_ID('discard_button'),
                G.HUD:get_UIE_by_ID('run_info_button')
            },
            attach = {major = G.hand, type = 'cl', offset = {x = -1.5, y = 0}},
            no_button = true,
            button_listen = 'discard_cards_from_highlighted',
            step = step,
        })
    elseif _part == 'first_hand_4' then
        step = tutorial_info({
            hard_set = true,
            text_key = 'fh_7',
            highlight = {
                G.HUD:get_UIE_by_ID('hud_hands').parent,
            },
            attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = 0}},
            step = step,
        })
        step = tutorial_info({
            text_key = 'fh_8',
            highlight = {
                G.HUD:get_UIE_by_ID('hud_hands').parent,
                G.HUD:get_UIE_by_ID('row_dollars_chips'),
                G.HUD_blind
            },
            attach = {major = G.ROOM_ATTACH, type = 'cm', offset = {x = 0, y = 0}},
            step = step,
        })
    elseif _part == 'second_hand' then
        step = tutorial_info({
            text_key = 'sh_1',
            hard_set = true,
            highlight = {
                G.jokers
            },
            attach = {major =  G.HUD, type = 'cm', offset = {x = 0, y = -2}},
            step = step,
        })
        local empress = find_joker('The Empress')[1]
        if empress then 
            step = tutorial_info({
                text_key = 'sh_2',
                highlight = {
                    empress
                },
                attach = {major =  G.HUD, type = 'cm', offset = {x = 0, y = -2}},
                step = step,
            })
            step = tutorial_info({
                text_key = 'sh_3',
                attach = {major =  G.HUD, type = 'cm', offset = {x = 0, y = -2}},
                highlight = {
                    empress,
                    G.hand
                },
                no_button = true,
                button_listen = 'use_card',
                snap_to = function() return G.hand.cards[1] end,
                step = step,
            })
        end
    elseif _part == 'shop_1' then
        step = tutorial_info({
            hard_set = true,
            text_key = 's_1',
            highlight = {
                G.SHOP_SIGN,
                G.HUD:get_UIE_by_ID('dollar_text_UI').parent.parent.parent
            },
            attach = {major = G.shop, type = 'tm', offset = {x = 0, y = 4}},
            step = step,
        })
        step = tutorial_info({
            text_key = 's_2',
            highlight = {
                G.SHOP_SIGN,
                G.HUD:get_UIE_by_ID('dollar_text_UI').parent.parent.parent,
                G.shop_jokers.cards[2],
            },
            snap_to = function() return G.shop_jokers.cards[2] end,
            attach = {major = G.shop, type = 'tr', offset = {x = -0.5, y = 6}},
            no_button = true,
            button_listen = 'buy_from_shop',
            step = step,
        })
        step = tutorial_info({
            text_key = 's_3',
            loc_vars = {#G.P_CENTER_POOLS.Joker},
            highlight = function() return {
                G.SHOP_SIGN,
                G.HUD:get_UIE_by_ID('dollar_text_UI').parent.parent.parent,
                G.jokers.cards[1],
            } end,
            attach = {major = G.shop, type = 'tm', offset = {x = 0, y = 6}},
            step = step,
        })
        step = tutorial_info({
            text_key = 's_4',
            highlight = function() return {
                G.SHOP_SIGN,
                G.HUD:get_UIE_by_ID('dollar_text_UI').parent.parent.parent,
                G.jokers.cards[1],
            } end,
            attach = {major = G.shop, type = 'tm', offset = {x = 0, y = 6}},
            step = step,
        })
        step = tutorial_info({
            text_key = 's_5',
            highlight = function() return {
                G.SHOP_SIGN,
                G.HUD:get_UIE_by_ID('dollar_text_UI').parent.parent.parent,
                G.jokers,
            } end,
            attach = {major = G.shop, type = 'tm', offset = {x = 0, y = 6}},
            step = step,
        })
        step = tutorial_info({
            text_key = 's_6',
            highlight = function() return {
                G.SHOP_SIGN,
                G.HUD:get_UIE_by_ID('dollar_text_UI').parent.parent.parent,
                G.shop_jokers.cards[1],
            } end,
            snap_to = function() return G.shop_jokers.cards[1] end,
            no_button = true,
            button_listen = 'buy_from_shop',
            attach = {major = G.shop, type = 'tr', offset = {x = -0.5, y = 6}},
            step = step,
        })
        step = tutorial_info({
            text_key = 's_7',
            highlight = function() return {
                G.SHOP_SIGN,
                G.HUD:get_UIE_by_ID('dollar_text_UI').parent.parent.parent,
                G.consumeables.cards[#G.consumeables.cards],
            } end,
            attach = {major = G.shop, type = 'tm', offset = {x = 0, y = 6}},
            step = step,
        })
        step = tutorial_info({
            text_key = 's_8',
            highlight = function() return {
                G.SHOP_SIGN,
                G.HUD:get_UIE_by_ID('dollar_text_UI').parent.parent.parent,
                G.consumeables
            } end,
            attach = {major = G.shop, type = 'tm', offset = {x = 0, y = 6}},
            step = step,
        })
        step = tutorial_info({
            text_key = 's_9',
            highlight = function() return {
                G.SHOP_SIGN,
                G.HUD:get_UIE_by_ID('dollar_text_UI').parent.parent.parent,
                G.shop_vouchers,
            } end,
            snap_to = function() return G.shop_vouchers.cards[1] end,
            attach = {major = G.shop, type = 'tr', offset = {x = -4, y = 6}},
            step = step,
        })
        step = tutorial_info({
            text_key = 's_10',
            highlight = function() return {
                G.SHOP_SIGN,
                G.HUD:get_UIE_by_ID('dollar_text_UI').parent.parent.parent,
                G.shop_vouchers,
            } end,
            attach = {major = G.shop, type = 'tr', offset = {x = -4, y = 6}},
            step = step,
        })
        step = tutorial_info({
            text_key = 's_11',
            highlight = function() return {
                G.SHOP_SIGN,
                G.HUD:get_UIE_by_ID('dollar_text_UI').parent.parent.parent,
                G.shop_booster,
            } end,
            snap_to = function() return G.shop_booster.cards[1] end,
            attach = {major = G.shop, type = 'tl', offset = {x = 3, y = 6}},
            step = step,
        })
        step = tutorial_info({
            text_key = 's_12',
            highlight = function() return {
                G.shop:get_UIE_by_ID('next_round_button'),
            } end,
            snap_to = function() if G.shop then return G.shop:get_UIE_by_ID('next_round_button') end end,
            no_button = true,
            button_listen = 'toggle_shop',
            attach = {major = G.shop, type = 'tm', offset = {x = 0, y = 6}},
            step = step,
        })
    end

    
    G.E_MANAGER:add_event(Event({
        blockable = false,
        timer = 'REAL',
        func = function()
            if (G.OVERLAY_TUTORIAL.step == step and
            not G.OVERLAY_TUTORIAL.step_complete) or G.OVERLAY_TUTORIAL.skip_steps then
                if G.OVERLAY_TUTORIAL.Jimbo then G.OVERLAY_TUTORIAL.Jimbo:remove() end
                if G.OVERLAY_TUTORIAL.content then G.OVERLAY_TUTORIAL.content:remove() end
                G.OVERLAY_TUTORIAL:remove()
                G.OVERLAY_TUTORIAL = nil
                G.SETTINGS.tutorial_progress.hold_parts[_part]=true
                return true
            end
            return G.OVERLAY_TUTORIAL.step > step or G.OVERLAY_TUTORIAL.skip_steps
        end
    }), 'tutorial') 
    G.SETTINGS.paused = false
end
