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

const BALL = 0
const ALICATE = 1
const LADDER = 2
const PARTITURA = 3   
const ARMARIO_KEY = 4 
const VASSOURA = 5 
const BATH_KEY = 6
const DESENTUPIDOR = 7

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.game = self

func teleport(index):
	print(Global.stairs_positions[index])
	Global.player.global_position = Global.stairs_positions[index]
			
	
func catch_photo():
	photos.append("photo")
	Global.hud.change_progress(photos.size())	

	if photos.size() == 5:
		var new_dog = dog.instance()
		new_dog.global_position = $Navigation2D/Destinations/Position2D.global_position
		self.add_child(new_dog)

func remove_item(index):
	Global.hud.remove_item(index)

func add_item(index, quantity, texture):
	Global.hud.add_item(index, quantity, texture)

# ITEMS	
func catch_ball(texture):
	balls.append("ball")
	add_item(BALL ,balls.size(), texture)	
	
func catch_alicate(texture):
	has_alicate = true
	add_item(ALICATE , 1, texture)	
	
func catch_ladder(texture):
	has_ladder = true
	add_item(LADDER , 1, texture)	
	
func catch_partitura(texture):
	has_partitura = true
	add_item(PARTITURA , 1, texture)	
	
func catch_key(texture):
	has_key = true
	add_item(ARMARIO_KEY , 1, texture)	
	
func catch_vassoura(texture):
	has_vassoura = true
	add_item(VASSOURA , 1, texture)	
	
func catch_bath_key(texture):
	has_bath_key = true
	add_item(BATH_KEY , 1, texture)	
	
func catch_desentupidor(texture):
	has_desentupidor = true
	add_item(DESENTUPIDOR , 1, texture)	