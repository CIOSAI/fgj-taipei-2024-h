extends Node2D

var player:PhysicsBody2D
@export var following:bool

func _process(delta):
	if is_instance_valid(player) and following: 
		look_at(player.global_position)

func _on_area_2d_body_entered(body):
	player = body

func _on_area_2d_body_exited(body):
	player = null
