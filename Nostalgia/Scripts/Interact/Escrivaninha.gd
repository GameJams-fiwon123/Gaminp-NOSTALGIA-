extends StaticBody2D

var can_interact = false

func _input(event):
	if Input.is_action_just_pressed("interact") and can_interact:
		print("oi")
		if Global.game.photos.size() >= 6:
			Global.audio.volume_db = -4000
			Global.hud.change_scene(Global.FINAL)


func _on_Detect_body_entered(body):
	can_interact = true


func _on_Detect_body_exited(body):
	can_interact = false
