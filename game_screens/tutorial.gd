extends Control

func _on_back_button_pressed():
	var menu = preload("res://game_screens/menu_scene.tscn").instantiate()
	SceneTransition.change_scene(menu)
