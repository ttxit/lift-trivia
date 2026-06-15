extends Node


var current_scene: Node


func _ready() -> void:
    current_scene = get_tree().root.get_node("Main/Current Scene")

func change_view(new_scene_path: String) -> void:
    if not current_scene:
        push_error("Reference to Current Scene not found.")
        return

    for child: Node in current_scene.get_children():
        child.queue_free()

    var new_scene_resource: PackedScene = load(new_scene_path)

    if new_scene_resource:
        var new_instance: Node = new_scene_resource.instantiate()
        current_scene.add_child(new_instance)
    else:
        push_error("Failed to load scene: " + new_scene_path)
