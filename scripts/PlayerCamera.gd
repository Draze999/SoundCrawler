extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	limit_right = get_node("../../Background/TileMap").width
	limit_bottom = get_node("../../Background/TileMap").height


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
