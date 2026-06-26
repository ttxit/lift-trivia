extends Control


func _on_back_pressed() -> void:
	SceneManager.change_view("res://scenes/main_menu.tscn")

func _on_start_pressed() -> void:
	SceneManager.change_view("res://scenes/waiting_room.tscn")
