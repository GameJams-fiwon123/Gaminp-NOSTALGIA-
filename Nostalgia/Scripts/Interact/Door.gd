extends StaticBody2D

var idea_texture = "res://GFX/Icons/Balao_Chave_azul.png"

export(int, "None", "Banheiro") var type_door
export(bool) var is_locked = false

var audio_destrancar = "res://SFX/Destrancar.ogg"
var audio_porta = "res://SFX/porta.ogg"

var is_near_enter = false
var is_near_exit = false

var can_interact = false

onready var audio = $AudioStreamPlayer

onready var position_enter = $EnterDetect/Position2D
onready var position_exit = $ExitDetect/Position2D


func _on_ExitDetect_body_entered(body):
	is_near_exit = true
	can_interact = true
	if is_locked and type_door == 1:
		Global.player.show_idea(load(idea_texture))


func _on_EnterDetect_body_entered(body):
	is_near_enter = true
	can_interact = true
	if is_locked and type_door == 1:
		Global.player.show_idea(load(idea_texture))


func _on_EnterDetect_body_exited(body):
	is_near_enter = false
	can_interact = false
	if is_locked and type_door == 1:
		Global.player.hide_idea()


func _on_ExitDetect_body_exited(body):
	is_near_exit = false
	can_interact = false
	if is_locked and type_door == 1:
		Global.player.hide_idea()


func _input(event):
	if Input.is_action_just_pressed("interact") and can_interact and not is_locked and Global.hud.can_change_comodo():
		if not audio.is_playing():	
			if is_near_enter:
				Global.hud.change_comodo(position_enter.global_position)
				is_near_enter = false
			elif is_near_exit:
				Global.hud.change_comodo(position_exit.global_position)
				is_near_exit = false
			
	
			audio.stream = load(audio_porta)
			audio.play()
	elif Input.is_action_just_pressed("interact") and Global.game.has_bath_key and can_interact and is_locked and type_door == 1:
		Global.game.remove_item()
		audio.stream = load(audio_destrancar)
		audio.play()
		is_locked = false
		Global.player.hide_idea()
