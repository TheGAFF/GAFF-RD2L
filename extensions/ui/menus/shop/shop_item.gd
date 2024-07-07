extends "res://ui/menus/shop/shop_item.gd"

func set_shop_item(p_item_data:ItemParentData, p_wave_value:int = RunData.current_wave)->void :
	.set_shop_item(p_item_data, p_wave_value)

	if RunData.effects["attack_speed_shop"]:
		var icon = ItemService.material_icon.get_data()
		var texture = ImageTexture.new()
		var color = Utils.GOLD_COLOR
		item_data = p_item_data
		_item_description.set_item(p_item_data)
		wave_value = p_wave_value
		value = ItemService.get_value(wave_value, p_item_data.value, true, p_item_data is WeaponData, p_item_data.my_id)
		value = ceil(value / 4.0) as int
		icon = ItemService.get_stat_icon("stat_attack_speed").get_data()
		icon.resize(64, 64)
		color = Color.white

		texture.create_from_image(icon)
		_button.set_icon(texture, color)
		_button.set_value(value)

