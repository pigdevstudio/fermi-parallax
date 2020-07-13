extends Node2D

export var speed: = 600.0
export var direction: = Vector2.ZERO

export var clamp_left := 0.0 + 32.0
export var clamp_right := 640.0 - 32

onready var velocity: = direction * speed
onready var weapon := $Weapon

onready var health := $Health
onready var hurtbox := $HurtBox

func _process(delta: float) -> void:
	move(delta)
	if Input.is_action_pressed("shoot"):
		weapon.shot()


func move(delta: float) -> void:
	update_velocity()
	update_direction()
	translate(velocity * delta)
	position.x = clamp(position.x, clamp_left, clamp_right)


func update_direction() -> void:
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")


func update_velocity() -> void:
	velocity = direction * speed


func die() -> void:
	queue_free()


func _on_HurtBox_area_entered(area: Area2D) -> void:
	if not area.is_in_group("player"):
		health.current -= area.damage
