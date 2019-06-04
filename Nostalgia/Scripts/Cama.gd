extends StaticBody2D

var has_photo = true
var can_interact = false

func _input(event):
	if Input.is_action_just_pressed("interact") and can_interact:
		if has_photo and Global.game.has_vassoura:
			Global.game.remove_item(5)
			has_photo = false
			Global.game.catch_photo()

func _on_Detect_body_entered(body):
	can_interact = true


func _on_Detect_body_exited(body):
	can_interact = false
