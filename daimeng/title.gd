extends Control


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://opsource/test_scene.tscn")

func _on_close_button_pressed() -> void:
	$CreditPanel.visible = false
	$ControlPanel.visible = false

func _on_credit_button_pressed() -> void:
	$CreditPanel.show()
	
func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_control_button_pressed() -> void:
	$ControlPanel.show()
