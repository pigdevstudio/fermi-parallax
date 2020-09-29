extends Particles2D


onready var animator := $AnimationPlayer

func start() :
	emitting = true
	animator.play("Charge")


func stop() :
	emitting = false
	animator.stop()
