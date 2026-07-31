extends Node

# accessible from anywhere in the project as "PlayerData"

var room_code: String = ""
var current_player: Player = null # local player object

class Player:
	var player_name: String = ""
	var points: int = 0

	func _init(p_name: String) -> void:
		player_name = p_name
	
	func add_points(amount: int) -> void:
		points += amount

	# readable string summary of the player's current state	
	func status_str() -> String:
		return player_name + ": " + str(points) + " pts."

# creates a new Player object and assigns it to current_player, called when player clicks "Join"
func create_player(p_name: String) -> void:
	current_player = Player.new(p_name)

# for leaderboard sorting, returns a new array of players sorted by points (highest first)
func get_sorted_players(players: Array) -> Array:
	var sorted = players.duplicate()
	sorted.sort_custom(func(a, b): return a.points > b.points)
	return sorted
