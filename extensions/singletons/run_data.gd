extends "res://singletons/run_data.gd"

#Adds custom tracked stats to the dictionary
func init_tracked_effects()->Dictionary:
	var vanilla_tracked_effects = .init_tracked_effects()

	return vanilla_tracked_effects
