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
	current_question = QuestionManager.get_next_question()

	question_node.text = current_question.question_string
	answer_1_node.text = current_question.option_array[0]
	answer_2_node.text = current_question.option_array[1]
	answer_3_node.text = current_question.option_array[2]
	answer_4_node.text = current_question.option_array[3]

	# load question and answers from file to overwrite placeholder text on scene

# functions to select answer and send to players for display

func _on_end_pressed() -> void:
	SceneManager.change_view("res://scenes/main_menu.tscn")

func _on_leaderboard_pressed() -> void:
	SceneManager.change_view("res://scenes/host_leaderboard.tscn")

func _on_next_question_pressed() -> void:
	current_question = QuestionManager.get_next_question()

	if current_question == null:
		print("No more questions. Game Over!")
		return

	question_node.text = current_question.question_string
	answer_1_node.text = current_question.option_array[0]
	answer_2_node.text = current_question.option_array[1]
	answer_3_node.text = current_question.option_array[2]
	answer_4_node.text = current_question.option_array[3]
