extends Control


onready var _transit_rect := $SceneTransitionRect


func _on_BackButton_pressed() -> void:
	_transit_rect.transit()
