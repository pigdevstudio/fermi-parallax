extends CanvasLayer


onready var fade_animator := $FadeRect/AnimationPlayer
onready var _play_screen := $PlayScreen

func fade_in():
	fade_animator.play("fade")


func fade_out():
	fade_animator.play_backwards("fade")


func link_player_resources(player: Player) -> void:
	_play_screen.player_energybar.resource = player.energy
	_play_screen.player_healthbar.resource = player.health
