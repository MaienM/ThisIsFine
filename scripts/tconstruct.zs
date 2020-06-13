import mods.tconstruct.Casting;
import mods.jei.JEI;

/*
 * All Tinker's Construct & Construct's Armor Forges should be gated behind having access to steel.
 */

// Replace the seared blocks with steel blocks. A bit more expensive, but this way it's gated behind steel while still
// allowing you to use whichever variant you like for aesthetic reasons.
recipes.replaceAllOccurences(<ore:blockSeared>, <ore:blockSteel>, <tconstruct:toolforge>);
recipes.replaceAllOccurences(<ore:blockSeared>, <ore:blockSteel>, <conarm:armorforge>);


/*
 * Disable TC Hammer, Excavator & Broad Axe
 *
 * NOTE: Patterns cannot be disabled and will be craftable, but not useable.
 */

// Disable creating casts & hide in JEI
Casting.removeTableRecipe(<tconstruct:cast>.withTag({PartType: "tconstruct:hammer_head"}));
JEI.hide(<tconstruct:cast>.withTag({PartType: "tconstruct:hammer_head"}));

Casting.removeTableRecipe(<tconstruct:cast>.withTag({PartType: "tconstruct:excavator_head"}));
JEI.hide(<tconstruct:cast>.withTag({PartType: "tconstruct:excavator_head"}));

Casting.removeTableRecipe(<tconstruct:cast>.withTag({PartType: "tconstruct:broad_axe_head"}));
JEI.hide(<tconstruct:cast>.withTag({PartType: "tconstruct:broad_axe_head"}));

Casting.removeTableRecipe(<tconstruct:clay_cast>.withTag({PartType: "tconstruct:hammer_head"}));
JEI.hide(<tconstruct:clay_cast>.withTag({PartType: "tconstruct:hammer_head"}));

Casting.removeTableRecipe(<tconstruct:clay_cast>.withTag({PartType: "tconstruct:excavator_head"}));
JEI.hide(<tconstruct:clay_cast>.withTag({PartType: "tconstruct:excavator_head"}));

Casting.removeTableRecipe(<tconstruct:clay_cast>.withTag({PartType: "tconstruct:broad_axe_head"}));
JEI.hide(<tconstruct:clay_cast>.withTag({PartType: "tconstruct:broad_axe_head"}));

// Disable tool head casting & hide in JEI
Casting.removeTableRecipe(<tconstruct:hammer_head>);
for item in <tconstruct:hammer_head>.definition.subItems {
  JEI.hide(item);
}
for item in <tconstruct:hammer>.definition.subItems {
  JEI.hide(item);
}

Casting.removeTableRecipe(<tconstruct:excavator_head>);
for item in <tconstruct:excavator_head>.definition.subItems {
  JEI.hide(item);
}
for item in <tconstruct:excavator>.definition.subItems {
  JEI.hide(item);
}

Casting.removeTableRecipe(<tconstruct:broad_axe_head>);
for item in <tconstruct:broad_axe_head>.definition.subItems {
  JEI.hide(item);
}
for item in <tconstruct:lumberaxe>.definition.subItems {
  JEI.hide(item);
}
