
SMODS.Edition{
    key = "enchanted",
    shader = "akyrs_enchanted",
    config = {
        name = "akyrs_enchanted"
    },
    sound = { sound = "akyrs_enchanted", per = 1, vol = 0.7 },
    in_shop = false,
    loc_vars = function (self, info_queue, card)
        return {
        }
    end,
    calculate = function (self, card, context)
    end,
    weight = 0,
}

AKYRS.Enchantments = {}

---@type SMODS.Center
AKYRS.Enchantment = SMODS.GameObject:extend{
    set = "Enchantment",
    required_params = {
        "key",
        "max_level"
    },
    max_level = 1,
    get_level = function(self,ench_power)
        return self.max_level
    end,
    get_weight_from_level = function(self, level)
        return 2 ^ ((self.max_level - level) + 1)
    end,
    get_weights_for_randomiser = function (self, level)
        local weights = {}
        for single_level = 1, self.max_level do
            table.insert(weights, {
                value = {
                    key = self.key,
                    level = single_level
                },
                weight = self:get_weight_from_level(single_level)
            })
        end
        return weights
    end,

}