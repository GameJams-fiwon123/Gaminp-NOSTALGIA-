extends Node2D

onready var audio_button_exit = $Control/ButtonExit/AudioButtonExit

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("default")


func _on_ButtonExit_pressed():
	if not audio_button_exit.is_playing():
		Global.audio.volume_db = -4000
		$AnimationPlayer.play("change_scene")
		audio_button_exit.play()


func _on_AudioButtonExit_finished():
	get_tree().change_scene(Global.MAIN_MENU)
	
func load_music():
	Global.audio.stream = load(Global.audio_final)
	Global.audio.play()
	Global.audio.volume_db = -10

