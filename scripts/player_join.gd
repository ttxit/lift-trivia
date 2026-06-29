extends Control

var selected_avatar: String = ""

func _on_join_pressed() -> void:
    var room_code = $VBoxContainer/HBoxContainer/LineEdit.text.strip_edges()
    var player_name = $VBoxContainer/HBoxContainer2/LineEdit.text.strip_edges()

    print("Joining room: " + room_code + " as " + player_name + " with avatar " + selected_avatar)

func _on_avatar_selected(emoji: String) -> void:
    selected_avatar = emoji
    print("Avatar selected: " + emoji)

func _on_leave_pressed() -> void:
    SceneManager.change_view("res://scenes/main_menu.tscn")