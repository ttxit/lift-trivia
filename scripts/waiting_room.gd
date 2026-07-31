extends Control

# per-player container, pairs avatar and name as one element in the player_container
# new one is created for each player that joins the room
@onready var player_container: HBoxContainer = $VBoxContainer/player_box/player_row

func _on_back_pressed() -> void:
	SceneManager.change_view("res://scenes/room_creation.tscn")

	var name_label = Label.new()
	name_label.text = player_name
	name_label.add_theme_font_size_override("font_size", 22)
	name_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER

	container.add_child(avatar)
	container.add_child(name_label)
	player_container.add_child(container)

func _on_back_pressed() -> void:
	SceneManager.change_view("res://scenes/room_creation.tscn")

func _on_start_pressed() -> void:
	SceneManager.change_view("res://scenes/host_question.tscn")
