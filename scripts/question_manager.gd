extends Node


## Temporary constant for sample file path (there will be one for each file in the future)
const SAMPLE_FILE_PATH: String = "res://questions/sample_questions.json"


func get_question_sequence(requested_count: int) -> Array[int]:
	if requested_count < 1:
		# This shouldn't be possible btw
		# If it happens, there is a problem with the spinbox
		push_error("Count is invalid: {count}")
		return []

	## Sequence of question indexes to be used during game
	var question_idx_seq: Array[int]

	if not FileAccess.file_exists(SAMPLE_FILE_PATH):
		push_error("File does not exist: " + SAMPLE_FILE_PATH)
		return []
		
	var file: FileAccess = FileAccess.open(SAMPLE_FILE_PATH, FileAccess.READ)
	var json_string: String = file.get_as_text()
	file.close()

	var json: JSON = JSON.new()
	json.parse(json_string)

	var data: Dictionary = json.data

	requested_count = min(requested_count, data.get("total_questions"))

	for i in range(requested_count):
		question_idx_seq.append(i)

	question_idx_seq.shuffle()

	return question_idx_seq
