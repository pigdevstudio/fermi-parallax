extends Control

onready var player_healthbar := $HBoxContainer/Left/VBoxContainer/PlayerHealthBar
onready var player_energybar := $HBoxContainer/Left/VBoxContainer/PlayerEnergyBar
onready var enemy_healthbar := $HBoxContainer/Right/VBoxContainer/EnemyHealthBar
onready var enemy_interface := $HBoxContainer/Right/VBoxContainer
onready var player_interface := $HBoxContainer/Left/VBoxContainer
func _ready() -> void:
	get_tree().connect("node_added", self, "_on_SceneTree_node_added")


func update_enemy_healthbar(new_value: float) -> void:
	enemy_interface.show()


func _on_Enemy_Health_depleted() -> void:
	enemy_interface.hide()


func hide_interface() -> void:
	enemy_interface.hide()
	player_interface.hide()


func show_interface() -> void:
	player_interface.show()


func cinematic_fade_in() -> void:
	$AnimationPlayer.play("interface_fadeOut")


func cinematic_fade_out() -> void:
	$AnimationPlayer.play_backwards(("interface_fadeOut"))


func _on_SceneTree_node_added(node_added: Node) -> void:
	if node_added.is_in_group("enemy_health"):
		enemy_healthbar.resource = node_added
		enemy_interface.show()
		node_added.connect("changed", self, "update_enemy_healthbar")
		node_added.connect("depleted", self, "_on_Enemy_Health_depleted")
