extends Area2D

	
func _on_body_entered(body: Node2D) -> void:
		$"../CharacterBody2D".activated()
		queue_free()
