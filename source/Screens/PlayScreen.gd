extends Control

onready var enemy_healthbar := $HBoxContainer/Right/VBoxContainer/EnemyHealthBar
onready var enemy_interface := $HBoxContainer/Right/VBoxContainer

func _ready() -> void:
	link_enemies_health()


func link_enemies_health() -> void:
	for enemy in get_tree().get_nodes_in_group("enemy"):
		enemy.connect("damaged", self, "update_enemy_healthbar")
		enemy.connect("died", self, "_on_Enemy_died")


func update_enemy_healthbar(health: ActionResource) -> void:
	enemy_healthbar.resource = health
	enemy_interface.show()


func _on_Enemy_died() -> void:
	enemy_interface.hide()
