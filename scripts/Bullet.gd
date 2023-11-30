extends RigidBody2D

const speed = 1500.0
var timer = 3

signal hit(damage)

func initi(dir:Vector2):
	linear_velocity = speed * dir

func _process(delta):
	if (timer <= 0):
		queue_free()
	if (abs(linear_velocity.x) + abs(linear_velocity.y) < 25):
		timer -= delta

func _on_body_entered(body:Node):
	if (body.is_in_group("enemies")):
		print("Hit enemy")
		emit_signal("hit", 1)
	else:
		print("Poulet") # Replace with function body.
