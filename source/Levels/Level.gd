extends Node2D
class_name Level

signal cinematic_started
signal cinematic_ended
signal finished(next_level_path)

export(AudioStream) var background_music
export(String, FILE, "*.tscn") var next_level_path

onready var player = $Player
onready var _events_player = $EventsPlayer

export(int) var current_event = 0


func _ready():
	update_background_music()


func update_background_music():
	BackgroundMusic.crossfade_to(background_music)


func _on_WaveSpawner2D_spawned(spawn):
	spawn.connect("finished", self, "_on_Wave_finished")


func _on_Wave_finished():
	play_next_event()


func play_next_event():
	current_event += 1
	var events_list = _events_player.get_animation_list()
	var animation_count = events_list.size()
	
	if current_event >= animation_count:
		return
	_events_player.play(events_list[current_event])


func finish():
	emit_signal("finished", next_level_path)


func start_cinematic():
	emit_signal("cinematic_started")


func end_cinematic():
	emit_signal("cinematic_ended")
