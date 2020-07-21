extends Control

onready var _resume_button := $MarginContainer/VBoxContainer/HBoxContainer/Center/VBoxContainer/ResumeButton


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if get_tree().paused:
			unpause()
		else:
			pause()


func pause() -> void:
	show()
	_resume_button.grab_focus()
	get_tree().paused = true


func unpause() -> void:
	hide()
	get_tree().paused = false


func _on_ResumeButton_pressed() -> void:
	unpause()


func _on_QuitButton_pressed() -> void:
	get_tree().quit()
