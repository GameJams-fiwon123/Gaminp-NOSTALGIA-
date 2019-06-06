extends StaticBody2D

var has_photo = true
var can_interact = false

onready var audio = $AudioStreamPlayer

func _input(event):
	if Input.is_action_just_pressed("interact") and can_interact:
		if Global.game.has_partitura and has_photo:
			audio.play()
			Global.player.speed = 0
			Global.audio.volume_db = -400
			Global.game.remove_item()
			Global.game.catch_photo()
			has_photo = false

func _on_Detect_body_entered(body):
	can_interact = true


func _on_Detect_body_exited(body):
	can_interact = false


func _on_AudioStreamPlayer_finished():
	Global.player.speed = Global.player.base_speed
	Global.audio.volume_db = -10
