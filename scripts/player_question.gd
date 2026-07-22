extends Control

func _ready() -> void:
	$VBoxContainer/top_row/avatar_display/avatar.text = PlayerData.current_player.avatar
	# LOAD QUESTION AND ANSWERS FROM FILE TO OVERWRITE PLACEHOLDER TEXT ON SCENE

# functions to select answer and send to host for validation

func _on_leave_pressed() -> void:
	# clear the player data
	PlayerData.current_player = null
	PlayerData.room_code = ""

	SceneManager.change_view("res://scenes/main_menu.tscn")

func _on_leaderboard_pressed() -> void:
	SceneManager.change_view("res://scenes/player_leaderboard.tscn")
