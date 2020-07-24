extends Node2D

signal finished

func _ready() -> void:
	for child in get_children():
		child.connect("tree_exited", self, "_on_Child_tree_exited")


func _on_Child_tree_exited():
	if get_child_count() < 1:
		emit_signal("finished")
		queue_free()
