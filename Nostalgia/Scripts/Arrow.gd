extends Sprite

onready var position1 = $PositionStart.global_position
onready var position2 = $PositionEnd.global_position

func _ready():
	var tween = get_node("Tween")
	tween.interpolate_property(self, "global_position",
	                position1, position2, 1,
	                Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Tween_tween_completed(object, key):
	
	var position_aux = position1
	position1 = position2
	position2 = position_aux
	
	var tween = get_node("Tween")
	tween.interpolate_property(self, "global_position",
	                position1, position2, 1,
	                Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
