extends StaticBody2D

var can_interact = false
onready var sprite = $Sprite

func _input(event):
	if Input.is_action_just_pressed("interact") and can_interact:
		can_interact = false
		Global.game.catch_photo()
		queue_free()

func _on_Detect_body_entered(body):
	can_interact = true


func _on_Detect_body_exited(body):
	can_interact = false
