extends Control

var hell_score : int = 0
var heaven_score : int = 0

@onready var Heaven = $Heaven
@onready var Hell = $Hell
@onready var UnderworldSelector = $UnderworldSelector
@onready var HeavenScoreLabel = $Heaven/HeavenBackgroundPanel/ScoreLabel
@onready var HellScoreLabel = $Hell/HellBackgroundPanel/ScoreLabel

signal underworld_left()

func _on_to_hell_button_pressed() -> void:
	UnderworldSelector.set_visible(false)
	Hell.set_visible(true)


func _on_to_heaven_button_pressed() -> void:
	UnderworldSelector.set_visible(false)
	Heaven.set_visible(true)


func _on_back_pressed() -> void:
	UnderworldSelector.set_visible(true)
	Heaven.set_visible(false)
	Hell.set_visible(false)

	underworld_left.emit()


func _on_tinder_scene_character_sent_to_heaven(character : CharacterData) -> void:
	var soul_value : int = character.get_soul_value_sum()
	heaven_score += soul_value
	HeavenScoreLabel.text = "Heaven score is: " + str(heaven_score)


func _on_tinder_scene_character_sent_to_hell(character) -> void:
	var soul_value : int = character.get_soul_value_sum()
	hell_score += soul_value
	HellScoreLabel.text = "Hell score is: " + str(hell_score)

