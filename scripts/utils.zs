#priority 1000

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

/**
 * Rudimentary string hash.
 */
function hash(input as string) as string {
	var characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_:<{}[]\"' ";
	var hc = 0;
	for i in 0 to input.length {
		hc += 3023 * (i % 64);
		hc += 1439 * characters.indexOf(input[i]);
		hc %= 1000000000;
	}
	return hc as string;
}

/**
 * Get all registered item variants that match an ingredient.
 */
function getItemsForIngredients(ingredients as IIngredient[]) as IItemStack[] {
	var items as IItemStack[] = [];
	for ingredient in ingredients {
		for item in ingredient.items {
			for subItem in item.definition.subItems {
				if (ingredient.matches(subItem) && !(items has subItem)) {
					items += subItem;
				}
			}
		}
	}
	return items;
}

/**
 * Set it up so that an item can be cycled between the provided list of items.
 *
 * This means the first item when cracted by itself turns into the second item, which when crafted by itself turns into
 * the third item, and so on until the last item which will turn back into the first item, completing the cycle.
 */
function addItemCycle(items as IItemStack[]) {
	for i, item in items {
		recipes.addShapeless(item, [items[i == 0 ? (items.length - 1) : (i - 1)]]);
	}
}
