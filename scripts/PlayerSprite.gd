extends Sprite2D
var TextBL = load("res://sprites/Player/BotLeft.png")
var TextBR = load("res://sprites/Player/BotRight.png") 
var TextTL = load("res://sprites/Player/TopLeft.png") 
var TextTR = load("res://sprites/Player/TopRight.png") 

# Called when the node enters the scene tree for the first time.
func _ready():
	texture=TextBR


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var facing = get_parent().facing
	if facing == 0:
		texture = TextBR
	if facing == 1:
		texture = TextBL
	if facing == 2:
		texture = TextTR
	if facing == 3:
		texture = TextTL
