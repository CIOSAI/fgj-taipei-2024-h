extends Area2D

@export var damage:float

func attack():
	for area in get_overlapping_areas():
		if not area.has_method("on_hurt"): continue
		area.on_hurt(damage)
