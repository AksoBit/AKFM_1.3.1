extends Node

var config = ConfigFile.new()
var path = "user://logs/save.cfg"

func _ready():
	load_settings()

func load_settings():
	if config.load(path) != OK:
		set_value("~NUMBERS~", "HacksKilled", 0 )
		set_value("~NUMBERS~", "RodgersKilled", 0 )
		set_value("~NUMBERS~", "TechnoZensKilled", 0 )
		set_value("~NUMBERS~", "YourselfKilled", 0 )
		set_value("~NUMBERS~", "BestLibScore", 0 )
		save()
		
func save():
	config.save(path)

func get_value(section, key, default = null):
	return config.get_value(section, key, default)

func set_value(section, key, value):
	config.set_value(section, key, value)
	save()
