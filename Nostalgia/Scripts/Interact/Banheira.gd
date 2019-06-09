extends StaticBody2D

var photo_texture = "res://GFX/Parts/Photo2.png"
var photo = preload("res://Scenes/Objects/Pegaveis/Photo.tscn")

var idea_texture = "res://GFX/Icons/Balao_desentupidor.png"

var has_photo = true
var can_interact = false

onready var audio = $AudioStreamPlayer

func _input(event):
	if Input.is_action_just_pressed("interact") and can_interact:
		if Global.game.has_desentupidor and has_photo:
			audio.play()
			Global.player.speed = 0
			Global.game.remove_item()
			has_photo = false
			Global.player.hide_idea()

func _on_Detect_body_entered(body):
	if(has_photo):
		Global.player.show_idea(load(idea_texture))
	can_interact = true


func _on_Detect_body_exited(body):
	if(has_photo):
		Global.player.hide_idea()
	can_interact = false


func _on_AudioStreamPlayer_finished():
	Global.player.speed = Global.player.base_speed
	var new_photo = photo.instance()
	new_photo.global_position = $SpawnPosition.global_position
	Global.game.objects.add_child(new_photo)
	new_photo.sprite.texture = load(photo_texture)