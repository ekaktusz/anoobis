extends Control

var hell_score : int = -50
var heaven_score : int = 50
var dead_counter : int = 0
var heaven_quest_accepted : bool = false
var hell_quest_accepted : bool = false

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
	heaven_score += character.get_soul_value_sum()
	dead_counter += 1

	HeavenScoreLabel.text = "Heaven score is: " + str(heaven_score)


func _on_tinder_scene_character_sent_to_hell(character) -> void:
	hell_score += character.get_soul_value_sum()
	dead_counter += 1

	HellScoreLabel.text = "Hell score is: " + str(hell_score)


func evaluate_win_condition() -> void:
	if dead_counter >= 100:
		if heaven_quest_accepted or hell_quest_accepted:
			print("YOUR LOSER: Accepted an underworld quest but ended up balanced")
		else:
			print("YOUR WINNER: True ending")

	if hell_score <= -100:
		if hell_quest_accepted:
			print("YOUR WINNER: Completed hell quest")
		else:
			print("YOUR LOSER: Hell got unbalanced")
	elif hell_score >= 0:
		print("YOUR LOSER: Hell got unbalanced")

	if heaven_score >= 100:
		if heaven_quest_accepted:
			print("YOUR WINNER: Completed heaven quest")
		else:
			print("YOUR LOSER: Heaven got unbalanced")
	elif heaven_score <= 0:
		print("YOUR LOSER: Heaven got unbalanced")
