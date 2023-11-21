extends MarginContainer

const CharacterData = preload("res://character_data.gd")

var current_character: CharacterData

func _ready():

func change_character(new_character: CharacterData):
	self.current_character = new_character
	var portrait_container : Node = $PortraitContainer

	# TODO: Here we can send the portrait to the afterlife instead of deleting
	remove_child($PortraitContainer)
	add_child(new_character.portrait_view)

func _on_tinder_scene_character_changed(new_character):
	change_character(new_character)
