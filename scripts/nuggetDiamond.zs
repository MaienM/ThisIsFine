// Remove the crafting recipes for the diamond chip, as they conflict with the diamond nugget
recipes.remove(<OpenComputers:item:111>);

// Made the chip just another version of the diamond nugget
<ore:nuggetDiamond>.addAll(<ore:chipDiamond>);
<ore:chipDiamond>.mirror(<ore:nuggetDiamond>);
