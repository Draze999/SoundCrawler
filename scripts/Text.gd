extends RichTextLabel

var playerNode

# Called when the node enters the scene tree for the first time.
func _ready():
	playerNode = get_node("../../SubViewportContainer/SubViewport/World/Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var DashC = str(playerNode.DashCount)
	var Dashmax = str(playerNode.MaxDashCount)
	var DashCD = str(snappedf(playerNode.DashResetTimer, 0.1))
	var RockC = str(playerNode.ShootCount)
	var Rockmax = str(playerNode.MaxShootCount)
	var RockCD = str(snappedf(playerNode.ShootResetTimer, 0.1))
	var HP = ""
	for x in playerNode.Health:
		HP += '♥'
	var LastHP = ""
	for x in (playerNode.MaxHealth - playerNode.Health):
		LastHP += "♡"
	if DashCD.length() == 1:
		DashCD += ".0"
	var Berserk = ""
	for i in playerNode.berserkCount:
		Berserk += "▬"
	for i in (20 - playerNode.berserkCount):
		Berserk += "▭"
		
	text = " HP     : " + HP + LastHP + "\n Rage : " + Berserk
	text += "\n Dash : " + DashC + " / " + Dashmax + "\n CD     : " + DashCD
	text += "\n Rocks: " + RockC + " / " + Rockmax + "\n CD     : " + RockCD
