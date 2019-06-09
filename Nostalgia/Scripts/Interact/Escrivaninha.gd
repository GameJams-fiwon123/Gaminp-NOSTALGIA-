extends StaticBody2D

var idea_texture = "res://GFX/Icons/Balao_Foto.png"

var can_interact = false
onready var arrow = $Arrow

func _ready():
	Global.escrivaninha = self

func _input(event):
	if Input.is_action_just_pressed("interact") and can_interact:
		if Global.game.photos.size() >= 6:
			Global.player.speed = 0
			Global.audio.volume_db = -4000
			Global.hud.change_scene(Global.FINAL)


func _on_Detect_body_entered(body):
	Global.player.show_idea(load(idea_texture))
	can_interact = true


func _on_Detect_body_exited(body):
	Global.player.hide_idea()
	can_interact = false
