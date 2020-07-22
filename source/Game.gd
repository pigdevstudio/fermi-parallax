extends Node


export(String, FILE, "*.tscn") var game_over_screen_path


onready var _level := $Level
onready var _transit_rect := $Interface/SceneTransitionRect

func _ready() -> void:
	_level.player.connect("died", self, "_on_Player_died")
	$Interface/PlayScreen/HBoxContainer/Left/VBoxContainer/PlayerHealthBar.resource = _level.player.health
	$Interface/PlayScreen/HBoxContainer/Left/VBoxContainer/PlayerEnergyBar.resource = _level.player.energy



func _on_Player_died() -> void:
	_transit_rect.transit(game_over_screen_path)
