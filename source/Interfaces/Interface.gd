extends CanvasLayer


onready var fade_animator := $SceneTransitionRect/AnimationPlayer
onready var _play_screen := $PlayScreen
onready var _scene_transition_rect := $SceneTransitionRect

func fade_in():
	fade_animator.play_backwards("Fade")


func fade_out():
	fade_animator.play("Fade")


func fade_hud_in():
	_play_screen.fade_in()


func fade_hud_out():
	_play_screen.fade_out()


func link_player_resources(player: Player) :
	_play_screen.player_energybar.resource = player.energy
	_play_screen.player_healthbar.resource = player.health
