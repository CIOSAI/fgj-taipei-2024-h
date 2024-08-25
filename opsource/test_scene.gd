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
	%PlayerDeathSound.play()
	Global.player.queue_free()
	var tw = create_tween()
	tw.tween_property(
		%SpiralTransition.material, "shader_parameter/amount",
		1, 1
	)
	tw.tween_callback(spawn_player)
	tw.tween_property(
		%SpiralTransition.material, "shader_parameter/amount",
		0, .3
	)

func spawn_player():
	var instance:Player = player_res.instantiate()
	instance.global_position = %PlayerSpawnPoint.global_position
	instance.died.connect(_on_player_died)
	add_child.call_deferred(instance)
	#add_child(instance)

func _on_back_pressed():
	get_tree().change_scene_to_file("res://daimeng/title.tscn")
