extends Control

onready var _resume_button := $PauseMenu/HBoxContainer/Center/MarginContainer/VBoxContainer/ResumeButton
onready var _pause_menu := $PauseMenu
onready var _options_menu := $OptionsMenu

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if get_tree().paused:
			unpause()
		else:
			pause()


func pause() -> void:
	show()
	_pause_menu.show()
	_resume_button.grab_focus()
	get_tree().paused = true


func unpause() -> void:
	hide()
	get_tree().paused = false


func _on_ResumeButton_pressed() -> void:
	unpause()


func _on_QuitButton_pressed() -> void:
	get_tree().quit()


func _on_OptionsButton_pressed() -> void:
	_pause_menu.hide()
	_options_menu.show()


func _on_OptionsCloseButton_pressed() -> void:
	_pause_menu.show()
	_options_menu.hide()


func _on_CloseButton_draw():
	$OptionsMenu/HBoxContainer/CenterColumn/VBoxContainer4/CenterContainer/CloseButton.grab_focus()
