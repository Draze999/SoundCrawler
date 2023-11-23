extends Control

var playerNode

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var CamPos = get_viewport().get_camera_2d().get_screen_center_position()
	position = CamPos - (get_viewport_rect().size / 2)
	size = get_viewport_rect().size

