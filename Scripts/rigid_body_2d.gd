extends RigidBody2D
var Parriable = true
var Damage = 10
var FirstDot
var SecondDot
var Distance
var Direction
var MC 
@onready var CoolRay = $"../RayCast2D"
func _ready() -> void:
	set_process(false)
	await get_tree().process_frame
	FirstDot = global_position
	CoolRay.global_position = FirstDot
	apply_torque(10000)
	var mouse_pos = get_global_mouse_position()
	var req = global_position.y - mouse_pos.y
	if req < 0:
		linear_velocity.y += -sqrt(2 * 980) 
	else:
		linear_velocity.y += -sqrt(2 * 980 * req) 
	var reqx = global_position.x - mouse_pos.x
	linear_velocity.x += -reqx
	set_process(true)
func _process(delta: float) -> void:
	CoolRay.global_position = FirstDot
	SecondDot = global_position
	Direction = (SecondDot - FirstDot)
	Distance = Direction.length()
	CoolRay.target_position = Vector2.RIGHT * Distance
	CoolRay.global_rotation = Direction.angle()
	CoolRay.force_raycast_update()
	if CoolRay.is_colliding():
		var body = CoolRay.get_collider()
		if body.has_method("take_damage") and not body.name == "UwUGG":
			body.take_damage(Damage)
			MC.OVERLOAD += 5
		elif body.name == "UwUGG":
			body.take_damage(Damage/4)
		print("Поезд сделал БУМ")
		var Thingy = CoolRay.get_collision_point()
		$"../Area2D".visible = true
		$"../Area2D".monitoring = true
		$"../Area2D".global_position = Thingy
		$"../Area2D".DESTROY()
		queue_free()
	FirstDot = global_position
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
		linear_velocity = Dir * 3
		Damage += 20
		print('+parry')
