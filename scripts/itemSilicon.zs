// Make the ender io and project red silicon equivalent
<ore:itemSilicon>.add(<ProjRed|Core:projectred.core.part:12>);

// Re-create the project red recipes using the oredict
recipes.remove(<ProjRed|Core:projectred.core.part:43>);
recipes.addShaped(<ProjRed|Core:projectred.core.part:43>, [[<ore:dustGlowstone>, <ore:dustGlowstone>, <ore:dustGlowstone>], [<ore:dustGlowstone>, <ore:itemSilicon>, <ore:dustGlowstone>], [<ore:dustGlowstone>, <ore:dustGlowstone>, <ore:dustGlowstone>]]);
recipes.remove(<ProjRed|Core:projectred.core.part:42>);
recipes.addShaped(<ProjRed|Core:projectred.core.part:42>, [[<ore:cropRedstodendron>, <ore:cropRedstodendron>, <minecraft:redstone>], [<minecraft:redstone>, <ore:itemSilicon>, <ore:cropRedstodendron>], [<minecraft:redstone>, <ore:cropRedstodendron>, <ore:cropRedstodendron>]]);
