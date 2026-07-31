extends Control

@onready var name_display: Label = $VBoxContainer/name_display
@onready var avatar_display: TextureRect = $VBoxContainer/avatar_display

func _ready() -> void:

	# check that current_player exists before trying to read from it
	# avoid crash if the scene is opened without going through player join
	if PlayerData.current_player == null:
		print("No player data found")
		return

	# display the player's avatar and name
	name_display.text =  PlayerData.current_player.player_name
	avatar_display.texture = AvatarLoader.get_avatar_for_name(PlayerData.current_player.player_name)

func _on_leave_button_pressed() -> void:
	# clear the player data
	PlayerData.current_player = null
	PlayerData.room_code = ""

	SceneManager.change_view("res://scenes/main_menu.tscn")

func _on_join_button_pressed() -> void:
	SceneManager.change_view("res://scenes/player_question.tscn")
