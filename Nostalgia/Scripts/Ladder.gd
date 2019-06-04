extends StaticBody2D

var ladder_texture = load("res://GFX/Piso.png")

var can_interact = false

func _input(event):
	if Input.is_action_just_pressed("interact") and can_interact:
		if Global.game.has_alicate:
			Global.game.remove_item(1)
			Global.game.catch_ladder(ladder_texture)
			queue_free()
		else:
			print("precisa de alicate")		


func _on_Detect_body_entered(body):
	can_interact = true


func _on_Detect_body_exited(body):
	can_interact = false
