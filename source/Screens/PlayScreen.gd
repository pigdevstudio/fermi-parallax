extends Control

onready var enemy_healthbar := $HBoxContainer/Right/VBoxContainer/EnemyHealthBar
onready var enemy_interface := $HBoxContainer/Right/VBoxContainer

func _ready() -> void:
	get_tree().connect("node_added", self, "_on_SceneTree_node_added")
#	link_enemies_health()


#func link_enemies_health() -> void:
#	for enemy in get_tree().get_nodes_in_group("enemy"):
#		enemy.connect("damaged", self, "update_enemy_healthbar")
#		enemy.connect("died", self, "_on_Enemy_died")


func update_enemy_healthbar(health: ActionResource) -> void:
	enemy_healthbar.resource = health
	enemy_interface.show()


func _on_Enemy_Health_depleted() -> void:
	enemy_interface.hide()


func _on_SceneTree_node_added(node_added: Node) -> void:
	if node_added.is_in_group("enemy_health"):
		update_enemy_healthbar(node_added)
		node_added.connect("depleted", self, "_on_Enemy_Health_depleted")
