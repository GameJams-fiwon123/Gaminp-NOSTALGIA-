extends Area2D

export(int, "Descendo", "Subindo") var index_type
export(int, "Sala de Estar", "Sala de Jogos", "Sala de Jantar", "Sala de Música") var index_comodo
export(int, "Sala de Estar", "Sala de Jogos", "Sala de Jantar", "Sala de Música") var teleport_comodo

var is_enter = false

onready var audio = $AudioStreamPlayer
var audio_type = ["res://SFX/Escada_descendo.ogg", "res://SFX/Escada_Subindo.ogg"]

func _ready():
	Global.stairs_positions[index_comodo] = global_position
	print(audio)

func _input(event):
	if Input.is_action_just_pressed("interact") and is_enter and Global.hud.can_change_comodo():
		audio.stream = load(audio_type[index_type])
		audio.play()
		Global.game.teleport(teleport_comodo)
		is_enter = false
			
func _on_Stair_body_entered(body):
	is_enter = true


func _on_Stair_body_exited(body):
	is_enter = false
