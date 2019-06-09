extends Node

var player = null
var game = null
var hud = null


#IN GAME
var stairs_positions = [Vector2(), Vector2(), Vector2(), Vector2()]
var escrivaninha  = null

#AUDIOS
onready var audio = $AudioStreamPlayer
var audio_main_menu = "res://SFX/Screens/Scrapbook-Tela_Titulo.ogg"
var audio_game = "res://SFX/Gameplay/Scrapbook-Moving_Day.ogg"
var audio_final = "res://SFX/Screens/Scrapbook-Final.ogg"

#Dog
var navigation  = null
var destinations  = null

#Floors
var andar1 = "res://Scenes/Floors/Andar1.tscn"
var terreo = "res://Scenes/Floors/Terreo.tscn"

#Scenes
var MAIN_MENU = "res://Scenes/Screens/MainMenu.tscn"
var CREDITS = "res://Scenes/Screens/Credits.tscn"
var CUTSCENE = "res://Scenes/Screens/Cutscene.tscn"
var FINAL = "res://Scenes/Screens/Final.tscn"

#Level
var LEVEL1 = "res://Scenes/Level/Level1.tscn"