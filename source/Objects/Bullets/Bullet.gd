extends Node2D
class_name Bullet


export var speed := 800.0
export var direction := Vector2.UP
export var spread := 10.0

onready var velocity := direction * speed
onready var hitbox := $HitBox

func _ready() -> void:
	var team := "player" if "player" in get_groups() else "enemy"
	hitbox.add_to_group(team)
	
	var spread_radians := deg2rad(spread)
	var random_spread := rand_range(-spread_radians, spread_radians)
	direction = direction.rotated(random_spread)
	rotate(direction.angle())


func _process(delta: float) -> void:
	velocity = direction * speed
	translate(velocity * delta)


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()


func _on_HitBox_area_entered(area: Area2D) -> void:
	if not is_in_group(area.team):
		queue_free()
