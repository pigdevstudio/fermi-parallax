extends Action


export var weapon_path: NodePath

onready var weapon: Weapon = get_node_or_null(weapon_path)

func _ready() -> void:
	weapon.connect("fired", self, "_on_Weapon_fired")


func _execute() -> void:
	if player.replenish.is_processing():
		return
	weapon.fire()


func _on_Weapon_fired() -> void:
	resource.current -= cost
