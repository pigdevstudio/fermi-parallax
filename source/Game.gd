extends Node


export(String, FILE, "*.tscn") var game_over_screen_path

onready var _interface := $Interface
onready var _level := $Level
onready var _transit_rect := $Interface/SceneTransitionRect
onready var _interface_animator := $Interface/AnimationPlayer

func _ready() :
	initialize_level()


func initialize_level() :
	_level.player.connect("died", self, "_on_Player_died")
	_interface.link_player_resources(_level.player)
	_level.connect("finished", self, "_on_Level_finished")
	_level.connect("cinematic_started", self, "start_cinematic")
	_level.connect("cinematic_ended", self, "end_cinematic")
	_interface.fade_in()
	yield(_transit_rect, "fade_finished")
	start_cinematic()


func _on_Player_died() :
	_transit_rect.transit(game_over_screen_path)


func _on_Level_finished(next_level_path) :
	_interface.fade_out()
	yield(_interface.fade_animator, "animation_finished")
	_level.queue_free()
	yield(_level, "tree_exited")
	_level = load(next_level_path).instance()
	add_child(_level)
	move_child(_level, 0)
	initialize_level()


func start_cinematic():
	_interface_animator.play_backwards("slide_bars")
	yield(_interface_animator, "animation_finished")
	_interface.fade_hud_in()


func end_cinematic():
	_interface_animator.play("slide_bars")
	yield(_interface_animator, "animation_finished")
	_interface.fade_hud_out()
