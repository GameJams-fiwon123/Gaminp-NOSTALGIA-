extends Control

onready var audio_button_skip = $ColorRect/ButtonSkip/AudioButtonSkip

func _on_ButtonSkip_pressed():
	audio_button_skip.play()


func _on_AudioButtonSkip_finished():
	get_tree().change_scene(Global.LEVEL1)
