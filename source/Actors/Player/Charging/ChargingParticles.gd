extends Particles2D


onready var animator := $AnimationPlayer

func start() -> void:
	emitting = true
	animator.play("Charge")


func stop() -> void:
	emitting = false
	animator.stop()
