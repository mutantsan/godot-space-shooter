extends Node

@onready var highscoreLabel := $HighscoreLabel;

func _ready() -> void:
	set_highscore_label()

func set_highscore_label():
	var storage = Storage.load_storage()
	
	highscoreLabel.text = "Highscore: %s" % storage.highScore;
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://start_menu.tscn")
