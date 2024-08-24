extends CharacterBody2D

signal died(gift)

@export var gift:PackedScene

var target:Node2D
var hp:float = 12 : 
	set(f):
		hp = f
		if f<=0:
			died.emit(gift)

func _process(delta):
	if is_instance_valid(target):
		velocity = (target.global_position-global_position).normalized()*30
		move_and_slide()

func _on_timer_timeout():
	%HurtArea.attack()

func _on_hit_area_hurt(damage):
	hp-=damage
	if hp<=0:
		queue_free()
