extends Area2D
class_name Money

@export var type: Enemy.EnemyType:
	set(new_type):
		type = new_type
		if is_instance_valid(mobdrop):
			mobdrop.frame = type + 3
@onready var mobdrop: Sprite2D = $Mobdrop

var target: Node2D
const FLY_SPEED: float = 500

func _ready() -> void:
	type = type

func _physics_process(delta: float) -> void:
	if is_instance_valid(target):
		global_position = (target.global_position - global_position).normalized() * FLY_SPEED * delta
