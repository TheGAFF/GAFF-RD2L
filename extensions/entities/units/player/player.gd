extends "res://entities/units/player/player.gd"

func handle_gold_stat(effect_key:String)->void :
	if Utils == null:
		return

	.handle_gold_stat(effect_key)

	for temp_stat in RunData.get_player_effect(effect_key, player_index):
		if temp_stat[0] == "stat_harvesting":
			RunData.add_stat("stat_harvesting", temp_stat[1], player_index)
