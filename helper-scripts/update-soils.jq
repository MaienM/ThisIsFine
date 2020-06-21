def intersection(arr): arr as $arr | map(select(. as $left | $arr | any(. as $right | $left == $right)));
[
	"farmland_soil",
	"farmland_planter_soil",
	"fertile_farmland_soil",
	"fertile_planter_soil",
	"fertile_soil",
	"fertilized_dirt_soil"
] as $soilsFarmland |
[
	"elemental_soil_soil",
	"aqueous_soil_soil",
	"caelic_soil_soil",
	"magmatic_soil_soil",
	"terran_soil_soil"
] as $soilsElemental |
[
	"dirt_soil",
	"dirt_planter_soil"
] as $soilsDirt |
[
	"grass_soil",
	"grass_planter_soil"
] as $soilsGrass |
[
	"gravel_soil",
	"gravel_planter_soil"
] as $soilsGravel |
[
	"sand_soil",
	"sand_planter_soil",
	"red_sand_planter_soil"
] as $soilsSand |
[
	"soul_sand_soil",
	"soul_sand_planter_soil"
] as $soilsSoulSand |
[
	"stone_soil",
	"mycelium_soil",
	"podzol_soil",
	"water_planter_soil"
] as $soilsOther |
[
	"fertilized_farmland_healthy_soil",
	"fertilized_farmland_healthy_stable_soil",
	"fertilized_farmland_rich_soil",
	"fertilized_farmland_rich_stable_soil",
	"fertilized_farmland_stable_soil",
	"loamy_farmland_soil",
	"sandy_farmland_soil",
	"silty_farmland_soil"
] as $soilsDisabled |
($soilsFarmland + $soilsElemental + $soilsDirt + $soilsGrass + $soilsGravel + $soilsSand + $soilsSoulSand + $soilsOther) as $soilOrder |
.requirement.soils as $soils |
. + {
	requirement: (.requirement + {
		soils: ((
			$soils
			+ if ($soils | intersection($soilsFarmland) | length > 0) then $soilsFarmland + $soilsElemental else [] end
			+ if ($soils | intersection($soilsDirt) | length > 0) then $soilsDirt else [] end
			+ if ($soils | intersection($soilsGrass) | length > 0) then $soilsGrass else [] end
			+ if ($soils | intersection($soilsGravel) | length > 0) then $soilsGravel else [] end
			+ if ($soils | intersection($soilsSand) | length > 0) then $soilsSand else [] end
			+ if ($soils | intersection($soilsSoulSand) | length > 0) then $soilsSoulSand else [] end
			- $soilsDisabled
		) | unique | sort_by(. as $soil | $soilOrder | if any(. == $soil) then index($soil) else 999 end)),
	})
}
