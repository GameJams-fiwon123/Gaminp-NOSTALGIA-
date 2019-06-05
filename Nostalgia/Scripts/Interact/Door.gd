extends StaticBody2D

export(bool) var is_locked = false

var is_near_enter = false
var is_near_exit = false

var can_interact = false

onready var position_enter = $EnterDetect/Position2D
onready var position_exit = $ExitDetect/Position2D

func _on_ExitDetect_body_entered(body):
	is_near_exit = true
	can_interact = true


func _on_EnterDetect_body_entered(body):
	is_near_enter = true
	can_interact = true


func _on_EnterDetect_body_exited(body):
	is_near_enter = false
	can_interact = false


func _on_ExitDetect_body_exited(body):
	is_near_exit = false
	can_interact = false


func _input(event):
	if Input.is_action_just_pressed("interact") and can_interact and not is_locked:
		if is_near_enter:
			Global.player.global_position = position_enter.global_position
			is_near_enter = false
		elif is_near_exit:
			Global.player.global_position = position_exit.global_position
			is_near_exit = false
	elif Global.game.has_bath_key and can_interact and is_locked:
		Global.game.remove_item()
		is_locked = false
