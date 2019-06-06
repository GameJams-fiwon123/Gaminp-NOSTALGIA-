extends Control

onready var audio_button_exit = $ColorRect/ButtonExit/AudioButtonExit

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.audio.stream != load(Global.audio_final):
		Global.audio.stream = load(Global.audio_final)
		Global.audio.play()


func _on_ButtonExit_pressed():
	if not audio_button_exit.is_playing():
		$AnimationPlayer.play("change_scene")
		audio_button_exit.play()


func _on_AudioButtonExit_finished():
	get_tree().change_scene(Global.MAIN_MENU)
