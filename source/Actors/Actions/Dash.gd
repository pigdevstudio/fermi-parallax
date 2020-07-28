extends Action

export var speed := 2000.0
export var dash_duration := 0.5

onready var _dash_time := $DashTime


func _execute() -> void:
	if player.direction.is_equal_approx(Vector2.ZERO):
		return
	if not _dash_time.is_stopped():
		return
	player.velocity = player.direction * speed
	_dash_time.start(dash_duration)
	resource.current -= cost
	player.animator.play("dash")


func cancel() -> void:
	if not _dash_time.is_stopped():
		player.update_velocity()
		player.animator.play("cancel_dash")


func _on_DashTime_timeout() -> void:
	player.update_velocity()
	player.animator.play("cancel_dash")
