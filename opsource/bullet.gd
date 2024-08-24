extends Area2D
class_name Bullet

@export var damage: DamageStats
@export var penetrating: bool = false
@export var travel_speed: float = 100.0
@export var travel_direction:= Vector2.ZERO

func _physics_process(delta: float) -> void:
	position += travel_direction * travel_speed * delta
