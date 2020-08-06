extends Node2D
class_name Level

signal finished(next_level_path)

export var background_music: AudioStream
export(String, FILE, "*.tscn") var next_level_path


onready var player := $Player
onready var _events_player := $EventsPlayer

export var current_event := 0


func _ready() -> void:
	update_background_music()


func update_background_music() -> void:
	BackgroundMusic.crossfade_to(background_music)


func _on_WaveSpawner2D_spawned(spawn) -> void:
	spawn.connect("finished", self, "_on_Wave_finished")


func _on_Wave_finished() -> void:
	var events_list := _events_player.get_animation_list() as PoolStringArray
	var animation_count := events_list.size() as int
	current_event += 1
	
	if current_event >= animation_count:
		return
	_events_player.play(events_list[current_event])


func finish() -> void:
	emit_signal("finished", next_level_path)
