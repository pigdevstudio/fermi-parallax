extends Node2D
class_name Player

export var speed := 600.0
export var direction := Vector2.ZERO
export var dash_speed := 1800.0

export var clamp_left := 0.0 + 32.0
export var clamp_right := 640.0 - 32

onready var velocity := direction * speed


onready var animator := $AnimationPlayer
onready var health := $Health
onready var energy := $Energy
onready var hurtbox := $HurtBox
onready var sprite_anim := $Sprite/AnimationPlayer
onready var dash := $Actions/Dash
onready var shoot := $Actions/Shoot

func _ready() -> void:
	for action in $Actions.get_children():
		action.player = self
		action.resource = $Energy


func _process(delta: float) -> void:
	move(delta)
	if Input.is_action_pressed("shoot"):
		shoot.execute()


func _input(event: InputEvent) -> void:
	if event.is_action("move_left") or event.is_action("move_right"):
		update_direction()
		update_velocity()
	if event.is_action_pressed("dash"):
		dash()
	elif event.is_action_released("dash"):
		stop_dash()


func move(delta: float) -> void:
	translate(velocity * delta)
	position.x = clamp(position.x, clamp_left, clamp_right)


func update_direction() -> void:
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")


func update_velocity() -> void:
	velocity = direction * speed


func die() -> void:
	queue_free()


func dash() -> void:
	dash.execute()


func stop_dash() -> void:
	dash.cancel()
	$GhostTrail.emitting = false


func _on_HurtBox_damage_taken(damage: float) -> void:
	health.current -= damage
	sprite_anim.play("damage")
