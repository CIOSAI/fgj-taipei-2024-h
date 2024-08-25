extends Area2D
class_name CanonPicker

var lagacy_canons: Array[AutoCanon]
var new_canon: AutoCanon

func _on_area_entered(area: Area2D) -> void:
	if area.get_parent() is Player:
		for canon in lagacy_canons:
			area.get_parent().append_canon(canon)
		area.get_parent().append_canon(new_canon)
