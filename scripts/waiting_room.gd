extends Control

@onready var player_container: HBoxContainer = $VBoxContainer/player_box/player_row

func _ready() -> void:
	# placeholder test data — remove when networking is in
	_add_player_to_bar("Alex")
	_add_player_to_bar("Jordan")
	_add_player_to_bar("Sam")

func _add_player_to_bar(p_name: String) -> void:
	# container to group this player's avatar and name together
	var container = HBoxContainer.new()
	container.add_theme_constant_override("separation", 8)

	# avatar TextureRect for this player
	var avatar = TextureRect.new()
	avatar.custom_minimum_size = Vector2(50, 50)
	avatar.expand_mode = TextureRect.EXPAND_FIT_WIDTH_PROPORTIONAL
	avatar.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	avatar.texture = AvatarLoader.get_avatar_for_name(p_name)

	# name label for this player
	var name_label = Label.new()
	name_label.text = p_name
	name_label.add_theme_font_size_override("font_size", 22)
	name_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER

	# add avatar and name into the per-player container
	container.add_child(avatar)
	container.add_child(name_label)

	# add the per-player container into the main player row
	player_container.add_child(container)

func _on_back_pressed() -> void:
	SceneManager.change_view("res://scenes/room_creation.tscn")

func _on_start_pressed() -> void:
	SceneManager.change_view("res://scenes/host_question.tscn")