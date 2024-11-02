extends "res://ui/menus/shop/base_shop.gd"

func buy_item(item_data:ItemData, player_index:int)->void :
	.buy_item(item_data, player_index)

	var ogre_magi_duplicate_item_effect:int = RunData.get_player_effect("ogre_magi_duplicate_item", player_index)

	if (ogre_magi_duplicate_item_effect > 0):
		.buy_item(item_data, player_index)
