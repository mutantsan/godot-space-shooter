extends Node

var score = 0: set = set_score
@onready var ScoreLabel = $Score

func set_score(value: int) -> void:
	score = value
	ScoreLabel.text = "Score %s" % score
	
