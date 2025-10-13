extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var parent_sprite = get_parent() as Sprite2D
	if parent_sprite and parent_sprite.texture:
		material.set_shader_parameter("parent_texture", parent_sprite.texture)
