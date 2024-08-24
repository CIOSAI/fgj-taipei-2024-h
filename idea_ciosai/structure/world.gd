extends Node2D

@export var player_res:PackedScene
@export var zombie_res:PackedScene

var to_clear:Array[Node2D] = []

func _ready():
	set_up()

func set_up():
	for entity in to_clear:
		if is_instance_valid(entity): entity.queue_free()
	
	var player = spawn_entity(player_res, Vector2(200,200))
	player.died.connect(set_up)
	for i in 3:
		var zombie = spawn_entity(zombie_res, Vector2(randf_range(300, 400),randf_range(0, 300)))
		zombie.target = player
		zombie.died.connect(func(gift): leave_gift(gift,zombie.global_position))

func leave_gift(gift, v:Vector2):
	var instance = gift.instantiate()
	instance.global_position = v
	add_child(instance)

func spawn_entity(subject:PackedScene, v:Vector2):
	var instance = subject.instantiate()
	instance.global_position = v
	add_child(instance)
	to_clear.append(instance)
	return instance
