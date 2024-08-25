extends Resource
class_name DamageStats

enum DamageType{NONE, ICE, FIRE, WIND}

@export var damage: int = 0
@export var damage_type: DamageType = DamageType.NONE
