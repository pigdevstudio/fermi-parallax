extends Node2D
class_name Bullet


export var speed := 800.0
export var direction := Vector2.UP

onready var velocity := direction * speed
onready var hitbox := $HitBox

func _ready() -> void:
	var team := "player" if "player" in get_groups() else "enemy"
	hitbox.add_to_group(team)


func _process(delta: float) -> void:
	velocity = direction * speed
	translate(velocity * delta)


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()


func _on_HitBox_area_entered(area: Area2D) -> void:
	if not is_in_group(area.team):
		queue_free()
