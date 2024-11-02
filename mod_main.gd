extends Node

const RD2L_MOD_DIR = "GAFF-RD2L/"
const RD2L_LOG     = "GAFF-RD2L"

var dir = ""
var ext_dir = ""
var trans_dir = ""

func _init(_modLoader = ModLoader):
	ModLoaderLog.info("Init Start", RD2L_LOG)

	dir = ModLoaderMod.get_unpacked_dir() + RD2L_MOD_DIR
	ext_dir = dir + "extensions/"
	trans_dir = dir + "translations/"

	# Add extensions
	var extensions = [
	 "singletons/player_run_data.gd",
					 "singletons/run_data.gd",
					 "entities/units/unit/unit.gd",
					 "ui/menus/shop/coop_shop.gd",
					 "ui/menus/shop/shop_item.gd",
					 "ui/menus/shop/base_shop.gd",
					 "weapons/weapon.gd",
					 "entities/units/player/player.gd"
	]

	for path in extensions:
		ModLoaderMod.install_script_extension(ext_dir + path)

	# Add translations
	#ModLoaderMod.add_translation(trans_dir + "RD2L_text.de.translation")
	ModLoaderMod.add_translation(trans_dir + "RD2L_text.en.translation")
	#ModLoaderMod.add_translation(trans_dir + "RD2L_text.es.translation")
	#ModLoaderMod.add_translation(trans_dir + "RD2L_text.fr.translation")
	#ModLoaderMod.add_translation(trans_dir + "RD2L_text.it.translation")
	#ModLoaderMod.add_translation(trans_dir + "RD2L_text.ja.translation")
	#ModLoaderMod.add_translation(trans_dir + "RD2L_text.ko.translation")
	#ModLoaderMod.add_translation(trans_dir + "RD2L_text.pl.translation")
	#ModLoaderMod.add_translation(trans_dir + "RD2L_text.pt.translation")
	#ModLoaderMod.add_translation(trans_dir + "RD2L_text.ru.translation")
	#ModLoaderMod.add_translation(trans_dir + "RD2L_text.tr.translation")
	#ModLoaderMod.add_translation(trans_dir + "RD2L_text.zh.translation")
	#ModLoaderMod.add_translation(trans_dir + "RD2L_text.zh_TW.translation")

	ModLoaderLog.info("Init Finish", RD2L_LOG)

func _ready():

	dir = ModLoaderMod.get_unpacked_dir() + RD2L_MOD_DIR
	ext_dir = dir + "extensions/"

	ModLoaderLog.info("Ready Start", RD2L_LOG)

	_load_rd2l_content()

	#Add hit_protection custom tagged items
	var tardigrade_data = load("res://items/all/tardigrade/tardigrade_data.tres")
	tardigrade_data.tags.push_back("rd2l_hit_protection")

	#structure custom tagged items
	var StructureTag = [
		"res://items/all/landmines/landmines_data.tres",
		"res://items/all/garden/garden_data.tres",
		"res://items/all/turret/turret_data.tres",
		"res://items/all/turret_flame/turret_flame_data.tres",
		"res://items/all/turret_healing/turret_healing_data.tres",
		"res://items/all/turret_laser/turret_laser_data.tres",
		"res://items/all/turret_rocket/turret_rocket_data.tres",
		"res://items/all/tyler/tyler_data.tres",
		"res://items/all/wandering_bot/wandering_bot_data.tres",
		"res://items/all/improved_tools/improved_tools_data.tres"
		]
	for path in StructureTag:
		var StructureTag_data = load(path)
		StructureTag_data.tags.push_back("rd2l_structure")

	#wave_clear custom tagged items
	var WaveClearTag = [
		"res://items/all/baby_elephant/baby_elephant_data.tres",
		"res://items/all/baby_with_a_beard/baby_with_a_beard_data.tres",
		"res://items/all/bandana/bandana_data.tres",
		"res://items/all/community_support/community_support_data.tres",
		"res://items/all/cyberball/cyberball_data.tres",
		"res://items/all/pumpkin/pumpkin_data.tres",
		"res://items/all/ricochet/ricochet_data.tres"
		]
	for path in WaveClearTag:
		var WaveClearTag_data = load(path)
		WaveClearTag_data.tags.push_back("rd2l_wave_clear")

	#rd2l_pickup_range custom tagged items
	var alien_tongue_data = load("res://items/all/alien_tongue/alien_tongue_data.tres")
	alien_tongue_data.tags.push_back("rd2l_pickup_range")
	var little_frog_data = load("res://items/all/little_frog/little_frog_data.tres")
	little_frog_data.tags.push_back("rd2l_pickup_range")

	#damage_against_bosses custom tagged items
	var silver_bullet_data = load("res://items/all/silver_bullet/silver_bullet_data.tres")
	silver_bullet_data.tags.push_back("rd2l_damage_against_bosses")
	var giant_belt_data = load("res://items/all/giant_belt/giant_belt_data.tres")
	giant_belt_data.tags.push_back("rd2l_damage_against_bosses")

	ModLoaderLog.info("Ready Finish", RD2L_LOG)

func _load_rd2l_content():

	ModLoaderLog.info("Load RD2L Content Start", RD2L_LOG)

	var mod_data = load("res://mods-unpacked/GAFF-RD2L/content_data/rd2l_content.tres")

	ProgressData._append_without_duplicates(ItemService.characters, mod_data.characters)

	ModLoaderLog.info("Load RD2L Content Finish", RD2L_LOG)
