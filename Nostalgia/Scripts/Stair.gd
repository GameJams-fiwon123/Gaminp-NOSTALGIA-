extends Area2D

export(int, "Sala de Estar", "Sala de Jogos", "Sala de Jantar", "Sala de Música") var teleport_comodo

var is_enter = false

func _input(event):
	if event is InputEventKey:
		if Input.is_action_pressed("interact") and is_enter:
			match(teleport_comodo):
				0:
					Global.load_terreo(global_position)
				1:
					Global.load_andar1(global_position)
				2:
					Global.load_terreo(global_position)
				3:
					Global.load_andar1(global_position)

func _on_Stair_body_entered(body):
	is_enter = true


func _on_Stair_body_exited(body):
	is_enter = false
