extends Control

onready var _transit_rect := $SceneTransitionRect


func _ready() :
	$MarginContainer/VBoxContainer/MarginContainer/RetryButton.grab_focus()
	$MarginContainer/VBoxContainer/Label.text = "Congratulations you've defeated Paradox. \n Highscore: %d" % ScoreSingleton.high_score

func _on_RetryButton_pressed() :
	_transit_rect.transit()
