extends StaticBody2D

var has_photo = true
var can_interact = false

onready var audio = $AudioStreamPlayer

var audio_varrendo = "res://SFX/varrendo.ogg"

func _input(event):
	if Input.is_action_just_pressed("interact") and can_interact:
		if has_photo and Global.game.has_vassoura:
			audio.stream = load(audio_varrendo)
			audio.play()
			Global.player.speed = 0
			Global.game.remove_item()
			has_photo = false
			Global.game.catch_photo()

func _on_Detect_body_entered(body):
	can_interact = true


func _on_Detect_body_exited(body):
	can_interact = false


func _on_AudioStreamPlayer_finished():
	Global.player.speed = Global.player.base_speed
