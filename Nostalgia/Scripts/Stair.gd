extends Area2D

export(int, "Sala de Estar", "Sala de Jogos", "Sala de Jantar", "Sala de Música") var index_comodo
export(int, "Sala de Estar", "Sala de Jogos", "Sala de Jantar", "Sala de Música") var teleport_comodo

var is_enter = false

func _ready():
	Global.stairs_positions[index_comodo] = global_position

func _input(event):
	if event is InputEventKey:
		if Input.is_action_pressed("interact") and is_enter:
				Global.game.teleport(teleport_comodo)
				is_enter = false
				
func _on_Stair_body_entered(body):
	is_enter = true


func _on_Stair_body_exited(body):
	is_enter = false
