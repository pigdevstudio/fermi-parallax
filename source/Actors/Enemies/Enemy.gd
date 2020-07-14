extends Node2D


onready var health := $Health
onready var animator := $Sprite/AnimationPlayer


func die() -> void:
	queue_free()


func _on_HurtBox_damage_taken(damage) -> void:
	health.current -= damage
	animator.play("damage")
