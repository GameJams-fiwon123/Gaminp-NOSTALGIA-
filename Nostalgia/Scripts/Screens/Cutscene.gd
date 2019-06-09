extends Node2D

onready var audio_button_skip = $ColorRect/ButtonSkip/AudioButtonSkip

func _ready():
	$AnimationPlayer.play("default")
	Global.audio.volume_db = -4000


func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene(Global.LEVEL1)
