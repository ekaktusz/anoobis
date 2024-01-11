extends VideoStreamPlayer


func _ready():
	play()
	paused = true


func _on_timer_timeout() -> void:
	paused = false
	$AudioStreamPlayer2D.play()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	var menu_scene : Node = preload("res://game_screens/menu_scene.tscn").instantiate()
	SceneTransition.change_scene(menu_scene)
