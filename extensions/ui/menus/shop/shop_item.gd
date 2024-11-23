extends "res://ui/menus/shop/shop_item.gd"

func set_shop_item(p_item_data:ItemParentData, p_wave_value:int = RunData.current_wave)->void :
	.set_shop_item(p_item_data, p_wave_value)

	if RunData.get_player_effect_bool("attack_speed_shop", player_index):
		value = ceil(value / 4.0) as int
		var material_icon:Image = ItemService.get_stat_icon("stat_attack_speed").get_data()
		var texture: = ImageTexture.new()
		texture.create_from_image(material_icon)
		_button.set_material_icon(texture)
		_button.set_value(value, RunData.get_player_currency(player_index))

	if RunData.get_player_effect_bool("engineering_shop", player_index):
		value = ceil(value / 10.0) as int
		var material_icon:Image = ItemService.get_stat_icon("stat_engineering").get_data()
		var texture: = ImageTexture.new()
		texture.create_from_image(material_icon)
		_button.set_material_icon(texture)
		_button.set_value(value, RunData.get_player_currency(player_index))

	if RunData.get_player_effect_bool("armor_shop", player_index):
		value = ceil(value / 9.0) as int
		var material_icon:Image = ItemService.get_stat_icon("stat_armor").get_data()
		var texture: = ImageTexture.new()
		texture.create_from_image(material_icon)
		_button.set_material_icon(texture)
		_button.set_value(value, RunData.get_player_currency(player_index))
