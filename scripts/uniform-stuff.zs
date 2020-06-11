/*
 * Various mods add items that are either the same or very, very similar. This makes for a messs in JEI, and conflicting recipes.
 * For all of these we try to pick once version that we will keep, and we disable the rest.
 */

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.betterwithmods.Saw;
import mods.jei.JEI;

/*
 * Completely replace an item with another item.
 *
 * This means no longer being able to craft the replaced item, nor being able to find it in JEI.
 * A shapeless recipe will be added to convert the replaced item with the replacement item, in case people already have
 * the replaced item, or are still somehow able to acquire it.
 * All recipes using the replaced item will use the replacement item.
 */
function removeInFavorOf(replaced as IItemStack, replacement as IItemStack) {
   JEI.removeAndHide(replaced);
   recipes.addShapeless(replacement, [replaced]);
   recipes.replaceAllOccurences(replaced, replacement);
}

// BetterWithMods adds a waterwheel and a windmill, but we already have these from Immersive Engineering, so disable them.
removeInFavorOf(<betterwithmods:axle_generator:0>, <immersiveengineering:wooden_device1:1>);
removeInFavorOf(<betterwithmods:axle_generator:1>, <immersiveengineering:wooden_device1:0>);
removeInFavorOf(<betterwithmods:axle_generator:2>, <immersiveengineering:wooden_device1:1>);
removeInFavorOf(<betterwithmods:material:11>, <immersiveengineering:material:12>);

// Wooden gears. These are the worst, so many mods add them.
removeInFavorOf(<appliedenergistics2:material:40>, <thermalfoundation:material:22>);
removeInFavorOf(<betterwithmods:material:0>, <thermalfoundation:material:22>);
removeInFavorOf(<enderio:item_material:9>, <thermalfoundation:material:22>);
recipes.replaceAllOccurences(<thermalfoundation:material:22>, <ore:gearWood>);
Saw.remove(<betterwithmods:material:0>);
Saw.add(<betterwithmods:corner_wood>, [<thermalfoundation:material:22> * 2]);

// Stone gears.
removeInFavorOf(<enderio:item_material:10>, <thermalfoundation:material:23>);
recipes.replaceAllOccurences(<thermalfoundation:material:23>, <ore:gearStone>);
