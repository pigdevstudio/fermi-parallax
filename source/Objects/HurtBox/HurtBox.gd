extends Area2D

signal damage_taken(damage)

export var team := "enemy"

onready var damage_label_spawner = $DamageLabelSpawner2D

func _on_area_entered(area):
	if not area.team == team:
		emit_signal("damage_taken", area.damage)
		
