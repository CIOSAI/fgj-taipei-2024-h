extends Node2D
class_name EnemySpawner

@export var enemy: PackedScene
@export var enemy_attack: int
@export var enemy_speed: float
@export var spawner_type: Enemy.EnemyType 
@export var safe_inner_radius: float = 80.0
@export var danger_outer_radius: float = 120.0

func _ready() -> void:
	spawn()
	pass

func spawn() -> void:
	var spawn_position:= Vector2.ONE.rotated(randf_range(0.0, TAU)) * randf_range(safe_inner_radius, danger_outer_radius)
	var new_enemy: Enemy = enemy.instantiate()
	print_debug(new_enemy)
	new_enemy.type = spawner_type
	new_enemy.movement_speed = enemy_speed
	new_enemy.attack_box.damage_modifiers.append(IncreaseDamage.new(enemy_attack))
	new_enemy.global_position = position + spawn_position
	get_tree().current_scene.add_child.call_deferred(new_enemy)
