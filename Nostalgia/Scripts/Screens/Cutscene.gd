extends Control

onready var audio_button_skip = $ColorRect/ButtonSkip/AudioButtonSkip

func _on_ButtonSkip_pressed():
	if not audio_button_skip.is_playing():
		$AnimationPlayer.play("change_scene")
		audio_button_skip.play()


func _on_AudioButtonSkip_finished():
	get_tree().change_scene(Global.LEVEL1)
