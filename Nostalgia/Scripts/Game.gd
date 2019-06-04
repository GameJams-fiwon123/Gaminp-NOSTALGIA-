extends Node2D

var dog = preload("res://Scenes/Objects/Dog.tscn")

var balls = []
var photos = []

var has_alicate = false
var has_ladder = false
var has_partitura = false
var has_key = false
var has_vassoura = false
var has_bath_key = false
var has_desentupidor = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.game = self

func teleport(index):
	print(Global.stairs_positions[index])
	Global.player.global_position = Global.stairs_positions[index]
			
func catch_ball():
	balls.append("ball")
	
func catch_photo():
	print("catch photo")
	photos.append("photo")
	
	if photos.size() == 5:
		var new_dog = dog.instance()
		new_dog.global_position = $Navigation2D/Destinations/Position2D.global_position
		self.add_child(new_dog)
	
func catch_alicate():
	has_alicate = true
	
func catch_ladder():
	has_ladder = true
	
func catch_partitura():
	has_partitura = true
	
func catch_key():
	has_key = true
	print("catch key")
	
func catch_vassoura():
	has_vassoura = true
	print("catch vassoura")
	
func catch_bath_key():
	has_bath_key = true
	print("catch bath key")
	
func catch_desentupidor():
	has_desentupidor = true
	print("catch desentupidor")