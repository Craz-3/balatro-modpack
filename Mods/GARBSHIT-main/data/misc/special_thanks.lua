local click_ref = Card.click
G.GARB_NAMES = {}
function garb_SpecialThanksUI()
    G.GARBSpecialTEXT = UIBox {
        definition = create_UIBox_minigametext("Hall of Great People <3", G.C.WHITE, 1.5),
        config = {
            align = "tli",
            offset = {x = 0, y = 0},
            major = G.ROOM_ATTACH,
            bond = 'Weak'
        }
    }
    G.GARBSpecialThanks = {
        "Fazzie",
        "CampfireCollective",
        "Akai",
        "Nxkoo",
        "Aikoyori",
        "Victin",
        "OmegaFlowey18",
        "Astro",
        "MrCr33ps",
        "lamborghiniofficial",
        "TheSlayerITA",
        "Mil0meg4",
        "Incognito",
        "DrSpectred",
        "MurphyObv",
        "EsattoX",
        "Heaven",
        "Doctor Flamingo",
        "Revo",
        "SDM_0",
        "Eris",
        "64suns",
        "Dvod",
        "Flote",
        "Eremel",
        "Ice",
        "Haya",
        "PLagger",
        "Yahiamice",
        "ItsPhyrra",
        "TheOneGoofAli",
        "Basil_squared",
        "and You! <3"
    }
    for k, v in pairs(G.GARBSpecialThanks) do
        local pos = k - 1
        G.GARB_NAMES[k] = UIBox {
        definition = create_UIBox_minigametext(v, G.C.EDITION, 0.5),
        config = {
            align = "tli",
            offset = {x = math.floor(pos/11)*7, y = pos-(math.floor(pos/11)*11-1)},
            major = G.ROOM_ATTACH,
            bond = 'Weak'
        }
    }
    end
end 

function garb_enterSpecialThanks()
    G.E_MANAGER:clear_queue()
    G.FUNCS.wipe_on()
    G.E_MANAGER:add_event(Event({
        no_delete = true,
        blockable = true,
        blocking = false,
        func = function()
            G.FUNCS:exit_overlay_menu()
            G:prep_stage(G.STAGES.RUN, G.STATES.garb_SPECIAL_THANKS)
            G.STATE_COMPLETE = false

            G.STAGE = G.STAGES.RUN
            G.STATE = G.STATES.garb_SPECIAL_THANKS
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
            garb_SpecialThanksUI()
        return true
        end
    }))

    GARB_SPECIAL_THANKS = true
    G.FUNCS.wipe_off()
end

local game_updateref = Game.update
function Game:update(dt)
    if GARB_SPECIAL_THANKS then
        ease_background_colour {
            new_colour = darken(G.C.BLACK, 0.4),
            special_colour = darken(G.C.BLACK, 0.4), 
            tertiary_colour = darken(G.C.EDITION, 0.7),
            contrast = 3
        }
    end
    game_updateref(self, dt)
end

function Card:click()
    click_ref(self)
    if self.config.center.key == "j_garb_director" and
        (love.keyboard.isDown('lshift') or love.keyboard.isDown('rshift')) and
        self.area.config.collection then
        self.specialcounter = self.specialcounter and (self.specialcounter + 1) or 1
        play_sound('garb_click', 0.9 + 2* self.counter * 0.0833, 1)
        if self.specialcounter >= 12 then
            play_sound('garb_secret')
            garb_enterSpecialThanks()
        end
    end
end
