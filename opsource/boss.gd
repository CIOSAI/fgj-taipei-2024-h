extends Node2D
class_name Boss

@onready var enemy_spawner: EnemySpawner = $EnemySpawner
@onready var timer: Timer = $Timer

@export var max_spawn_gap: float = 10
@export var spawn_gap_decrease: float = 1
@export var min_spawn_gap: float = 1
@export var mob_attack_init: int = 1
@export var mob_attack_increase: int = 1

var spawn_count: int = 0

func _on_timer_timeout() -> void:
	enemy_spawner.enemy_attack = mob_attack_init + mob_attack_increase * spawn_count
	enemy_spawner.spawn()
	timer.start(clampi(min_spawn_gap, max_spawn_gap, max_spawn_gap - spawn_gap_decrease * spawn_count))
