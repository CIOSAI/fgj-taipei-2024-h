extends Control

var items = []
@onready var slots: Array[PanelContainer] = [
	$HBoxContainer/ItemSlot,
	$HBoxContainer/ItemSlot2,
	$HBoxContainer/ItemSlot3,
	$HBoxContainer/ItemSlot4,
	$HBoxContainer/ItemSlot5,
	$HBoxContainer/ItemSlot6,
]

func _ready():
	pass

func show_items(items):
	print(len(items))
	assert(len(items) <= 6, "More than 6 items.")
	for i in range(6):
		var txr: TextureRect = slots[i].get_child(0)
		txr.texture = null

	for i in range(items.size()):
		var txr: TextureRect = slots[i].get_child(0)
		txr.texture = items[i]

#func _process(delta: float):
	#if Input.is_action_just_pressed("ui_text_backspace"):
		#var tex: Texture2D = load("res://icon.svg")
		#show_items([tex, tex, tex, tex, tex])
