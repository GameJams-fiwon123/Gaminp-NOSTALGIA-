extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.game = self

func teleport(index):
	print(Global.stairs_positions[index])
	Global.player.global_position = Global.stairs_positions[index]
			
