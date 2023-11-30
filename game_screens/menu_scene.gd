extends Control

func _on_start_button_pressed():
	BackgroundMusicPlayer.play_heaven_music()
	var tinder_scene = preload("res://game_screens/tinder_scene.tscn").instantiate()
	SceneTransition.change_scene(tinder_scene)
	pass # Replace with function body.
