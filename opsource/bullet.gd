extends Area2D
class_name Bullet

@export var damage: DamageStats
@export var penetrating: bool = false
@export var life_time: float = 1.0:
	set(new_time):
		life_time = new_time
		if life_time <= 0.0:
			queue_free()
@export var travel_speed: float = 1000.0
@export var travel_direction:= Vector2.ZERO
var shooter: Node2D

func _physics_process(delta: float) -> void:
	position += travel_direction * travel_speed * delta
	life_time -= delta

func _draw() -> void:
	draw_circle(Vector2.ZERO, 5, Color.BLACK)
