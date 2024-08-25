extends Area2D
class_name AttackBox

@export var base_damage:DamageStats
@onready var damage: DamageStats = base_damage.duplicate()
