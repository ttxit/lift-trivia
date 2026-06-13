extends Control


# Emitted when user clicks "Host" from Main Menu
signal requested_room_creation


func _on_host_pressed() -> void:
	requested_room_creation.emit()
