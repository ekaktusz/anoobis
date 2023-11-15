extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	print("asd")
	pass # Replace with function body.


func _on_generate_char_button_pressed() -> void:
	get_tree().change_scene_to_file("res://character_generator.tscn")


func _on_heaven_button_pressed() -> void:
	get_tree().change_scene_to_file("res://character_generator.tscn")
