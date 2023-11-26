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
@onready var HellQuestButton = $Hell/HellBackgroundPanel/AcceptHellQuest
@onready var HeavenQuestButton = $Heaven/HeavenBackgroundPanel/AcceptHeavenQuest

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
		game_over()

	if hell_score <= -100:
		if hell_quest_accepted:
			print("YOUR WINNER: Completed hell quest")
		else:
			print("YOUR LOSER: Hell got unbalanced")
		game_over()
	elif hell_score >= 0:
		print("YOUR LOSER: Hell got unbalanced")
		game_over()

	if heaven_score >= 100:
		if heaven_quest_accepted:
			print("YOUR WINNER: Completed heaven quest")
		else:
			print("YOUR LOSER: Heaven got unbalanced")
			game_over()
	elif heaven_score <= 0:
		print("YOUR LOSER: Heaven got unbalanced")
		game_over()


func game_over() -> void:
	SceneTransition.change_scene_to_file("res://menu_scene.tscn")


func execute_rank_up_event(level : int) -> void:
	if (level == 3):
		HellQuestButton.set_visible(true)
		HeavenQuestButton.set_visible(true)

	elif(level == 5):
		pass


func _on_accept_hell_quest_pressed() -> void:
	hell_quest_accepted = true
	HeavenQuestButton.set_visible(false)
	HellQuestButton.set_visible(false)


func _on_accept_heaven_quest_pressed() -> void:
	heaven_quest_accepted = true
	HeavenQuestButton.set_visible(false)
	HellQuestButton.set_visible(false)
