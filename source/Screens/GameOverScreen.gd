extends Control

onready var _transit_rect := $SceneTransitionRect


func _ready() -> void:
	$MarginContainer/VBoxContainer/MarginContainer/RetryButton.grab_focus()


func _on_RetryButton_pressed() -> void:
	_transit_rect.transit()
