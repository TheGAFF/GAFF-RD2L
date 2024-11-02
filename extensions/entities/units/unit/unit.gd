extends "res://entities/units/unit/unit.gd"

func take_damage(value:int, args:TakeDamageArgs)->Array:

	var damage_taken = .take_damage(value, args)

	var from_player_index = args.from_player_index
	if (from_player_index >= 0 and
		RunData.get_player_effect("huskar_health_loss", from_player_index) and
		from_player_index < RunData.DUMMY_PLAYER_INDEX and
		args.is_burning == false and
		players_ref[from_player_index].current_stats.health > 1):
		RunData.emit_signal("damage_effect", 1, from_player_index, false, false)

	return damage_taken
