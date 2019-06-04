extends StaticBody2D

var texture_key = load("res://GFX/Piso.png")

var has_key = true
var can_interact = false

func _input(event):
	if Input.is_action_just_pressed("interact") and can_interact:
		if has_key:
			has_key = false
			Global.game.catch_key(texture_key)

func _on_Detect_body_entered(body):
	can_interact = true


func _on_Detect_body_exited(body):
	can_interact = false
