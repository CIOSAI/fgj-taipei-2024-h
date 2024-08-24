extends Area2D
class_name HurtBox

signal damage_taken(damage: DamageStats)

func _on_area_entered(area: Area2D) -> void:
	if area is Bullet:
		if !area.penetrating:
			area.queue_free()
		damage_taken.emit(area.damage)
