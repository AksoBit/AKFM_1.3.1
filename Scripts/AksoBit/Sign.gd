extends TextureRect

#Бла бла бла какая скука. Я бы мог написать это от руки
#Но это такая сложная, скучная и незначительная херь что я поручил это нейронке
#(и пофиксил ее говнокод)
#(а точнее поставил на дрянные костыли)
#(и небо как кофе)
var painting = false
var canvas_image: Image
var canvas_texture: ImageTexture
var previous_pixel_pos: Vector2 = Vector2(-1, -1)
func _ready():
	canvas_image = Image.create(32, 32, false, Image.FORMAT_RGBA8)
	canvas_image.fill(	Color.from_hsv(0.092, 0.04, 0.95, 1.0))
	canvas_texture = ImageTexture.create_from_image(canvas_image)
	self.texture = canvas_texture
func _input(event):
	var mouse_pos = get_local_mouse_position()
	var current_pixel_pos = Vector2(
		clamp(int((mouse_pos.x / size.x) * 33), -1, 32),
		clamp(int((mouse_pos.y / size.y) * 33), -1, 32)
	)
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			painting = event.pressed
			if painting:
				draw_pixel_smooth(current_pixel_pos)
			previous_pixel_pos = current_pixel_pos if painting else Vector2(-1, -1)
				
	elif event is InputEventMouseMotion and painting:
		if previous_pixel_pos != Vector2(-1, -1):
			interpolate_pixels(previous_pixel_pos, current_pixel_pos)
		else:
			draw_pixel_smooth(current_pixel_pos)
		previous_pixel_pos = current_pixel_pos

func draw_pixel_smooth(pos: Vector2):
	for i in range(-1, 2):
		if is_position_valid(Vector2(pos.x + i, pos.y)):
			canvas_image.set_pixel(pos.x + i, pos.y, Color.BLACK)
		if is_position_valid(Vector2(pos.x, pos.y + i)):
			canvas_image.set_pixel(pos.x, pos.y + i, Color.BLACK)
	canvas_texture.update(canvas_image)

func interpolate_pixels(from: Vector2, to: Vector2):
	var distance = max(abs(from.x - to.x), abs(from.y - to.y))
	distance = max(distance, 1)
	
	for i in range(distance + 1):
		var t = float(i) / distance
		var interpolated_pos = Vector2(
			int(lerp(from.x, to.x, t)),
			int(lerp(from.y, to.y, t))
		)
		draw_pixel_smooth(interpolated_pos)

func is_position_valid(pos: Vector2) -> bool:
	return pos.x >= 0 and pos.x < 32 and pos.y >= 0 and pos.y < 32
