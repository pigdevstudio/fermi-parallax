extends Node2D

signal died
signal damaged(health)

export var score := 200

onready var animator := $AnimationPlayer
onready var health := $Health
onready var sprite_animator := $Sprite/AnimationPlayer
onready var hurt_box :=$HurtBox
onready var explosion := $Explosion
onready var explosion_animator := $Explosion/AnimationPlayer
onready var weapon := $Weapon
onready var score_pop_spawner := $ScoreLabelSpawner2D
onready var damage_label_spawner := $DamageLabelSpawner2D

func die() -> void:
	animator.play("die")
	
	score_pop_spawner.value_to_display = score
	score_pop_spawner.spawn()
	
	explosion.set_as_toplevel(true)
	explosion.global_position = global_position
	explosion_animator.play("Explode")
	yield(explosion_animator, "animation_finished")
	emit_signal("died")


func _on_HurtBox_damage_taken(damage) -> void:
	damage_label_spawner.spawn()
	damage_label_spawner.spawn.modulate = Color(0.984375, 0.388367, 0.388367)
	damage_label_spawner.spawn.text = "-%s" % damage
	damage_label_spawner.spawn.rect_global_position.x += 64
	
	
	health.current -= damage
	sprite_animator.play("damage")
	emit_signal("damaged", health)
