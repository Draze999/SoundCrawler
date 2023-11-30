extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export var patrol_type: PackedStringArray = ["Loop", "Linear"]
@onready var path_follow = get_parent()

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	$AnimatedSprite2D.play("idle")
