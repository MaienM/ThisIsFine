/*
 * We want to delay access to lava a bit, so at the start only clay buckets should be available. Any item that can carry
 * lava that is accessible before iron plates should be adjusted so it requires at least an iron plate.
 */

import crafttweaker.item.IIngredient;

// Regular iron buckets.
recipes.replaceAllOccurences(<ore:ingotIron>, <thermalfoundation:material:32>, <minecraft:bucket>);

// Ender bucket from randomthings.
recipes.replaceAllOccurences(<ore:ingotIron>, <thermalfoundation:material:32>, <randomthings:enderbucket>);
