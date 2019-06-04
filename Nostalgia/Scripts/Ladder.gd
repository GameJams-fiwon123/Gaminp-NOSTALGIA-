extends StaticBody2D

var can_interact = false

func _input(event):
	if Input.is_action_just_pressed("interact") and can_interact:
		if Global.game.has_alicate:
			Global.game.catch_ladder()
			queue_free()
		else:
			print("precisa de alicate")		


func _on_Detect_body_entered(body):
	can_interact = true


func _on_Detect_body_exited(body):
	can_interact = false
