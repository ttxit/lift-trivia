extends Control

# initialize timer for countdown


# Variables for storing node paths
@onready var question_node: Label = $VBoxContainer/question_bubble/question
@onready var answer_1_node: Label = $VBoxContainer/answer_grid/answer_1_panel/Label
@onready var answer_2_node: Label = $VBoxContainer/answer_grid/answer_2_panel/Label
@onready var answer_3_node: Label = $VBoxContainer/answer_grid/answer_3_panel/Label
@onready var answer_4_node: Label = $VBoxContainer/answer_grid/answer_4_panel/Label

var current_question: QuestionManager.QuestionData


func _ready() -> void:
	var temp_question := QuestionManager.get_next_question()

	if not temp_question:
		current_question = QuestionManager.get_current_question()
		_set_question_ui_elements(current_question)
		return

	current_question = temp_question

	_set_question_ui_elements(current_question)

	# load question and answers from file to overwrite placeholder text on scene

# functions to select answer and send to players for display

func _on_end_pressed() -> void:
	SceneManager.change_view("res://scenes/main_menu.tscn")

func _on_leaderboard_pressed() -> void:
	SceneManager.change_view("res://scenes/host_leaderboard.tscn")

func _on_next_question_pressed() -> void:
	var temp_question := QuestionManager.get_next_question()

	if not temp_question:
		print("No more questions. Game Over!")
		return

	current_question = temp_question

	_set_question_ui_elements(current_question)

func _set_question_ui_elements(question_data) -> void:
	if not question_data:
		push_error("Question data null.")
		return

	question_node.text = question_data.question_string
	answer_1_node.text = question_data.option_array[0]
	answer_2_node.text = question_data.option_array[1]
	answer_3_node.text = question_data.option_array[2]
	answer_4_node.text = question_data.option_array[3]