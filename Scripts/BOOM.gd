extends Area2D
var damage = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(damage)
	
func DESTROY():
	damage = $"../RigidBody2D".Damage
	await get_tree().create_timer(0.5).timeout
	queue_free()
