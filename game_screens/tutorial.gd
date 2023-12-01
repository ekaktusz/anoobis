extends Control

func _on_button_pressed():
	var menu = preload("res://game_screens/tinder_scene.tscn").instantiate()
	SceneTransition.change_scene(menu)
