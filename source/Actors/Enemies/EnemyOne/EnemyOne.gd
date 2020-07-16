extends Path2D


func _on_Enemy_died():
	queue_free()
