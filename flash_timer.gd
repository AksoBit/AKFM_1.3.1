extends Timer

var flash = 0.5
var last_system_time: int = 0
var accumulated_time: int = 0

func _ready():
	last_system_time = Time.get_ticks_msec()
	set_process(true)

func _process(_delta: float) -> void:
	var current_time: int = Time.get_ticks_msec()
	var elapsed: int = current_time - last_system_time
	if elapsed >= flash:
		last_system_time = current_time
