extends Control

onready var _resume_button := $PauseMenu/HBoxContainer/Center/MarginContainer/VBoxContainer/ResumeButton
onready var _master_slider := $OptionsMenu/HBoxContainer/CenterColumn/VBoxContainer4/VBoxContainer/VolumeSlider
onready var _pause_menu := $PauseMenu
onready var _options_menu := $OptionsMenu

func _input(event: InputEvent) :
	if event.is_action_pressed("pause"):
		if get_tree().paused:
			unpause()
		else:
			pause()


func pause() :
	show()
	_pause_menu.show()
	_resume_button.grab_focus()
	get_tree().paused = true


func unpause() :
	hide()
	get_tree().paused = false


func _on_ResumeButton_pressed() :
	unpause()


func _on_QuitButton_pressed() :
	get_tree().quit()


func _on_OptionsButton_pressed() :
	_pause_menu.hide()
	_options_menu.show()
	_master_slider.grab_focus()


func _on_OptionsCloseButton_pressed() :
	_pause_menu.show()
	_options_menu.hide()
	_resume_button.grab_focus()
