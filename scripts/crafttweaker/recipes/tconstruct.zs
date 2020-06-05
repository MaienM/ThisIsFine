
/*
  Contains modifications to Tinker's Construct & Construct's Armor
*/

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

// Recipes that are modified with other crafting parts
static recipeUpdates as IIngredient[IIngredient][IItemStack] = {
  <tconstruct:toolforge> : {
    <ore:blockSeared> : <ore:blockSteel>
  },
  <conarm:armorforge> : {
    <ore:blockSeared> : <ore:blockSteel>
  }
};


itemManager.replaceIngredients(recipeUpdates);
