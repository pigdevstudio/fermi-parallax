extends ColorRect


export(String, FILE, "*.tscn") var next_scene_path

onready var _animator := $AnimationPlayer

func _ready() -> void:
	_animator.play_backwards("Fade")


func transit(to := next_scene_path) -> void:
	_animator.play("Fade")
	yield(_animator, "animation_finished")
	get_tree().change_scene(to)
