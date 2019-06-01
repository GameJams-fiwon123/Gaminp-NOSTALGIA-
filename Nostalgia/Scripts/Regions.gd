extends YSort


func body_entered(player, area):
	print("oi")
	player.camera.limit_left = area.minX
	player.camera.limit_top = area.minY
	player.camera.limit_right = area.maxX
	player.camera.limit_bottom = area.maxY
	
