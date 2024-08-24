extends Area2D

signal picked(item:PackedScene)

var item:PackedScene
var item_name:String
var has_overlap:bool : 
	set(b):
		has_overlap = b
		if %Label: %Label.visible = has_overlap

func _ready():
	%Label.text = item_name

func _physics_process(delta):
	if Input.is_action_just_pressed("pick_item") and has_overlap:
		picked.emit(item)
		queue_free()

func _on_body_entered(body):
	has_overlap = true

func _on_body_exited(body):
	has_overlap = false
