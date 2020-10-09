extends Control

export (String, FILE, "*.tscn") var main_menu_path
onready var _transit_rect := $SceneTransitionRect


func _ready() -> void:
	$MarginContainer/VBoxContainer/MarginContainer/MainMenuButton.grab_focus()


func _on_QuitButton_pressed() -> void:
	get_tree().quit()


func _on_MainMenuButton_pressed() -> void:
	_transit_rect.transit(main_menu_path)


func _on_SceneTransitionRect_fade_finished() -> void:
	$AnimationPlayer.play("AnimateText")
