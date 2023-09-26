extends CharacterBody2D

class_name Ball

var initial_speed = 20
var speed_multi = 1.02

var light = 0.0

var speed_ball = initial_speed

var started = false

func _ready():
	randomize()
	
func init_ball():
	started = false
	velocity = Vector2(0,0)
	position.x = 560
	position.y = 300
	
func _physics_process(delta):
	var collition = move_and_collide(velocity * speed_ball * delta)
	
	if collition:
		light = 0.7
		$ColorRect.color = Color(1,1,1)
		velocity = velocity.bounce(collition.get_normal()) * speed_multi
	else:
		if light == 0:
			$ColorRect.color = Color(0,1,0)
		elif light > 0:
			light -= delta
			if light < 0:
				light = 0

func _input(event):
	if event.is_action_pressed("ui_accept") && !started:
		started = true
		rand_move()
		
func rand_move():
	velocity.x = [-1, 1][randi() % 2] * initial_speed
	velocity.y = [-.8,.8][randi() % 2] * initial_speed
	
	#Physics->2D->Gravity=0, Vector=0,0
