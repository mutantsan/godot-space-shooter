extends Node

const STORAGE_PATH = "user://storage.json"

var default_storage = {
	highScore = 0,
}

func save_storage(data: Dictionary):
	var json_string = JSON.stringify(data)
	var file = FileAccess.open(STORAGE_PATH, FileAccess.WRITE)
	
	file.store_line(json_string)
	file.close()

func load_storage() -> Dictionary:
	if not FileAccess.file_exists(STORAGE_PATH):
		return default_storage
	
	var file = FileAccess.open(STORAGE_PATH, FileAccess.READ)
	var storage = JSON.parse_string(file.get_as_text())
	
	file.close()
	
	return storage
	
