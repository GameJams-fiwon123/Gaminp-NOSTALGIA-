extends CanvasLayer

var color_show = Color(1, 1, 1, 1)
var color_hide = Color(1, 1, 1, 0.7)

var is_show = false
var is_mouse = false

onready var item_list = $Control/ColorRect/HBoxContainer/ItemList

onready var modulate_button = $Control/ColorRect/Button.modulate

onready var progress = $Control/ColorRect/HBoxContainer/VBoxContainer/TextureProgress
onready var text_progress = $Control/ColorRect/HBoxContainer/VBoxContainer/Label

func _ready():
	Global.hud = self

func change_progress(value):
	progress.value = value
	text_progress.text = str(int(progress.value/progress.max_value*100)) + "%"
	

func add_item(index, quantity ,texture):
	item_list.set_item_icon(index ,texture)
	item_list.set_item_text(index,"  " + str(quantity) + "x")
	
func remove_item(index):
	item_list.set_item_icon(index, null)
	item_list.set_item_text(index, "")

func _on_ColorRect_mouse_exited():
	if is_show:
		$AnimationPlayer.play("hide")
		modulate_button = color_hide
	
	is_mouse = false

func _on_Button_mouse_entered():
	if not is_show:
		$AnimationPlayer.play("show")
		modulate_button = color_show
		
	is_mouse = true

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "show":
		is_show = true
		if not is_mouse:
			_on_ColorRect_mouse_exited()
	else:
		is_show = false


func _on_ColorRect_mouse_entered():
	is_mouse = true


func _on_Button_mouse_exited():
	is_mouse = false
