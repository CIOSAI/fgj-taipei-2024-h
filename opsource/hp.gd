extends Node2D
class_name HP

var self_type: DamageStats.DamageType
signal hp_updated(new_hp: int)

var hp: int = 50

func take_damage(damage: DamageStats) -> void:
	if !damage.damage_typed || self_type == damage.damage_type:
		hp -= damage.damage
	elif (self_type + 1) % 3 == damage.damage_type:
		hp -= damage.damage * 1.5
	else:
		hp -= damage.damage * 0.5
