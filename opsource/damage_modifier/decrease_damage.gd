extends DamageModifier
class_name DecreaseDamage

@export var decrease_amount: int

func modify_damage(damage: DamageStats) -> DamageStats:
	damage.damage -= decrease_amount
	return damage
