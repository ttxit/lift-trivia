extends Control

var selected_avatar: String = ""

func _on_join_pressed() -> void:
    #var room_code = $VBoxContainer/HBoxContainer/LineEdit.text.strip_edges()
    #var player_name = $VBoxContainer/HBoxContainer2/LineEdit.text.strip_edges()

    '''
    if room_code == "":
        print("Please enter a room code")
        return

    if player_name == "":
        print("Please enter your name")
        return

    if selected_avatar == "":
        print("Please select an avatar")
        return
    '''

    # Hide join UI, show waiting message
    $VBoxContainer/HBoxContainer.visible = false
    $VBoxContainer/HBoxContainer2.visible = false
    $VBoxContainer/AvatarLabel.visible = false
    $VBoxContainer/AvatarRow.visible = false
    $VBoxContainer/JoinButton.visible = false
    $VBoxContainer/WaitingLabel.visible = true

func _on_avatar_selected(emoji: String) -> void:
    selected_avatar = emoji
    print("Avatar selected: " + emoji)

func _on_leave_pressed() -> void:
    SceneManager.change_view("res://scenes/main_menu.tscn")