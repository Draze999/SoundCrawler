extends RigidBody2D

const speed = 1500.0
var timer = 3
var light_timer = 0
var light_node
var impact_velocity = 0
var old_vel = Vector2(0, 0)
var new_vel = Vector2(0, 0)

func _ready():
	light_node = get_node("./PointLight2D")

func initi(dir:Vector2):
	linear_velocity = speed * dir
	
func curver(x):
	return x * x * x * x

func _process(delta):
	old_vel = new_vel
	new_vel = linear_velocity
	if (scale.x <=0.1):
		queue_free()
	elif (timer <= 0):
		freeze = true
		apply_scale(Vector2(0.92, 0.92))
	elif (abs(linear_velocity.x) + abs(linear_velocity.y) < 25):
		timer -= delta
	if (light_timer > 0) :
		light_timer = clamp(light_timer - delta, 0, 1)
		light_node.scale = Vector2(1 + impact_velocity * curver(light_timer), 1 + impact_velocity * curver(light_timer))

func _on_body_entered(_body):
	light_timer += 1
	impact_velocity = (sqrt(old_vel.x * old_vel.x + old_vel.y * old_vel.y) / 750)
	print(impact_velocity)
	$Audio.pitch_scale = randf_range(0.3, 0.7)
	$Audio.play(0)
	print("Poulet") # Replace with function body.
