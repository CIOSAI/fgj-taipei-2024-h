extends Area2D
class_name AttackBox

@export var base_damage:DamageStats
@export var damage_modifiers: Array[DamageModifier]:
	set(new):
		damage_modifiers = new
		print_debug(damage_modifiers)
var damage: DamageStats:
	get:
		var new_damage: DamageStats = base_damage.duplicate()
		for damage_modifier: DamageModifier in damage_modifiers:
			new_damage = damage_modifier.modify_damage(new_damage)
		return new_damage
