extends CanvasLayer

var color_show = Color(1, 1, 1, 1)
var color_hide = Color(1, 1, 1, 0.7)

var is_show = false
var is_mouse = false

func _on_ColorRect_mouse_exited():
	if is_show:
		$AnimationPlayer.play("hide")
		$Control/ColorRect/Button.modulate = color_hide
	
	is_mouse = false

func _on_Button_mouse_entered():
	if not is_show:
		$AnimationPlayer.play("show")
		$Control/ColorRect/Button.modulate = color_show
		
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
