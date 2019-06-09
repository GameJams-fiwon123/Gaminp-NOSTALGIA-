extends Node2D

func _ready():
	$AnimationPlayer.play("default")
	Global.audio.volume_db = -4000


func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene(Global.LEVEL1)
