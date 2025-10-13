extends Area2D
var Splat = preload("res://Scenes/splat.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body == $"..":
		return
	body.add_child(Splat)
	Splat.global_position = global_position
	queue_free()
	
