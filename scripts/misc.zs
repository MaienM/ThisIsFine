import crafttweaker.event.BlockFarmlandTrampleEvent;
import crafttweaker.item.IIngredient;

// Prevent trampling farmland.
events.onFarmlandTrample(function(event as BlockFarmlandTrampleEvent) {
	event.cancel();
});

// Change the windmill to use a rope instead of an iron ingot, making it available a bit earlier.
recipes.replaceAllOccurences(<minecraft:iron_ingot>, <betterwithmods:rope>, <immersiveengineering:wooden_device1:1>);

// Smelt sand to glass shards instead of full blocks, to motivate moving to a crucible as quickly as possible.
furnace.remove(<minecraft:glass>);
furnace.addRecipe(<quark:glass_shards>, <minecraft:sand>);

// Use bronze instead of gold in latches.
recipes.replaceAllOccurences(<ore:nuggetGold>, <ore:nuggetBronze>, <betterwithmods:material:34>);

// Allow converting between regular sapling and betterwithmods saplings without a bucket of dirt.
for recipe in recipes.getRecipesFor(<ore:treeSapling>) {
	if (recipe.ingredients1D.length == 2) {
		var hasBucket as bool = false;
		var itemSapling as IIngredient = null;
		for ingredient in recipe.ingredients1D {
			if (ingredient.matches(<dynamictrees:dirtbucket>)) {
				hasBucket = true;
			} else {
				for ingredientItem in ingredient.items {
					if (<ore:treeSapling> has ingredientItem) {
						itemSapling = ingredient;
						break;
					}
				}
			}
		}
		if (hasBucket && !isNull(itemSapling)) {
			recipes.removeByRecipeName(recipe.fullResourceDomain);
			recipes.addShapeless(recipe.output, [itemSapling]);
		}
	}
}

// Use any glass for Cooking with Blockheads furnace.
recipes.replaceAllOccurences(<minecraft:stained_glass:15>, <ore:blockGlass>, <cookingforblockheads:oven>);

// Allow converting forest troll leather into normal leather.
recipes.addShapeless(<minecraft:leather> * 2, [<iceandfire:troll_leather_forest>]);
