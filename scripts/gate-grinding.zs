import crafttweaker.item.IIngredient;
import mods.betterwithmods.Mill;
import mods.roots.Mortar;

// Bonemeal from mortar and pestle, not by hand.
function setupBone(input as IIngredient, mortarAmount as int, machineAmount as int) {
	Mortar.addRecipe(<minecraft:dye:15> * mortarAmount, [input]);
	Mill.addRecipe([input], [<minecraft:dye:15> * machineAmount]);
}
recipes.remove(<minecraft:dye:15>);
Mortar.removeRecipe(<minecraft:dye:15>);
Mill.remove([<minecraft:dye:15>]);
setupBone(<ore:bone>, 3, 6);
setupBone(<mod_lavacow:sharptooth>, 1, 2);
setupBone(<ore:mythicalSkull> | <iceandfire:troll_tusk>, 5, 10);
setupBone(<minecraft:bone_block> | <natura:bonemeal_bag>, 9, 9);
