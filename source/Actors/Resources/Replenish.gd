extends Timer


export var resource_path: NodePath
export var recharge_per_second := 10.0

onready var resource: ActionResource = get_node(resource_path)

func _ready() -> void:
	set_process(false)


func _process(delta: float) -> void:
	resource.current += recharge_per_second * delta
	if resource.current >= resource.max_amount:
		set_process(false)


func _on_timeout() -> void:
	set_process(true)
