extends "res://singletons/run_data.gd"

# Add custom effects
func init_effects()->Dictionary:
	var vanilla_effects = .init_effects()
	var new_effects = {
		"attack_speed_shop":[],
	}
	vanilla_effects.merge(new_effects)
	return vanilla_effects


func get_currency()->int:
	if (effects["attack_speed_shop"]) :
		return (get_stat("stat_attack_speed") + 1000.0) as int
	else :
		return .get_currency()

func remove_currency(value:int)->void :
	if effects["attack_speed_shop"] :
		remove_stat("stat_attack_speed", value)
	else:
		.remove_currency(value)
