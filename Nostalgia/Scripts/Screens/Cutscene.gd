extends Node2D

onready var audio_button_skip = $ColorRect/ButtonSkip/AudioButtonSkip

func _ready():
	$AnimatedSprite.play("default")
	Global.audio.volume_db = -4000


func _on_AnimatedSprite_animation_finished():
	get_tree().change_scene(Global.LEVEL1)
