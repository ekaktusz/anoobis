extends MarginContainer

const CharacterData = preload("res://data_classes/character_data.gd")

var current_character: CharacterData

func change_character(new_character: CharacterData):
	self.current_character = new_character
	var portrait_containter : Node = $MarginContainer

	# TODO: Here we can send the portrait to the afterlife instead of deleting
	portrait_containter.get_child(0).queue_free()
	portrait_containter.add_child(new_character.portrait_view)

func _on_tinder_scene_character_changed(new_character):
	change_character(new_character)
