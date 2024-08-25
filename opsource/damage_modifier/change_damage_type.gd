extends DamageModifier
class_name ChangeDamageType

@export var change_to: DamageStats.DamageType

func _init(type: DamageStats.DamageType = change_to) -> void:
	change_to = type

func modify_damage(damage: DamageStats) -> DamageStats:
	damage.damage_type = change_to
	return damage
