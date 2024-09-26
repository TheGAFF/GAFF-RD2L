extends "res://entities/units/player/player.gd"

func handle_gold_stat(effect_key:String)->void :
	if Utils == null:
		return

	.handle_gold_stat(effect_key)

	for temp_stat in RunData.get_player_effect(effect_key, player_index):
		if temp_stat[0] == "stat_harvesting":
			RunData.add_stat("stat_harvesting", temp_stat[1], player_index)


func on_consumable_picked_up(consumable_data:ConsumableData)->void :
	.on_consumable_picked_up(consumable_data)
	var consumable_damage_taken_rd2l = RunData.get_player_effect("consumable_damage_taken_rd2l", player_index)

	if consumable_damage_taken_rd2l.size() > 0 and _invincibility_timer.is_stopped():
		TempStats.add_stat(consumable_damage_taken_rd2l[0][0], consumable_damage_taken_rd2l[0][1] * -1, player_index)
		RunData.emit_signal("damage_effect", 0, player_index)

