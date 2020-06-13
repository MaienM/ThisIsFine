/**
 * Plates cannot be made by hand. They can be made with the IE metal press at one ingot per plate, or the smeltery at two ingots per plate.
 */

import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import mods.immersiveengineering.MetalPress;
import mods.tconstruct.Casting;

function setupPlate(plate as IItemStack, ingot as IItemStack, fluid as ILiquidStack) {
	recipes.remove(plate);
	Casting.removeTableRecipe(plate);
	if (!isNull(fluid)) {
		Casting.addTableRecipe(plate, <tconstruct:cast_custom:3>, fluid, 288);
	}
	MetalPress.removeRecipe(plate);
	MetalPress.addRecipe(plate, ingot, <immersiveengineering:mold>, 2400, 1);
}

setupPlate(<thermalfoundation:material:32>, <minecraft:iron_ingot:0>, <liquid:iron>);
setupPlate(<thermalfoundation:material:33>, <minecraft:gold_ingot:0>, <liquid:gold>);
setupPlate(<thermalfoundation:material:320>, <thermalfoundation:material:128>, <liquid:copper>);
setupPlate(<thermalfoundation:material:321>, <thermalfoundation:material:129>, <liquid:tin>);
setupPlate(<thermalfoundation:material:322>, <thermalfoundation:material:130>, <liquid:silver>);
setupPlate(<thermalfoundation:material:323>, <thermalfoundation:material:131>, <liquid:lead>);
setupPlate(<thermalfoundation:material:324>, <thermalfoundation:material:132>, <liquid:aluminum>);
setupPlate(<thermalfoundation:material:325>, <thermalfoundation:material:133>, <liquid:nickel>);
setupPlate(<thermalfoundation:material:326>, <thermalfoundation:material:134>, <liquid:platinum>);
setupPlate(<thermalfoundation:material:327>, <thermalfoundation:material:135>, <liquid:iridium>);
setupPlate(<thermalfoundation:material:328>, <thermalfoundation:material:136>, <liquid:mithril>);
setupPlate(<thermalfoundation:material:352>, <thermalfoundation:material:160>, <liquid:steel>);
setupPlate(<thermalfoundation:material:353>, <thermalfoundation:material:161>, <liquid:electrum>);
setupPlate(<thermalfoundation:material:354>, <thermalfoundation:material:162>, <liquid:invar>);
setupPlate(<thermalfoundation:material:355>, <thermalfoundation:material:163>, <liquid:bronze>);
setupPlate(<thermalfoundation:material:356>, <thermalfoundation:material:164>, <liquid:constantan>);
setupPlate(<thermalfoundation:material:357>, <thermalfoundation:material:165>, <liquid:signalum>);
setupPlate(<thermalfoundation:material:358>, <thermalfoundation:material:166>, <liquid:lumium>);
setupPlate(<thermalfoundation:material:359>, <thermalfoundation:material:167>, <liquid:enderium>);
setupPlate(<thaumadditions:mithrillium_plate:0>, <thaumadditions:mithrillium_ingot:0>, null);
setupPlate(<thaumadditions:adaminite_plate:0>, <thaumadditions:adaminite_ingot:0>, null);
setupPlate(<thaumadditions:mithminite_plate:0>, <thaumadditions:mithminite_ingot:0>, null);
setupPlate(<thaumcraft:plate:0>, <thaumcraft:ingot:2>, <liquid:brass>);
setupPlate(<thaumcraft:plate:2>, <thaumcraft:ingot:0>, null); // Thaumium Plate
setupPlate(<thaumcraft:plate:3>, <thaumcraft:ingot:1>, null); // Void Metal Plate
setupPlate(<immersiveengineering:metal:35>, <immersiveengineering:metal:5>, <liquid:uranium>);
setupPlate(<betterwithmods:material:51>, <betterwithmods:material:14>, null); // Soulforged Steel Plate
setupPlate(<bewitchment:cold_iron_plate:0>, <bewitchment:cold_iron_ingot:0>, null);
setupPlate(<immersive_io:item_plate:2>, <enderio:item_alloy_ingot:6>, <liquid:dark_steel>);
setupPlate(<immersive_io:item_plate:3>, <enderio:item_alloy_ingot:8>, <liquid:end_steel>);
setupPlate(<immersive_io:item_plate:4>, <enderio:item_alloy_ingot:7>, <liquid:soularium>);
setupPlate(<immersiveintelligence:material_plate:0>, <immersiveintelligence:material_ingot:0>, null); // Advanced Electronic Alloy Plate
setupPlate(<immersiveintelligence:material_plate:3>, <immersiveintelligence:material_ingot:3>, <liquid:tungsten>);
setupPlate(<immersiveintelligence:material_plate:4>, <immersiveintelligence:material_ingot:4>, <liquid:zinc>);
setupPlate(<thaumicrestoration:item_plate:0>, <thaumicrestoration:item_ingot:0>, <liquid:fluid_molten_aer>);
setupPlate(<thaumicrestoration:item_plate:1>, <thaumicrestoration:item_ingot:1>, <liquid:fluid_molten_ignis>);
setupPlate(<thaumicrestoration:item_plate:2>, <thaumicrestoration:item_ingot:2>, <liquid:fluid_molten_aqua>);
setupPlate(<thaumicrestoration:item_plate:3>, <thaumicrestoration:item_ingot:3>, <liquid:fluid_molten_terra>);
setupPlate(<thaumicrestoration:item_plate:4>, <thaumicrestoration:item_ingot:4>, <liquid:fluid_molten_ordo>);
setupPlate(<thaumicrestoration:item_plate:5>, <thaumicrestoration:item_ingot:5>, <liquid:fluid_molten_perditio>);
