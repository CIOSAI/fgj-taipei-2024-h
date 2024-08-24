extends DamageModifier
class_name IncreaseDamage

@export var increase_amount: int

func modify_damage(damage: DamageStats) -> DamageStats:
	damage.damage += increase_amount
	return damage
