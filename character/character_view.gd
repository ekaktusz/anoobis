extends MarginContainer

const CharacterData = preload("res://character/character_data.gd")

var current_character: CharacterData

func change_character(new_character: CharacterData):
	self.current_character = new_character
	# TODO: Here we can send the portrait to the afterlife instead of deleting
	remove_child(get_child(0))
	add_child(new_character.portrait_view)

func _on_tinder_scene_character_changed(new_character):
	change_character(new_character)
