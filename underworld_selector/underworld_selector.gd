extends Control

@onready var player_to_hell_button = $PlayerToHellButton
@onready var player_to_heaven_button = $PlayerToHeavenButton
 
func _on_player_to_hell_button_pressed():
	var hell_scene = preload("res://game_screens/hell_scene.tscn").instantiate()
	SceneTransition.change_scene(hell_scene)


func _on_player_to_heaven_button_pressed():
	var heaven_scene = preload("res://game_screens/heaven_scene.tscn").instantiate()
	SceneTransition.change_scene(heaven_scene)

func _on_player_to_hell_button_mouse_entered():
	player_to_hell_button.scale = Vector2(2.1, 2.1)


func _on_player_to_hell_button_mouse_exited():
	player_to_hell_button.scale = Vector2(2, 2)


func _on_player_to_heaven_button_mouse_entered():
	player_to_heaven_button.scale = Vector2(2.1, 2.1)


func _on_player_to_heaven_button_mouse_exited():
	player_to_heaven_button.scale = Vector2(2, 2)
