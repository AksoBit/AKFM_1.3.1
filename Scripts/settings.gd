extends Node

var config = ConfigFile.new()
var path = "user://logs/settings.cfg"

func _ready():
	load_settings()

func load_settings():
	if config.load(path) != OK:
		set_value("~SOUND~", "Global", 50 )
		set_value("~SOUND~", "SFX", 50 )
		set_value("~SOUND~", "Voice", 50 )
		set_value("~SOUND~", "Music", 50 )
		set_value("~SOUND~", "Speed", 100 )
		set_value("~SOUND~", "Overdrum", false)
		set_value("~GRAPHICS~", "VSYNC", true)
		set_value("~GRAPHICS~", "CRT", false)
		set_value("~GRAPHICS~", "Curvature", 7.0)
		set_value("~GRAPHICS~", "Vingette multiplyer", 0.25)
		set_value("~GRAPHICS~", "Blur", 0.3)
		set_value("~GRAPHICS~", "Scanlines", 0.1)
		set_value("~GAMEPLAY~", "Debug", false)
		save_settings()

func save_settings():
	config.save(path)

func get_value(section, key, default = null):
	return config.get_value(section, key, default)

func set_value(section, key, value):
	config.set_value(section, key, value)
	save_settings()
