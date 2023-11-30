extends Control

func _on_start_button_pressed():
	BackgroundMusicPlayer.play_heaven_music()
	SceneTransition.change_scene_to_file("res://game_screens/tinder_scene.tscn")
	pass # Replace with function body.
