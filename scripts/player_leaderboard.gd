extends Control

func _ready() -> void:
	if PlayerData.current_player == null:
		print("No player data found")
		return

	# LATER: $VBoxContainer/player_bg/player_vbox/position.text 
	$VBoxContainer/player_bg/player_vbox/avatar.text = PlayerData.current_player.avatar
	$VBoxContainer/player_bg/player_vbox/name.text = PlayerData.current_player.player_name
	$VBoxContainer/player_bg/player_vbox/points_count.text = str(PlayerData.current_player.points)


func _on_leave_pressed() -> void:
	# clear the player data
	PlayerData.current_player = null
	PlayerData.room_code = ""

	SceneManager.change_view("res://scenes/main_menu.tscn")
