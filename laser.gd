extends RigidBody2D


const hitEffectScn := preload("res://hit_effect.tscn");
@onready var laserSound := $LaserSound;

func _on_visibility_notifier_screen_exited() -> void:
	queue_free()

func _ready() -> void:
	laserSound.play()

func make_hit_effect() -> void:
	var main = get_tree().current_scene
	var hitEffect := hitEffectScn.instantiate()
	
	main.add_child.call_deferred(hitEffect, true)
	hitEffect.global_position = global_position
