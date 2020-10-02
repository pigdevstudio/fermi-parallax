extends Node2D

const PARAM_PATH = "parameters/conditions/"
const DEFAULT_DIRECTIONS = ["left", "right"]

var _available_directions = DEFAULT_DIRECTIONS.duplicate()

var _idle_count = 0
var _damage_count = 0

onready var health = $Health
onready var anim_tree = $AnimationTree
onready var animator = $AnimationPlayer


func _ready():
	randomize()


func attack():
	if _available_directions.size() < 1:
		_available_directions = DEFAULT_DIRECTIONS.duplicate()

	var attack = ""
	var rand_index = randi() % _available_directions.size()
	var direction = _available_directions[rand_index]
	_available_directions.remove(rand_index)

	if _damage_count > 2:
		_damage_count = 0
		attack = "_laser"
	elif _idle_count > 3:
		_idle_count = 0
		attack = "_attack"
	if attack:
		anim_tree[PARAM_PATH + direction + attack] = true


func _on_AnimationPlayer_animation_finished(anim_name):
	match anim_name:
		"idle":
			_idle_count += 1
			attack()


func _on_HurtBox_damage_taken(damage):
	_damage_count += 1
	health.current -= damage
	animator.play("Damage")
