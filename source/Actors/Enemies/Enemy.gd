extends Node2D

signal died
signal damaged(health)

onready var animator := $AnimationPlayer
onready var health := $Health
onready var sprite_animator := $Sprite/AnimationPlayer
onready var hurt_box :=$HurtBox
onready var explosion := $Explosion
onready var explosion_animator := $Explosion/AnimationPlayer
onready var weapon := $Weapon

func die() -> void:
	animator.play("die")
	explosion.set_as_toplevel(true)
	explosion.global_position = global_position
	explosion_animator.play("Explode")
	yield(explosion_animator, "animation_finished")
	emit_signal("died")


func _on_HurtBox_damage_taken(damage) -> void:
	health.current -= damage
	sprite_animator.play("damage")
	emit_signal("damaged", health)
