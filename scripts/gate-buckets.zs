/*
 * We want to delay access to lava a bit, so at the start only clay buckets should be available. Any item that can carry
 * lava that is accessible before iron plates should be adjusted so it requires at least an iron plate.
 */

import crafttweaker.item.IIngredient;

static iron_plate as IIngredient = <thermalfoundation:material:32>;

// Regular iron buckets.
recipes.remove(<minecraft:bucket>);
recipes.addShaped(<minecraft:bucket>, [
   [null, null, null],
   [iron_plate, null, iron_plate],
   [null, iron_plate, null],
]);

// Ender bucket from randomthings.
recipes.remove(<randomthings:enderbucket>);
recipes.addShaped(<randomthings:enderbucket>, [
   [null, null, null],
   [iron_plate, null, iron_plate],
   [null, <minecraft:ender_pearl>, null],
]);
