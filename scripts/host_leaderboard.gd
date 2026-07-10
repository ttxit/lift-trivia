extends Control

# Placeholder player data as dictionaries — replace with real Player objects later
var players = [
	{"name": "Alex", "avatar": "avatar1", "points": 1200},
	{"name": "Jordan", "avatar": "avatar2", "points": 950},
	{"name": "Sam", "avatar": "avatar3", "points": 800},
	{"name": "Taylor", "avatar": "avatar4", "points": 650},
	{"name": "Morgan", "avatar": "avatar5", "points": 500},
	{"name": "Riley", "avatar": "avatar1", "points": 420},
]

# @onready - variables are assigned when the scene is fully loaded
@onready var top_panels = [
	$VBoxContainer/top4/first,
	$VBoxContainer/top4/second,
	$VBoxContainer/top4/third,
	$VBoxContainer/top4/fourth,
]

# reference to the VBoxContainer that holds the 5th place and beyond rows
@onready var rest_list = $VBoxContainer/rest_list

func _ready() -> void:
	# sort the placeholder players array by points, highest first
	var sorted = players.duplicate()
	sorted.sort_custom(func(a, b): return a["points"] > b["points"])

	_populate_top4(sorted)
	_populate_rest(sorted)

func _populate_top4(sorted: Array) -> void:
	for i in range(min(4, sorted.size())):
		# get the panel for this positiion
		var panel = top_panels[i]
		# gt the VBoxContainer inside the panel
		var vbox = panel.get_child(0)
		# 3rd child (index 2) of the vbox is the name label
		vbox.get_child(2).text = sorted[i]["name"]
		# 4th child (index 3) of the vbox is the points label
		vbox.get_child(3).text = str(sorted[i]["points"])

func _populate_rest(sorted: Array) -> void:
	# clear placeholder rows
	for child in rest_list.get_children():
		child.queue_free()

	# loop through players ranked 5th and beyond (index 4 onwards)
	for i in range(4, sorted.size()):
		# new horizontal row to hold this player's info
		var row = HBoxContainer.new()

		var position_label = Label.new()
		position_label.text = str(i + 1)

		#position_label.custom_minimum_size = Vector2(24, 0)
		position_label.add_theme_font_size_override("font_size", 14)

		var name_label = Label.new()
		name_label.text = sorted[i]["name"]

		#name_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		#name_label.add_theme_font_size_override("font_size", 14)

		var pts_label = Label.new()
		pts_label.text = str(sorted[i]["points"]) + " pts"
		pts_label.add_theme_font_size_override("font_size", 14)

		# add all three labels into the row in order: rank, name, points
		row.add_child(rank_label)
		row.add_child(name_label)
		row.add_child(pts_label)

		# add the completed row to rest_list
		rest_list.add_child(row)

func _on_next_question_pressed() -> void:
	print("Moving to next question")

	SceneManager.change_view("res://scenes/host_question.tscn")