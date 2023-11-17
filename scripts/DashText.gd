extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var DashC = str(get_node("../Player").DashCount)
	var DashCD = str(snappedf(get_node("../Player").DashResetTimer, 0.1))
	var HP = ""
	for x in get_node("../Player").Health:
		HP += '♥'
	var LastHP = ""
	for x in (get_node("../Player").MaxHealth - get_node("../Player").Health):
		LastHP += "♡"
	if DashCD.length() == 1:
		DashCD += ".0"
	text = " Dash : " + DashC + "\n CD     : " + DashCD + "\n HP     : " + HP + LastHP
