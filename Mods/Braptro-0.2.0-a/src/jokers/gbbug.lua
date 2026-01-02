SMODS.Joker {
    key = 'gbbug',
    loc_txt = {
        name = 'GB Bug',
        text = {
            '{C:green}#1# in 10{} chance to create a',
            '{C:dark_edition}Negative{} {C:spectral}Spectral{} card', 
            'for each played card with',
            'a {V:1}#2#{} suit',

        }
    },

    atlas = 'jokers',
    rarity = 3,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    pos = { x = 2, y = 1 },
    config = {
        extra = { }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = {
            G.GAME.probabilities.normal,
            G.GAME.current_round.gbbug_card.suit,
            colours = { G.C.SUITS[G.GAME.current_round.gbbug_card.suit] },
        }}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit(G.GAME.current_round.gbbug_card.suit) then
            if pseudorandom('gbbug') <= G.GAME.probabilities.normal/10 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'gbb')
                        card:set_edition({negative = true}, true)
                        card:add_to_deck()
                        G.consumeables:emplace(card)
                        return true
                    end
                }))
               return {
                    message = localize('k_plus_spectral'),
                    colour = G.C.SECONDARY_SET.Tarot,
                    --card = self
                }
            end
        end
    end
}

local igo = Game.init_game_object
function Game:init_game_object()
	local ret = igo(self)
	ret.current_round.gbbug_card = { suit = 'Spades' }
	return ret
end

function SMODS.current_mod.reset_game_globals(run_start)
	G.GAME.current_round.gbbug_card = { suit = 'Spades' }
	local valid_gbbug_cards = {}
	for _, v in ipairs(G.playing_cards) do
		if not SMODS.has_no_suit(v) then
			valid_gbbug_cards[#valid_gbbug_cards + 1] = v
		end
	end
	if valid_gbbug_cards[1] then
		local gbbug_card = pseudorandom_element(valid_gbbug_cards, pseudoseed('gbbug' .. G.GAME.round_resets.ante))
		G.GAME.current_round.gbbug_card.suit = gbbug_card.base.suit
	end
end
