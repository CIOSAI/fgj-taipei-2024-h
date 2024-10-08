extends Node2D
class_name HP

var self_type: DamageStats.DamageType
signal hp_updated(new_hp: int)

@export var init_hp: int
var hp: int = init_hp:
	set(new_hp):
		hp = new_hp
		hp_updated.emit(hp)

func _ready():
	hp = init_hp

func take_damage(damage: DamageStats) -> void:
	if damage.damage_type == damage.DamageType.NONE || self_type == damage.damage_type:
		hp -= damage.damage
	elif (self_type + 1) % 3 == damage.damage_type:
		hp -= damage.damage * 1.5
	else:
		hp -= damage.damage * 0.5
