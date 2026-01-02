local j = {
  loc_txt = {
    name = "Witch",                                   
        text = {
            "Each card in the",
	    "hand is counted"                   
        },
  },
  config = {},
  rarity = 4,
  cost = 20,
  atlas = 22,
  soul_pos = 29,

  blueprint_compat = false,
}

function j:loc_vars(_, card)
	return {}
end


function j:calculate(card, context)
	if not context.blueprint and context.before and context.scoring_hand then
		local score = true
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i] == card then
				break
			end
                	if G.jokers.cards[i].config.center.key == "j_dd_witch" and not (G.jokers.cards[i] == card) then 
				score = false
			end
            	end
		if score then
			for i = 1, #G.hand.cards do
				context.scoring_hand[#context.scoring_hand + 1] = G.hand.cards[i]
			end
		end
	end
end


if JokerDisplay then
    JokerDisplay.Definitions["j_dd_witch"] = {
        scoring_function = function(playing_card, scoring_hand, joker_card)
	    local check = false
	    for i = 1, #G.hand.cards do
		if playing_card == G.hand.cards[i] then
			check = true
		end
            end
            return check
        end
    }
    JokerDisplay.get_scoring_hand = function()
    	local count_facedowns = false
    	if G.STATE ~= G.STATES.HAND_PLAYED then
        	JokerDisplay.current_hand = {}
        	if G.STATE == G.STATES.SELECTING_HAND and G.hand and G.hand.highlighted then
            		for i = 1, #G.hand.highlighted do
                		JokerDisplay.current_hand[i] = G.hand.highlighted[i]
            		end
        	end
    	else
        	count_facedowns = true
    	end

    	local text, poker_hands, scoring_hand = JokerDisplay.evaluate_hand(JokerDisplay.current_hand or {}, count_facedowns)
	if next(find_joker("j_dd_witch")) then
		local count_facedowns = false
    		if G.STATE ~= G.STATES.HAND_PLAYED then
        		JokerDisplay.current_hand = {}
        		if G.STATE == G.STATES.SELECTING_HAND and G.hand and G.hand.highlighted then
            			for i = 1, #G.hand.cards do
                			JokerDisplay.current_hand[i] = G.hand.cards[i]
            			end
        		end
    		else
        		count_facedowns = true
    		end

    		local text2, poker_hands2, scoring_hand2 = JokerDisplay.evaluate_hand(JokerDisplay.current_hand or {}, count_facedowns)
		text = text2
		scoring_hand = scoring_hand2
	end

    	JokerDisplay.current_hand_info = {
        	text = text,
        	poker_hands = poker_hands,
        	scoring_hand = scoring_hand
    	}
   end
end

return j