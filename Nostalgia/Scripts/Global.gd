extends Node

var player

#Floors
var andar1 = "res://Scenes/Andar1.tscn"
var terreo = "res://Scenes/Terreo.tscn"

var actual_positon = null

func load_andar1(position):
	get_tree().change_scene(andar1)
	actual_positon = position

func load_terreo(position):
	get_tree().change_scene(terreo)
	actual_positon = position