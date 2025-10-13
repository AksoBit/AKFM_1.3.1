extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	$"../../../../Synth/Control".monitoring = false
	$"../../../../Synth/Area2D".monitoring = false
	$"../../../../Synth/Control".visible = false
	$"../../../../Synth/Area2D".visible = false

func _on_mouse_exited() -> void:
	$"../../../../Synth/Control".monitoring = true
	$"../../../../Synth/Area2D".monitoring = true
	$"../../../../Synth/Control".visible = true
	$"../../../../Synth/Area2D".visible = true
