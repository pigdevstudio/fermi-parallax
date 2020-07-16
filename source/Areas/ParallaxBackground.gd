extends ParallaxBackground

export var speed := 100.0

func _process(delta: float) -> void:
	scroll_base_offset.y -= speed * delta
