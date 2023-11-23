extends CharacterBody2D


const bullet = preload("res://scenes/bullet.tscn")
var SPEED = 400.0

var Health = 3
var MaxHealth = 5

var direction = Vector2()
var DashDirection = Vector2.ZERO

var canDash = true
var MaxDashTimer = 0.1
var MaxDashResetTimer = 3
var MaxDashCount = 5
var DashTimer = MaxDashTimer
@export var DashResetTimer = MaxDashResetTimer
@export var DashCount = MaxDashCount

var MaxShootResetTimer = 2
var MaxShootCount = 10
@export var ShootResetTimer = MaxShootResetTimer
@export var ShootCount = MaxShootCount

@export var facing = 0 #0 = Right Bottom; 1 = Left Bottom; 2 = Right Top; 3 = Left Top;
var facingX:int = 0
var facingY:int = 0

func _dash(delta):
	if Input.is_action_just_pressed("Dash") and canDash and (DashCount > 0):
		DashDirection = direction.normalized() * 9
		if DashDirection == Vector2.ZERO:
			var DashX = -1 if (facing % 2 == 1) else 1
			var DashY = -1 if (facing >= 2) else 1
			DashDirection = Vector2(DashX, DashY).normalized() * 9
		canDash = false
		DashCount -= 1
	elif not canDash:
		DashTimer -= delta
	if DashTimer <= 0:
		DashTimer = MaxDashTimer
		canDash = true
		DashDirection = Vector2.ZERO
	if DashCount < MaxDashCount:
		DashResetTimer -= delta
	if DashResetTimer <= 0:
		DashCount += 1
		DashResetTimer = MaxDashResetTimer
		
func spawn_rock(angle):
	var arrow_node = get_node("TargetArrow")
	if (arrow_node.distance > 0.3):
		ShootCount -= 1
		var curr_b = bullet.instantiate()
		get_parent().add_child(curr_b)
		curr_b.position = $Muzzle.global_position
		curr_b.direction = arrow_node.direction
		curr_b.rotate(arrow_node.rotation)
		
func _test_shoot(delta):
	if ShootCount < MaxShootCount:
		ShootResetTimer -= delta
	if ShootResetTimer <= 0:
		ShootCount += 1
		ShootResetTimer = MaxShootResetTimer
	if Input.is_action_just_pressed("Throw") and ShootCount > 0:
		spawn_rock(deg_to_rad(135))

func _test_health():
	if Input.is_action_just_pressed("Test_Health_Down"):
		Health = clamp(Health - 1, 0, MaxHealth)
	if Input.is_action_just_pressed("Test_Health_Up"):
		if Health == MaxHealth:
			MaxHealth += 1
		Health = clamp(Health + 1, 0, MaxHealth)

func _input(_event):
	direction.x = Input.get_axis("Move_Left", "Move_Right")
	direction.y = Input.get_axis("Move_Up", "Move_Down")
	
	

func _process(delta):
	velocity.x = (direction.x + DashDirection.x) * SPEED
	velocity.y = (direction.y + DashDirection.y) * SPEED
	facingX = 1 if (direction.x < 0) else 0 if (direction.x > 0) else facingX
	facingY = 2 if (direction.y < 0) else 0 if (direction.y > 0) else facingY
	if (direction.x == 0):
		facing = (facing % 2) + facingY
	elif (direction.y == 0):
		facing = (facing / 2) + facingX
	else:
		facing = facingX + facingY

	_test_shoot(delta)
	_test_health()
	_dash(delta)
	move_and_slide()

