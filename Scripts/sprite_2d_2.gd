extends AnimatedSprite2D
@onready var gg =  get_parent().get_parent().get_parent().get_node("UwUGG/UwUGG")

func _ready() -> void:
	play("default")
func _process(delta: float) -> void:
	var ggpos = gg.get_global_position()
	look_at(ggpos)
