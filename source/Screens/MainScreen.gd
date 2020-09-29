extends Control


export(String, FILE, "*.tscn") var game_screen_path
export(String, FILE, "*.tscn") var options_screen_path

onready var _transition_rect := $SceneTransitionRect


func _ready() :
	$MarginContainer/VBoxContainer/HBoxContainer/Center/VBoxContainer/PlayButton.grab_focus()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _on_PlayButton_pressed() :
	_transition_rect.transit(game_screen_path)


func _on_OptionsButton_pressed() :
	_transition_rect.transit(options_screen_path)


func _on_QuitButton_pressed() :
	get_tree().quit()
