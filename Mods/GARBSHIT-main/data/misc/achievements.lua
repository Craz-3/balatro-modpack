return {
SMODS.Atlas({
	key = "garb_achievements",
	path = "garb_achievements.png",
	px = 66,
	py = 66
}),

SMODS.Achievement({
	key = "corr_upgrade",
	bypass_all_unlocked = true,
	atlas = "garb_achievements",
	-- reset_on_startup = true,
	unlock_condition = function(self, args)
		if args.type == "corrupted" then
			return true
		end
	end
}),

SMODS.Achievement({
	key = "surged",
	bypass_all_unlocked = true,
	atlas = "garb_achievements",
	-- reset_on_startup = true,
	unlock_condition = function(self, args)
		if args.type == "surged" then
			return true
		end
	end
}),

SMODS.Achievement({
	key = "rocking",
	bypass_all_unlocked = true,
	atlas = "garb_achievements",
	-- reset_on_startup = true,
	unlock_condition = function(self, args)
		if args.type == "rocking" then
			return true
		end
	end
}),

SMODS.Achievement({
	key = "jimboss",
	bypass_all_unlocked = true,
	atlas = "garb_achievements",
	-- reset_on_startup = true,
	unlock_condition = function(self, args)
		if args.type == "mustdie" then
			return true
		end
	end
}),

SMODS.Achievement({
	key = "snowedin",
	bypass_all_unlocked = true,
	atlas = "garb_achievements",
	-- reset_on_startup = true,
	unlock_condition = function(self, args)
		if args.type == "snowedin" then
			return true
		end
	end
}),

SMODS.Achievement({
	key = "valoky",
	bypass_all_unlocked = true,
	atlas = "garb_achievements",
	-- reset_on_startup = true,
	unlock_condition = function(self, args)
		if next(SMODS.find_card("j_garb_valoky")) and next(SMODS.find_card("j_garb_obsession")) then
			return true
		end
	end
}),

SMODS.Achievement({
	key = "shot",
	bypass_all_unlocked = true,
	atlas = "garb_achievements",
	-- reset_on_startup = true,
	unlock_condition = function(self, args)
		if args.type == "shot" then
			return true
		end
	end
}),

SMODS.Achievement({
	key = "doubleornothing",
	bypass_all_unlocked = true,
	atlas = "garb_achievements",
	-- reset_on_startup = true,
	unlock_condition = function(self, args)
		if args.type == "doubleornothing" then
			return true
		end
	end
}),



SMODS.Achievement({
	key = "regicide",
	bypass_all_unlocked = true,
	atlas = "garb_achievements",
	pos = { x = 2, y = 0 },
	-- reset_on_startup = true,
	hidden_name = true,
	hidden_text = true,
	unlock_condition = function(self, args)
		if args.type == "regicide" then
			return true
		end
	end
}),

SMODS.Achievement({
	key = "str_flush_five",
	bypass_all_unlocked = true,
	atlas = "garb_achievements",
	-- reset_on_startup = true,
	hidden_name = true,
	hidden_text = true,
	unlock_condition = function(self, args)
		if args.type == "str_flush_five" then
			return true
		end
	end
}),

SMODS.Achievement({
	key = "beheading",
	bypass_all_unlocked = true,
	atlas = "garb_achievements",
	pos = { x = 3, y = 0 },
	-- reset_on_startup = true,
	hidden_name = true,
	hidden_text = true,
	unlock_condition = function(self, args)
		if args.type == "beheading" then
			return true
		end
	end
}),

SMODS.Achievement({
	key = "thehive",
	bypass_all_unlocked = true,
	atlas = "garb_achievements",
	pos = { x = 3, y = 0 },
	-- reset_on_startup = true,
	hidden_name = true,
	hidden_text = true,
	unlock_condition = function(self, args)
		if args.type == "thehive" then
			return true
		end
	end
}),

SMODS.Achievement({
	key = "funisinfinite",
	bypass_all_unlocked = true,
	atlas = "garb_achievements",
	pos = { x = 3, y = 0 },
	-- reset_on_startup = true,
	hidden_name = true,
	hidden_text = true,
	unlock_condition = function(self, args)
		if args.type == "funisinfinite" then
			return true
		end
	end
}),

SMODS.Achievement({
	key = "betterthangarb",
	bypass_all_unlocked = true,
	atlas = "garb_achievements",
	pos = { x = 3, y = 0 },
	-- reset_on_startup = true,
	hidden_name = true,
	hidden_text = true,
	unlock_condition = function(self, args)
		if args.type == "betterthangarb" then
			return true
		end
	end
}),

SMODS.Achievement({
	key = "cute",
	bypass_all_unlocked = true,
	atlas = "garb_achievements",
	pos = { x = 2, y = 0 },
	-- reset_on_startup = true,
	hidden_name = true,
	hidden_text = true,
	unlock_condition = function(self, args)
		if args.type == "cute" then
			return true
		end
	end
}),

SMODS.Achievement({
	key = "silksong",
	bypass_all_unlocked = true,
	atlas = "garb_achievements",
	pos = { x = 3, y = 0 },
	-- reset_on_startup = true,
	hidden_name = true,
	hidden_text = true,
	unlock_condition = function(self, args)
		if args.type == "silksong" then
			return true
		end
	end
}),
}
