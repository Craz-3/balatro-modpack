local click_ref = Card.click
function Card:click()    
    click_ref(self)
    if G.garb_MINIGAME and G.garb_MINIGAME.score then
        if G.garb_MINIGAME.score > 400 then
            check_for_unlock({type = 'betterthangarb'})
        end
        if G.PROFILES[G.SETTINGS.profile].MINIGAME_HIGH_SCORE and
            G.PROFILES[G.SETTINGS.profile].MINIGAME_HIGH_SCORE <
            G.garb_MINIGAME.score and not G.garb_MINIGAME.highscore then
            G.garb_MINIGAME.highscore = true
            play_sound('garb_abadeus1', 0.9 + math.random() * 0.1, 0.8)
            card_eval_status_text(G.MINIGAME_UI, 'extra', nil, nil, nil, {
                message = "New High Score!",
                colour = G.C.MULT
            })
        end
        if G.garb_MINIGAME.phase <= G.garb_MINIGAME.score / 50 then
            G.garb_MINIGAME.phase = G.garb_MINIGAME.phase + 1
        end
        if G.garb_MINIGAME.phase == 2 and not G.garb_MINIGAME.phaseT[2] then
            ease_background_colour {
                new_colour = G.C.BLIND["Big"],
                special_colour = darken(G.C.BLACK, 0.4),
                contrast = 1
            }
            play_sound('garb_jimboss_defeat', 0.9 + math.random() * 0.1, 1)
            G.garb_MINIGAME.phaseT[G.garb_MINIGAME.phase] = true
        elseif G.garb_MINIGAME.phase == 3 and not G.garb_MINIGAME.phaseT[3] then
            ease_background_colour {
                new_colour = G.C.MULT,
                special_colour = darken(G.C.BLACK, 0.4),
                contrast = 1
            }
            play_sound('garb_jimboss_defeat', 0.9 + math.random() * 0.1, 1)
            G.garb_MINIGAME.phaseT[G.garb_MINIGAME.phase] = true
        elseif G.garb_MINIGAME.phase == 4 and not G.garb_MINIGAME.phaseT[4] then
            ease_background_colour {
                new_colour = G.C.BLUE,
                special_colour = G.C.RED,
                tertiary_colour = darken(G.C.BLACK, 0.4),
                contrast = 3
            }
            play_sound('garb_jimboss_defeat', 0.9 + math.random() * 0.1, 1)
            G.garb_MINIGAME.phaseT[G.garb_MINIGAME.phase] = true
        elseif G.garb_MINIGAME.phase == 5 and not G.garb_MINIGAME.phaseT[5] then
            check_for_unlock({type = 'kaleido_deck'})
            ease_background_colour {
                new_colour = G.C.GARB_T1,
                special_colour = G.C.GARB_T2,
                tertiary_colour = darken(G.C.BLACK, 0.4),
                contrast = 3
            }
            play_sound('garb_jimboss_defeat', 0.9 + math.random() * 0.1, 1)
            G.garb_MINIGAME.phaseT[G.garb_MINIGAME.phase] = true
        elseif G.garb_MINIGAME.phase == 6 and not G.garb_MINIGAME.phaseT[6] then
            ease_background_colour {
                new_colour = darken(G.C.BLACK, 0.4),
                special_colour = G.C.RAINBOW,
                contrast = 3
            }
            play_sound('garb_jimboss_defeat', 0.9 + math.random() * 0.1, 1)
            G.garb_MINIGAME.phaseT[G.garb_MINIGAME.phase] = true
        elseif G.garb_MINIGAME.phase >= 7 and not G.garb_MINIGAME.phaseT[G.garb_MINIGAME.phase] then
            ease_background_colour {
                new_colour = darken(G.C.BLACK, 0.4),
                special_colour = G.C.RAINBOW,
                tertiary_colour = darken(G.C.RAINBOW, 0.4),
                contrast = 3
            }
            play_sound('garb_jimboss_defeat', 0.9 + math.random() * 0.1, 1)
            G.garb_MINIGAME.phaseT[G.garb_MINIGAME.phase] = true
        end
    end

    if self.config.center.key == "j_joker" and not (self.area and self.area.config.collection) and G.STATE == 20 and
        not (self.talking or self.exploding) then
        if G.EXITBUTTON and G.EXITBUTTON.states.visible then
            ease_background_colour {
                new_colour = darken(G.C.MULT, 0.4),
                special_colour = G.C.PURPLE,
                contrast = 2
            }
            G.EXITBUTTON.states.visible = false
            G.EXITBUTTON:remove()
            G.SHOOTJIMBOTEXT:remove()
            G.HIGHSCORETEXT:remove()
        end
        G.garb_MINIGAME.lost = 0
        play_sound('garb_gunshot', 0.9 + math.random() * 0.1, 0.4)
        G.garb_MINIGAME.score = G.garb_MINIGAME.score + 1
        self.exploding = true
        for k, v in pairs(G.garb_MINIGAME.jimbos) do
            if v == self then table.remove(G.garb_MINIGAME.jimbos, k) end
        end
        self:start_dissolve()
    end
    if self.config.center.key == "j_garb_shoot_the_dealer" and
        (G.STATE == G.STATES.garb_MINIGAME or G.STATE == G.STATES.MINIGAME_OVER) and
        not self.exploding and not (self.area and self.area.config.collection) then
        play_sound('garb_jimboss_defeat', 0.9 + math.random() * 0.1, 1)
        if G.EXITBUTTON and G.EXITBUTTON.states.visible then
            ease_background_colour {
                new_colour = darken(G.C.MULT, 0.4),
                special_colour = G.C.PURPLE,
                contrast = 2
            }
            G.EXITBUTTON.states.visible = false
            G.EXITBUTTON:remove()
            G.SHOOTJIMBOTEXT:remove()
            G.HIGHSCORETEXT:remove()
        end
        G.garb_MINIGAME = {
            score = 0,
            jimbos = {},
            phase = 1,
            phaseT = {true},
            lost = 0,
            highscore = false
        }
        G.STATE = 20
        play_sound('garb_gunshot', 0.9 + math.random() * 0.1, 0.4)
        G.garb_MINIGAME.score = G.garb_MINIGAME.score + 1
        self.exploding = true
        for k, v in pairs(G.garb_MINIGAME.jimbos) do
            if v == self then table.remove(G.garb_MINIGAME.jimbos, k) end
        end
        self:start_dissolve()
    end

    if self.config.center.key == "j_golden" and not (self.area and self.area.config.collection) and G.STATE == 20 and
        not (self.talking or self.exploding) then
        G.garb_MINIGAME.lost = 0
        play_sound('garb_gunshot', 0.9 + math.random() * 0.1, 0.4)
        G.garb_MINIGAME.score = G.garb_MINIGAME.score + 3
        self.exploding = true
        for k, v in pairs(G.garb_MINIGAME.jimbos) do
            if v == self then
                table.remove(G.garb_MINIGAME.jimbos, k)
                play_sound('multhit2', 0.95, 3)
                card_eval_status_text(G.MINIGAME_UI, 'extra', nil, nil, nil,
                                      {message = "+3!"})
                G.MINIGAME_UI:juice_up(0.3)
            end
        end
        self:start_dissolve()
    end

    if self.config.center.key == "j_baron" and not (self.area and self.area.config.collection) and G.STATE == 20 and
        not (self.talking or self.exploding) then
        G.garb_MINIGAME.lost = 0
        play_sound('garb_gunshot', 0.9 + math.random() * 0.1, 0.4)
        G.garb_MINIGAME.score = G.garb_MINIGAME.score + 5
        self.exploding = true
        for k, v in pairs(G.garb_MINIGAME.jimbos) do
            if v == self then
                table.remove(G.garb_MINIGAME.jimbos, k)
                card_eval_status_text(G.MINIGAME_UI, 'extra', nil, nil, nil,
                                      {message = "+5!"})
                play_sound('multhit2', 1.2, 3)
                G.MINIGAME_UI:juice_up(0.6)
            end
        end
        self:start_dissolve()
    end

    if self.config.center.key == "j_garb_SURGE" and not (self.area and self.area.config.collection) and G.STATE == 20 and
        not (self.talking or self.exploding) then
        self.exploding = true
        minigame_over()
        self:explode()
    end

    if self.config.center.key == "j_joker" and not (self.area and self.area.config.collection) and G.STATE == 21 and
        not (self.talking or self.exploding) then
        play_sound('garb_gunshot')
        self.exploding = true
        self:start_dissolve()
    end

    if self.config.center.key == "j_garb_SURGE" and not (self.area and self.area.config.collection) and G.STATE == 21 and
        not (self.talking or self.exploding) then
        self.exploding = true
        self:explode()
    end

    if self.config.center.key == "j_garb_director" and not (self.area and self.area.config.collection) and G.STATE == 21 and
        not self.talking then
        self:add_dialogue("minigame_tutorial_" .. self.counter, "bm")
        if self.counter == 7 then
            jimbo_card_tutorial = Card(G.TILE_W / 2 - G.CARD_W * 0.66 - 2 *
                                           G.CARD_W * 1.32,
                                       G.TILE_H / 2 - G.CARD_H, G.CARD_W * 1.32,
                                       G.CARD_H * 1.32, G.P_CARDS.empty,
                                       G.P_CENTERS.j_joker, {
                bypass_discovery_center = true,
                bypass_discovery_ui = true
            })
            jimbo_card_tutorial.no_ui = true
            jimbo_card_tutorial.states.drag.can = false
            jimbo_card_tutorial:start_materialize()
        end

        if self.counter == 8 then
            surge_card_tutorial = Card(G.TILE_W / 2 - G.CARD_W * 0.66 + 2 *
                                           G.CARD_W * 1.32,
                                       G.TILE_H / 2 - G.CARD_H, G.CARD_W * 1.32,
                                       G.CARD_H * 1.32, G.P_CARDS.empty,
                                       G.P_CENTERS.j_garb_SURGE, {
                bypass_discovery_center = true,
                bypass_discovery_ui = true
            })
            surge_card_tutorial.no_ui = true
            surge_card_tutorial.states.drag.can = false
            surge_card_tutorial:start_materialize()
        end

        if self.counter >= 12 then
            if jimbo_card_tutorial then jimbo_card_tutorial:remove() end
            if surge_card_tutorial then surge_card_tutorial:remove() end
            G.PROFILES[G.SETTINGS.profile].MINIGAME_TUTORIAL_COMPLETED = true
            self:remove()
            G:save_progress()
            G.FILE_HANDLER.force = true
            garb_enterMinigame()
            ease_background_colour {
                new_colour = G.C.BLIND["Small"],
                special_colour = G.C.RED,
                contrast = 2
            }
        end
    end

    if self.config.center.key == "j_garb_garbTITLE" or self.config.center.key == "j_garb_shoot_the_dealer" and self.area and self.area.config.collection and G.STATE ~= G.STATES.garb_MINIGAME then
        play_sound('garb_knock', 0.9 + math.random() * 0.1, 1)
        if (self.counter >= 10) then
            play_sound('garb_secret')
            self.counter = 0
            garb_enterMinigame()
        end
    end
