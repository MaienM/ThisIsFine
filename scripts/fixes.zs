import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import mods.tconstruct.Casting;

// Fix levelup chunks (the metadata of the result was lost, so a lot of them would melt into the wrong item).
furnace.remove(<minecraft:dye:0>, <levelup2:surfaceore:6>);
furnace.remove(<thermalfoundation:material:0>, <levelup2:surfaceore:7>);
furnace.remove(<thermalfoundation:material:0>, <levelup2:surfaceore:8>);
furnace.remove(<thermalfoundation:material:0>, <levelup2:surfaceore:9>);
furnace.remove(<thermalfoundation:material:0>, <levelup2:surfaceore:10>);
furnace.remove(<thermalfoundation:material:0>, <levelup2:surfaceore:11>);
furnace.remove(<thermalfoundation:material:0>, <levelup2:surfaceore:12>);
furnace.remove(<thermalfoundation:material:0>, <levelup2:surfaceore:13>);
furnace.remove(<thermalfoundation:material:0>, <levelup2:surfaceore:14>);
furnace.remove(<thermalfoundation:material:0>, <levelup2:surfaceore:15>);
furnace.remove(<tconstruct:ingots:0>, <levelup2:netherore:2>);
furnace.addRecipe(<minecraft:dye:4>, <levelup2:surfaceore:6>, 0.1);
furnace.addRecipe(<thermalfoundation:material:128>, <levelup2:surfaceore:7>, 0.1);
furnace.addRecipe(<thermalfoundation:material:129>, <levelup2:surfaceore:8>, 0.1);
furnace.addRecipe(<thermalfoundation:material:130>, <levelup2:surfaceore:9>, 0.1);
furnace.addRecipe(<thermalfoundation:material:131>, <levelup2:surfaceore:10>, 0.1);
furnace.addRecipe(<thermalfoundation:material:132>, <levelup2:surfaceore:11>, 0.1);
furnace.addRecipe(<thermalfoundation:material:133>, <levelup2:surfaceore:12>, 0.1);
furnace.addRecipe(<thermalfoundation:material:134>, <levelup2:surfaceore:13>, 0.1);
furnace.addRecipe(<thermalfoundation:material:135>, <levelup2:surfaceore:14>, 0.1);
furnace.addRecipe(<thermalfoundation:material:136>, <levelup2:surfaceore:15>, 0.1);
furnace.addRecipe(<tconstruct:ingots:1>, <levelup2:netherore:2>, 0.1);

// Normally spectre saplings are created by right-clicking a regular sapling with ectoplasm. This isn't possible in this
// pack because all planted trees are converted to dynamic trees automatically, so allow crafting the sapling instead.
recipes.addShapeless(<randomthings:spectresapling>, [<ore:treeSapling>, <randomthings:ingredient:2>]);

// Fluxed electron can be made in a smeltery, and the items exist in JEI, but they cannot be actually be cast; fix this.
function addCastable(item as IItemStack, partType as string, costInIngots as float, fluid as ILiquidStack) {
	Casting.addTableRecipe(item, <tconstruct:cast>.withTag({ PartType: partType }), fluid, costInIngots * 144);
	Casting.addTableRecipe(item, <tconstruct:clay_cast>.withTag({ PartType: partType }), fluid, costInIngots * 144);
}
addCastable(<tconstruct:arrow_head>.withTag({ Material: "electrumflux" }), "tconstruct:arrow_head", 2, <liquid:electrumflux>);
addCastable(<tconstruct:axe_head>.withTag({ Material: "electrumflux" }), "tconstruct:axe_head", 2, <liquid:electrumflux>);
addCastable(<tconstruct:binding>.withTag({ Material: "electrumflux" }), "tconstruct:binding", 1, <liquid:electrumflux>);
addCastable(<tconstruct:bow_limb>.withTag({ Material: "electrumflux" }), "tconstruct:bow_limb", 3, <liquid:electrumflux>);
addCastable(<tconstruct:broad_axe_head>.withTag({ Material: "electrumflux" }), "tconstruct:broad_axe_head", 8, <liquid:electrumflux>);
addCastable(<tconstruct:cross_guard>.withTag({ Material: "electrumflux" }), "tconstruct:cross_guard", 1, <liquid:electrumflux>);
addCastable(<tconstruct:excavator_head>.withTag({ Material: "electrumflux" }), "tconstruct:excavator_head", 8, <liquid:electrumflux>);
addCastable(<tconstruct:hammer_head>.withTag({ Material: "electrumflux" }), "tconstruct:hammer_head", 8, <liquid:electrumflux>);
addCastable(<tconstruct:hand_guard>.withTag({ Material: "electrumflux" }), "tconstruct:hand_guard", 1, <liquid:electrumflux>);
addCastable(<tconstruct:kama_head>.withTag({ Material: "electrumflux" }), "tconstruct:kama_head", 2, <liquid:electrumflux>);
addCastable(<tconstruct:knife_blade>.withTag({ Material: "electrumflux" }), "tconstruct:knife_blade", 1, <liquid:electrumflux>);
addCastable(<tconstruct:large_plate>.withTag({ Material: "electrumflux" }), "tconstruct:large_plate", 8, <liquid:electrumflux>);
addCastable(<tconstruct:large_sword_blade>.withTag({ Material: "electrumflux" }), "tconstruct:large_sword_blade", 8, <liquid:electrumflux>);
addCastable(<tconstruct:pan_head>.withTag({ Material: "electrumflux" }), "tconstruct:pan_head", 3, <liquid:electrumflux>);
addCastable(<tconstruct:pick_head>.withTag({ Material: "electrumflux" }), "tconstruct:pick_head", 2, <liquid:electrumflux>);
addCastable(<tconstruct:scythe_head>.withTag({ Material: "electrumflux" }), "tconstruct:scythe_head", 8, <liquid:electrumflux>);
addCastable(<tconstruct:shard>.withTag({ Material: "electrumflux" }), "tconstruct:shard", 0.5, <liquid:electrumflux>);
addCastable(<tconstruct:sharpening_kit>.withTag({ Material: "electrumflux" }), "tconstruct:sharpening_kit", 2, <liquid:electrumflux>);
addCastable(<tconstruct:shovel_head>.withTag({ Material: "electrumflux" }), "tconstruct:shovel_head", 2, <liquid:electrumflux>);
addCastable(<tconstruct:sign_head>.withTag({ Material: "electrumflux" }), "tconstruct:sign_head", 3, <liquid:electrumflux>);
addCastable(<tconstruct:sword_blade>.withTag({ Material: "electrumflux" }), "tconstruct:sword_blade", 2, <liquid:electrumflux>);
addCastable(<tconstruct:tool_rod>.withTag({ Material: "electrumflux" }), "tconstruct:tool_rod", 1, <liquid:electrumflux>);
addCastable(<tconstruct:tough_binding>.withTag({ Material: "electrumflux" }), "tconstruct:tough_binding", 3, <liquid:electrumflux>);
addCastable(<tconstruct:tough_tool_rod>.withTag({ Material: "electrumflux" }), "tconstruct:tough_tool_rod", 3, <liquid:electrumflux>);
addCastable(<tconstruct:wide_guard>.withTag({ Material: "electrumflux" }), "tconstruct:wide_guard", 1, <liquid:electrumflux>);
addCastable(<tcomplement:chisel_head>.withTag({ Material: "electrumflux" }), "tcomplement:chisel_head", 1, <liquid:electrumflux>);
