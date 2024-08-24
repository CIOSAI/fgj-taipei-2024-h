extends Node2D

@export var player_res:PackedScene
@export var zombie_res:PackedScene
@export var pickable_res:PackedScene
@export var possible_items:Array[PackedScene]
@export var possible_names:Array[String]

var to_spawn:Array = []
var to_clear:Array[Node2D] = []
var player

func _ready():
	set_up()
	leave_gift(null, Vector2(200, 250))

func set_up():
	for entity in to_clear:
		if is_instance_valid(entity): entity.queue_free()
	
	while not to_spawn.is_empty():
		var data = to_spawn.pop_front()
		leave_gift(data["thing"], data["v"])
	
	player = spawn_entity(player_res, Vector2(200,200))
	player.died.connect(set_up)

func leave_gift(gift, v:Vector2):
	var instance = pickable_res.instantiate()
	instance.global_position = v
	var chosen:int = randi() % possible_items.size()
	instance.item = possible_items[chosen]
	instance.item_name = possible_names[chosen]
	instance.picked.connect(func(picked_item): player.add_child(picked_item.instantiate()))
	add_child(instance)

func spawn_entity(subject:PackedScene, v:Vector2):
	var instance = subject.instantiate()
	instance.global_position = v
	add_child(instance)
	to_clear.append(instance)
	return instance

func _on_timer_timeout():
	var zombie = spawn_entity(zombie_res, Vector2(randf_range(0, 1000),randf_range(0, 800)))
	zombie.target = player
	zombie.died.connect(func(gift): to_spawn.append({"thing": gift, "v": zombie.global_position}))
	
