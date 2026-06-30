extends Control

# initialize timer for countdown

#func _ready() -> void:
    # load question and answers from file to overwrite placeholder text on scene

    #$VBoxContainer/top_row/number_bubble/question_number.text = "3"
    #$VBoxContainer/top_row/timer_bubble/timer.text = "15"
    #$VBoxContainer/question_bubble/question.text = "Which book of the Bible contains the Sermon on the Mount?"
    #$VBoxContainer/answer_grid/a1_bubble/answer1.text = "Matthew"
    #$VBoxContainer/answer_grid/a2_bubble/answer2.text = "Luke"
    #$VBoxContainer/answer_grid/a3_bubble/answer3.text = "Mark"
    #$VBoxContainer/answer_grid/a4_bubble/answer4.text = "John"

func _on_end_pressed() -> void:
    SceneManager.change_view("res://scenes/main_menu.tscn")
