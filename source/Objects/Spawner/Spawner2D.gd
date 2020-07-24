extends Position2D

signal spawned(spawn)

export var spawn_scene: PackedScene

func spawn() -> void:
	var spawn := spawn_scene.instance() as Node2D
	add_child(spawn)
	spawn.set_as_toplevel(true)
	spawn.global_position = global_position
	emit_signal("spawned", spawn)
