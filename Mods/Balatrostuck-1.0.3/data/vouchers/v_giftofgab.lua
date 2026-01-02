function Balatrostuck.INIT.Vouchers.v_giftofgab()
    SMODS.Voucher {
        key = 'giftofgab',
        loc_txt = {
            name = 'Gift Of Gab',
            text = {
                'Every {C:zodiac}Zodiac{} gets the ',
                'same odd of spawning'
            },
            unlock = {'Get a Zodiac to',
                    'level 5 or higher'}
        },
        pos = {x=0,y=1},
        loc_vars = function(self, info_queue, card)
            art_credit('garb', info_queue)
            return {true}
        end,

        check_for_unlock = function(self,args)
            if args.type == 'bstuck_giftofgab' then
                unlock_card(self)
            end
        end,
        unlocked = false,
        atlas = 'HomestuckVouchers',
        requires = {'v_bstuck_riseup'}
    }
end