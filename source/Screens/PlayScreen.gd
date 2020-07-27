extends Control

onready var enemy_healthbar := $HBoxContainer/Right/VBoxContainer/EnemyHealthBar
onready var enemy_interface := $HBoxContainer/Right/VBoxContainer

func _ready() -> void:
	get_tree().connect("node_added", self, "_on_SceneTree_node_added")


func update_enemy_healthbar(new_value: float) -> void:
	enemy_interface.show()


func _on_Enemy_Health_depleted() -> void:
	enemy_interface.hide()


func _on_SceneTree_node_added(node_added: Node) -> void:
	if node_added.is_in_group("enemy_health"):
		enemy_healthbar.resource = node_added
		enemy_interface.show()
		node_added.connect("changed", self, "update_enemy_healthbar")
		node_added.connect("depleted", self, "_on_Enemy_Health_depleted")
