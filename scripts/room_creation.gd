extends Control


## Category array based on order of options in the OptionButton node
const CATEGORY_ARRAY: Array[String] = [
	"bible",
	"church_members",
	"lift_lore",
	"campus"
]

@onready var category_selection: OptionButton = $"VBoxContainer/options/room_settings/HBoxContainer/category"


func _on_back_pressed() -> void:
	SceneManager.change_view("res://scenes/main_menu.tscn")


func _on_create_pressed() -> void:
	if category_selection.selected == -1:
		print("Please select a category for questions")

	var selected_string: String = CATEGORY_ARRAY[category_selection.selected]

	var question_count: int = $"VBoxContainer/options/room_settings/questions_count/SpinBox".value

	selected_string = "sample_category" # Remove this line when other category files exist
	QuestionManager.save_question_sequence(question_count, selected_string)

	SceneManager.change_view("res://scenes/waiting_room.tscn")
