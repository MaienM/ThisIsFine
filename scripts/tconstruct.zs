/*
 * All Tinker's Construct & Construct's Armor Forges should be gated behind having access to steel.
 */

// Replace the seared blocks with steel blocks. A bit more expensive, but this way it's gated behind steel while still
// allowing you to use whichever variant you like for aesthetic reasons.
recipes.replaceAllOccurences(<ore:blockSeared>, <ore:blockSteel>, <tconstruct:toolforge>);
recipes.replaceAllOccurences(<ore:blockSeared>, <ore:blockSteel>, <conarm:armorforge>);
