extends "res://singletons/player_run_data.gd"

static func init_effects()->Dictionary:

	if (not Utils == null) :
		var vanilla_effects = .init_effects()

		var new_effects: = {
			"attack_speed_shop": 0,
			"engineering_shop": 0,
			"armor_shop": 0,
			"huskar_health_loss": 0,
			"gbay_drunk": 0,
			"consumable_damage_taken_rd2l": [],
			"temp_stats_on_attack": [],
			"ogre_magi_duplicate_item": 0,
			"rd2l_last_item_purchased": ['']
		}

		new_effects.merge(vanilla_effects)

		return new_effects;
	else:
		return {}
