extends Node


class QuestionData:
	## String for the question being asked
	var question_string: String:
		get:
			return question_string

	## Array of strings for options
	var option_array: Array:
		get:
			return option_array

	## Index of correct answer in option_array
	var correct_option_idx: int:
		get:
			return correct_option_idx


	func _init(input_question: String, input_options: Array, correct_idx: int) -> void:
		question_string = input_question
		option_array = input_options
		correct_option_idx = correct_idx


## Dictionary for looking up file paths for question categories
const FILE_PATH: Dictionary[String, String] = {
	"sample_category": "res://questions/sample_questions.json"
	}


func save_question_sequence(requested_count: int, requested_category: String) -> void:
	if requested_count < 1:
		# This shouldn't be possible btw
		# If it happens, there is a problem with the spinbox
		push_error("Count is invalid: {count}")
		return

	## Sequence of question indexes to be used during game
	var question_idx_seq: Array[int]

	var category_path: String = FILE_PATH[requested_category]

	if not FileAccess.file_exists(category_path):
		push_error("File does not exist: " + category_path)
		return
		
	var file: FileAccess = FileAccess.open(category_path, FileAccess.READ)
	var json_string: String = file.get_as_text()
	file.close()

	var json: JSON = JSON.new()
	json.parse(json_string)

	var data: Dictionary = json.data

	requested_count = min(requested_count, data["total_questions"])

	var temp_sequence: Array[int]

	for i in range(data["total_questions"]):
		temp_sequence.append(i)

	temp_sequence.shuffle() # Order is randomized here

	for i in range(requested_count):
		question_idx_seq.append(temp_sequence[i])

	## Dictionary format for the question_sequence file
	var qs_format: Dictionary = {
		"category": requested_category,
		"question_sequence": question_idx_seq,
		"current_question": -1
	}

	var dir: DirAccess = DirAccess.open("user://")
	dir.make_dir_recursive("user://game_data")

	var qs_file: FileAccess = FileAccess.open("user://game_data/question_sequence.json", FileAccess.WRITE)
	json_string = JSON.stringify(qs_format, "\t")

	# Save question_sequence to host's machine
	qs_file.store_line(json_string)

	qs_file.close()


func get_next_question() -> QuestionData:
	## Question Sequence file pointer
	var qs_file: FileAccess = FileAccess.open("user://game_data/question_sequence.json", FileAccess.READ_WRITE)

	var qs_data: Dictionary = JSON.parse_string(qs_file.get_as_text())

	var sequence: Array = qs_data["question_sequence"]
	var current_question_in_seq: int = qs_data["current_question"]
	current_question_in_seq += 1

	# Question sequence completed and game is over (check for null on receiving end)
	if current_question_in_seq >= sequence.size():
		return null

	# Update current question to next
	qs_data["current_question"] = current_question_in_seq

	# Store new data to qs_file
	qs_file.store_line(JSON.stringify(qs_data, "\t"))
	qs_file.close()


	var qp_file_path: String = FILE_PATH[qs_data["category"]]

	## Question Pool file pointer
	var qp_file: FileAccess = FileAccess.open(qp_file_path, FileAccess.READ)
	var qp_data = JSON.parse_string(qp_file.get_as_text())

	qp_file.close()

	var current_question_idx: int = sequence[current_question_in_seq]

	var question_data_dict: Dictionary = qp_data["questions"][current_question_idx]
	var question_string: String = question_data_dict["question"]
	var option_array: Array = question_data_dict["options"]
	var correct_option_idx: int = question_data_dict["correct_answer_index"]

	var question_data: QuestionData = QuestionData.new(question_string, option_array, correct_option_idx)

	return question_data
