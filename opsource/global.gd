extends Node

##Player sent this shit
signal player_died
signal time_skipped
signal player_updated
var player: Player :
	set(p):
		player = p
		player_updated.emit()

func _ready() -> void:
	#player = get_tree().current_scene.get_node("Player")
	time_skipped.connect(_on_time_skipped)

func _on_time_skipped() -> void:
	##TODO: Boss HP Reset
	player = get_tree().current_scene.get_node("Player")
