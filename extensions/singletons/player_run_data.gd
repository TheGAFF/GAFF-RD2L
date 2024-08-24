extends "res://singletons/player_run_data.gd"

static func init_stats(all_null_values:bool = false)->Dictionary:
	if Utils == null:
		return {}

	var vanilla_stats = .init_stats(all_null_values)

	var new_stats: = {
		"attack_speed_shop": 0,
		"testddd": 1
	}

	new_stats.merge(vanilla_stats)

	return new_stats;

