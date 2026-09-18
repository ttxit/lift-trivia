extends Control

@onready var avatar_display: TextureRect = $VBoxContainer/top_row/avatar/avatar_display
@onready var question_label: Label = $VBoxContainer/question_bubble/question
@onready var verdict_overlay: Panel = $verdict_overlay
@onready var verdict_title: Label = $verdict_overlay/VBoxContainer/verdict_title
@onready var selected_answer_label: Label = $verdict_overlay/VBoxContainer/selected_answer_label
@onready var correct_answer_label: Label = $verdict_overlay/VBoxContainer/correct_answer_label
@onready var verdict: VideoStreamPlayer = $verdict_overlay/VBoxContainer/verdict

# 4 answer buttons
var answer_buttons: Array = []

# Tracks which answer button index (0-3) the player clicked, -1 means no answer selected
var selected_answer_index: int = -1

# Stores the current question data received from the host, which is used to populate the question and answer buttons
var current_question: QuestionManager.QuestionData

# A reusable grey StyleBoxFlat applied to the button the player clicks to show their selection
var color_grey := StyleBoxFlat.new()

func _ready() -> void:
	# load avatar for the current player if they exist
	if PlayerData.current_player:
		avatar_display.texture = AvatarLoader.get_avatar_for_name(PlayerData.current_player.player_name)
	
	# load answer buttons into array
	answer_buttons = [
		$VBoxContainer/answer_grid/answer1,
		$VBoxContainer/answer_grid/answer2,
		$VBoxContainer/answer_grid/answer3,
		$VBoxContainer/answer_grid/answer4,
	]

	color_grey.bg_color = Color(0.4, 0.4, 0.4, 1)

	# Connect each answer button
	for i in range(answer_buttons.size()):
		answer_buttons[i].pressed.connect(_on_answer_selected.bind(i)) # only called when a specific answer is selected

	# load question
	var temp_question := QuestionManager.get_next_question()
	if not temp_question:
		current_question = QuestionManager.get_current_question()
		_set_question_ui_elements(current_question)
		return
	current_question = temp_question
	_set_question_ui_elements(current_question)

	# Hide verdict overlay at start
	verdict_overlay.visible = false

func _set_question_ui_elements(question_data) -> void:
	# If question_data is null
	if not question_data:
		push_error("Question data null.")
		return

	# Set the question and answer button text based on the question data
	question_label.text = question_data.question_string
	answer_buttons[0].text = question_data.option_array[0]
	answer_buttons[1].text = question_data.option_array[1]
	answer_buttons[2].text = question_data.option_array[2]
	answer_buttons[3].text = question_data.option_array[3]

# functions to select answer and send to host for validation

func _on_answer_selected(index: int) -> void:
	# Store which answer the player picked
	selected_answer_index = index

	# Grey out the selected button, disable all buttons
	for i in range(answer_buttons.size()):
		if i != index:
			# answer_buttons[i].add_theme_stylebox_override("normal", color_grey)
			answer_buttons[i].disabled = true

func show_verdict(correct_index: int) -> void:
	# Get the current question to read answer text strings
	var q = QuestionManager.get_current_question()
	if not q:
		push_error("Current question is null.")
		return

	# Show the verdict overlay
	verdict_overlay.visible = true

	# Determine if the player was correct
	var is_correct = selected_answer_index == correct_index

	if is_correct:
		verdict_title.text = "Correct!"
		verdict_title.add_theme_color_override("font_color", Color(0.317647, 0.811764, 0.4, 1))
		selected_answer_label.text = ""
		correct_answer_label.text = ""
	else:
		verdict_title.text = "Incorrect!"
		verdict_title.add_theme_color_override("font_color", Color(0.905882, 0.298039, 0.235294, 1))
		if selected_answer_index == -1:
			selected_answer_label.text = "You did not answer"
		else:
			selected_answer_label.text = "Your answer: " + q.option_array[selected_answer_index]
			correct_answer_label.text = "Correct answer: " + q.option_array[correct_index]

	# Play a random verdict video matching the outcome
	_play_verdict_video(is_correct)

func _play_verdict_video(is_correct: bool) -> void:
	# Pick folder based on correctness
	var folder: String
	var prefix: String

	if is_correct:
		folder = "res://verdicts/correct_verdicts/"
		prefix = "correct_"
	else:
		folder = "res://verdicts/incorrect_verdicts/"
		prefix = "incorrect_"

	# Pick a random number between 1 and 5 inclusive
	var random_index = randi() % 5 + 1

	# Build full path to the video file
	var path = folder + prefix + str(random_index) + ".ogv"

	# Check if file exists
	if not ResourceLoader.exists(path):
		print("Verdict video file does not exist: " + path)
		return

	# Load the video as a VideoStream resource
	var stream = load(path)	as VideoStream
	if not stream:
		print("Failed to load verdict video: " + path)
		return

	# Assign the loaded stream to the VideoStreamPlayer and play it
	verdict.stream = stream
	verdict.play()

func _on_video_finished() -> void:
	# Loops whichever video is currently loaded indefinitely
	verdict.play()

func hide_verdict() -> void:
	# Hide the overlay
	verdict_overlay.visible = false

	# Stop the video so it doesn't keep playing in the background
	verdict.stop()

	# Reset selected answer for the next question
	selected_answer_index = -1

func _on_leave_pressed() -> void:
	# clear the player data
	PlayerData.current_player = null
	PlayerData.room_code = ""

	SceneManager.change_view("res://scenes/main_menu.tscn")

func _on_leaderboard_pressed() -> void:
	SceneManager.change_view("res://scenes/player_leaderboard.tscn")
