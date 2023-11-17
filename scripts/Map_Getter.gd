extends TileMap

@export var width = 18 * tile_set.tile_size.x * scale.x
@export var height = 11 * tile_set.tile_size.y * scale.y

# Called when the node enters the scene tree for the first time.
func _ready():
	print(11 * tile_set.tile_size.y * scale.y)
	print(18 * tile_set.tile_size.x * scale.x)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
