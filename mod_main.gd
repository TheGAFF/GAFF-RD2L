extends Node

const RD2L_MOD_DIR = "GAFF-RD2L/"
const RD2L_LOG     = "GAFF-RD2L"

var dir = ""
var ext_dir = ""
var trans_dir = ""

func _init(_modLoader = ModLoader):
	ModLoaderLog.info("Init", RD2L_LOG)
	dir = ModLoaderMod.get_unpacked_dir() + RD2L_MOD_DIR
	ext_dir = dir + "extensions/"
	trans_dir = dir + "translations/"

	# Add extensions
	var extensions = [
		"/singletons/run_data.gd", # Initialise custom tracking data and stats
		"/main.gd"
	]
	for path in extensions:
		ModLoaderMod.install_script_extension(ext_dir + path)

	# Add translations
	ModLoaderMod.add_translation(trans_dir + "RD2L_text.en.translation")

func _ready():
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
		"res://items/all/ricochet/ricochet_data.tres",
		"res://items/all/rip_and_tear/rip_and_tear_data.tres",
		]
	for path in WaveClearTag:
		var WaveClearTag_data = load(path)
		WaveClearTag_data.tags.push_back("rd2l_wave_clear")
	
	#damage_against_bosses custom tagged items
	var silver_bullet_data = load("res://items/all/silver_bullet/silver_bullet_data.tres")
	silver_bullet_data.tags.push_back("rd2l_damage_against_bosses")
	var giant_belt_data = load("res://items/all/giant_belt/giant_belt_data.tres")
	giant_belt_data.tags.push_back("rd2l_damage_against_bosses")
	
	ModLoaderLog.info("Done", RD2L_LOG)

func _load_rd2l_content():
	ModLoaderLog.info("Loading custom content", RD2L_LOG)
	
		# Get the ContentLoader class
	var ContentLoader = get_node("/root/ModLoader/Darkly77-ContentLoader/ContentLoader")

	var content_dir = "res://mods-unpacked/GAFF-RD2L/content_data/"
	var mod_log = "GAFF-RD2L"

	# Add content. These .tres files are ContentData resources
	ContentLoader.load_data(content_dir + "rd2l_content.tres", mod_log)
