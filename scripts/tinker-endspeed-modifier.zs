/*
 * This makes it possible to add the endspeed modifier to shuriken, because it's just too much fun to not be available.
 * Because it's not possible to add this as a modifier that can be applied in the tool forge, it's instead done in a
 * regular crafting grid, but it otherwise behaves the same way (uses a modifier slot, not available if there is no free
 * slot, etc).
 */

import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.recipes.IRecipeFunction;
import mods.jei.JEI;

// The properties/cost of the modifier.
static modifierCost as short = 1;
static modifierItems as IIngredient[] = [
   <minecraft:end_rod>,
   <minecraft:ender_pearl>,
   <minecraft:nether_star>,
   <enderio:item_alloy_ingot:8>, // end steel ingot
];
static modifierName as string = "endspeed"; // Also the trait name.
static modifierData as IData = {
   identifier: modifierName,
   color: -1507370,
   level: 1,
};

// Create a custom item in JEI for this modifier.
static modifierItem as IItemStack = <minecraft:end_rod>.withTag({
   display: {
      Name: "Endspeed Modifier",
      Lore: [
         "Adds the Endspeed modifier to a shuriken.",
         "Use in a crafting table, not a tool station/forge.",
      ],
   },
});
JEI.addItem(modifierItem);
JEI.addDescription(modifierItem, [
   "This special end rod can be combined with a shuriken in a crafting table to add the endspeed modifier to the shuriken, at the cost of 1 modifier slot.",
   "(Note that this has to be the 'Endspeed Modifier' item, not a regular end rod.)",
]);
recipes.addShapeless(modifierItem, modifierItems);

// Finally, add a recipe that combines any shuriken with the special modifier item, and that actually adds the modifier
// to the shuriken.
recipes.addShapeless(<tconstruct:shuriken>, [<tconstruct:shuriken>.anyDamage().marked("shuriken"), modifierItem], function (out, ins, cInfo) {
   var freeModifiers = ins.shuriken.tag.memberGet("Stats").memberGet("FreeModifiers");
   var modifierNameList = ins.shuriken.tag.memberGet("TinkerData").memberGet("Modifiers");

   // If there are no free modifiers this recipe cannot be used.
   if (freeModifiers < modifierCost) {
      return null;
   }

   // If the item already has this modifier this recipe also cannot be used.
   if (modifierNameList has modifierName) {
      return null;
   }

   return ins.shuriken.withTag(ins.shuriken.tag + {
      Stats: {
         FreeModifiers: freeModifiers - modifierCost,
      },
      Modifiers: [modifierData],
      TinkerData: {
         Modifiers: [modifierName],
      },
      Traits: [modifierName],
   });
} as IRecipeFunction);
