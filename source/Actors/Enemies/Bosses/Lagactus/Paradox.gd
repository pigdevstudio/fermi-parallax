extends Node2D

const PARAM_PATH = "parameters/conditions/"
const DEFAULT_ATTACKS = ["left_attack", "right_attack"]

var _available_attacks = DEFAULT_ATTACKS.duplicate()

var _idle_count = 0
var _rand_attack = _available_attacks[0]

onready var health = $Health
onready var anim_tree = $AnimationTree
onready var animator = $AnimationPlayer


func _ready():
	randomize()


func attack():
	if _available_attacks.size() < 1:
		_available_attacks = DEFAULT_ATTACKS.duplicate()
	
	_rand_attack = randi() % _available_attacks.size()
	anim_tree[PARAM_PATH + _available_attacks[_rand_attack]] = true
	_idle_count = 0
	_available_attacks.remove(_rand_attack)


func _on_AnimationPlayer_animation_finished(anim_name):
	match anim_name:
		"idle":
			_idle_count += 1
			if _idle_count > 3:
				attack()


func _on_HurtBox_damage_taken(damage):
	health.current -= damage
	animator.play("Damage")
