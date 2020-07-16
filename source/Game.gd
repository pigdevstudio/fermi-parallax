extends Node

func _ready():
	var player_health := $Viewport/TestLevel/Player/Health
#	var healthbar := $Viewport/InterfaceLayer/Control/ProgressBar
	var healthbar := $PlayScreen/HBoxContainer/Left/Control/InterfaceLayer/Control/HealthBar
	
	player_health.connect("changed", healthbar, "set_value")
	player_health.connect("max_changed", healthbar, "set_max")
	player_health.initialize()
