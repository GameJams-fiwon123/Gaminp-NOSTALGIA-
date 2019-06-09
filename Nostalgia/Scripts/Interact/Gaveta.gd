extends StaticBody2D

var photo_texture = "res://GFX/Parts/Photo4.png"
var photo = preload("res://Scenes/Objects/Pegaveis/Photo.tscn")

var idea_texture = "res://GFX/Icons/Balao_bolas_de_sinuca.png"

var has_photo = true
var can_interact = false

var balls = []

func _input(event):
	if Input.is_action_just_pressed("interact") and can_interact:
		if Global.game.has_ball:
			balls.append("ball")
			Global.game.drop_item()
			if balls.size() >= 3 and has_photo:
				has_photo = false
				var new_photo = photo.instance()
				new_photo.global_position = $SpawnPhoto.global_position
				Global.game.objects.add_child(new_photo)
				new_photo.sprite.texture = load(photo_texture)
				Global.player.hide_idea()

func _on_Detect_body_entered(body):
	can_interact = true
	if(has_photo):
		Global.player.show_idea(load(idea_texture))


func _on_Detect_body_exited(body):
	can_interact = false
	if(has_photo):
		Global.player.hide_idea()
