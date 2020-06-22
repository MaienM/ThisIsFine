/*
 * Various mods add items that are either the same or very, very similar. This makes for a messs in JEI, and conflicting recipes.
 * For all of these we try to pick once version that we will keep, and we disable the rest.
 */

#priority 100

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import mods.betterwithmods.Saw;
import mods.jei.JEI;
import mods.roots.Mortar;
import scripts.utils.hash;

/**
 * Completely replace an item with another item.
 *
 * This means no longer being able to craft the replaced item, nor being able to find it in JEI.
 * A shapeless recipe will be added to convert the replaced item with the replacement item, in case people already have
 * the replaced item, or are still somehow able to acquire it. This will be a hidden recipe to avoid adding noise.
 * All recipes using the replaced item will use the replacement item.
 */
function removeInFavorOf(replaced as IItemStack, replacement as IItemStack) {
	JEI.removeAndHide(replaced);
	JEI.addDescription(replaced, [
		"This version of this item has been disabled in favor of another, and you shouldn't have been able to acquire it.",
		"Please report how you got this so we can fix this.",
		"You can put it in a crafting table to convert it to its intended replacement.",
	]);
	recipes.addHiddenShapeless(
		"convert_removed_item_ " ~ hash(replaced.commandString) ~ "_" ~ hash(replacement.commandString),
		replacement,
		[replaced]
	);
	recipes.replaceAllOccurences(replaced, replacement);
}

/**
 * Merge a group of items (with an oredict entry) into one.
 *
 * Calls removeInFavorOf for all but the first item, replacing them all with the first item in the list.
 * Will adjust all reciped to use the oredict entry rather than any specific version.
 */
function mergeGroup(oredict as IOreDictEntry, members as IItemStack[]) {
	for i, member in members {
		if (i > 0) {
			removeInFavorOf(member, members[0]);
		}
		recipes.replaceAllOccurences(member, oredict);
	}
}

// BetterWithMods adds a waterwheel and a windmill, but we already have these from Immersive Engineering, so disable them.
removeInFavorOf(<betterwithmods:axle_generator:0>, <immersiveengineering:wooden_device1:1>);
removeInFavorOf(<betterwithmods:axle_generator:1>, <immersiveengineering:wooden_device1:0>);
removeInFavorOf(<betterwithmods:axle_generator:2>, <immersiveengineering:wooden_device1:1>);
removeInFavorOf(<betterwithmods:material:11>, <immersiveengineering:material:12>);

// Sawdust.
mergeGroup(<ore:dustWood>, [
	<thermalfoundation:material:800>,
	<immersiveintelligence:material:22>,
	<betterwithmods:material:22>,
]);

// IE adds some posts, Immersive Posts add better versions, so replace these.
// Make the transform recipes also return the two fences that were used, as the base post doesn't include these.
JEI.removeAndHide(<immersiveengineering:wooden_device1:3>);
recipes.addShapeless(<immersiveposts:postbase>, [<immersiveengineering:wooden_device1:3>.giveBack(<immersiveengineering:wooden_decoration:0> * 2)]);
JEI.removeAndHide(<immersiveengineering:metal_decoration2:0>);
recipes.addShapeless(<immersiveposts:postbase>, [<immersiveengineering:metal_decoration2:0>.giveBack(<immersiveengineering:metal_decoration1:0> * 2)]);
JEI.removeAndHide(<immersiveengineering:metal_decoration2:2>);
recipes.addShapeless(<immersiveposts:postbase>, [<immersiveengineering:metal_decoration2:2>.giveBack(<immersiveengineering:metal_decoration1:4> * 2)]);

// Ingots and tools are already mostly unified, but mystical world still shows some of its stuff while it shouldn't.
removeInFavorOf(<mysticalworld:copper_dust:0>, <thermalfoundation:material:64>);
removeInFavorOf(<mysticalworld:copper_ingot:0>, <thermalfoundation:material:128>);
removeInFavorOf(<mysticalworld:copper_nugget:0>, <thermalfoundation:material:192>);
removeInFavorOf(<mysticalworld:copper_block:0>, <thermalfoundation:storage:0>);
JEI.removeAndHide(<mysticalworld:copper_dust_tiny:0>);
removeInFavorOf(<mysticalworld:silver_dust:0>, <thermalfoundation:material:66>);
removeInFavorOf(<mysticalworld:silver_ingot:0>, <thermalfoundation:material:130>);
removeInFavorOf(<mysticalworld:silver_nugget:0>, <thermalfoundation:material:194>);
removeInFavorOf(<mysticalworld:silver_block:0>, <thermalfoundation:storage:2>);
JEI.removeAndHide(<mysticalworld:silver_dust_tiny:0>);
removeInFavorOf(<mysticalworld:gold_dust:0>, <thermalfoundation:material:1>);
JEI.removeAndHide(<mysticalworld:gold_dust_tiny:0>);
removeInFavorOf(<mysticalworld:iron_dust:0>, <thermalfoundation:material:0>);
JEI.removeAndHide(<mysticalworld:iron_dust_tiny:0>);
// Some dusts can be gotten from the roots mortal & pestle, change that to give the pulverized dusts instead.
Mortar.removeRecipe(<mysticalworld:gold_dust:0>);
Mortar.addRecipe(<thermalfoundation:material:1>, [<minecraft:gold_ingot>]);
Mortar.removeRecipe(<mysticalworld:iron_dust:0>);
Mortar.addRecipe(<thermalfoundation:material:0>, [<minecraft:iron_ingot>]);
// Allow crafting tiny piles of dust into a larger pile of dust.
recipes.addShaped(<thermalfoundation:material:0>, [
	[<rustic:dust_tiny_iron:0>, <rustic:dust_tiny_iron:0>, <rustic:dust_tiny_iron:0>],
	[<rustic:dust_tiny_iron:0>, <rustic:dust_tiny_iron:0>, <rustic:dust_tiny_iron:0>],
	[<rustic:dust_tiny_iron:0>, <rustic:dust_tiny_iron:0>, <rustic:dust_tiny_iron:0>],
]);

