extends CharacterBody2D

var SPEED = 400.0
var direction = Vector2()
var canDash = true
var DashTimer = Timer.new()
var DashDirection = Vector2.ZERO
var facing = 0 #0 = Right Bottom; 1 = Left Bottom; 2 = Right Top; 3 = Left Top;

func _dash():
	if Input.is_action_just_pressed("ui_accept") and canDash:
		DashDirection = direction.normalized() * 3
		canDash = false
		DashTimer.start(1) #DashTimer Bug Currently
		canDash = true
	elif not canDash:
		print("Currently dashing. Time left : ", DashTimer.time_left)
		DashDirection = DashDirection * DashTimer.time_left
		

func _input(_event):
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	

func _process(_delta):
	facing = 0
	velocity.x = (direction.normalized().x + DashDirection.x) * SPEED
	velocity.y = (direction.normalized().y + DashDirection.y) * SPEED
	if direction.x < 0:
		facing += 1
	if direction.y < 0:
		facing += 2

	_dash()
	move_and_slide()

