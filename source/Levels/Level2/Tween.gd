extends Tween


export var player_path: NodePath
export var target_position: Vector2
export var duration := 1.0

onready var player := get_node(player_path)


func tween_player() -> void:
	interpolate_property(player, "position", player.position,
			target_position, duration, Tween.TRANS_BACK, Tween.EASE_OUT)
	start()
