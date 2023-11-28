extends Sprite2D

@export var direction = Vector2()
@export var rotations = 0
@export var distance = 0
@onready var sizemax = texture.get_size()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	var controllers =  Input.get_connected_joypads()
	if controllers.is_empty():
		var mouse_pos = get_viewport().get_mouse_position()
		var player_pos = get_node("../../Player").position
		var CamPos = get_viewport().get_camera_2d().get_screen_center_position()
		var positioncam = CamPos - (get_viewport_rect().size / 2)
		direction.x = - player_pos.x + mouse_pos.x + positioncam.x
		direction.y = - player_pos.y + mouse_pos.y + 64 + positioncam.y
		direction = direction.normalized()
	else:
		direction.x = Input.get_axis("Aim_Left", "Aim_Right")
		direction.y = Input.get_axis("Aim_Up", "Aim_Down")
	distance = sqrt((direction.x * direction.x) + (direction.y * direction.y))
	clamp(distance, 0, 1)
	set_scale(Vector2(distance, distance))
	modulate.a = distance * 0.7
	rotations = atan2(direction.y, direction.x) - rotation
	rotate(rotations)
	position.x = 200 * direction.x
	position.y = 200 * direction.y - 64
	
