extends Resource
class_name DamageStats

enum DamageType{WIND, FIRE, ICE}

@export var damage: int = 10
@export var damage_type: DamageType = DamageType.WIND
