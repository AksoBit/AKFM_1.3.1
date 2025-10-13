extends Area2D
var IsInFuckIdkActually = false
var IsInFuckIdkActuallyUwU = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if IsInFuckIdkActually == true:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			print('UwU')
			IsInFuckIdkActually = false
			monitoring = false
			get_tree().change_scene_to_file("res://Scenes/POLY.tscn")

func _on_mouse_entered() -> void:
	IsInFuckIdkActually = true
	


func _on_mouse_exited() -> void:
	IsInFuckIdkActually = false
