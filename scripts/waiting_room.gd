extends Control


func _on_back_pressed() -> void:
	SceneManager.change_view("res://scenes/room_creation.tscn")


func _on_start_pressed() -> void:
	SceneManager.change_view("res://scenes/host_question.tscn")
