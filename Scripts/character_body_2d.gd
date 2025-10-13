extends CharacterBody2D

func _process(delta: float) -> void:
	if not is_on_wall():
		velocity.x -= 1200 * delta
	else:
		velocity.x = 0
	if Input.is_action_just_pressed("ui_accept"):  # Пробел по умолчанию
		var mouse_pos = get_global_mouse_position()
		var UwU = mouse_pos.distance_to(global_position)
		velocity.x += sqrt(2 * 1200 * UwU)
	move_and_slide()
