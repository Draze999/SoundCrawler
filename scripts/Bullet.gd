extends StaticBody2D

@export var direction = Vector2(1.0,0.0)
var speed = 2000.0

func _ready():
	pass

func _physics_process(delta):
	position = position + speed * direction * delta
	speed = clamp(speed - (speed / 33), 0, 2000)
	

