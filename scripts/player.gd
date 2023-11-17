extends CharacterBody2D

var SPEED = 400.0
var direction = Vector2()
var canDash = true
var DashTimer = 0.1
var IsDashing = false
var DashDirection = Vector2.ZERO
@export var facing = 0 #0 = Right Bottom; 1 = Left Bottom; 2 = Right Top; 3 = Left Top;
var facingX:int = 0
var facingY:int = 0

func _dash(delta):
	if Input.is_action_just_pressed("Dash") and canDash:
		DashDirection = direction.normalized() * 9
		if DashDirection == Vector2.ZERO:
			var DashX = -1 if (facing % 2 == 1) else 1
			var DashY = -1 if (facing >= 2) else 1
			DashDirection = Vector2(DashX, DashY).normalized() * 9
		canDash = false
		IsDashing = true
	elif IsDashing:
		DashTimer -= delta
	if DashTimer <= 0:
		DashTimer = 0.1
		canDash = true
		IsDashing = false
		DashDirection = Vector2.ZERO
		

func _input(_event):
	direction.x = Input.get_axis("Move_Left", "Move_Right")
	direction.y = Input.get_axis("Move_Up", "Move_Down")
	

func _process(delta):
	velocity.x = (direction.normalized().x + DashDirection.x) * SPEED
	velocity.y = (direction.normalized().y + DashDirection.y) * SPEED
	facingX = 1 if (direction.x < 0) else 0 if (direction.x > 0) else facingX
	facingY = 2 if (direction.y < 0) else 0 if (direction.y > 0) else facingY
	if (direction.x == 0):
		facing = (facing % 2) + facingY
	elif (direction.y == 0):
		facing = (facing / 2) + facingX
	else:
		facing = facingX + facingY

	_dash(delta)
	move_and_slide()

