extends Sprite2D

var direction = Vector2()
var distance = 0
@onready var sizemax = texture.get_size()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	direction.x = Input.get_axis("Aim_Left", "Aim_Right")
	direction.y = Input.get_axis("Aim_Up", "Aim_Down")
	distance = sqrt((direction.x * direction.x) + (direction.y * direction.y))
	clamp(distance, 0, 1)
	set_scale(Vector2(distance, distance))
	rotate(atan2(direction.y, direction.x) - rotation)
	position.x = 200 * direction.x
	position.y = 200 * direction.y - 64
	
