#priority 5000

/*
  Helper class to manage items and recipes
*/

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import mods.jei.JEI;

zenClass ItemManager {

  zenConstructor() {
  }


  /*
    Add new item recipes
  */
  function addShaped(shapedRecipes as IIngredient[][][][string][IItemStack]) {

    for item, itemRecipes in shapedRecipes {
      for itemName, recipeList in itemRecipes {
        for i, uniqueRecipe in recipeList {
          var uniqueName = itemName;

          // If there are multiple recipes, make sure the name is unique
          if ( i > 0 ) {
            uniqueName = uniqueName ~ "_" ~ i;
          }

          recipes.addShaped(uniqueName, item, uniqueRecipe);

        }
      }
    }

  }


  /*
    Removes all items in the removals list
    Items are NOT hidden in JEI
  */
  function removeItems(removals as IItemStack[]) {
    removeItems(removals, false);
  }


  /*
    Removes all items in the removals list
    Items are also hidden in hideJEI is true
  */
  function removeItems(removals as IItemStack[], hideJEI as bool) {
    if (hideJEI) {
      for item in removals {
        JEI.removeAndHide(item);
      }
    }
    else {
      for item in removals {
        recipes.remove(item);
      }
    }
  }


}
