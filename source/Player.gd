extends Area2D

export var speed: = 100.0
export var direction: = Vector2.ZERO
onready var velocity: = direction * speed


func _process(delta: float) -> void:
	move(delta)
	

func move(delta: float) -> void:
	update_velocity()
	update_direction()
	translate(velocity * delta)
	position.x = clamp(position.x, 0, 640)


func update_direction() -> void:
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")


func update_velocity() -> void:
	velocity = direction * speed
