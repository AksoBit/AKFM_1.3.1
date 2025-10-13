extends AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	stream = Global.footstep


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pitch_scale = randf_range(0.7, 1.3)
	await get_tree().create_timer(0.05).timeout
