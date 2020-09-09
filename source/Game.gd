extends Node


export(String, FILE, "*.tscn") var game_over_screen_path

onready var _interface := $Interface
onready var _level := $Level
onready var _transit_rect := $Interface/SceneTransitionRect
onready var animator := $Interface/AnimationPlayer

func _ready() -> void:
	initialize_level()


func initialize_level() -> void:
	_level.player.connect("died", self, "_on_Player_died")
	_interface.link_player_resources(_level.player)
	_level.connect("cinematic_started", self, "start_cinematic")
	_level.connect("cinematic_ended", self, "end_cinematic")
	animator.play("cinematic_on")


func _on_Player_died() -> void:
	_transit_rect.transit(game_over_screen_path)


func _on_Level_finished(next_level_path) -> void:
	_interface.fade_out()
	yield(_interface.fade_animator, "animation_finished")
	_level.queue_free()
	yield(_level, "tree_exited")
	_level = load(next_level_path).instance()
	add_child(_level)
	move_child(_level, 0)
	_interface.fade_in()
	initialize_level()


func start_cinematic():
	animator.play("cinematic_in")


func end_cinematic():
	animator.play_backwards("cinematic_in")

