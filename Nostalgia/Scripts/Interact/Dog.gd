extends KinematicBody2D

var photo = preload("res://Scenes/Objects/Pegaveis/Photo.tscn")

var has_photo = true
var can_interact = false

var speed = 200

var motion = Vector2()
var possible_destination = []
var path = []
var destination = Vector2()

export var walk_slowdown = 0.5
export var nav_stop_treshold = 5

var index = 0

onready var navigation = Global.navigation
onready var available_destinations = Global.destinations

onready var audio = $AudioStreamPlayer
onready var sprite = $Sprite

func _ready():
	audio.play()
	possible_destination = available_destinations.get_children()
	make_path()

func _process(delta):
	navigate()
	
func navigate():
	var distance_to_destination = position.distance_to(path[0])
	destination = path[0]
	
	if distance_to_destination > nav_stop_treshold:
		move()
	else:
		update_path()
	
func move():
	motion = (destination-position).normalized() * speed
	
	if motion.x >= 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
	
	if is_on_wall():
		make_path()
	
	move_and_slide(motion)

func make_path():
	randomize()
	
	index  = randi() % possible_destination.size()
		
	var next_destination = possible_destination[index]
	
	path = navigation.get_simple_path(global_position, next_destination.global_position, false)

func update_path():
	if path.size() == 1:
		if $Timer.is_stopped():
			$Timer.start()
	else:
		path.remove(0)

func _on_Timer_timeout():
	audio.play()
	make_path()

func _input(event):
	if Input.is_action_just_pressed("interact") and can_interact:
		if has_photo:
			var new_photo = photo.instance()
			new_photo.global_position = $SpawnPhoto.global_position
			Global.game.add_child(new_photo)
			
			has_photo = false

func _on_Detect_body_entered(body):
	can_interact = true


func _on_Detect_body_exited(body):
	can_interact = false
