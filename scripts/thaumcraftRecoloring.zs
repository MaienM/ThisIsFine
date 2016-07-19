import minetweaker.item.IIngredient;
import minetweaker.item.IItemStack;

// The dyes
var dyes = [
	<ore:dyeWhite>,
	<ore:dyeOrange>,
	<ore:dyeMagenta>,
	<ore:dyeLightBlue>,
	<ore:dyeYellow>,
	<ore:dyeLime>,
	<ore:dyePink>,
	<ore:dyeGray>,
	<ore:dyeLightGray>,
	<ore:dyeCyan>,
	<ore:dyePurple>,
	<ore:dyeBlue>,
	<ore:dyeBrown>,
	<ore:dyeGreen>,
	<ore:dyeRed>,
	<ore:dyeBlack>
] as IIngredient[];

// Allow recoloring the floating candles
var floatingCandles = [
	<ThaumicExploration:floatCandle:0>,
	<ThaumicExploration:floatCandle:1>,
	<ThaumicExploration:floatCandle:2>,
	<ThaumicExploration:floatCandle:3>,
	<ThaumicExploration:floatCandle:4>,
	<ThaumicExploration:floatCandle:5>,
	<ThaumicExploration:floatCandle:6>,
	<ThaumicExploration:floatCandle:7>,
	<ThaumicExploration:floatCandle:8>,
	<ThaumicExploration:floatCandle:9>,
	<ThaumicExploration:floatCandle:10>,
	<ThaumicExploration:floatCandle:11>,
	<ThaumicExploration:floatCandle:12>,
	<ThaumicExploration:floatCandle:13>,
	<ThaumicExploration:floatCandle:14>,
	<ThaumicExploration:floatCandle:15>
] as IItemStack[];
for i, dye in dyes {
	val candle = floatingCandles[i];
	recipes.addShapeless(candle, [<ThaumicExploration:floatCandle:*>, dye]);
}

// Allow recoloring the banners
for i, dye in dyes {
	val banner = <Thaumcraft:blockWoodenDevice:8>.withTag({color: i as byte});
	recipes.addShapeless(banner, [<Thaumcraft:blockWoodenDevice:8>.marked("banner"), dye.marked("dye")], function(output, inputs, crafting) {
		return inputs.banner.updateTag({color: output.tag.color});
	});
}
