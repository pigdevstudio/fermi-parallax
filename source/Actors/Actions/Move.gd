extends Action

export var clamp_left := 0.0 + 32.0
export var clamp_right := 640.0 - 32
export var clamp_bottom := 1048.024
export var clamp_top := 60.147


func _ready() -> void:
	set_process(false)


func _process(delta: float) -> void:
	player.translate(player.velocity * delta)
	player.position.x = clamp(player.position.x, clamp_left, clamp_right)
	player.position.y = clamp(player.position.y, clamp_top, clamp_bottom)
	if cost > 0.0:
		resource.current -= cost * delta


func _execute() -> void:
	set_process(true)


func cancel() -> void:
	set_process(false)
