extends Control

@onready var name_line_edit: LineEdit = $VBoxContainer/input_data/player_name/pn_input
@onready var room_code_line_edit: LineEdit = $VBoxContainer/input_data/room_code/rc_input
@onready var avatar_preview: TextureRect = $VBoxContainer/avatar_vbox/avatar_preview

func _ready() -> void:
	# connect name field to update avatar preview when text changes
	name_line_edit.text_changed.connect(_on_name_changed)

func _on_name_changed(new_text: String) -> void:
	# update avatar preview live
	if new_text.strip_edges() != "":
		avatar_preview.texture = AvatarLoader.get_avatar_for_name(new_text.strip_edges())
	else:
		# clear preview if name is empty
		avatar_preview.texture = null

func _on_join_pressed() -> void:
	var room_code = room_code_line_edit.text.strip_edges()
	var player_name = name_line_edit.text.strip_edges()

#	if room_code == "":
#		print("Please enter a room code")
#		return	
#	if player_name == "":
#		print("Please enter your name")
#		return
#	if selected_avatar == "":
#		print("Please select an avatar")
#		return

	PlayerData.room_code = room_code
	PlayerData.create_player(player_name, selected_avatar)

	SceneManager.change_view("res://scenes/player_waiting.tscn")

func _on_leave_pressed() -> void:
	# clear the player data
	PlayerData.current_player = null
	PlayerData.room_code = ""

	SceneManager.change_view("res://scenes/main_menu.tscn")
