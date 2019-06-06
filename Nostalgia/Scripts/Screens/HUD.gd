extends CanvasLayer

onready var item = $Control/SlotItem/Item	

onready var progress = $Control/TextureProgress
onready var animation = $AnimationPlayer

var new_position

func _ready():
	Global.hud = self

func change_progress(value):
	progress.value = value

func add_item(texture):
	item.texture = texture
	
func remove_item():
	item.texture = null
	
func can_change_comodo():
	return not animation.is_playing()	
	
func change_comodo(position):
	new_position = position
	Global.player.speed = 0
	animation.play("change_comodo")

func change_position_player():
	Global.player.speed = Global.player.base_speed
	Global.player.global_position = new_position
