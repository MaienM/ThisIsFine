/*
 * Fixes for items with multiple variants, that are lacking recipes for some variants.
 *
 * For example there are various different pressure plates, with appropriate recipes for many types of wood. There are
 * also types of wood that do have a matching pressure plate but are lacking a recipe (like the variants from chisel),
 * and ones that don't have a matching pressure plate (which will craft into the generic version).
 */

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import scripts.utils.getItemsForIngredients;
import scripts.utils.addItemCycle;

/**
 * Helper method to find all items that do not yet appear in a recipe resulting in an item in the given oredict.
 *
 * Note that recipes added by crafttweaker scripts cannot be queried immediately, so these will not be taken into
 * consideration. You can pass a blacklist of ingredients that you know have already been handled to exclude them from
 * the result.
 */
function getItemsLackingRecipeFor(
	targetOreDict as IOreDictEntry,
	ingredients as IIngredient,
	blacklist as IIngredient[]
) as IIngredient {
	var matchingItems as IIngredient = null;
	for item in getItemsForIngredients([ingredients]) {
		var hasMatchingRecipe as bool = false;
		for outputItem in getItemsForIngredients([targetOreDict]) {
			for recipe in recipes.getRecipesFor(outputItem) {
				var matches = false;
				for ingredient in recipe.ingredients1D {
					if (!isNull(ingredient) && ingredient.matches(item)) {
						matches = true;
						break;
					}
				}
				if (matches) {
					hasMatchingRecipe = true;
					break;
				}
			}
			if (hasMatchingRecipe) {
				break;
			}
		}
		for blacklistIngredient in blacklist {
			if (blacklistIngredient.matches(item)) {
				hasMatchingRecipe = true;
				break;
			}
		}
		if (!hasMatchingRecipe) {
			if (isNull(matchingItems)) {
				matchingItems = item;
			} else {
				matchingItems |= item;
			}
		}
	}
	return matchingItems;
}

/*
 * Pressure plates.
 */

// Specific pressure plates for some variants of the built-in woods.
recipes.replaceAllOccurences(
	<minecraft:planks:1>,
	<minecraft:planks:1> | <quark:vertical_planks:1> | <chisel:planks-spruce:*>,
	<quark:spruce_pressure_plate>
);
recipes.replaceAllOccurences(
	<minecraft:planks:2>,
	<minecraft:planks:2> | <quark:vertical_planks:2> | <chisel:planks-birch:*>,
	<quark:birch_pressure_plate>
);
recipes.replaceAllOccurences(
	<minecraft:planks:3>,
	<minecraft:planks:3> | <quark:vertical_planks:3> | <chisel:planks-jungle:*>,
	<quark:jungle_pressure_plate>
);
recipes.replaceAllOccurences(
	<minecraft:planks:4>,
	<minecraft:planks:4> | <quark:vertical_planks:4> | <chisel:planks-acacia:*>,
	<quark:acacia_pressure_plate>
);
recipes.replaceAllOccurences(
	<minecraft:planks:5>,
	<minecraft:planks:5> | <quark:vertical_planks:5> | <chisel:planks-dark-oak:*>,
	<quark:dark_oak_pressure_plate>
);
// Wooden pressure plate for all varieties of wood that don't have a specific pressure plate variant.
// The recipes that we just altered aren't available yet, so we need to take these into account manually.
recipes.replaceAllOccurences(
	<minecraft:planks:0>,
	getItemsLackingRecipeFor(<ore:pressurePlateWood>, <ore:plankWood>, [
		<minecraft:planks:*>,
		<quark:vertical_planks:*>,
		<chisel:planks-spruce:*>,
		<chisel:planks-birch:*>,
		<chisel:planks-jungle:*>,
		<chisel:planks-acacia:*>,
		<chisel:planks-dark-oak:*>,
	]) | <minecraft:planks:0> | <quark:vertical_planks:0>,
	<minecraft:wooden_pressure_plate>
);

/*
 * Trapdoors.
 */

// Specific trapdoors for some variants of the built-in woods.
recipes.replaceAllOccurences(
	<minecraft:planks:1>,
	<minecraft:planks:1> | <quark:vertical_planks:1> | <chisel:planks-spruce:*>,
	<quark:spruce_trapdoor>
);
recipes.replaceAllOccurences(
	<minecraft:planks:2>,
	<minecraft:planks:2> | <quark:vertical_planks:2> | <chisel:planks-birch:*>,
	<quark:birch_trapdoor>
);
recipes.replaceAllOccurences(
	<minecraft:planks:3>,
	<minecraft:planks:3> | <quark:vertical_planks:3> | <chisel:planks-jungle:*>,
	<quark:jungle_trapdoor>
);
recipes.replaceAllOccurences(
	<minecraft:planks:4>,
	<minecraft:planks:4> | <quark:vertical_planks:4> | <chisel:planks-acacia:*>,
	<quark:acacia_trapdoor>
);
recipes.replaceAllOccurences(
	<minecraft:planks:5>,
	<minecraft:planks:5> | <quark:vertical_planks:5> | <chisel:planks-dark-oak:*>,
	<quark:dark_oak_trapdoor>
);
// Quark adds an ore:plankWood -> trapdoor recipe, but this includes woods that _do_ have specific trapdoors, so remove
// this and re-do it to avoid conflicting recipes.
recipes.removeByRecipeName('quark:trapdoor');
// Wooden trapdoor for all varieties of wood that don't have a specific trapdoor variant.
// The recipes that we just altered aren't available yet, so we need to take these into account manually.
recipes.replaceAllOccurences(
	<minecraft:planks:0>,
	getItemsLackingRecipeFor(<ore:trapdoorWood>, <ore:plankWood>, [
		<minecraft:planks:*>,
		<quark:vertical_planks:*>,
		<chisel:planks-spruce:*>,
		<chisel:planks-birch:*>,
		<chisel:planks-jungle:*>,
		<chisel:planks-acacia:*>,
		<chisel:planks-dark-oak:*>,
	]) | <minecraft:planks:0> | <quark:vertical_planks:0>,
	<minecraft:trapdoor>
);

// There's two types of trapdoors for some wood types, from quark and from malisisdoors. Unlike some other duplicates we
// want to keep both, as they are aesthetically different. The main recipes we just made are to the quark ones, so now
// create shapeless recipes to convert to/from the malisisdoors equivalents.
recipes.remove(<malisisdoors:trapdoor_spruce>);
addItemCycle([<malisisdoors:trapdoor_spruce>, <quark:spruce_trapdoor>]);
recipes.remove(<malisisdoors:trapdoor_birch>);
addItemCycle([<malisisdoors:trapdoor_birch>, <quark:birch_trapdoor>]);
recipes.remove(<malisisdoors:trapdoor_jungle>);
addItemCycle([<malisisdoors:trapdoor_jungle>, <quark:jungle_trapdoor>]);
recipes.remove(<malisisdoors:trapdoor_acacia>);
addItemCycle([<malisisdoors:trapdoor_acacia>, <quark:acacia_trapdoor>]);
recipes.remove(<malisisdoors:trapdoor_dark_oak>);
addItemCycle([<malisisdoors:trapdoor_dark_oak>, <quark:dark_oak_trapdoor>]);
