extends Node2D


export var speed := 300.0
export var direction := Vector2.DOWN


onready var _velocity := speed * direction

onready var _health := $Health
onready var _animator := $AnimationPlayer


func _process(delta: float) -> void:
	translate(_velocity * delta)


func _on_Health_depleted() -> void:
	_animator.play("explode")


func _on_HurtBox_damage_taken(damage) -> void:
	_health.current -= damage


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()


func _on_PlayerCollisionDetector_area_entered(area: Area2D) -> void:
	_animator.play("explode")
