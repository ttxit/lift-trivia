extends Control

@onready var avatar_display: TextureRect = $VBoxContainer/player_bg/player_vbox/avatar
@onready var name_display: Label = $VBoxContainer/player_bg/player_vbox/name
@onready var points_display: Label = $VBoxContainer/player_bg/player_vbox/points_count
@onready var position_display: Label = $VBoxContainer/player_bg/player_vbox/position
# LATER: GET POSITION FROM LEADERBOARD DATA AND DISPLAY IT IN THE POSITION LABEL

func _ready() -> void:
	if PlayerData.current_player == null:
		print("No player data found")
		return

	# LATER: $VBoxContainer/player_bg/player_vbox/position.text 
	avatar_display.texture = AvatarLoader.get_avatar_for_name(PlayerData.current_player.player_name)
	name_display.text =  PlayerData.current_player.player_name
	points_display.text = str(PlayerData.current_player.points)


func _on_leave_button_pressed() -> void:
	# clear the player data
	PlayerData.current_player = null
	PlayerData.room_code = ""

	SceneManager.change_view("res://scenes/main_menu.tscn")
