extends Control

onready var player_healthbar := $HBoxContainer/Left/VBoxContainer/PlayerHealthBar
onready var player_energybar := $HBoxContainer/Left/VBoxContainer/PlayerEnergyBar
onready var enemy_healthbar := $HBoxContainer/Right/VBoxContainer/EnemyInterface/EnemyHealthBar
onready var enemy_interface := $HBoxContainer/Right/VBoxContainer/EnemyInterface
onready var player_interface := $HBoxContainer/Left/VBoxContainer
onready var animator := $AnimationPlayer
onready var score_label := $HBoxContainer/Right/VBoxContainer/ScoreLabel

func _ready():
	get_tree().connect("node_added", self, "_on_SceneTree_node_added")
	ScoreSingleton.connect("scored", self, "_on_ScoreSingleton_scored")


func update_enemy_healthbar(new_value):
	enemy_interface.show()


func hide_interface() :
	enemy_interface.hide()
	player_interface.hide()


func show_interface() :
	player_interface.show()


func fade_in() :
	animator.play("fade")


func fade_out() :
	animator.play_backwards("fade")


func _on_ScoreSingleton_scored(new_score):
	score_label.text = "Score: %d" % new_score


func _on_Enemy_Health_depleted():
	enemy_interface.hide()


func _on_SceneTree_node_added(node_added):
	if node_added.is_in_group("enemy_health"):
		enemy_healthbar.resource = node_added
		enemy_interface.show()
		node_added.connect("changed", self, "update_enemy_healthbar")
		node_added.connect("depleted", self, "_on_Enemy_Health_depleted")
