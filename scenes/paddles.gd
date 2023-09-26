extends Node2D

const SPEED = 1000

@onready var viewport_Y = get_viewport().size.y
@onready var paddle_Y = $Left/ColorRect.size.y

var current_y = 0

func _ready():
	
	move_paddles((viewport_Y / 2) - (paddle_Y/2))

func _physics_process(delta):
	if Input.is_action_pressed("ui_down") || Input.is_action_pressed("ui_left"):
		move_paddles(current_y + SPEED * delta)
	elif Input.is_action_pressed("ui_up") || Input.is_action_pressed("ui_right"):
		move_paddles(current_y - SPEED * delta)
		
		
func move_paddles(pos_y):
	if pos_y < 0:
		pos_y = 0
	elif pos_y > viewport_Y-paddle_Y:
		pos_y = viewport_Y-paddle_Y
	current_y = pos_y
	$Left.position.y = pos_y
	$Right.position.y = pos_y
