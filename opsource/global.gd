extends Node

##Player sent this shit
signal player_died
signal time_skipped
var player: Player

func _ready() -> void:
	player = get_tree().current_scene.get_node("Player")
	time_skipped.connect(_on_time_skipped)

func _on_time_skipped() -> void:
	##TODO: Boss HP Reset
	player = get_tree().current_scene.get_node("Player")
