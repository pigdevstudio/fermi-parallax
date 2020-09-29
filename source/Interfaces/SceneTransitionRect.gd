extends ColorRect

signal transition_started
signal transition_finished
signal fade_started
signal fade_finished


export(String, FILE, "*.tscn") var next_scene_path

onready var _animator := $AnimationPlayer

func _ready() :
	fade_in()


func transit(to := next_scene_path) :
	fade_out()
	emit_signal("transition_started")
	yield(_animator, "animation_finished")
	emit_signal("transition_finished")
	get_tree().change_scene(to)


func fade_in():
	emit_signal("fade_started")
	_animator.play_backwards("Fade")
	yield(_animator, "animation_finished")
	emit_signal("fade_finished")


func fade_out():
	emit_signal("fade_started")
	_animator.play("Fade")
	yield(_animator, "animation_finished")
	emit_signal("fade_finished")
