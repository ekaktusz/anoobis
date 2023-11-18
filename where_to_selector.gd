extends Window


func _on_to_hell_button_pressed() -> void:
	get_tree().change_scene_to_file("res://hell.tscn")


func _on_to_heaven_button_pressed() -> void:
	get_tree().change_scene_to_file("res://heaven.tscn")
