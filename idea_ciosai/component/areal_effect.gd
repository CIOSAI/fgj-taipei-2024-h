extends AttackBox

@export var base_heal:int
@export var collision_shape:NodePath
@export_range(0.2, 100) var cool_down:float = 1

func _ready():
	base_damage = base_damage_stats
	get_node(collision_shape).disabled = true
	%Timer.wait_time = cool_down

func _on_timer_timeout():
	var tw = create_tween()
	tw.tween_property(
		get_node(collision_shape), "disabled",
		false, 0
	)
	tw.tween_interval(0.1)
	tw.tween_property(
		get_node(collision_shape), "disabled",
		true, 0
	)
