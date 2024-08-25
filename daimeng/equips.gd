extends Node
class_name Equips

var items: Array[Item]

func _ready():
	_init_items()

func _init_items():
	items = []
	for c in get_children():
		if c.is_class("Item"):
			items.append(c as Item)

func equip(item: Item):
	items.append(item)
