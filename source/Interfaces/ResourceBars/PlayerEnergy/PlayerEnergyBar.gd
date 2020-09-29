extends ResourceBar

onready var animator = $AnimationPlayer

func _on_Resource_value_changed(new_value: float) :
	._on_Resource_value_changed(new_value)
	if new_value >= max_value:
		animator.play("flashing")
