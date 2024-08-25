extends Area2D
class_name HurtBox

signal damage_taken(damage: DamageStats)
@export var damage_modifiers: Array[DamageModifier]

func _on_area_entered(area: Area2D) -> void:
	if area is Bullet:
		if area.shooter == get_parent():
			return
		
		var damage_to_take: DamageStats = area.damage
		for damage_modifier in  damage_modifiers:
			damage_to_take = damage_modifier.modify_damage(damage_to_take)
		damage_taken.emit(area.damage)
		
		if !area.penetrating:
			area.deactivate()
			
	if area is AttackBox:
		var damage_to_take: DamageStats = area.damage
		for damage_modifier in  damage_modifiers:
			damage_to_take = damage_modifier.modify_damage(damage_to_take)
		damage_taken.emit(area.damage)
		%Timer.start()

func _on_timer_timeout():
	var areas = get_overlapping_areas().filter(func(area): return area is AttackBox)
	if areas.is_empty():
		%Timer.stop()
	else:
		var area = areas[0]
		var damage_to_take: DamageStats = area.damage
		for damage_modifier in  damage_modifiers:
			damage_to_take = damage_modifier.modify_damage(damage_to_take)
		damage_taken.emit(area.damage)
