extends Node2D

const PARAM_PATH = "parameters/conditions/"
const DEFAULT_DIRECTIONS = ["left", "right"]
const LASER_THRESHOLD = 7
const SUPER_THRESHOLD = 0.5
const IDLE_THRESHOLD = 1

var _available_directions = DEFAULT_DIRECTIONS.duplicate()

var _idle_count = 0
var _damage_count = 0
var _can_super = true

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

	if _idle_count > IDLE_THRESHOLD:
		_idle_count = 0
		attack = "_attack"
		if _damage_count > LASER_THRESHOLD:
			_damage_count = 0
			if _can_super and health.current < health.max_amount * SUPER_THRESHOLD:
				_can_super = false
				anim_tree[PARAM_PATH + "mouth_attack"] = true
				return
			attack = "_laser"
			_can_super = true
		anim_tree[PARAM_PATH + direction + attack] = true


func _on_AnimationPlayer_animation_finished(anim_name):
	match anim_name:
		"idle":
			_idle_count += 1
			attack()


func _on_HurtBox_damage_taken(damage):
	_damage_count += 1
	health.current -= damage
	if health.current < 1:
		$Sprites/AnimationPlayer.play("Die")
		return
	animator.play("Damage")
