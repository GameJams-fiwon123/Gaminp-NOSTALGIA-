extends StaticBody2D

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
				Global.game.catch_photo()

func _on_Detect_body_entered(body):
	can_interact = true


func _on_Detect_body_exited(body):
	can_interact = false
