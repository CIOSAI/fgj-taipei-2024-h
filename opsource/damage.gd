extends Resource
class_name DamageStats

enum DamageType{WIND, FIRE, ICE}

@export var damage: int = 0
@export var damage_typed: bool = true
@export var damage_type: DamageType = DamageType.WIND
