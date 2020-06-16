/*
 * Fixes for recipes that really should have used an oredict, but didn't.
 */

// HarvestCraft traps allow only oak variants, extend this.
recipes.replaceAllOccurences(<minecraft:trapdoor>, <ore:trapdoorWood>, <harvestcraft:groundtrap>);
recipes.replaceAllOccurences(<minecraft:chest>, <ore:chestWood>, <harvestcraft:groundtrap> | <harvestcraft:watertrap>);
