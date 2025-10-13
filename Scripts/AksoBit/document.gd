extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_custom_mouse_cursor(load("res://Sprites/AksoBit/Pen.png"), Input.CURSOR_ARROW, Vector2(0, 332))
	var date = "{day}/{month}/{year}".format(Time.get_datetime_dict_from_system())
	$"../Label".text = str("Я, ", OS.get_environment("USERNAME"), "
пребывая в твердом уме и здравой памяти полностью осознаю восхитительную и вопиющую неиграбельность и выходящие из нее риски появления включая, но не заканчивая:
Мигрени
Тошноты
Рвоты
Рака глаз
Рака мозга
Вареного рака 
Диарии 
ПТСР
Шизофрении
Суицидальных наклонностей
Гинофобии
Мучительной смерти

Настоящим заявлением я освобождаю АксоБита и АксоБита от ответственности и обязуюсь принять вину за убийство 35-го президента Соединенных Штатов Америки Джона Фицджералда Кеннеди в пятницу 22 ноября 1963 года в Далласе. 

", date, "   Подпись Бита:          Подпись ", OS.get_environment("USERNAME"), ":")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
