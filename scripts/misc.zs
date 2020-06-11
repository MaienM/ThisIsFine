// Change the windmill to use a rope instead of an iron ingot, making it available a bit earlier.
recipes.replaceAllOccurences(<minecraft:iron_ingot>, <betterwithmods:rope>, <immersiveengineering:wooden_device1:1>);

// Smelt sand to glass shards instead of full blocks, to motivate moving to a crucible as quickly as possible.
furnace.remove(<minecraft:glass>);
furnace.addRecipe(<quark:glass_shards>, <minecraft:sand>);
