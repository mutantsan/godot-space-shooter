extends Node

var score = 0: set = set_score
@onready var ScoreLabel = $Score

func set_score(value: int) -> void:
	score = value
	ScoreLabel.text = "Score %s" % score

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://start_menu.tscn")

func update_save_data():
	var storage = Storage.load_storage()
	
	if score > storage.highScore:
		storage.highScore = score
		Storage.save_storage(storage)

func _on_ship_player_death() -> void:
	update_save_data()
	
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://game_over_screen.tscn")
