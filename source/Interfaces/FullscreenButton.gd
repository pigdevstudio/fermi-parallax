extends CheckButton


func _ready() :
	pressed = OS.window_fullscreen


func _toggled(button_pressed: bool) :
	OS.window_fullscreen = button_pressed
