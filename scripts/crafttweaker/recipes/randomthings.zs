
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

// These recipes will be replaced, but first removed
static replaceRecipes as IItemStack[] = [
  <randomthings:enderbucket>
];

// These recipes are the replacements
static shapedReplacements as IIngredient[][][][string][IItemStack] = {
  <randomthings:enderbucket> : {
    "randomthings:enderbucket" : [
      [
        [null, null, null],
        [<thermalfoundation:material:32>, null, <thermalfoundation:material:32>],
        [null, <minecraft:ender_pearl>, null]
      ]
    ]
  }
};


itemManager.removeItems(replaceRecipes);
itemManager.addShaped(shapedReplacements);
