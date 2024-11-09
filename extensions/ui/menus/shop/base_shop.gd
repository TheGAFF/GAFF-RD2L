extends "res://ui/menus/shop/base_shop.gd"

func buy_item(item_data:ItemData, player_index:int)->void :
	.buy_item(item_data, player_index)

	var effect_bear_repeat_item = RunData.get_player_effect("rd2l_last_item_purchased", player_index)

	if effect_bear_repeat_item.has("bear_repeat_item") and item_data.max_nb == -1:
		effect_bear_repeat_item[0] = item_data.my_id

	var ogre_magi_duplicate_item_effect:int = RunData.get_player_effect("ogre_magi_duplicate_item", player_index)

	if (ogre_magi_duplicate_item_effect > 0):
		.buy_item(item_data, player_index)
