extends Control

# initialize timer for countdown

func _ready() -> void:
	pass
	# load question and answers from file to overwrite placeholder text on scene

# functions to select answer and send to players for display

func _on_end_pressed() -> void:
	SceneManager.change_view("res://scenes/main_menu.tscn")

func _on_leaderboard_pressed() -> void:
	SceneManager.change_view("res://scenes/host_leaderboard.tscn")