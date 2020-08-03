extends HSlider


export var bus := "Master"

onready var _bus := AudioServer.get_bus_index(bus)


func _ready() -> void:
	value = db2linear(AudioServer.get_bus_volume_db(_bus))


func _on_value_changed(_value: float) -> void:
	AudioServer.set_bus_volume_db(_bus, linear2db(_value))


func _on_mouse_exited():
	release_focus()
