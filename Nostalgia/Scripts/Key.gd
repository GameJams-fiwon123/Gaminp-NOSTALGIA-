extends Area2D

var can_interact = false

func _input(event):
	if Input.is_action_just_pressed("interact") and can_interact:
		Global.game.catch_bath_key($Sprite.texture)
		queue_free()

func _on_Key_body_entered(body):
	can_interact = true


func _on_Key_body_exited(body):
	can_interact = false
