// Make the mekanism and the thermal expansion sawdust equivalent
<ore:pulpWood>.add(<ThermalExpansion:material:512>);

// Add the shaped mekanism recipes for the alternative sawdust
recipes.addShaped(<minecraft:paper> * 6, [[<ore:pulpWood>, <ore:pulpWood>, <ore:pulpWood>]]);
