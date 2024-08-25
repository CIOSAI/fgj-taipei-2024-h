extends Area2D

var collected_money: Array[int] = [0, 0, 0, 0]

func _on_money_detector_area_entered(area: Area2D) -> void:
	if area is Money:
		area.target = self

func _on_area_entered(area: Area2D) -> void:
	if area is Money:
		collected_money[area.type] += 1
		area.queue_free()
