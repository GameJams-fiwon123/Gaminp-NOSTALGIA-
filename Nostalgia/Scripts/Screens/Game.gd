extends Node2D

var dog = preload("res://Scenes/Objects/Interact/Dog.tscn")

var photos = []
var ref_object = null

var has_ball = false
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

var audio_pegar = "res://SFX/pegar_item.ogg"
var audio_soltar = "res://SFX/soltar_item.ogg"

onready var audio = $AudioStreamPlayer
onready var objects = $YSort

var current_comodo

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.audio.stream != load(Global.audio_game):
		Global.audio.stream = load(Global.audio_game)
		Global.audio.volume_db = -10
		Global.audio.play()
	Global.game = self

func teleport(index):
	Global.hud.change_comodo(Global.stairs_positions[index])
			
	
func catch_photo():
	print("catch photo")
	photos.append("photo")
	Global.hud.change_progress(photos.size())	
	
	audio.stream = load(audio_pegar)
	audio.play()

	if photos.size() == 5:
		var new_dog = dog.instance()
		new_dog.global_position = $Navigation2D/Destinations/Position2D.global_position
		objects.add_child(new_dog)
	elif photos.size() == 6:
		Global.escrivaninha.arrow.visible = true

func drop_item():
	audio.stream = load(audio_soltar)
	audio.play()
	
	remove_item()

func remove_item():
	match (ref_object.index):
		BALL:
			has_ball = false
		ALICATE:
			has_alicate = false
		LADDER:
			has_ladder = false
		PARTITURA:
			has_partitura = false
		ARMARIO_KEY:
			has_key = false
		VASSOURA:
			has_vassoura = false
		BATH_KEY:
			has_bath_key = false
		DESENTUPIDOR:
			has_desentupidor = false	
			
	Global.hud.remove_item()
	ref_object = null

func add_item(object):
	ref_object = object
	Global.hud.add_item(object.sprite.texture)

# ITEMS	
func catch_item(object):
	audio.stream = load(audio_pegar)
	audio.play()
	
	if ref_object != null:	
		ref_object.global_position = object.global_position
		remove_item()
	
	match (object.index):
		BALL:
			has_ball = true
		ALICATE:
			has_alicate = true
		LADDER:
			has_ladder = true
		PARTITURA:
			has_partitura = true
		ARMARIO_KEY:
			has_key = true
		VASSOURA:
			has_vassoura = true
		BATH_KEY:
			has_bath_key = true
		DESENTUPIDOR:
			has_desentupidor = true
	
	add_item(object)
	
	ref_object.global_position = Vector2(-1000, -1000)