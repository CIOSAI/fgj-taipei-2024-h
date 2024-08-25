extends DamageModifier
class_name IncreaseDamage

@export var increase_amount: int

func _init(amount: int = increase_amount) -> void:
	increase_amount = amount

func modify_damage(damage: DamageStats) -> DamageStats:
	damage.damage += increase_amount
	return damage
