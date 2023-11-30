extends CanvasLayer

var tinder_scene = preload("res://game_screens/tinder_scene.tscn").instantiate()
var heaven_scene = preload("res://game_screens/heaven_scene.tscn").instantiate()

func _process(delta):
	# Check animation playback position and adjust volume accordingly
	if $AnimationPlayer.is_playing():
		var animation_position = $AnimationPlayer.current_animation_position
		var max_animation_length = $AnimationPlayer.current_animation_length
		# Calculate normalized volume based on animation progress
		var volume = 1.0 - abs(animation_position / max_animation_length)
		volume = clamp(volume, 0.0, 1.0)
		BackgroundMusicPlayer.volume_db = -80.0 + 80.0 * volume
	pass

func change_scene_to_file(target: String) -> void:
	$AnimationPlayer.play("dissolve")
	await $AnimationPlayer.animation_finished
	get_tree().root.add_child(tinder_scene)
	$AnimationPlayer.play_backwards("dissolve")
	
func change_scene(scene: Node) -> void:
	$AnimationPlayer.play("dissolve")
	await $AnimationPlayer.animation_finished
	get_tree().root.add_child(scene)
	$AnimationPlayer.play_backwards("dissolve")
