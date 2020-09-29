extends Tween


export var player_path: NodePath
export var target_position: Vector2
export var target_rotation: float
export var duration := 1.0

onready var player := get_node(player_path)


func tween_player() :
	interpolate_property(player, "position", player.position,
			target_position, duration, Tween.TRANS_BACK, Tween.EASE_OUT)
	interpolate_property(player, "rotation", player.rotation,
			deg2rad(target_rotation), duration, Tween.TRANS_BACK, Tween.EASE_OUT)
	start()
