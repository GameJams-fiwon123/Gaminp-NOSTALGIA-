extends StaticBody2D

var has_key = true
var can_interact = false

func _input(event):
	if Input.is_action_just_pressed("interact") and can_interact:
		if has_key:
			has_key = false
			var new_key = key.instance()
			new_key.global_position = global_position
			Global.game.add_child(new_key)
			Global.game.catch_item(new_key)

func _on_Detect_body_entered(body):
	can_interact = true


func _on_Detect_body_exited(body):
	can_interact = false
