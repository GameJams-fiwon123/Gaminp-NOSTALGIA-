extends Node

var player
var game

#IN GAME
var stairs_positions = [Vector2(), Vector2(), Vector2(), Vector2()]

#Dog
var navigation
var destinations

#Floors
var andar1 = "res://Scenes/Floors/Andar1.tscn"
var terreo = "res://Scenes/Floors/Terreo.tscn"

#Scenes
var MAIN_MENU = "res://Scenes/Screens/MainMenu.tscn"
var CREDITS = "res://Scenes/Screens/Credits.tscn"
var CUTSCENE = "res://Scenes/Screens/Cutscene.tscn"

#Level
var LEVEL1 = "res://Scenes/Level/Level1.tscn"