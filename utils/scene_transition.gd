extends CanvasLayer

var tinder_scene = preload("res://game_screens/tinder_scene.tscn").instantiate()
var heaven_scene = preload("res://game_screens/heaven_scene.tscn").instantiate()

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

func change_to_tinder_scene(target: String) -> void:
	$AnimationPlayer.play("dissolve")
	await $AnimationPlayer.animation_finished
	get_tree().root.add_child(tinder_scene)
	$AnimationPlayer.play_backwards("dissolve")
	
func change_to_heaven_scene(target: String) -> void:
	$AnimationPlayer.play("dissolve")
	await $AnimationPlayer.animation_finished
	get_tree().root.add_child(heaven_scene)
	$AnimationPlayer.play_backwards("dissolve")
