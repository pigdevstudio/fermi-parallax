extends Path2D


export var min_animator_speed := 1.0
export var max_animator_speed := 1.0

onready var animator := $AnimationPlayer

func _ready() -> void:
	animator.playback_speed = rand_range(min_animator_speed, max_animator_speed)


func _on_Enemy_died() -> void:
	queue_free()
