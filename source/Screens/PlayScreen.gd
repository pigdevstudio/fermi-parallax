extends Control

onready var enemy_healthbar := $HBoxContainer/Right/VBoxContainer/EnemyHealthBar

func link_enemies_health() -> void:
	for enemy in get_tree().get_nodes_in_group("enemy"):
		enemy.connect("damaged", self, "update_enemy_healthbar")
	
	
func update_enemy_healthbar(health: ActionResource) -> void:
	enemy_healthbar.resource = health
