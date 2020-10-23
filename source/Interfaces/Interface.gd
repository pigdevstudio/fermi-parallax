extends CanvasLayer
signal faded


onready var fade_animator := $SceneTransitionRect/AnimationPlayer
onready var _play_screen := $PlayScreen
onready var _scene_transition_rect := $SceneTransitionRect


func fade_in():
	_play_screen.fade_in()
	yield(_play_screen.get_node("AnimationPlayer"), "animation_finished")
	emit_signal("faded")


func fade_out():
	_play_screen.fade_out()
	yield(_play_screen.get_node("AnimationPlayer"), "animation_finished")
	emit_signal("faded")


func link_player_resources(player: Player) :
	_play_screen.player_energybar.resource = player.energy
	_play_screen.player_healthbar.resource = player.health


func transition():
	_scene_transition_rect.fade_out()
	yield(_scene_transition_rect.get_node("AnimationPlayer"), "animation_finished")
	emit_signal("faded")
