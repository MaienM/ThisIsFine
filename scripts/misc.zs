import crafttweaker.event.BlockFarmlandTrampleEvent;
import crafttweaker.item.IIngredient;
import mods.jei.JEI;
import mods.betterwithmods.Anvil;

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

// These items are marked as deprecated, might as well hide them in JEI.
JEI.removeAndHide(<extracells:part.base:0>);
JEI.removeAndHide(<extracells:part.base:1>);
JEI.removeAndHide(<extracells:part.base:2>);
JEI.removeAndHide(<extracells:part.base:3>);
JEI.removeAndHide(<extracells:part.base:4>);
JEI.removeAndHide(<extracells:part.base:5>);
JEI.removeAndHide(<extracells:part.base:6>);
JEI.removeAndHide(<extracells:part.base:9>);
JEI.removeAndHide(<extracells:storage.fluid:0>);
JEI.removeAndHide(<extracells:storage.fluid:1>);
JEI.removeAndHide(<extracells:storage.fluid:2>);
JEI.removeAndHide(<extracells:storage.fluid:3>);
JEI.removeAndHide(<extracells:storage.component:4>);
JEI.removeAndHide(<extracells:storage.component:5>);
JEI.removeAndHide(<extracells:storage.component:6>);
JEI.removeAndHide(<extracells:storage.component:7>);
JEI.removeAndHide(<extracells:ecbaseblock:0>);

// BetterWithMods soulforged steel has a weird block:ingot ratio of 1:16 instead of 1:9. This confuses some other mods
// (such as the Thermal Expansion factorizer), leading to some exploits. Rather than trying to fix all other mods that
// might assume 1 block = 9 ingots, fix the BWM recipes to use that ratio instead. (There are no recipes actually using
// these blocks, so this doesn't affect the balance in any way.)
Anvil.removeShaped(<betterwithmods:steel_block>);
recipes.removeByRecipeName("betterwithmods:decompress/steel_block");
recipes.addShaped(<betterwithmods:steel_block>, [
	[<betterwithmods:material:14>, <betterwithmods:material:14>, <betterwithmods:material:14>],
	[<betterwithmods:material:14>, <betterwithmods:material:14>, <betterwithmods:material:14>],
	[<betterwithmods:material:14>, <betterwithmods:material:14>, <betterwithmods:material:14>],
]);
recipes.addShapeless(<betterwithmods:material:14> * 9, [<betterwithmods:steel_block>]);
