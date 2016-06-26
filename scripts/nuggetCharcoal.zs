// Create an oredict entry for the mini charcoal
<ore:nuggetCharcoal>.add(<Ztones:minicharcoal>);

// Allow converting back to charcoal
recipes.addShapeless(<minecraft:coal:1>, [<ore:nuggetCharcoal>, <ore:nuggetCharcoal>, <ore:nuggetCharcoal>, <ore:nuggetCharcoal>, <ore:nuggetCharcoal>, <ore:nuggetCharcoal>, <ore:nuggetCharcoal>, <ore:nuggetCharcoal>]);

// Allow usage in the compacting drawers
mods.storagedrawers.Compaction.add(<minecraft:coal:1>, <Ztones:minicharcoal>, 8);
