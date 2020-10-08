extends Node


export(String, FILE, "*.tscn") var game_over_screen_path
export(String, FILE, "*.tscn") var end_screen_path

onready var _interface := $Interface
onready var _level := $Level
onready var _transit_rect := $Interface/SceneTransitionRect


func _ready() :
	initialize_level()


func initialize_level() :
	_level.player.connect("died", self, "_on_Player_died")
	_interface.link_player_resources(_level.player)
	_level.connect("finished", self, "_on_Level_finished")
	_interface.fade_in()


func _on_Player_died() :
	_transit_rect.transit(game_over_screen_path)


func _on_Level_finished(next_level_path):
	if next_level_path == end_screen_path:
		_transit_rect.transit(end_screen_path)
		return
	_interface.fade_out()
	yield(_interface.fade_animator, "animation_finished")
	_level.queue_free()
	yield(_level, "tree_exited")
	_level = load(next_level_path).instance()
	add_child(_level)
	move_child(_level, 0)
	initialize_level()
