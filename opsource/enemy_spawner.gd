extends Node2D
class_name EnemySpawner

enum SpawnerType{TYPED, NONE_TYPED}

@export var enemy: PackedScene
@export var spawner_type: SpawnerType 
@export var safe_inner_radius: float = 80.0
@export var danger_outer_radius: float = 120.0

func _ready() -> void:
	for i in 5:
		spawn()

func spawn() -> void:
	var spawn_position:= Vector2.ONE.rotated(randf_range(0.0, TAU)) * randf_range(safe_inner_radius, danger_outer_radius)
	var new_enemy: Enemy = enemy.instantiate()
	if spawner_type == SpawnerType.TYPED: new_enemy.type = randi() % 3 + 1
	new_enemy.global_position = position + spawn_position
	get_tree().current_scene.add_child.call_deferred(new_enemy)
