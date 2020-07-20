extends Timer

signal started
signal replenished

export var resource_path: NodePath
export var recharge_per_second := 10.0

onready var resource: ActionResource = get_node(resource_path)

func _ready() -> void:
	set_process(false)


func _process(delta: float) -> void:
	resource.current += recharge_per_second * delta
	if resource.current >= resource.max_amount:
		emit_signal("replenished")
		set_process(false)


func _on_timeout() -> void:
	emit_signal("started")
	set_process(true)
