extends Node


## Temporary constant for sample file path (there will be one for each file in the future)
const SAMPLE_FILE_PATH: String = "res://questions/sample_questions.json"


func set_question_sequence(requested_count: int) -> void:
	if requested_count < 1:
		# This shouldn't be possible btw
		# If it happens, there is a problem with the spinbox
		push_error("Count is invalid: {count}")
		return

	## Sequence of question indexes to be used during game
	var question_idx_seq: Array[int]

	if not FileAccess.file_exists(SAMPLE_FILE_PATH):
		push_error("File does not exist: " + SAMPLE_FILE_PATH)
		return
		
	var file: FileAccess = FileAccess.open(SAMPLE_FILE_PATH, FileAccess.READ)
	var json_string: String = file.get_as_text()
	file.close()

	var json: JSON = JSON.new()
	json.parse(json_string)

	var data: Dictionary = json.data

	requested_count = min(requested_count, data.get("total_questions"))

	for i in range(requested_count):
		question_idx_seq.append(i)

	question_idx_seq.shuffle() # Order is randomized here

	## Dictionary format for the question_sequence file
	var qs_format: Dictionary = {
		"question_sequence": question_idx_seq,
		"current_question": 0
	}

	var dir: DirAccess = DirAccess.open("user://")
	dir.make_dir_recursive("user://game_data")

	var qs_file: FileAccess = FileAccess.open("user://game_data/question_sequence.json", FileAccess.WRITE)
	json_string = JSON.stringify(qs_format, "\t")

	# Save question_sequence to host's machine
	qs_file.store_line(json_string)

	qs_file.close()

	return
