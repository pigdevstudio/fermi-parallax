extends Control

export (String, FILE, "*.tscn") var credits_scene_path
export (String, FILE, "*.tscn") var replay_scene_path
onready var _transit_rect := $SceneTransitionRect


func _ready() :
	$MarginContainer/VBoxContainer/MarginContainer/RetryButton.grab_focus()
	$MarginContainer/VBoxContainer/Label.text = "Congratulations! \n You've defeated \n Paradox. \n Highscore: %d" % ScoreSingleton.high_score


func _on_ReplayButton_pressed() :
	_transit_rect.transit(replay_scene_path)


func _on_CreditsButton_pressed() -> void:
	_transit_rect.transit(credits_scene_path)
