extends StaticBody2D

var can_catch = false

func _input(event):
	if Input.is_action_just_pressed("interact") and can_catch:
		Global.game.catch_ball()
		queue_free()

func _on_Detect_body_entered(body):
	can_catch = true


func _on_Detect_body_exited(body):
	can_catch = false
