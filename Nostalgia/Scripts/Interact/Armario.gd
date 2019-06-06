extends StaticBody2D

var vassoura = preload("res://Scenes/Objects/Pegaveis/Vassoura.tscn")

var has_vassoura = true
var can_interact = false

func _input(event):
	if Input.is_action_just_pressed("interact") and can_interact:
		if Global.game.has_key and has_vassoura:	
			Global.game.remove_item()
			has_vassoura = false
			$AudioStreamPlayer.play()
			var new_vassoura = vassoura.instance()
			new_vassoura.global_position = $SpawnVassoura.global_position
			Global.game.add_child(new_vassoura)

func _on_Detect_body_entered(body):
	can_interact = true


func _on_Detect_body_exited(body):
	can_interact = false
