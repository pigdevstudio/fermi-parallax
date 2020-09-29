extends Position2D

signal spawned(spawn)

var spawn
export var spawn_scene = preload("res://Objects/HurtBox/Pop Label/PopLabel.tscn")

func spawn() :
	spawn = spawn_scene.instance()
	add_child(spawn)
	spawn.set_as_toplevel(true)
	spawn.global_position = global_position
	emit_signal("spawned", spawn)
