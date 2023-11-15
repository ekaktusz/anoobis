extends Control

var character_node : Node

func _ready() -> void:
	character_node = $VBoxContainer/Character
	character_node._set_random_parts()

func _on_hair_button_pressed() -> void:
	character_node._set_next_hair()


func _on_eyes_button_pressed() -> void:
	character_node._set_next_eye()


func _on_nose_button_pressed() -> void:
	character_node._set_next_nose()


func _on_mouth_button_pressed() -> void:
		character_node._set_next_mouth()


func _on_skin_button_pressed() -> void:
	character_node._set_next_skin()


func _on_generate_button_pressed() -> void:
	character_node._set_random_parts()
