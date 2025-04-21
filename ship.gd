extends Area2D

@export var SPEED: = 100;

const Laser: PackedScene = preload("res://laser.tscn")
const ExplosionEffect = preload("res://explosion.tscn")

signal player_death

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
	
	if Input.is_action_just_pressed("ui_accept"):
		fire_laser()
		
func fire_laser() -> void:
	var laser = Laser.instantiate()
	var rootScene = get_tree().current_scene
	
	rootScene.add_child(laser, true)
	
	laser.global_position = global_position

func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	queue_free()

func _exit_tree() -> void:
	var main = get_tree().current_scene
	
	var explosion_effect = ExplosionEffect.instantiate()
	main.add_child.call_deferred(explosion_effect)
	
	explosion_effect.global_position = global_position
	
	emit_signal("player_death")
