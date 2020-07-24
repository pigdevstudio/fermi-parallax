extends Node2D


export var background_music: AudioStream

onready var player := $Player
onready var _events_player := $EventsPlayer

var _current_event := 0


func _ready() -> void:
	BackgroundMusic.crossfade_to(background_music)


func _on_WaveSpawner2D_spawned(spawn) -> void:
	spawn.connect("finished", self, "_on_Wave_finished")


func _on_Wave_finished() -> void:
	var events_list := _events_player.get_animation_list() as PoolStringArray
	var animation_count := events_list.size() as int
	_current_event += 1
	
	if _current_event >= animation_count:
		return
	_events_player.play(events_list[_current_event])


func finish() -> void:
	print("Level finished!")
