extends CharacterBody2D

var moveSpeed = 200

func _ready():
	$AnimatedSprite2D.play("idle")

func _process(delta):
	velocity.x = moveSpeed
	move_and_slide()
	
	if is_on_wall():
		moveSpeed *= -1
		$AnimatedSprite2D.flip_h = !$AnimatedSprite2D.flip_h 

func _take_damage(damage):
	print("Je prends " + damage.to_string() + " degats")
	pass
