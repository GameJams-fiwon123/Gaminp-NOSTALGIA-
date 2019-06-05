extends Control

onready var audio_button_start = $ColorRect/VBoxContainer2/VBoxContainer/ButtonStart/AudioButtonStart
onready var audio_button_credits = $ColorRect/VBoxContainer2/VBoxContainer/ButtonCredits/AudioButtonCredis
onready var audio_button_exit = $ColorRect/VBoxContainer2/VBoxContainer/ButtonExit/AudioButtonExit

func _ready():
	if Global.audio.stream != load(Global.audio_main_menu):
		Global.audio.stream = load(Global.audio_main_menu)
		Global.audio.play()

func _on_ButtonStart_pressed():
	audio_button_start.play()

func _on_ButtonCredits_pressed():
	audio_button_credits.play()
	
func _on_ButtonExit_pressed():
	audio_button_exit.play()


func _on_AudioButtonStart_finished():
	get_tree().change_scene(Global.CUTSCENE)


func _on_AudioButtonCredis_finished():
	get_tree().change_scene(Global.CREDITS)


func _on_AudioButtonExit_finished():
	get_tree().quit()
