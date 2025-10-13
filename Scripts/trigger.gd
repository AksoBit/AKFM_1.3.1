extends Area2D

#Это не прям костыль, но просто необычное решение
#Каждый дублированный триггер будет иметь имя TRIGGER(номер тригера).
#И эта хрень ореинтируется на это
func _on_body_entered(body: Node2D) -> void:
	if name == "TRIGGER":
		$"../ReRodger3/Roach".activate()
		$"../UwUGG/UwUGG".EPICER_MUSIK()
		queue_free()
	if name == "TRIGGER3":
		$"../ReRodger2/Roach".activate()
		$"../ReRodger4/Roach".activate()
		$"../ReRodger/Roach".activate()
		queue_free()
	if name == "TRIGGER4":
		$"../ManHack3/ManHack".activate()
		queue_free()
	if name == "TRIGGER5":
		$"../ReRodger5/Roach".activate()
		$"../ReRodger6/Roach".activate()
		$"../ReRodger7/Roach".activate()
		$"../ReRodger8/Roach".activate()
		$"../ManHack2/ManHack".activate()
		queue_free()
	if name == "TRIGGER6":
		$"../TechnoZen/TechnoZen".activate()
		$"../ManHack5/ManHack".activate()
		$"../ManHack4/ManHack".activate()
		$"../ReRodger9/Roach".activate()
		$"../ReRodger10/Roach".activate()
		$"../ReRodger11/Roach".activate()
		$"../ReRodger12/Roach".activate()
		queue_free()
