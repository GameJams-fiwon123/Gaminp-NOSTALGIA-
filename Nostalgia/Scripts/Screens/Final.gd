extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.audio.stream != load(Global.audio_final):
		Global.audio.stream = load(Global.audio_final)
		Global.audio.play()


func _on_ButtonExit_pressed():
	get_tree().change_scene(Global.MAIN_MENU)
