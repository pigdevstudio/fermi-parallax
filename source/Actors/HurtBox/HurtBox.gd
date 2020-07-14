extends Area2D

signal damage_taken(damage)

export var team := "enemy"

func _on_area_entered(area: Area2D) -> void:
	if not area.is_in_group(team):
		emit_signal("damage_taken", area.damage) 
