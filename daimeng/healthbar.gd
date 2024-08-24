extends Control

var max_hp: int = 100
var hp: int = 100

func _ready():
	$ProgressBar.max_value = max_hp
	$ProgressBar.set_value_no_signal(hp)


func set_max_hp(max: int):
	max_hp = max
	$ProgressBar.max_value = max

func set_hp(v: int):
	hp = v
	$ProgressBar.set_value_no_signal(hp)

func damage(d: int):
	var tween = create_tween()
	tween.tween_property($ProgressBar, "value", hp - d, 0.2)
	hp -= d

#func _process(delta: float):
	#if Input.is_action_just_pressed("ui_text_backspace"):
		#damage(12)
