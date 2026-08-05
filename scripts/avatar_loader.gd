extends Node

# accessible from anywhere in the project as "AvatarLoader"

# stores all loaded avatar textures
var avatar_textures: Array[Texture2D] = []

func _ready() -> void:
	# load all avatars when game starts
	_load_avatars("res://avatars/")

func _load_avatars(folder_path: String) -> void:
	var dir = DirAccess.open(folder_path)
	if not dir:
		print("Could not open avatars folder: " + folder_path)
		return

	dir.list_dir_begin()
	var file_name = dir.get_next()
	while file_name != "":
		# skip .import files
		if file_name.ends_with(".svg"):
			var texture = load(folder_path + file_name) as Texture2D
			if texture:
				avatar_textures.append(texture)	
				print("Loaded " + str(avatar_textures.size()) + " avatars.")
			else:
				print("Failed to load avatar texture: " + file_name)
		file_name = dir.get_next()

# returns texture based on player name
# same name always gets same avatar
func get_avatar_for_name(player_name: String) -> Texture2D:
	if avatar_textures.is_empty():
		print("No avatars loaded.")
		return null

	var index = posmod(player_name.hash(), avatar_textures.size())
	return avatar_textures[index]
