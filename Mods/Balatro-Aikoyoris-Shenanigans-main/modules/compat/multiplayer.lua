if MP then
    AKYRS.bal = function(balance)
        balance = "adequate"
        if balance then
            return G.PROFILES[G.SETTINGS.profile].akyrs_balance == balance
        end
        return G.PROFILES[G.SETTINGS.profile].akyrs_balance
    end
end