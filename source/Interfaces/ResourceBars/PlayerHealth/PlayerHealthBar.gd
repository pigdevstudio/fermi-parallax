extends ResourceBar

onready var animator = $AnimationPlayer

func _on_Resource_value_changed(new_value: float) -> void:
	if new_value < value:
		animator.play("damaged")
	._on_Resource_value_changed(new_value)
