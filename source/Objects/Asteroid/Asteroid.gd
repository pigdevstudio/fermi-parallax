extends Node2D

export var speed := 300.0
export var direction := Vector2.DOWN
export var score := 100


onready var _velocity := speed * direction

onready var _health := $Health
onready var _animator := $AnimationPlayer
onready var _sprite_animator := $Sprite/AnimationPlayer
onready var _score_label_spawner := $ScoreLabelSpawner2D
onready var _damage_label_spawner := $DamageLabelSpawner2D


func _process(delta: float):
	translate(_velocity * delta)


func _on_Health_depleted():
	_damage_label_spawner.value_to_display = score
	ScoreSingleton.current_score += score
	_damage_label_spawner.spawn()
	_animator.play("explode")


func _on_HurtBox_damage_taken(damage):
	_damage_label_spawner.spawn()
	_damage_label_spawner.spawn.modulate = Color(0.984375, 0.388367, 0.388367)
	_damage_label_spawner.spawn.text = "-%s" % damage
	_damage_label_spawner.spawn.rect_global_position.x += 64
	
	_health.current -= damage
	_sprite_animator.play("damage")


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_DestructionArea_area_entered(area):
	_animator.play("explode")
