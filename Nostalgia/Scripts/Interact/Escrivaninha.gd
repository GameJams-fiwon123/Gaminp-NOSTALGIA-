extends StaticBody2D

var can_interact = false
onready var arrow = $Arrow

func _ready():
	Global.escrivaninha = self

func _input(event):
	if Input.is_action_just_pressed("interact") and can_interact:
		if Global.game.photos.size() >= 6:
			Global.audio.volume_db = -4000
			Global.hud.change_scene(Global.FINAL)


func _on_Detect_body_entered(body):
	can_interact = true


func _on_Detect_body_exited(body):
	can_interact = false
