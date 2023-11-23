extends Area2D

@export var direction = Vector2(1.0,0.0)
var speed = 700.0

func _ready():
	pass

func _process(delta):
	position = position + speed * direction * delta
	

func _on_Bullet_body_entered(body):
	if body.is_in_group("mobs"):
		body.queue_free()
	queue_free()
