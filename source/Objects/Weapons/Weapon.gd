extends Position2D
class_name Weapon

export var bullet_scene: PackedScene

export var cooldown := 1.0
export var disabled := false

var can_shot := true

onready var _cooldown := $Cooldown


func shot() -> void:
	if disabled:
		return
	if not can_shot:
		return
	
	var bullet: Bullet = bullet_scene.instance()
	add_child(bullet)
	bullet.set_as_toplevel(true)
	bullet.global_position = global_position
	bullet.direction = bullet.direction.rotated(rotation)
	
	_cooldown.start(cooldown)
	can_shot = false


func _on_Cooldown_timeout() -> void:
	can_shot = true
