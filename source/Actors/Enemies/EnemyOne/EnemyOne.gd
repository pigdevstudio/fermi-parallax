extends Path2D


func _on_Enemy_tree_exited() -> void:
	queue_free()
