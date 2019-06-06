extends YSort

export(int, "None", "Area", "Banheiro") var index_type

var minX
var maxX
var minY
var maxY

onready var areaSize = $DetectArea/CollisionShape2D.shape.extents

func _ready():
	minX = $DetectArea.global_position.x - areaSize.x
	minY = $DetectArea.global_position.y - areaSize.y
	maxX = $DetectArea.global_position.x + areaSize.x
	maxY = $DetectArea.global_position.y + areaSize.y

func _on_DetectArea_body_entered(body):
	get_parent().body_entered(body, self)
	if index_type >= 1:
		Global.audio.volume_db = -4000
		$AudioStreamPlayer.volume_db = 0


func _on_DetectArea_body_exited(body):
	if index_type >= 1:
		Global.audio.volume_db = -10
		$AudioStreamPlayer.volume_db = -4000