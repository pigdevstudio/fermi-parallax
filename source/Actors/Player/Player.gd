extends Node2D
class_name Player

signal died

export var speed := 600.0
export var direction := Vector2.ZERO
export var dash_speed := 1800.0


onready var velocity := direction * speed


onready var animator := $AnimationPlayer
onready var health := $Health
onready var energy := $Energy
onready var hurtbox := $HurtBox
onready var sprite_anim := $Sprite/AnimationPlayer
onready var dash := $Actions/Dash
onready var shoot := $Actions/Shoot
onready var move := $Actions/Move
onready var charge_vfx := $ChargingParticles
onready var asteroid_collision := $CollisionArea
onready var replenish := $EnergyReplenish


func _ready() :
	for action in $Actions.get_children():
		action.player = self
		action.resource = $Energy


func _process(delta: float) :
	if Input.is_action_pressed("shoot") and is_processing_unhandled_input():
		shoot.execute()


func _unhandled_input(event: InputEvent) :
	handle_input(event)


func handle_input(event: InputEvent) :
	if not event.is_action_type():
		return
	update_direction()
	update_velocity()
	if event.is_action_pressed("dash"):
		dash()
	elif event.is_action_released("dash"):
		stop_dash()


func update_direction() :
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	direction = direction.normalized()
	
	if is_zero_approx(direction.length()):
		move.cancel()
	else:
		move.execute()


func update_velocity() :
	velocity = direction * speed


func die() :
	emit_signal("died")


func dash() :
	dash.execute()


func stop_dash() :
	dash.cancel()


func _on_HurtBox_damage_taken(damage: float) :
	health.current -= damage
	sprite_anim.play("damage")


func _on_EnergyReplenish_finished() :
	charge_vfx.stop()


func _on_EnergyReplenish_started() :
	charge_vfx.start()
