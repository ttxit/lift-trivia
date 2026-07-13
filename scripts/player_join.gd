extends Control

var selected_avatar: String = ""

func _on_join_pressed() -> void:
	var room_code = $VBoxContainer/input_data/room_code/rc_input.text.strip_edges()
	var player_name = $VBoxContainer/input_data/player_name/pn_input.text.strip_edges()

	if room_code == "":
		print("Please enter a room code")
		return	
	if player_name == "":
		print("Please enter your name")
		return
	if selected_avatar == "":
		print("Please select an avatar")
		return

	PlayerData.room_code = room_code
	PlayerData.create_player(player_name, selected_avatar)

	SceneManager.change_view("res://scenes/player_waiting.tscn")

func _on_avatar_selected(emoji: String) -> void:
	selected_avatar = emoji
	print("Avatar selected: " + emoji)

func _on_leave_pressed() -> void:
	SceneManager.change_view("res://scenes/main_menu.tscn")
