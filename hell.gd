extends Control


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://tinder_scene.tscn")