end

function garb_enterMinigame()
    G.garb_MINIGAME = {
        score = 0,
        jimbos = {},
        phase = 1,
        phaseT = {true},
        lost = 0,
        highscore = false
    }
    G.PROFILES[G.SETTINGS.profile].MINIGAME_HIGH_SCORE =
        G.PROFILES[G.SETTINGS.profile].MINIGAME_HIGH_SCORE or 0
    G.E_MANAGER:clear_queue()
    G.FUNCS.wipe_on()
    G.E_MANAGER:add_event(Event({
        no_delete = true,
        blockable = true,
        blocking = false,
        func = function()
            G.FUNCS:exit_overlay_menu()
            G:prep_stage(G.STAGES.RUN, G.STATES.garb_MINIGAME)
            G.STATE_COMPLETE = false

            G.STAGE = G.STAGES.RUN
            G.STATE =
                G.PROFILES[G.SETTINGS.profile].MINIGAME_TUTORIAL_COMPLETED and
                    G.STATES.garb_MINIGAME or G.STATES.MINIGAME_TUTORIAL
            G.ARGS.spin = {amount = 0, real = 0, eased = 0}

            G.SPLASH_BACK:define_draw_steps({
                {
                    shader = 'background',
                    send = {
                        {
                            name = 'time',
                            ref_table = G.TIMERS,
                            ref_value = 'REAL_SHADER'
                        },
                        {
                            name = 'spin_time',
                            ref_table = G.TIMERS,
                            ref_value = 'BACKGROUND'
                        },
                        {
                            name = 'colour_1',
                            ref_table = G.C.BACKGROUND,
                            ref_value = 'C'
                        },
                        {
                            name = 'colour_2',
                            ref_table = G.C.BACKGROUND,
                            ref_value = 'L'
                        },
                        {
                            name = 'colour_3',
                            ref_table = G.C.BACKGROUND,
                            ref_value = 'D'
                        },
                        {
                            name = 'contrast',
                            ref_table = G.C.BACKGROUND,
                            ref_value = 'contrast'
                        },
                        {
                            name = 'spin_amount',
                            ref_table = G.ARGS.spin,
                            ref_value = 'amount'
                        }
                    }
                }
            })
            if G.title_top then G.title_top:remove() end
            local node = G.MAIN_MENU_UI:get_UIE_by_ID("main_menu_play")
            if replace_card then replace_card:remove() end
            if G.SPLASH_LOGO then
                G.SPLASH_LOGO.states.visible = false
            end
            if node then node.children.alert.states.visible = false end
            if G.SPLASH_LOGO then G.SPLASH_LOGO:remove() end
            if G.SMODS_VERSION_UI then G.SMODS_VERSION_UI:remove() end
            if G.VERSION_UI then G.VERSION_UI:remove() end
            if G.MAIN_MENU_UI then G.MAIN_MENU_UI:remove() end
            if G.PROFILE_BUTTON then G.PROFILE_BUTTON:remove() end

            if G.STATE == 21 then
                local garbz = Card(G.TILE_W / 2 - G.CARD_W * 0.66,
                                   G.TILE_H / 2 - G.CARD_H, G.CARD_W * 1.32,
                                   G.CARD_H * 1.32, G.P_CARDS.empty,
                                   G.P_CENTERS.j_garb_director, {
                    bypass_discovery_center = true,
                    bypass_discovery_ui = true
                })
                garbz.no_ui = true
                garbz.states.drag.can = false
                garbz.counter = 1
                garbz:add_dialogue("minigame_tutorial_" .. garbz.counter, "bm")
            end
            if G.STATE == 20 then
                ease_background_colour {
                    new_colour = G.C.BLIND["Small"],
                    special_colour = G.C.RED,
                    contrast = 2
                }
                minigameUI()
                local jimboz = Card(G.TILE_W / 2 - G.CARD_W / 2,
                                    G.TILE_H / 2 - G.CARD_H / 2, G.CARD_W,
                                    G.CARD_H, G.P_CARDS.empty,
                                    G.P_CENTERS.j_garb_shoot_the_dealer, {
                    bypass_discovery_center = true,
                    bypass_discovery_ui = true
                })
                jimboz.no_ui = true
                jimboz.states.drag.can = false
                local eval = function() return true end
                juice_card_until(jimboz, eval, true)
            end
            return true
        end
    }))

    G.FUNCS.wipe_off()
    INMINIGAME = true
