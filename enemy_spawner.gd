extends Node2D


const Enemy: = preload("res://enemy.tscn")

@onready var spawnPoints: = $SpawnPoints;

func _process(_delta: float) -> void:
	pass

func get_spawn_position() -> Vector2:
	var points: = spawnPoints.get_children()
	points.shuffle()
	return points[0].global_position
	
func spawn_enemy() -> void:
	var enemy: = Enemy.instantiate()
	var spawn_position: = get_spawn_position()
	
	get_tree().current_scene.add_child(enemy)
	
	enemy.global_position = spawn_position
	
func _on_timer_timeout() -> void:
	spawn_enemy()
