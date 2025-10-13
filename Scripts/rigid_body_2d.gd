extends RigidBody2D
var Parriable = true
var Damage = 10
func _ready() -> void:
	await get_tree().create_timer(0.01).timeout
	apply_torque(10000)
	var mouse_pos = get_global_mouse_position()
	var req = global_position.y - get_global_mouse_position().y
	if req < 0:
		linear_velocity.y += -sqrt(2 * 980) 
	else:
		linear_velocity.y += -sqrt(2 * 980 * req) 
	var reqx = global_position.x - get_global_mouse_position().x
	linear_velocity.x += -reqx
	
func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if $"../Area2D" == null:
		return
	else:
		if body.has_method("take_damage") and not body.name == "UwUGG":
			body.take_damage(Damage)
		elif body.name == "UwUGG":
			body.take_damage(Damage/4)
		linear_velocity = Vector2.ZERO
		$"../Area2D".visible = true
		$"../Area2D".monitoring = true
		$"../Area2D".global_position = global_position
		$"../Area2D".DESTROY()
		queue_free()
func parry(Dir):
		linear_velocity = Dir
		Damage += 20
		print('+parry')
