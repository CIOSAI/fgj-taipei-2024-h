extends Node2D

func _on_player_died():
	get_tree().reload_current_scene()
