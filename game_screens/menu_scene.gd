extends Control


func _ready():
	BackgroundMusicPlayer.play_anubis_music()

func _on_start_button_pressed():
	var tinder_scene = preload("res://game_screens/tinder_scene.tscn").instantiate()
	SceneTransition.change_scene(tinder_scene)


func _on_how_to_play_button_pressed():
	var tinder_scene = preload("res://game_screens/tutorial.tscn").instantiate()
	SceneTransition.change_scene(tinder_scene)
