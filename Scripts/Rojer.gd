extends CharacterBody2D

@onready var GG = get_parent().get_parent().get_node("UwUGG/UwUGG")
var is_attaking = false
var base_gravity = 1200
var direction = Vector2.ZERO
var fast_fall_gravity_multiplier = 1.5
var acceleration = 400 
var max_speed = 100  
var jumped = false
var can_jump = false
var is_rotating = false
var hp = 25
var fell = false
var AlreadyFellTimerStarted = false
var Activated = false
var Parriable = false
var is_falling = false
var IsOnSomeone = false
var Someone 
var BREAK = false
var Offset = Vector2.ZERO
var OnCoolDown = false
var BeliveHeCanFLy
func _physics_process(delta: float) -> void:
	
	if Activated == true:
		while IsOnSomeone and not BREAK:
			global_position =  Someone.global_position + Offset
			await get_tree().create_timer(0.01).timeout 
		IsOnSomeone = false
		if fell and AlreadyFellTimerStarted == false :
			is_falling = false
			is_rotating = false
			Parriable = false
			AlreadyFellTimerStarted = true
			await get_tree().create_timer(2).timeout 
			$Sprite2D.rotation = 0
			fell = false
			AlreadyFellTimerStarted = false
		if jumped and not fell and not is_falling:
			if direction.x >= 0:
				jumped = false
				while direction.x >= 0:
					await get_tree().create_timer(0.1).timeout 
				is_rotating = true
			else:
				jumped = false
				while direction.x < 0:
					await get_tree().create_timer(0.1).timeout 
				is_rotating = true
		var target_pos: Vector2 = GG.get_global_position()
		direction = (target_pos - global_position).normalized()
		if direction.x != 0:
			velocity.x = move_toward(velocity.x, direction.x * max_speed, acceleration * delta)
		else:
			velocity.x = move_toward(velocity.x, 0, acceleration * delta)
		if is_on_floor() and not fell and is_rotating:
			print($"..".name, ' падает')
			fell = true
		if can_jump and is_on_floor() and not fell:
			jump()
		if not fell:
			if velocity.x < 0 and not BeliveHeCanFLy:
				$Sprite2D.flip_h = false 
			elif velocity.x > 0 and not BeliveHeCanFLy:
				$Sprite2D.flip_h = true
			elif velocity.x < 0 and BeliveHeCanFLy:
				$Sprite2D.flip_h = true
			elif velocity.x > 0 and BeliveHeCanFLy:
				$Sprite2D.flip_h = false
		var current_gravity = base_gravity
		if is_on_floor():
			BeliveHeCanFLy = false
		if velocity.y > 0 and not is_on_floor():
			current_gravity *= fast_fall_gravity_multiplier
			if is_rotating == true:
				$Sprite2D.rotation += 0.3
				await get_tree().create_timer(0.01).timeout 
		if not is_on_floor() and not IsOnSomeone:
			velocity.y += current_gravity * delta
		if not fell and not IsOnSomeone:
			move_and_slide()
func _on_jump_range_body_entered(body: Node2D):
		if body.name == "UwUGG" and not OnCoolDown:
			can_jump = true
func _on_attack_area_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage") and not IsOnSomeone and (Parriable or BeliveHeCanFLy):
		print($"..".name, " прицепился к ", body.name)
		Someone = body
		IsOnSomeone = true
		collision_layer = (1 << 9)
		Offset = global_position - body.global_position
		for i in 20:
			if not IsOnSomeone and not BREAK:
				break
			Parriable = true
			print($"..".name, ' кускус')
			Someone.take_damage(5)
			await get_tree().create_timer(0.2).timeout 
		IsOnSomeone = false
		BREAK = false
		collision_layer = (1 << 2)
	if body.name == "UwUGG": 
		is_attaking = true
		while is_attaking and not fell and not IsOnSomeone and not BeliveHeCanFLy:
			print($"..".name, ' делает кусь')
			body.take_damage(5)
			await get_tree().create_timer(0.1).timeout 
	elif body.has_method("take_damage"):
		is_attaking = true
		while is_attaking and not fell:
			Parriable = false
			print($"..".name, ' делает кусь чему-то')
			body.take_damage(5)
			await get_tree().create_timer(0.1).timeout 
func _on_attack_area_body_exited(body: Node2D) -> void:
	if body.name == "UwUGG": 
		is_attaking = false
		IsOnSomeone = false
		print($"..".name, ' не делает кусь')
func take_damage(damage) -> void:
	hp -= damage	
	print($"..".name, ' прилетело')
	if hp <= 0:
		die() 
func die():
	print('Роджер того')
	is_attaking = false
	Global.RoDeath()
	queue_free()
func parry(Dir):
	if Parriable:
		BeliveHeCanFLy = true
		velocity = Dir
		print('+parry')
		Parriable = false
		$Sprite2D.flip_v = true
		is_attaking = false
		while BeliveHeCanFLy:
			is_attaking = false
			look_at(velocity.normalized()) 
			move_and_slide()
			await get_tree().create_timer(0.01).timeout 
		rotation_degrees = 0
		$Sprite2D.flip_v = false
	if IsOnSomeone:
		BREAK = true
		collision_layer = (1 << 2)
func activate():
		print($"..".name, " активирован")
		Activated = true
func jump():
		print($"..".name, ' прыгает')
		Parriable = true
		var target_height = GG.global_position.y
		var current_height = global_position.y
		if target_height >= current_height:
			return
		var required_height = current_height - target_height 
		velocity.y += -sqrt(2 * base_gravity * required_height) 
		if $Sprite2D.flip_h == false:
			velocity.x -= 600
		else:
			velocity.x += 600
		jumped = true
func _on_jump_range_body_exited(body: Node2D) -> void:
	if body.name == "UwUGG": 
		can_jump = false
func CoolDown():
	can_jump = false
	OnCoolDown = true
	$BiTimer.start()
func _on_bi_timer_timeout() -> void:
	OnCoolDown = false
