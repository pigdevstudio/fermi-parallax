extends Position2D
class_name Weapon

signal fired

export var bullet_scene: PackedScene

export var cooldown := 1.0
export var disabled := false

onready var animator := $AnimationPlayer
onready var _cooldown := $Cooldown


func fire() :
	if disabled:
		return
	if not _cooldown.is_stopped():
		return
	
	var bullet: Bullet = bullet_scene.instance()
	bullet.direction = bullet.direction.rotated(global_rotation)
	add_child(bullet)
	bullet.set_as_toplevel(true)
	bullet.global_position = global_position
	
	_cooldown.start(cooldown)
	animator.play("flash")
	emit_signal("fired")
