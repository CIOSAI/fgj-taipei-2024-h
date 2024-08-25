extends Node2D

@export var player_res:PackedScene

func _ready():
	spawn_player()

func _on_player_died():
	Global.player.queue_free()
	await create_tween().tween_interval(1)
	spawn_player()

func spawn_player():
	var instance:Player = player_res.instantiate()
	instance.global_position = %PlayerSpawnPoint.global_position
	instance.died.connect(_on_player_died)
	add_child.call_deferred(instance)
	#add_child(instance)
