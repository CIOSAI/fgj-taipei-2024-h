extends Area2D

var has_overlap:bool :
	set(b):
		has_overlap = b
		%Flame.emitting = has_overlap

func _ready():
	has_overlap = true

#func _process(delta):
	#if not has_overlap: return

#func _on_body_entered(body):
	#has_overlap = true
#
#func _on_body_exited(body):
	#has_overlap = false

func _on_timer_timeout():
	if has_overlap:
		%HurtArea.attack()
