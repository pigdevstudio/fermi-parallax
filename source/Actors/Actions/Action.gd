extends Node
class_name Action


export var cost := 1.0

var resource: ActionResource
var player: Player

var available := true

func execute() :
	if resource.current - cost >= 0.0:
		_execute()


func cancel() :
	pass


func _execute() :
	pass

