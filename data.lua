local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
  {
    type = "module",
    name = "deterministic-quality-module",
    localised_description = { "item-description.quality-module" },
    icon = "__DeterministicQualityModule__/graphics/icons/quality-module.png",
    subgroup = "module",
    color_hint = { text = "Q" },
    category = "quality",
    tier = 4,
    order = "d[quality]-c[quality-module-4]",
    inventory_move_sound = item_sounds.module_inventory_move,
    pick_sound = item_sounds.module_inventory_pickup,
    drop_sound = item_sounds.module_inventory_move,
    stack_size = 20,
    weight = 50 * kg,
	-- +30% quality, -50% speed, so can put in two MASTERWORK (net +150Q -100S) and then two speed (net -50Q +100S) to get 100% but no speed penalty, but at extreme power cost (+255% ea from Q, +70% ea from S, net +650% = 7.5x)
	-- if just put four MASTERWORK quality then you get +300% quality, -80% (cap) speed, 11.2x power, for net guaranteed +1Q, 30% +2Q, 3% +3Q, 0.3% +4Q
	-- (MASTERWORK gives x2.5 module effect, so the actual 75% each this is balanced against; if you did the above with basic tier then scenario 1 you get +10%Q and scenario 2 you get 100% +1Q, 12% +2Q, 1.2% +3Q, 0.12% +4Q
    effect = { quality = 3, speed = -0.5, consumption = 2.55 }
  },
  {
    type = "recipe",
    name = "deterministic-quality-module",
    enabled = false,
	category = "electronics",
    ingredients =
    {
      {type = "item", name = "quality-module-3", amount = 5},
      {type = "item", name = "quantum-processor", amount = 10},
      {type = "item", name = "uranium-235", amount = 20}
    },
    energy_required = 180,
    results = {{type="item", name="deterministic-quality-module", amount=1}}
  },
  {
    type = "technology",
    name = "deterministic-quality-module",
    icon = "__DeterministicQualityModule__/graphics/icons/technology.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "deterministic-quality-module"
      }
    },
    prerequisites = { "quality-module-3", "quantum-processor" },
    unit =
    {
      count = 300,
      ingredients =
      {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "space-science-pack", 1 },
        { "electromagnetic-science-pack", 1 },
        { "cryogenic-science-pack", 1 },
      },
      time = 60
    },
    upgrade = true
  },
})