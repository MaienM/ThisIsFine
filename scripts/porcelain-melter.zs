/*
 * The porcelain melter is intended to be an early-game smelter that you will move on from rather quickly. Because of
 * this we want to limit the scope of what it can be used for. We do this by limiting the temperature it can go up to,
 * thus limiting the materials available. Being able to use liquids for melting would bypass this, so we disable this by
 * removing the relevant items. We also disable alloying to further limit the available materials.
 */

import mods.jei.JEI;

// Completely remove everything related to melting using liquids.
JEI.removeAndHide(<tcomplement:porcelain_alloy_tank>);
JEI.removeAndHide(<tcomplement:porcelain_tank>);
JEI.removeAndHide(<tcomplement:porcelain_tank:1>);
JEI.removeAndHide(<tcomplement:porcelain_tank:2>);
JEI.removeAndHide(<tcomplement:melter>);
JEI.removeAndHide(<tcomplement:alloy_tank>);
JEI.removeAndHide(<tcomplement:melter:8>);

// The porcelain melter uses some of the now-disabled items, so adjust the recipe to use something that is still
// available (glass instead of a porcelain tank).
recipes.remove(<tcomplement:porcelain_melter>);
recipes.addShaped(<tcomplement:porcelain_melter>, [
	[null, <ceramics:unfired_clay:5>, null],
	[<ceramics:unfired_clay:5>, <minecraft:glass>, <ceramics:unfired_clay:5>],
	[<ceramics:unfired_clay:5>, <ceramics:unfired_clay:5>, <ceramics:unfired_clay:5>],
]);

// All elements are crafted using the bricks except for the tap and channel, which you first mold and then bake?
// Change that to also just be crafted from the bricks, like everything else.
JEI.removeAndHide(<ceramics:unfired_clay:6>);
furnace.remove(<ceramics:faucet>);
recipes.addShaped(<ceramics:faucet>, [
	[null, null, null],
	[<ceramics:unfired_clay:5>, null, <ceramics:unfired_clay:5>],
	[null, <ceramics:unfired_clay:5>, null],
]);
JEI.removeAndHide(<ceramics:unfired_clay:7>);
furnace.remove(<ceramics:channel>);
recipes.addShaped(<ceramics:channel>  *3, [
	[null, null, null],
	[<ceramics:unfired_clay:5>, null, <ceramics:unfired_clay:5>],
	[<ceramics:unfired_clay:5>, <ceramics:unfired_clay:5>, <ceramics:unfired_clay:5>],
]);
