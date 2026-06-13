extends Node


var current_scene: Node


func _ready():
	current_scene = $"Current Scene"

func _on_requested_room_creation() -> void:
	for child: Node in current_scene.get_children():
		child.queue_free()

	current_scene.add_child(load("res://scenes/room_creation.tscn").instantiate())
