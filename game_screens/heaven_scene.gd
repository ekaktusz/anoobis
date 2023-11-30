extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	BackgroundMusicPlayer.play_heaven_music()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_button_pressed():
	var tinder_scene = preload("res://game_screens/tinder_scene.tscn").instantiate()
	SceneTransition.change_scene(tinder_scene)
	pass # Replace with function body.
