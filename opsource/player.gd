extends CharacterBody2D
class_name Player



const MAX_SPEED: float = 50.0
const ACCE: float = 800.0

func _physics_process(delta: float) -> void:
	velocity = velocity.move_toward(Input.get_vector("move_left","move_right","move_up", "move_down") * MAX_SPEED, ACCE * delta)
	move_and_slide()
