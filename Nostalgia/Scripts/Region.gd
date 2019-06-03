extends YSort

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
	print(body.name)
	get_parent().body_entered(body, self)
