extends StaticBody2D

var has_vassoura = true
var can_interact = false

func _input(event):
	if Input.is_action_just_pressed("interact") and can_interact:
		if Global.game.has_key and has_vassoura:
			has_vassoura = false
			Global.game.catch_vassoura()

func _on_Detect_body_entered(body):
	can_interact = true


func _on_Detect_body_exited(body):
	can_interact = false
