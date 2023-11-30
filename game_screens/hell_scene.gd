extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	BackgroundMusicPlayer.play_hell_music()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var tinder_scene = preload("res://game_screens/tinder_scene.tscn").instantiate()
func _on_back_button_pressed():
	SceneTransition.change_scene(tinder_scene)
	pass # Replace with function body.
