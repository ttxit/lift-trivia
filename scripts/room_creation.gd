extends Control


func _on_back_pressed() -> void:
	SceneManager.change_view("res://scenes/main_menu.tscn")


func _on_create_pressed() -> void:
	var question_count: int = $"VBoxContainer/Options/VBoxContainer/Question Count/SpinBox".value
	QuestionManager.set_question_sequence(question_count)

	SceneManager.change_view("res://scenes/waiting_room.tscn")
