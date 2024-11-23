extends "res://singletons/item_service.gd"

func get_player_shop_items(wave:int, player_index:int, args:ItemServiceGetShopItemsArgs)->Array:

	var effect_bear_repeat_item = RunData.get_player_effect("rd2l_last_item_purchased", player_index)

	if effect_bear_repeat_item[0] != ""  :

		var guaranteed_items = RunData.get_player_effect("guaranteed_shop_items", player_index)
		if guaranteed_items.size() > 0:
			guaranteed_items[0] = [effect_bear_repeat_item[0]]
		else:
			guaranteed_items.append([effect_bear_repeat_item[0]])

	return .get_player_shop_items(wave, player_index, args)
