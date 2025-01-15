extends Area2D

const ExplosionEffect = preload("res://explosion.tscn")

@export var SPEED: = 20;
@export var ARMOR: = 3;

func _process(delta: float) -> void:
	position.x -= SPEED * delta;


func _on_body_entered(body: Node2D) -> void:
	body.queue_free()
	ARMOR -= 1
	
	if ARMOR == 0:
		var main = get_tree().current_scene
		if main.is_in_group("World"):
			main.score += 10;
		queue_free()


func _on_visibility_notifier_screen_exited() -> void:
	queue_free()

func _exit_tree() -> void:
	var main = get_tree().current_scene
	var explosion_effect = ExplosionEffect.instantiate()
	main.add_child.call_deferred(explosion_effect)
	
	explosion_effect.global_position = global_position
