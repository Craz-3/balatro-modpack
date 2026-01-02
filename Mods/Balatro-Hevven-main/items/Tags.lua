-- Some Good Parts
SMODS.Tag({
    key = "some_good_parts",
    no_collection = false,
    discovered = true,
    atlas = "tags",
    pos = {
        x = 4,
        y = 0
    },
    
    loc_vars = function(self, info_queue, card)
        return {
            vars= {
                G.GAME and G.GAME.current_round.rh_flow_good_parts_percentage or 60,
                G.GAME and G.GAME.probabilities.normal or 1,
                G.GAME and G.GAME.current_round.rh_flow_good_parts_chances or 8
            }
        }
    end,
	in_pool = function()
		return false
	end,
    apply = function(self, tag, context)
		if context.type == "shop_start" then
            tag:yep("", G.C.SECONDARY_SET.FLOW, function() return true end)
			tag.triggered = true
            return true
		end
	end,
    credit = {
        art = "missingnumber",
        code = "TheAltDoc",
        concept = "TheAltDoc"
    }
})

-- You
SMODS.Tag({
    key = "you",
    no_collection = false,
    discovered = true,
    atlas = "tags",
    pos = {
        x = 5,
        y = 0
    },
	in_pool = function()
		return false
	end,
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { key = "rh_you_sticker", set = "Other" }
	end,
    apply = function(self, tag, context)
        if context.type == "shop_start" then
            tag:yep("", G.C.SECONDARY_SET.FLOW, function() return true end)
			tag.triggered = true
            return true
		end
	end,
    credit = {
        art = "missingnumber",
        code = "TheAltDoc",
        concept = "TheAltDoc"
    }
})

-- Skill Star
SMODS.Tag({
    key = "skill_star",
    loc_vars = function(self, info_queue, card)
        return {
            vars= {
                G.GAME.current_round.skill_star and G.GAME.current_round.skill_star.percentage or 5,
                G.GAME.current_round.skill_star and G.GAME.current_round.skill_star.base_money or 1,
                G.GAME.current_round.skill_star and G.GAME.current_round.skill_star.max_money or 40
            }
        }
    end,
    no_collection = false,
    discovered = true,
    atlas = "tags",
    pos = {
        x = 3,
        y = 0
    },
	in_pool = function()
		return false
	end,
    apply = function(self, tag, context)
        if context.type == "eval" then
            local percentage = ((to_big(G.GAME.chips)/to_big(G.GAME.blind.chips))-1)*100
            local base_dollar = to_big(math.floor(percentage/G.GAME.current_round.skill_star.percentage*G.GAME.current_round.skill_star.base_money))
            if base_dollar > to_big(G.GAME.current_round.skill_star.max_money) then
                base_dollar = G.GAME.current_round.skill_star.max_money
            end
            tag:yep('+', G.C.GOLD, function() return true end)
			tag.triggered = true
            return {
                dollars = base_dollar,
                condition = "Got a Skill Star",
                pos = self.pos,
                tag = self
            }
		end
	end,
    credit = {
        art = "missingnumber",
        code = "TheAltDoc",
        concept = "patataofcourse"
    }
})

-- Simple Tap
SMODS.Tag({
    key = "simple_tap",
    no_collection = false,
    discovered = true,
    atlas = "tags",
    pos = {
        x = 2,
        y = 0
    },
	in_pool = function()
		return false
	end,
    apply = function(self, tag, context)
		if context.type == "shop_start" then
            tag:yep("", G.C.SECONDARY_SET.FLOW, function() return true end)
			tag.triggered = true
            return true
		end
	end,

    credit = {
        art = "missingnumber",
        code = "TheAltDoc",
        concept = "patataofcourse"
    }
})

-- New Record
SMODS.Tag({
    key = "new_record",
    no_collection = false,
    discovered = true,
    atlas = "tags",
    pos = {
        x = 1,
        y = 0
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "tag_rare", set = "Other" }
        return {
            vars = {G.GAME.current_round.rh_flow_new_record_to_beat or 0}
        }
    end,
	in_pool = function()
		return false
	end,
    apply = function(self, tag, context)
		if context.type == "eval" then
                tag:yep("", G.C.SECONDARY_SET.FLOW, function() 
                    if G.GAME.current_round.rh_flow_new_record_tag then
                        add_tag(Tag('tag_rare'))
                        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                    end 
                    return true
                end)
			tag.triggered = true
            -- return true
		end
	end,
	credit = {
        art = "missingnumber",
        code = "TheAltDoc",
		concept = "patataofcourse"
    }
})

-- The Performer (random pack)
SMODS.Tag({
    key = "random",
    no_collection = false,
    discovered = true,
    atlas = "tags",
    pos = {
        x = 1,
        y = 1
    },
	in_pool = function()
		return false
	end,
    apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
            tag:yep('+', G.C.PURPLE,function() 
                local d100 = pseudorandom(pseudoseed('performer'), 1, 100)
                local key = "p_arcana_normal_1"
                if d100 > 5 then
                    local pool = {}
                    for _, v in ipairs(get_current_pool("Booster")) do
                        if v ~= "UNAVAILABLE" and v:sub(1, 2) == "p_" then -- Also checking if it starts with p_ and thus is a booster, to go around Equilibrium in Cryptid
                            pool[#pool+1] = v
                        end
                    end
                    key = pseudorandom_element(pool, pseudoseed("performer"))
                else
                    key = 'p_rh_legendary'
                end
                sendDebugMessage("Spawning booster "..key, "rhTagRandom")
                local card = Card(G.play.T.x + G.play.T.w/2 - G.CARD_W*1.27/2,
                G.play.T.y + G.play.T.h/2-G.CARD_H*1.27/2, G.CARD_W*1.27, G.CARD_H*1.27, G.P_CARDS.empty, G.P_CENTERS[key], {bypass_discovery_center = true, bypass_discovery_ui = true})
                card.cost = 0
                card.from_tag = true
                G.FUNCS.use_card({config = {ref_table = card}})
                card:start_materialize()
                return true
            end)
            tag.triggered = true
            return true
		end
	end,
	credit = {
        art = "missingnumber",
        code = "TheAltDoc",
		concept = "missingnumber"
    }
})

-- Mega Flow Pack
SMODS.Tag({
    key = "mega_flow",
    no_collection = false,
    discovered = true,
    atlas = "tags",
    pos = {
        x = 0,
        y = 1
    },
    apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
            tag:yep('+', G.C.PURPLE,function() 
                local card = Card(G.play.T.x + G.play.T.w/2 - G.CARD_W*1.27/2,
                G.play.T.y + G.play.T.h/2-G.CARD_H*1.27/2, G.CARD_W*1.27, G.CARD_H*1.27, G.P_CARDS.empty, G.P_CENTERS['p_rh_flow_jumbo'], {bypass_discovery_center = true, bypass_discovery_ui = true})
                card.cost = 0
                card.from_tag = true
                G.FUNCS.use_card({config = {ref_table = card}})
                card:start_materialize()
                return true
            end)
            tag.triggered = true
            return true
		end
	end,
	credit = {
        art = "missingnumber",
        code = "TheAltDoc",
		concept = "missingnumber"
    }
})