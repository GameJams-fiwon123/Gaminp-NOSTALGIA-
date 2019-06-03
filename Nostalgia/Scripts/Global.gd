extends Node

var player

#Floors
var andar1 = "res://Scenes/Andar1.tscn"
var terreo = "res://Scenes/Terreo.tscn"

#Scenes
var MAIN_MENU = "res://Scenes/MainMenu.tscn"
var CREDITS = "res://Scenes/Credits.tscn"
var CUTSCENE = "res://Scenes/Cutscene.tscn"
var TERREO = "res://Scenes/Terreo.tscn"
var ANDAR1 = "res://Scenes/Andar1.tscn"

var actual_positon = null

func load_andar1(position):
	get_tree().change_scene(andar1)
	actual_positon = position

func load_terreo(position):
	get_tree().change_scene(terreo)
	actual_positon = position