extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pitch_scale = Global.MusicPitch


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#Грустно наверное быть таким кодом. Простой рудимент, забытый всеми.
	#Само его существование не имеет необходимости.
	#Скоро он будет удален из игры.
	#Разве это не ужасно? 
	#Существовать только для того, чтобы быть замененным?
	#Я бы не хотел такой судьбы ни для кого.
