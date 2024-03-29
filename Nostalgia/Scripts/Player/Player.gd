extends KinematicBody2D

var base_speed = 450

var speed = 450
var motion = Vector2()

onready var camera = $Camera2D

onready var sprite = $Sprite
onready var collision = $CollisionShape2D

func _ready():
	Global.player = self
	
	
func _process(delta):
	move()
	move_and_slide(motion * speed)
	
func show_idea(texture):
	$Node2D/Idea.texture = texture
	$AnimationPlayer.play("show_idea")
	
func hide_idea():
	$AnimationPlayer.stop(true)
	$AnimationPlayer.play("hide_idea")
	
func move():
	
	motion.x = 0
	motion.y = 0
	
	if speed > 0:
		if Input.is_action_pressed("left"):
			sprite.play("walk")
			sprite.scale.x = -0.15
			motion.x = -1
		elif Input.is_action_pressed("right"):
			sprite.play("walk")
			sprite.scale.x = 0.15
			motion.x = 1

			
		if Input.is_action_pressed("up"):
			motion.y = -1
			sprite.play("walk")
		elif Input.is_action_pressed("down"):
			motion.y = 1
			sprite.play("walk")

			
	if motion.x == 0 and motion.y == 0:
		sprite.play("idle")