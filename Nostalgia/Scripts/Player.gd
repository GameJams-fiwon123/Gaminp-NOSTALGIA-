extends KinematicBody2D

var speed = 300
var motion = Vector2()

func _ready():
	pass
	
func _process(delta):
	move()
	move_and_slide(motion * speed)
	
func move():
	if Input.is_action_pressed("left"):
		motion.x = -1
	elif Input.is_action_pressed("right"):
		motion.x = 1
	else:
		motion.x = 0
		
	if Input.is_action_pressed("up"):
		motion.y = -1
	elif Input.is_action_pressed("down"):
		motion.y = 1
	else:
		motion.y = 0