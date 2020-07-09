extends Node2D
class_name Bullet


export var speed := 800.0
export var direction := Vector2.UP

onready var velocity := direction * speed


func _process(delta: float) -> void:
	velocity = direction * speed
	translate(velocity * delta)


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()


func _on_Area2D_area_entered(area: Area2D) -> void:
	queue_free()
