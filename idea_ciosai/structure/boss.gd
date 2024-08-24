extends StaticBody2D


var hp:float = 60

func _process(delta):
	%Label.text = str(hp)

func _on_hit_area_hurt(damage):
	hp -= damage

func _on_heal_timer_timeout():
	if hp>0: hp = min(100,hp+1)
