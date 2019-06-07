extends StaticBody2D

var idea_texture = "res://GFX/Icons/Balao_Escada.png"

var has_photo = true
var can_interact = false

func _input(event):
	if Input.is_action_just_pressed("interact") and can_interact:
		if Global.game.has_ladder and has_photo:
			Global.game.drop_item()
			$Photo.global_position = $SpawnPhoto.global_position
			has_photo = false
		elif(has_photo):
			Global.player.show_idea(load(idea_texture))

func _on_Detect_body_entered(body):
	can_interact = true

func _on_Detect_body_exited(body):
	can_interact = false

