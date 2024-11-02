extends "res://entities/units/player/player.gd"

func handle_gold_stat(effect_key:String)->void :
	if Utils == null:
		return

	.handle_gold_stat(effect_key)

	for temp_stat in RunData.get_player_effect(effect_key, player_index):
		if temp_stat[0] == "stat_harvesting":
			RunData.add_stat("stat_harvesting", temp_stat[1], player_index)


func  _on_ItemAttractArea_area_entered(item:Item)->void :

	if RunData.get_player_character(player_index).my_id == "character_rd2l_giggles":
		var is_heal: = item is Consumable
		var is_gold: = not item is Consumable
		var should_attract_item: = (is_heal and current_stats.health < max_stats.health) or is_gold
		if not should_attract_item:
			return
		var item_already_attracted_by_player: = item.attracted_by != null
		if should_attract_item and not item_already_attracted_by_player:
			item.attracted_by = self
		if is_gold and global_position.distance_squared_to(item.global_position) < global_position.distance_squared_to(item.attracted_by.global_position):
			item.attracted_by = self
	else:
		._on_ItemAttractArea_area_entered(item)

