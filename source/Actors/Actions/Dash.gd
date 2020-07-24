extends Action

export var speed := 2000.0
export var dash_duration := 0.5

onready var _dash_time := $DashTime


func _execute() -> void:
	if is_equal_approx(player.direction.x, 0.0):
		return 
	player.velocity.x = player.direction.x * speed
	_dash_time.start(dash_duration)
	player.animator.play("dash")
	resource.current -= cost


func cancel() -> void:
	if not _dash_time.is_stopped():
		player.update_velocity()


func _on_DashTime_timeout() -> void:
	player.update_velocity()
