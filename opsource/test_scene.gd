extends Node2D

@export var player_res:PackedScene

var need_to_defeat = 3

func _ready():
	spawn_player()
	
	Global.boss_defeated.connect(func():
		need_to_defeat -= 1
		if need_to_defeat <= 0:
			%Victory.visible = true
	)

func _process(delta):
	if is_instance_valid(Global.player):
		%Camera.global_position = Global.player.global_position

func _on_player_died():
	Global.player.queue_free()
	await create_tween().tween_interval(1).finished
	spawn_player()

func spawn_player():
	var instance:Player = player_res.instantiate()
	instance.global_position = %PlayerSpawnPoint.global_position
	instance.died.connect(_on_player_died)
	add_child.call_deferred(instance)
	#add_child(instance)

func _on_back_pressed():
	get_tree().change_scene_to_file("res://daimeng/title.tscn")
