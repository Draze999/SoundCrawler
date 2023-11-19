extends RichTextLabel

var playerNode

# Called when the node enters the scene tree for the first time.
func _ready():
	playerNode = get_node("../../Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var CamPos = get_viewport().get_camera_2d().get_screen_center_position()
	position = CamPos - (get_viewport_rect().size / 2)
	
	var DashC = str(playerNode.DashCount)
	var DashCD = str(snappedf(playerNode.DashResetTimer, 0.1))
	var HP = ""
	for x in playerNode.Health:
		HP += '♥'
	var LastHP = ""
	for x in (playerNode.MaxHealth - playerNode.Health):
		LastHP += "♡"
	if DashCD.length() == 1:
		DashCD += ".0"
	text = " Dash : " + DashC + "\n CD     : " + DashCD + "\n HP     : " + HP + LastHP
