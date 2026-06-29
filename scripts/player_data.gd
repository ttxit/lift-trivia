extends Node

# accessible from anywhere in the project as "PlayerData"

var player_name: String = ""
var avatar: String = ""
var room_code: String = ""

#class Player:
#	var player_name: String = ""
#	var avatar: String = ""
#	var points: int = 0
	
#	func _init(p_name: String, p_avatar: String) -> void:
#		player_name = p_name
#		avatar = p_avatar
	
#	func add_points(amount: int) -> void:
#		points += amount
	
	# readable string summary of the player's current state
#	func to_string() -> String:
#		return player_name + " (" + avatar + "): " + str(points) + " pts"

# player object for local device's player
#var current_player: Player = null

#var room_code: String = ""

# creates a new Player object and assigns it to current_player, called when player clicks "Join"
#func create_player(p_name: String, p_avatar: String) -> void:
#	current_player = Player.new(p_name, p_avatar)

# for leaderboard sorting, returns a new array of players sorted by points (highest first)
#func get_sorted_players(players: Array) -> Array:
#	players.sort_custom(func(a, b): return a.points > b.points)
#	return players
