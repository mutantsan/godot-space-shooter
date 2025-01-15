extends Area2D

@export var SPEED: = 100;

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		if position.y <= 10:
			pass
		else:
			position.y -= SPEED * delta
	
	if Input.is_action_pressed("ui_down"):
		if position.y >= 170:
			pass
		else:
			position.y += SPEED * delta
	
	
