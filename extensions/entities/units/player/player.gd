extends "res://entities/units/player/player.gd"

func handle_gold_stat(effect_key:String)->void :
	.handle_gold_stat(effect_key)

	for temp_stat in RunData.effects[effect_key]:
		if temp_stat[0] == "stat_harvesting":
			RunData.add_stat("stat_harvesting", temp_stat[1])
