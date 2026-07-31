extends Control

@onready var avatar_display: TextureRect = $VBoxContainer/top_row/avatar/avatar_display

func _ready() -> void:
	avatar_display.texture = AvatarLoader.get_avatar_for_name(PlayerData.current_player.player_name)
	# LOAD QUESTION AND ANSWERS FROM FILE TO OVERWRITE PLACEHOLDER TEXT ON SCENE

# functions to select answer and send to host for validation

func _on_leave_pressed() -> void:
	# clear the player data
	PlayerData.current_player = null
	PlayerData.room_code = ""

	SceneManager.change_view("res://scenes/main_menu.tscn")

func _on_leaderboard_pressed() -> void:
	SceneManager.change_view("res://scenes/player_leaderboard.tscn")
