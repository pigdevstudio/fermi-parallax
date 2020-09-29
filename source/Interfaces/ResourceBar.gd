extends ProgressBar
class_name ResourceBar


export var resource_path: NodePath

onready var resource: ActionResource = get_node_or_null(resource_path) setget set_resource


func _ready() :
	if resource:
		link_resource()


func set_resource(new_resource: ActionResource) :
	resource = new_resource
	link_resource()


func _on_Resource_value_changed(new_value: float) :
	value = new_value


func _on_Resource_max_changed(new_max: float) :
	max_value = new_max


func link_resource() :
	if not resource.is_connected("changed", self, "_on_Resource_value_changed"):
		resource.connect("changed", self, "_on_Resource_value_changed")
	if not resource.is_connected("max_changed", self, "_on_Resource_max_changed"):
		resource.connect("max_changed", self, "_on_Resource_max_changed")
	resource.initialize()
