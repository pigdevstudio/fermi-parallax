extends Area2D

signal damage_taken(damage)

export var team := "enemy"

func _on_area_entered(area):
	if not area.team == team:
		print(get_owner().name + " hurt")
		emit_signal("damage_taken", area.damage)
