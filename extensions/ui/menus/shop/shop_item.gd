extends "res://ui/menus/shop/shop_item.gd"

func set_shop_item(p_item_data:ItemParentData, p_wave_value:int = RunData.current_wave)->void :
	.set_shop_item(p_item_data, p_wave_value)

	if RunData.get_player_effect_bool("attack_speed_shop", player_index):
		var item_count: = 1
		var icon = ItemService.get_icon("icon_material").get_data()
		var texture = ImageTexture.new()
		var color = Utils.GOLD_COLOR
		item_data = p_item_data
		_item_description.set_item(p_item_data, player_index, item_count)
		wave_value = p_wave_value
		value = ItemService.get_value(wave_value, p_item_data.value, player_index, true, p_item_data is WeaponData, p_item_data.my_id)
		value = ceil(value / 4.0) as int
		icon = ItemService.get_stat_icon("stat_attack_speed").get_data()
		icon.resize(64, 64)
		color = Color.white

		texture.create_from_image(icon)
		_button.set_icon(texture, color)
		_button.set_value(value, RunData.get_player_currency(player_index))
	if RunData.get_player_effect_bool("engineering_shop", player_index):
		var item_count: = 1
		var icon = ItemService.get_icon("icon_material").get_data()
		var texture = ImageTexture.new()
		var color = Utils.GOLD_COLOR
		item_data = p_item_data
		_item_description.set_item(p_item_data, player_index, item_count)
		wave_value = p_wave_value
		value = ItemService.get_value(wave_value, p_item_data.value, player_index, true, p_item_data is WeaponData, p_item_data.my_id)
		value = ceil(value / 10.0) as int
		icon = ItemService.get_stat_icon("stat_engineering").get_data()
		icon.resize(64, 64)
		color = Color.white

		texture.create_from_image(icon)
		_button.set_icon(texture, color)
		_button.set_value(value, RunData.get_player_currency(player_index))
	if RunData.get_player_effect_bool("armor_shop", player_index):
		var item_count: = 1
		var icon = ItemService.get_icon("icon_material").get_data()
		var texture = ImageTexture.new()
		var color = Utils.GOLD_COLOR
		item_data = p_item_data
		_item_description.set_item(p_item_data, player_index, item_count)
		wave_value = p_wave_value
		value = ItemService.get_value(wave_value, p_item_data.value, player_index, true, p_item_data is WeaponData, p_item_data.my_id)
		value = ceil(value / 9.0) as int
		icon = ItemService.get_stat_icon("stat_armor").get_data()
		icon.resize(64, 64)
		color = Color.white

		texture.create_from_image(icon)
		_button.set_icon(texture, color)
		_button.set_value(value, RunData.get_player_currency(player_index))
