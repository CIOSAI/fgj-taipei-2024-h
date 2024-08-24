extends Node2D
class_name Enemy

@export var movement_speed: float = 90.0
@export var target: Player
var moving_direction:= Vector2.ZERO
var rotating_radius: float = PI / 4

func _physics_process(delta: float) -> void:
	if is_instance_valid(target):
		moving_direction = (global_position - target.global_position).normalized()
	else:
		moving_direction = moving_direction.rotated(rotating_radius)
		rotating_radius += randf_range(- PI / 8, PI / 8)
	position -= moving_direction * movement_speed * delta

func _draw() -> void:
	draw_rect(Rect2(0, 0, 60, 60), Color.FIREBRICK)
