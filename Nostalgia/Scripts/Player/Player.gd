extends KinematicBody2D

var speed = 300
var motion = Vector2()

onready var camera = $Camera2D

onready var sprite = $Sprite
onready var collision = $CollisionShape2D

func _ready():
	Global.player = self
	
func _process(delta):
	move()
	move_and_slide(motion * speed)
	
func move():
	if Input.is_action_pressed("left"):
		sprite.play("walk")
		sprite.scale.x = -0.1
		collision.position.x = 13
		motion.x = -1
	elif Input.is_action_pressed("right"):
		sprite.play("walk")
		sprite.scale.x = 0.1
		collision.position.x = -13
		motion.x = 1
	else:
		sprite.play("idle")
		motion.x = 0
		
	if Input.is_action_pressed("up"):
		motion.y = -1
	elif Input.is_action_pressed("down"):
		motion.y = 1
	else:
		motion.y = 0