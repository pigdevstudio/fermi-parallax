extends ProgressBar


export var resource_path: NodePath

onready var resource: ActionResource = get_node(resource_path) setget set_resource


func _ready() -> void:
	link_resource()


func set_resource(new_resource: ActionResource) -> void:
	resource = new_resource
	link_resource()


func link_resource() -> void:
	resource.connect("changed", self, "set_value")
	resource.connect("max_changed", self, "set_max")
	resource.initialize()
