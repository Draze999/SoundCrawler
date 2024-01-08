extends AnimatedSprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var facing = get_parent().facing
	modulate.a = clamp(get_parent().berserkCount - 10, 0, 10) / 10.
	if facing == 0:
		play("IdleFR")
	if facing == 1:
		play("IdleFL")
	if facing == 2:
		play("IdleBR")
	if facing == 3:
		play("IdleBL")
