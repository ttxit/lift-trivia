extends Control


func _on_host_pressed() -> void:
	SceneManager.change_view("res://scenes/room_creation.tscn")

func _on_join_pressed() -> void:
	SceneManager.change_view("res://scenes/player_join.tscn")