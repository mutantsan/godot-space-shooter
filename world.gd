extends Node

var score = 0;
@onready var ScoreLabel = $Score

func _on_enemy_score_update() -> void:
	score += 10;
	ScoreLabel.text = "Score : %s" % score
