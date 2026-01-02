local mod = BANNERMOD

local function hook_poker_hand(handname, f)
	local orig = SMODS.PokerHands[handname].evaluate
	SMODS.PokerHands[handname].evaluate = function(parts, ...)
		local result = orig(parts, ...)

		if result and next(result) and mod.config.limit_poker_hand_scoring then
			return f(result, parts)
		else
			return result
		end
	end
end

local function take(tbl, amt)
	local new_tbl = {}
	for i = 1, amt do
		new_tbl[i] = tbl[i]
	end
	return new_tbl
end

hook_poker_hand('Pair', function(result, parts)
	return { take(result[1], 2) }
end)
hook_poker_hand('Two Pair', function(result, parts)
	if #parts._2 >= 2 then
		return { SMODS.merge_lists({ take(parts._2[1], 2), take(parts._2[2], 2) }) }
	else
		return result
	end
end)
hook_poker_hand('Three of a Kind', function(result, parts)
	return { take(result[1], 3) }
end)
hook_poker_hand('Four of a Kind', function(result, parts)
	return { take(result[1], 4) }
end)
