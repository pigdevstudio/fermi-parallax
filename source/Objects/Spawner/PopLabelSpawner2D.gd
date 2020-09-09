extends "res://Objects/Spawner/Spawner2D.gd"


export var value_to_display = 200.0


func spawn():
	spawn = spawn_scene.instance()
	add_child(spawn)
	spawn.set_as_toplevel(true)
	spawn.rect_global_position = global_position
	
	spawn.text = "%d" % [value_to_display]
	spawn.pop()
	emit_signal("spawned", spawn)
