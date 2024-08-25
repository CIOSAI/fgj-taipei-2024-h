extends Node2D
class_name Boss

@onready var enemy_spawner: EnemySpawner = $EnemySpawner
@onready var timer: Timer = $Timer

@export var boss_type: Enemy.EnemyType
@export var max_spawn_gap: float = 10
@export var spawn_gap_decrease: float = 1
@export var min_spawn_gap: float = 1
@export var mob_attack_init: int = 1
@export var mob_attack_increase: int = 1

var spawn_count: int = 0

func _ready():
	enemy_spawner.spawner_type = boss_type
	$Sprite2D.frame_coords.x = boss_type

func _on_timer_timeout() -> void:
	enemy_spawner.enemy_attack = mob_attack_init + mob_attack_increase * spawn_count
	enemy_spawner.spawn()
	timer.start(clampi(min_spawn_gap, max_spawn_gap, max_spawn_gap - spawn_gap_decrease * spawn_count))

func _on_hp_hp_updated(new_hp):
	%HurtAnim.play("default")
	if new_hp<=0:
		queue_free()
		Global.boss_defeated.emit()
