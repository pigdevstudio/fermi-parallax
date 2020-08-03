extends Control


export(String, FILE, "*.tscn") var play_screen_path
export(String, FILE, "*.tscn") var options_screen_path

onready var _transition_rect := $SceneTransitionRect


func _ready() -> void:
	$MarginContainer/VBoxContainer/HBoxContainer/Center/VBoxContainer/PlayButton.grab_focus()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _on_PlayButton_pressed() -> void:
	_transition_rect.transit(play_screen_path)


func _on_OptionsButton_pressed() -> void:
	_transition_rect.transit(options_screen_path)


func _on_QuitButton_pressed() -> void:
	get_tree().quit()
