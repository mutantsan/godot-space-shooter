extends Area2D

const ExplosionEffect = preload("res://explosion.tscn")

@export var SPEED := 20.0;
@export var ARMOR := 3;

@onready var enemySprite := $Sprite;

var rng = RandomNumberGenerator.new()

func _process(delta: float) -> void:
	position.x -= SPEED * delta;
		
	SPEED += rng.randf_range(0.01, 0.05)


func _on_body_entered(body: Node2D) -> void:
	body.make_hit_effect()
	
	body.queue_free()
	ARMOR -= 1
	
	if ARMOR == 0:
		var main = get_tree().current_scene
		if main.is_in_group("World"):
			main.score += 10;
		
		explode()
		queue_free()
	
	# flash red on hit
	flash_on_hit(Color(1, 0, 0), 0.1);

func flash_on_hit(flash_color: Color, duration: float = 0.1):
	var originalColor = modulate;
	modulate = flash_color;
	await get_tree().create_timer(duration).timeout;
	modulate = originalColor;
	
func _on_visibility_notifier_screen_exited() -> void:
	queue_free()

func explode() -> void:
	var main = get_tree().current_scene
	
	var explosion_effect = ExplosionEffect.instantiate()
	main.add_child.call_deferred(explosion_effect)
	
	explosion_effect.global_position = global_position
