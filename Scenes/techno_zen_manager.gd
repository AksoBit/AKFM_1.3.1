extends Node2D
# Поверить не могу что я создаю МЕНЕДЖЕР ТЕХНОЗЕНОВ
var TechnoAmmount = 0
func _ready() -> void:
	if is_instance_valid($"../TechnoZen"): 
		TechnoAmmount += 1
		if is_instance_valid($"../TechnoZen2"):
			TechnoAmmount += 1
			if is_instance_valid($"../TechnoZen3"):
				TechnoAmmount += 1
				if is_instance_valid($"../TechnoZen4"):
					TechnoAmmount += 1
					if is_instance_valid($"../TechnoZen5"):
						print('Слишком много Дзенщин на квадратный метр')
	else:
		print("Ох, ну зачем здесь менеджер?")
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
