extends StaticBody2D

var idea_texture = "res://GFX/Icons/Balao_Alicate.png"

var cut_texture = "res://GFX/Itens/escada.png"

var can_interact = false
onready var sprite = $Sprite
var index = 2

var is_cut = false

onready var audio = $AudioStreamPlayer

func _input(event):
	if Input.is_action_just_pressed("interact") and can_interact:
		if Global.game.has_alicate and not is_cut:
			sprite.texture = load(cut_texture)
			is_cut = true
			audio.play()
			Global.game.drop_item()
		elif is_cut:
			Global.game.catch_item(self)
			can_interact = false	
		elif not Global.game.has_alicate and not is_cut:
			Global.player.show_idea(load(idea_texture))

func _on_Detect_body_entered(body):
	can_interact = true


func _on_Detect_body_exited(body):
	can_interact = false
