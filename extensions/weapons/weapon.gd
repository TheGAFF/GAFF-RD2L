extends "res://weapons/weapon.gd"


func shoot()->void :
	var temp_stats_on_attack_effect = RunData.get_player_effect("temp_stats_on_attack", player_index)
	for temp_stat_on_attack in temp_stats_on_attack_effect:
		TempStats.add_stat(temp_stat_on_attack[0], temp_stat_on_attack[1], player_index)
	.shoot()



#func _physics_process(delta: float) -> void:
#	var is_drunk = RunData.get_player_effect('gbay_drunk', player_index)
#
#
#	if is_drunk:
#		if not should_shoot() and _current_cooldown == 0:
#			_current_target = [Enemy.new(), 9000]
#			shoot()
#		else:
#			._physics_process(delta)
#	else:
#		._physics_process(delta)
#
#
#func get_direction_and_calculate_target()->float:
#	var isDrunk = RunData.get_player_effect('gbay_drunk', player_index)
#	var drunkenness = Utils.randi_range(0, 100)
#
#	if (isDrunk and drunkenness > 15):
#		return float(Utils.randi_range(0, 360))
#	else:
#		return .get_direction_and_calculate_target()
#
#
#func is_manual_aim()->bool:
#	var isDrunk = RunData.get_player_effect('gbay_drunk', player_index)
#
#
#	if (isDrunk):
#		return false
#	else:
#		return .is_manual_aim()
#
