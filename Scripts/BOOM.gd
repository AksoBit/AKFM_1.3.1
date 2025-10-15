extends Area2D
var damage = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_body_entered(body: Node2D) -> void:
		if body.has_method("take_damage") and not body.name == "UwUGG":
			body.take_damage(damage)
		elif body.name == "UwUGG":
			body.take_damage(damage/4)
	
func DESTROY():
	damage = $"../RigidBody2D".Damage
	await get_tree().create_timer(0.5).timeout
	get_parent().queue_free()
