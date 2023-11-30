extends CanvasLayer

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
	
func change_scene(scene: Node) -> void:
	$AnimationPlayer.play("dissolve")
	await $AnimationPlayer.animation_finished
	
	# Remove the current scene
	var current_scene = get_tree().root.get_child(get_tree().root.get_child_count() - 1)
	get_tree().root.remove_child(current_scene)
	
	get_tree().root.add_child(scene)
	$AnimationPlayer.play_backwards("dissolve")
