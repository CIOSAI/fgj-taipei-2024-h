extends Node2D
class_name AutoCanon

var target: Node2D
@export var bullet: Bullet
@onready var area_2d: Area2D = $Area2D

func shoot() -> void:
	var nearest_target_distance:= 9999
	for area in area_2d.get_overlapping_areas():
		if (area.global_position - global_position).length() < nearest_target_distance:
			nearest_target_distance = (area.global_position - global_position).length()
			target = area
	
	var shoot_direction:= Vector2.ZERO.rotated(randf_range(0, 2 * PI))
	if is_instance_valid(target):
		shoot_direction = target.position - global_position
	
	var new_bullet:= bullet.duplicate()
	bullet.travel_direction = shoot_direction
	get_tree().current_scene.add_child(new_bullet)
