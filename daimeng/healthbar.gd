extends Control

@export var max_hp: int = 12

func _ready():
	$ProgressBar.max_value = max_hp

func set_hp(v: int):
	var tween: Tween = get_tree().create_tween().set_ease(Tween.EASE_OUT)
	tween.tween_property($ProgressBar, "value", v, 0.2)
