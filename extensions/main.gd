extends "res://main.gd"

func _on_WaveTimer_timeout()->void :
	._on_WaveTimer_timeout()
	if RunData.current_wave >= 19:
		if RunData.effects["stats_end_of_wave"].size() > 0:
			for stat_end_of_wave in RunData.effects["stats_end_of_wave"]:
				if stat_end_of_wave[0] == "map_size":
					stat_end_of_wave[1] = 0
					RunData.effects["stats_end_of_wave"].erase(stat_end_of_wave)
