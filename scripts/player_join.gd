extends Control

var selected_avatar: String = ""

func _on_join_pressed() -> void:
	var room_code = $VBoxContainer/VBoxContainer/room_code/LineEdit.text.strip_edges()
	var player_name = $VBoxContainer/VBoxContainer/player_name/LineEdit.text.strip_edges()

	# for class implementation, replace lines 13-15 with:
	# PlayerData.create_player(player_name, selected_avatar)
	# PlayerData.room_code = room_code

	PlayerData.player_name = player_name
	PlayerData.avatar = selected_avatar
	PlayerData.room_code = room_code

	SceneManager.change_view("res://scenes/player_waiting.tscn")

func _on_avatar_selected(emoji: String) -> void:
	selected_avatar = emoji
	print("Avatar selected: " + emoji)

func _on_leave_pressed() -> void:
	SceneManager.change_view("res://scenes/main_menu.tscn")
