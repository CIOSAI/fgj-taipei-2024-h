extends CharacterBody2D
class_name Player

func _physics_process(delta: float) -> void:
	Input.get_vector("move_left","move_right","move_up", "move_down")
