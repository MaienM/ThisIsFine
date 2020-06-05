/*
  Update recipes for Tinker's Complement

  - Prevent Alloying
  - Update crafting recipes to fit the pack
*/

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

// These recipes will be completely removed and hidden in JEI
static removeItems as IItemStack[] = [
  <tcomplement:porcelain_alloy_tank>,
  <tcomplement:porcelain_tank>,
  <tcomplement:porcelain_tank:1>,
  <tcomplement:porcelain_tank:2>,
  <tcomplement:melter>,
  <tcomplement:alloy_tank>,
  <tcomplement:melter:8>
];

// These recipes will be replaced, but first removed
static replaceRecipes as IItemStack[] = [
  <tcomplement:porcelain_melter>
];

// These recipes are the replacements
static shapedReplacements as IIngredient[][][][string][IItemStack] = {
  <tcomplement:porcelain_melter> : {
    "tcomplement:melter/porcelain_melter" : [
      [
        [null, <ceramics:unfired_clay:5>, null],
        [<ceramics:unfired_clay:5>, <minecraft:glass>, <ceramics:unfired_clay:5>],
        [<ceramics:unfired_clay:5>, <ceramics:unfired_clay:5>, <ceramics:unfired_clay:5>]
      ]
    ]
  }
};


itemManager.removeItems(removeItems, true);
itemManager.removeItems(replaceRecipes);
itemManager.addShaped(shapedReplacements);