end

local game_updateref = Game.update
function Game:update(dt)
    game_updateref(self, dt)
    if G.STATE == 20 and not G.SETTINGS.paused and G.garb_MINIGAME.score > 0 then
        garb_MINIGAME()
    end
end

G.FUNCS.minigame_scoreboard = function(e)
    if G.CurScoreboardText ~= number_format(G.garb_MINIGAME.score) then
        G.CurScoreboardText = number_format(G.garb_MINIGAME.score)
        e.config.object.config.string = {number_format(G.garb_MINIGAME.score)}
        e.config.object:update_text(true)
        e.UIBox:recalculate()
    end
end

function create_UIBox_scoreboard()
    G.CurScoreboardText = number_format(G.garb_MINIGAME.score)
    local john_claire = {
        n = G.UIT.ROOT,
        config = {align = "cm", colour = G.C.CLEAR},
        nodes = {
            {
                n = G.UIT.R,
                config = {
                    align = "cm",
                    padding = 0.2,
                    r = 0.1,
                    emboss = 0.1,
                    colour = G.C.L_BLACK
                },
                nodes = {
                    {
                        n = G.UIT.R,
                        config = {align = "cm"},
                        nodes = {
                            {
                                n = G.UIT.T,
                                config = {
                                    text = "Score",
                                    scale = 0.4,
                                    colour = G.C.UI.TEXT_LIGHT,
                                    shadow = true
                                }
                            }
                        }
                    }, {
                        n = G.UIT.R,
                        config = {align = "cm"},
                        nodes = {
                            {
                                n = G.UIT.C,
                                config = {
                                    align = "cm",
                                    padding = 0.15,
                                    minw = 2,
                                    minh = 0.8,
                                    maxw = 2,
                                    r = 0.1,
                                    hover = false,
                                    colour = mix_colours(G.C.BLACK, G.C.GREY,
                                                         0.6)
                                },
                                nodes = {
                                    {
                                        n = G.UIT.O,
                                        config = {
                                            object = DynaText({
                                                string = number_format(
                                                    G.garb_MINIGAME.score)
                                            }),
                                            scale = 0.4,
                                            colour = G.C.UI.TEXT_LIGHT,
                                            shadow = true,
                                            func = 'minigame_scoreboard'
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return john_claire
end

function create_UIBox_minigameexit()
    local badman = {
        n = G.UIT.ROOT,
        config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15},
        nodes = {
            {
                n = G.UIT.C,
                config = {align = "tm", padding = 0.05, minw = 2.4},
                nodes = {
                    {n = G.UIT.R, config = {minh = 0.2}, nodes = {}}, {
                        n = G.UIT.R,
                        config = {
                            align = "tm",
                            padding = 0.2,
                            minh = 1.2,
                            minw = 1.8,
                            r = 0.15,
                            colour = G.C.GREY,
                            one_press = true,
                            button = 'go_to_menu',
                            hover = true,
                            shadow = true
                        },
                        nodes = {
                            {
                                n = G.UIT.T,
                                config = {
                                    text = "Quit",
                                    scale = 0.5,
                                    colour = G.C.WHITE,
                                    shadow = true,
                                    focus_args = {
                                        button = 'y',
                                        orientation = 'bm'
                                    },
                                    func = 'set_button_pip'
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return badman
end

function create_UIBox_minigametext(text, color, scale)
    local t = {
        n = G.UIT.ROOT,
        config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15},
        nodes = {
            {
                n = G.UIT.R,
                config = {align = "cm"},
                nodes = {
                    {
                        n = G.UIT.O,
                        config = {
                            object = DynaText({
                                string = {text},
                                colours = {color},
                                shadow = true,
                                float = true,
                                spacing = 10,
                                rotate = true,
                                scale = scale,
                                pop_in = 0.4,
                                maxw = 6.5
                            })
                        }
                    }
                }
            }
        }
    }
    return t
end

function minigameUI(from_death)
    if not from_death then
        G.MINIGAME_UI = UIBox {
            definition = create_UIBox_scoreboard(),
            config = {
                align = "bri",
                offset = {x = 0, y = 10},
                major = G.ROOM_ATTACH,
                bond = 'Weak'
            }
        }
    end
    G.EXITBUTTON = UIBox {
        definition = create_UIBox_minigameexit(),
        config = {
            align = "bli",
            offset = {x = 0, y = -10},
            major = G.ROOM_ATTACH,
            bond = 'Weak'
        }
    }
    G.SHOOTJIMBOTEXT = UIBox {
        definition = create_UIBox_minigametext("Shoot The Jimbo", G.C.EDITION,
                                               1.5),
        config = {
            align = "cmi",
            offset = {x = 0, y = -2},
            major = G.ROOM_ATTACH,
            bond = 'Weak'
        }
    }
    G.HIGHSCORETEXT = UIBox {
        definition = create_UIBox_minigametext("High Score: " ..
                                                   number_format(
                                                       G.PROFILES[G.SETTINGS
                                                           .profile]
                                                           .MINIGAME_HIGH_SCORE),
                                               G.C.WHITE, 1),
        config = {
            align = "cmi",
            offset = {x = 0, y = 2},
            major = G.ROOM_ATTACH,
            bond = 'Weak'
        }
    }
    -- G.SHOOTJIMBOTEXT.alignment.offset.y = 0
    G.HIGHSCORETEXT:align_to_major()
    G.SHOOTJIMBOTEXT:align_to_major()
    G.EXITBUTTON.alignment.offset.y = 0
    G.EXITBUTTON:align_to_major()
    G.MINIGAME_UI.alignment.offset.y = 0
    G.MINIGAME_UI:align_to_major()
end

function garb_MINIGAME()
    local random_delay = pseudorandom(pseudoseed(
                                          "pipis" .. math.random() ..
                                              G.TIMERS.REAL)) * 2.5 /
                             (1 + G.garb_MINIGAME.score * 0.025) * G.SETTINGS.GAMESPEED-- true randomness in MY balatro? unforgivable
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = random_delay,
        func = function()
            G.E_MANAGER:clear_queue('other')
            local xpos = G.TILE_W / 2 +
                             pseudorandom(
                                 pseudoseed(
                                     "pos" .. math.random() .. G.TIMERS.REAL),
                                 -32, 32) / 4
            local ypos = G.TILE_H / 2 +
                             pseudorandom(
                                 pseudoseed(
                                     "pos" .. math.random() .. G.TIMERS.REAL),
                                 -8, 32) / 4
            local centercard = ((pseudorandom(pseudoseed("baron" .. math.random() .. G.TIMERS.REAL)) < 0.02) and G.P_CENTERS.j_baron) or
                                   ((pseudorandom(pseudoseed("gold" .. math.random() .. G.TIMERS.REAL)) < 0.05) and G.P_CENTERS.j_golden) or
                                   G.P_CENTERS.j_joker
            centercard =
                (pseudorandom("surge") * (1 + G.garb_MINIGAME.score * 0.003) > 0.998) and
                    G.P_CENTERS.j_garb_SURGE or centercard
            G.garb_MINIGAME.jimbos[#G.garb_MINIGAME.jimbos + 1] =
                Card((xpos - G.CARD_W * 0.6), (ypos - G.CARD_H * 1.6), G.CARD_W,
                     G.CARD_H, G.P_CARDS.empty, centercard, {
                    bypass_discovery_center = true,
                    bypass_discovery_ui = true
                })
            G.garb_MINIGAME.jimbos[#G.garb_MINIGAME.jimbos].no_ui = true
            G.garb_MINIGAME.jimbos[#G.garb_MINIGAME.jimbos]:juice_up()
            G.garb_MINIGAME.jimbos[#G.garb_MINIGAME.jimbos].states.drag.can = false
            G.garb_MINIGAME.jimbos[#G.garb_MINIGAME.jimbos].timer = math.floor(4 +
                                                                         G.garb_MINIGAME
                                                                             .score *
                                                                         0.025)
            for k, v in pairs(G.garb_MINIGAME.jimbos) do
                v.timer = v.timer - 1
                if v.timer == 0 then
                    v.exploding = true
                    v:start_dissolve({G.C.RED})
                    play_sound('cancel')
                    table.remove(G.garb_MINIGAME.jimbos, k)
                    G.garb_MINIGAME.lost = G.garb_MINIGAME.lost + 1
                    if G.garb_MINIGAME.lost == 10 * G.garb_MINIGAME.score / 100 then
                        minigame_over(true)
                    end
                end
            end
            return true
        end
    }), 'other')
end

function minigame_over(from_lost)
    INMINIGAME = false
    G.PROFILES[G.SETTINGS.profile].MINIGAME_HIGH_SCORE =
        G.PROFILES[G.SETTINGS.profile].MINIGAME_HIGH_SCORE or 0
    if G.PROFILES[G.SETTINGS.profile].MINIGAME_HIGH_SCORE < G.garb_MINIGAME.score then
        G.PROFILES[G.SETTINGS.profile].MINIGAME_HIGH_SCORE = G.garb_MINIGAME.score
        G:save_progress()
        G.FILE_HANDLER.force = true
    end
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            G.STATE = G.STATES.MINIGAME_OVER
            G.E_MANAGER:clear_queue('other')
            if from_lost then
                for k, v in pairs(G.garb_MINIGAME.jimbos) do
                    v:start_dissolve({G.C.RED})
                end
            else
                for k, v in pairs(G.garb_MINIGAME.jimbos) do
                    v:explode()
                end
            end
            play_sound('negative', 0.5, 1.4)
            play_sound('whoosh2', 0.9, 1.4)
            G.garb_MINIGAME.jimbos = {}
            ease_background_colour {
                new_colour = G.C.RED,
                special_colour = darken(G.C.BLACK, 0.4),
                tertiary_colour = darken(G.C.PURPLE, 0.4),
                contrast = 1
            }
            return true
        end
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 3,
        func = function()
            minigameUI(true)
            local jimboz = Card(G.TILE_W / 2 - G.CARD_W / 2,
                                G.TILE_H / 2 - G.CARD_H / 2, G.CARD_W, G.CARD_H,
                                G.P_CARDS.empty,
                                G.P_CENTERS.j_garb_shoot_the_dealer, {
                bypass_discovery_center = true,
                bypass_discovery_ui = true
            })
            jimboz.no_ui = true
            jimboz.states.drag.can = false
            jimboz:start_materialize()
            local eval = function() return true end
            juice_card_until(jimboz, eval, true)
            return true
        end
    }))
end