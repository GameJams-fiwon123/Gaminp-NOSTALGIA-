extends StaticBody2D

var photo_texture = "res://GFX/Parts/Photo5.png"
var photo = preload("res://Scenes/Objects/Pegaveis/Photo.tscn")

var idea_texture = "res://GFX/Icons/Balao_Partitura.png"

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
	Global.audio.volume_db = -10
	var new_photo = photo.instance()
	new_photo.global_position = $SpawnPhoto.global_position
	Global.game.objects.add_child(new_photo)
	new_photo.sprite.texture = load(photo_texture)