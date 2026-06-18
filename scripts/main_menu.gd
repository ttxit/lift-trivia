extends Control


func _on_host_pressed() -> void:
	SceneManager.change_view("res://scenes/room_creation.tscn")
	pass

func _on_join_pressed() -> void:
	SceneManager.change_view("res://scenes/player_join.tscn")