// Duplicate crops/results.
removeInFavorOf(<randomthings:beans>, <harvestcraft:beanitem>);
removeInFavorOf(<aoa3:chilli_seeds>, <harvestcraft:chilipepperseeditem>);
removeInFavorOf(<rustic:chili_pepper_seeds>, <harvestcraft:chilipepperseeditem>);
removeInFavorOf(<aoa3:chilli>, <harvestcraft:chilipepperitem>);
removeInFavorOf(<rustic:chili_pepper>, <harvestcraft:chilipepperitem>);
removeInFavorOf(<actuallyadditions:item_coffee_seed>, <harvestcraft:coffeeseeditem>);
removeInFavorOf(<actuallyadditions:item_coffee_beans>, <harvestcraft:coffeebeanitem>);
removeInFavorOf(<aoa3:tea_seeds>, <harvestcraft:teaseeditem>);
removeInFavorOf(<aoa3:tea_shreddings>, <harvestcraft:teaitem>);
removeInFavorOf(<bewitchment:elderberries>, <harvestcraft:elderberryitem>);
removeInFavorOf(<bewitchment:juniper_berries>, <harvestcraft:juniperberryitem>);
// AoA's tea sink doesn't use oredict, so just replace the recipes with recipes with a pot.
JEI.removeAndHide(<aoa3:tea_sink>);
removeInFavorOf(<aoa3:tea>, <harvestcraft:earlgreyteaitem>);
recipes.addShapeless(
	<aoa3:natural_tea>,
	[<harvestcraft:potitem>.giveBack(), <aoa3:cup>, <harvestcraft:tealeafitem>, <aoa3:nature_melon_slice>]
);
recipes.addShapeless(
	<aoa3:fungal_tea>,
	[<harvestcraft:potitem>.giveBack(), <aoa3:cup>, <harvestcraft:tealeafitem>, <aoa3:mystic_shrooms>]
);

/*
 * Gears.
 */

mergeGroup(<ore:gearWood>, [
	<thermalfoundation:material:22>,
	<appliedenergistics2:material:40>,
	<betterwithmods:material:0>,
	<enderio:item_material:9>,
]);
Saw.remove([<betterwithmods:material:0>]);
Saw.add(<betterwithmods:corner_wood>, [<thermalfoundation:material:22> * 2]);

mergeGroup(<ore:gearStone>, [
	<thermalfoundation:material:23>,
	<enderio:item_material:10>,
]);

/*
 * Plates.
 *
 * Note that the way plates can be crafted is adjusted in a separate script (plates.zs). If the list below is changed in
 * such a way that a different plate becomes the primary/kept plate, that script will have to be adjusted accordingly.
 */

mergeGroup(<ore:plateIron>, [
	<thermalfoundation:material:32>,
	<thaumcraft:plate:1>,
	<immersiveengineering:metal:39>,
]);
mergeGroup(<ore:plateGold>, [
	<thermalfoundation:material:33>,
	<immersiveengineering:metal:40>,
]);
mergeGroup(<ore:plateCopper>, [
	<thermalfoundation:material:320>,
	<immersiveengineering:metal:30>,
]);
mergeGroup(<ore:plateSilver>, [
	<thermalfoundation:material:322>,
	<immersiveengineering:metal:33>,
	<bewitchment:silver_plate:0>,
]);
mergeGroup(<ore:plateLead>, [
	<thermalfoundation:material:323>,
	<immersiveengineering:metal:32>,
]);
mergeGroup(<ore:plateAluminum>, [
	<thermalfoundation:material:324>,
	<immersiveengineering:metal:31>,
]);
mergeGroup(<ore:plateNickel>, [
	<thermalfoundation:material:325>,
	<immersiveengineering:metal:34>,
]);
mergeGroup(<ore:platePlatinum>, [
	<thermalfoundation:material:326>,
	<immersiveintelligence:material_plate:2>,
]);
mergeGroup(<ore:plateSteel>, [
	<thermalfoundation:material:352>,
	<immersiveengineering:metal:38>,
]);
mergeGroup(<ore:plateElectrum>, [
	<thermalfoundation:material:353>,
	<immersiveengineering:metal:37>,
]);
mergeGroup(<ore:plateConstantan>, [
	<thermalfoundation:material:356>,
	<immersiveengineering:metal:36>,
]);
mergeGroup(<ore:plateBrass>, [
	<thaumcraft:plate:0>,
	<immersiveintelligence:material_plate:1>,
]);
