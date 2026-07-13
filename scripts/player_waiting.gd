extends Control

func _ready() -> void:
	$VBoxContainer/avatar_display.text = PlayerData.avatar
	$VBoxContainer/name_display.text = PlayerData.player_name

	#for class implementation:
	# check that current_player exists before trying to read from it
	# avoid crash if the scene is opened without going through player join
	#if PlayerData.current_player == null:
	#	print("No player data found")
	#	return

	# display the player's avatar and name
	#$VBoxContainer/AvatarDisplay.text = PlayerData.current_player.avatar
	#$VBoxContainer/NameDisplay.text = PlayerData.current_player.player_name

func _on_leave_pressed() -> void:
	# for class implementation:
	# clear the player data
	#PlayerData.current_player = null
	#PlayerData.room_code = ""

	SceneManager.change_view("res://scenes/main_menu.tscn")
