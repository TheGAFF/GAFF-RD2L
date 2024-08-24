extends "res://singletons/run_data.gd"

func get_player_currency(player_index:int)->int:
	var effects: = get_player_effects(player_index)
	if (effects["attack_speed_shop"]) :
		return (get_stat("stat_attack_speed", player_index) + 1000.0) as int
	else :
		return .get_player_currency(player_index)

func remove_currency(value:int, player_index:int)->void :
	var effects: = get_player_effects(player_index)
	if effects["attack_speed_shop"]:
		remove_stat("stat_attack_speed", value, player_index)
	else :
		.remove_currency(value, player_index)
