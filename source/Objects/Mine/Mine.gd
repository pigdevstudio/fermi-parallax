extends Node2D

export var speed := 300.0
export var direction := Vector2.DOWN

onready var health := $Health
onready var animator := $AnimationPlayer
onready var _velocity := speed * direction


func _on_HurtBox_damage_taken(damage) -> void:
	health.current -= damage
	countdown()


func _process(delta: float) -> void:
	translate(_velocity * delta)


func _on_SensorArea_area_entered(area: Area2D) -> void:
	countdown()


func countdown() -> void:
	if animator.current_animation == "explode":
		return
	if animator.current_animation == "countdown":
		return
	animator.play("countdown")


func _on_Health_depleted() -> void:
	if not animator.current_animation == "explode":
		animator.play("explode")
