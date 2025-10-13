extends Camera2D
var act_cum_pos : Vector2

@export var target: Node2D
@export var deadzone_y: float = 50.0
@export var deadzone_uwu: float = 50.0 
@export var follow_speed: float = 3.0 
@export var follow_speed_but_sexyer: float = 3.0 
func _process(delta):
	if !target:
		return
		
	var target_y = target.global_position.y
	var delta_y = target_y - global_position.y
	
	if delta_y <= 0:
		if abs(delta_y) > deadzone_uwu:
				global_position.y = lerp(global_position.y, target_y - deadzone_uwu * sign(delta_y), follow_speed_but_sexyer * delta)
	else:
		if abs(delta_y) > deadzone_y:
				global_position.y = lerp(global_position.y, target_y - deadzone_y * sign(delta_y), follow_speed * delta)
