extends Control


func _on_back_pressed() -> void:
	SceneManager.change_view("res://scenes/main_menu.tscn")


func _on_create_pressed() -> void:
	var question_count: int = $"VBoxContainer/options/room_settings/questions_count/SpinBox".value
	QuestionManager.save_question_sequence(question_count, "sample_category")

	SceneManager.change_view("res://scenes/waiting_room.tscn")
