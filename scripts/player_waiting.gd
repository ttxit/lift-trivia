extends Control

func _ready() -> void:
	#$VBoxContainer/avatar.text = PlayerData.avatar
	#$VBoxContainer/name.text = PlayerData.player_name

	# check that current_player exists before trying to read from it
	# avoid crash if the scene is opened without going through player join
	if PlayerData.current_player == null:
		print("No player data found")
		return

	# display the player's avatar and name
	$VBoxContainer/avatar.text = PlayerData.current_player.avatar
	$VBoxContainer/name.text = PlayerData.current_player.player_name

func _on_leave_pressed() -> void:
	# clear the player data
	PlayerData.current_player = null
	PlayerData.room_code = ""

	SceneManager.change_view("res://scenes/main_menu.tscn")

func _on_join_pressed() -> void:
	SceneManager.change_view("res://scenes/player_question.tscn")
