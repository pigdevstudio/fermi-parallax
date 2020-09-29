extends Node

signal scored(score)

const USER_PATH = "user://highscore"
var current_score = 0 setget set_score
var high_score = 0

func _ready():
	read_highscore()


func set_score(value):
	current_score = value
	current_score = max(current_score, 0)
	if current_score > high_score:
		high_score = current_score
		write_highscore()
	emit_signal("scored", current_score)


func write_highscore():
	var file = File.new()
	if file.file_exists(USER_PATH):
		file.open(USER_PATH, file.WRITE)
	else:
		file.open(USER_PATH, file.WRITE_READ)
	file.store_var(high_score)
	file.close()


func read_highscore():
	var file = File.new()
	if file.file_exists(USER_PATH):
		file.open(USER_PATH, file.READ)
		high_score = file.get_var()
		file.close()
	else:
		write_highscore()
	return(high_score)
