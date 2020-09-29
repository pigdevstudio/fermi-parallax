extends Action


export var weapon_path: NodePath

onready var weapon: Weapon = get_node_or_null(weapon_path)

func _ready() :
	weapon.connect("fired", self, "_on_Weapon_fired")


func _execute() :
	if player.replenish.is_processing():
		return
	weapon.fire()


func _on_Weapon_fired() :
	resource.current -= cost
