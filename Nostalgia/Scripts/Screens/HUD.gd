extends CanvasLayer

onready var item = $Control/SlotItem/Item	

onready var progress = $Control/TextureProgress

func _ready():
	Global.hud = self

func change_progress(value):
	progress.value = value

func add_item(texture):
	item.texture = texture
	
func remove_item():
	item.texture = null