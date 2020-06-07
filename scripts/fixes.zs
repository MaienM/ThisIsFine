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
