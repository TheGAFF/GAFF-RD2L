extends "res://entities/units/unit/unit.gd"

func take_damage(value:int, args:TakeDamageArgs)->Array:

	var damage_taken = .take_damage(value, args)

	var from_player_index = args.from_player_index

	var temp_stats_on_attack_effect = RunData.get_player_effect("temp_stats_on_attack", from_player_index)

	# lina attack speed
	if (from_player_index >= 0 and args.is_burning == false and from_player_index < RunData.DUMMY_PLAYER_INDEX) :
		for temp_stat_on_attack in temp_stats_on_attack_effect:
			TempStats.add_stat(temp_stat_on_attack[0], temp_stat_on_attack[1], from_player_index)

	# huskar health loss
	if (from_player_index >= 0 and
		RunData.get_player_effect("huskar_health_loss", from_player_index) and
		from_player_index < RunData.DUMMY_PLAYER_INDEX and
		args.is_burning == false and
		players_ref[from_player_index].current_stats.health > 1):
		RunData.emit_signal("damage_effect", 1, from_player_index, false, false)

	return damage_taken
