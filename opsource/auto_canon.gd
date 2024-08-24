extends Node2D
class_name AutoCanon

var target: Node2D
@export var bullet: PackedScene
@export var damage_modifiers: Array[DamageModifier]
@export var time_gap_between_shoot: float =2.0
@onready var area_2d: Area2D = $Area2D
@onready var timer: Timer = $Timer

func _ready() -> void:
	shoot()
	timer.start(time_gap_between_shoot)

func shoot() -> void:
	var nearest_target_distance:= 9999
	for area in area_2d.get_overlapping_areas():
		if area.get_parent() == get_parent():
			continue
		
		if (area.global_position - global_position).length() < nearest_target_distance:
			nearest_target_distance = (area.global_position - global_position).length()
			target = area
	
	var shoot_direction:= Vector2.ONE.rotated(randf_range(0, 2 * PI))
	if is_instance_valid(target):
		shoot_direction = (target.global_position - global_position).normalized()
	var new_bullet: Bullet = bullet.instantiate()
	new_bullet.damage = new_bullet.base_damage.duplicate(true)
	new_bullet.shooter = get_parent()
	for damage_modifier in damage_modifiers:
		new_bullet.damage = damage_modifier.modify_damage(new_bullet.damage)
	new_bullet.global_position = global_position
	new_bullet.travel_direction = shoot_direction
	get_tree().current_scene.add_child.call_deferred(new_bullet)

func _on_timer_timeout() -> void:
	shoot()
	timer.start(time_gap_between_shoot)
