// Create an oredict entry for the mini coal
<ore:nuggetCoal>.add(<progressiveautomation:CoalPellet>);

// Disallow charcoal -> mini coal
recipes.removeShapeless(<progressiveautomation:CoalPellet>, [<minecraft:coal:1>]);

// Allow converting back to coal
recipes.addShapeless(<minecraft:coal>, [<ore:nuggetCoal>, <ore:nuggetCoal>, <ore:nuggetCoal>, <ore:nuggetCoal>, <ore:nuggetCoal>, <ore:nuggetCoal>, <ore:nuggetCoal>, <ore:nuggetCoal>]);

// Allow usage in the compacting drawers
mods.storagedrawers.Compaction.add(<minecraft:coal>, <progressiveautomation:CoalPellet>, 8);
