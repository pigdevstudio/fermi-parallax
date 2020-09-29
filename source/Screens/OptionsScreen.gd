extends Control


onready var _transit_rect := $SceneTransitionRect


func _on_BackButton_pressed() :
	_transit_rect.transit()
