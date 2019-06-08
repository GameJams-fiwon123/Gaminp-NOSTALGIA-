extends StaticBody2D

var open_texture = "res://GFX/Comodos/lavanderia2.png"
var vassoura = preload("res://Scenes/Objects/Pegaveis/Vassoura.tscn")

var idea_texture = "res://GFX/Icons/Balao_Chave_Amarela.png"

var has_vassoura = true
var can_interact = false

func _input(event):
	if Input.is_action_just_pressed("interact") and can_interact:
		if Global.game.has_key and has_vassoura:	
			Global.game.remove_item()
			has_vassoura = false
			Global.game.current_comodo.sprite.texture = load(open_texture)
			$AudioStreamPlayer.play()
			var new_vassoura = vassoura.instance()
			new_vassoura.global_position = $SpawnVassoura.global_position
			Global.game.objects.add_child(new_vassoura)
			Global.player.hide_idea()

func _on_Detect_body_entered(body):
	if (has_vassoura):
		Global.player.show_idea(load(idea_texture))
	can_interact = true


func _on_Detect_body_exited(body):
	if (has_vassoura):
		Global.player.hide_idea()
	can_interact = false
