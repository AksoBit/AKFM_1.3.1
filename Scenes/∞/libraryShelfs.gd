extends TileMap

@export var map_width = 100
@export var map_height = 100
@export var max_tile_variants = 10  # Максимальное количество вариантов тайлов

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	for x in range(map_width):
		for y in range(map_height):
			# Случайный выбор тайла из доступных
			var tile_x = rng.randi_range(0, max_tile_variants - 1)
			var tile_coords = Vector2i(tile_x, 0)  # Предполагаем, что все тайлы в одной строке
			
			set_cell(0, Vector2i(x, y), 0, tile_coords)
