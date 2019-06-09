extends StaticBody2D

var idea_texture = "res://GFX/Icons/Balao_vassoura.png"

var has_photo = true
var can_interact = false

var photo_texture = "res://GFX/Parts/Photo3.png"
var photo = preload("res://Scenes/Objects/Pegaveis/Photo.tscn")

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
			Global.player.hide_idea()

func _on_Detect_body_entered(body):
	can_interact = true
	if(has_photo):
		Global.player.show_idea(load(idea_texture))

func _on_Detect_body_exited(body):
	can_interact = false
	if(has_photo):
		Global.player.hide_idea()


func _on_AudioStreamPlayer_finished():
	Global.player.speed = Global.player.base_speed
	var new_photo = photo.instance()
	print(new_photo)
	new_photo.global_position = $SpawnPhoto.global_position
	Global.game.add_child(new_photo)
	new_photo.sprite.texture = load(photo_texture)
