extends Action

export var speed := 2000.0
export var dash_duration := 0.5

var _player_speed := 600.0

onready var _dash_time := $DashTime


func _execute() -> void:
	if player.replenish.is_processing():
		return
	if player.direction.is_equal_approx(Vector2.ZERO):
		return
	_player_speed = player.speed
	player.speed = speed
	player.velocity = player.direction * speed
	_dash_time.start(dash_duration)
	resource.current -= cost
	player.animator.play("dash")


func _reset_player_speed() -> void:
	player.speed = _player_speed


func cancel() -> void:
	if _dash_time.is_stopped():
		return
	_dash_time.stop()
	_reset_player_speed()
	player.animator.play("cancel_dash")


func _on_DashTime_timeout() -> void:
	_reset_player_speed()
	player.animator.play("cancel_dash")
