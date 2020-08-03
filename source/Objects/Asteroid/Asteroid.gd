extends Node2D


export var speed := 300.0
export var direction := Vector2.DOWN


onready var _velocity := speed * direction

onready var _health := $Health
onready var _animator := $AnimationPlayer
onready var _sprite_animator := $Sprite/AnimationPlayer


func _process(delta: float) -> void:
	translate(_velocity * delta)


func _on_Health_depleted() -> void:
	_animator.play("explode")


func _on_HurtBox_damage_taken(damage) -> void:
	_health.current -= damage
	_sprite_animator.play("damage")


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()


func _on_DestructionArea_area_entered(area: Area2D) -> void:
	_animator.play("explode")
