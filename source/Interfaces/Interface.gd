extends CanvasLayer


onready var fade_animator := $FadeRect/AnimationPlayer

func fade_in():
	fade_animator.play("fade")


func fade_out():
	fade_animator.play_backwards("fade")
