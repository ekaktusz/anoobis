extends Control

var heaven_quest_accepted : bool = false
var hell_quest_accepted : bool = false

@onready var underworld_selector = $UnderworldSelector
@onready var heaven_score_label = $Heaven/HeavenBackgroundPanel/ScoreLabel
@onready var hell_score_label = $Hell/HellBackgroundPanel/ScoreLabel
@onready var hell_quest_button = $Hell/HellBackgroundPanel/AcceptHellQuest
@onready var heaven_quest_button = $Heaven/HeavenBackgroundPanel/AcceptHeavenQuest

func _on_to_hell_button_pressed() -> void:
	var hell_scene = preload("res://game_screens/hell_scene.tscn").instantiate()
	SceneTransition.change_scene(hell_scene)

func _on_to_heaven_button_pressed() -> void:
	var heaven_scene = preload("res://game_screens/heaven_scene.tscn").instantiate()
	SceneTransition.change_scene(heaven_scene)

func _on_back_pressed() -> void:
	underworld_selector.set_visible(true)

func _on_tinder_scene_character_sent_to_heaven(character : CharacterData) -> void:
	GlobalGameData.heaven_score += character.get_soul_value_sum()
	GlobalGameData.dead_counter += 1
	heaven_score_label.text = "Heaven score is: " + str(GlobalGameData.heaven_score)

func _on_tinder_scene_character_sent_to_hell(character) -> void:
	GlobalGameData.hell_score += character.get_soul_value_sum()
	GlobalGameData.dead_counter += 1
	hell_score_label.text = "Hell score is: " + str(GlobalGameData.hell_score)

func evaluate_win_condition() -> void:
	if GlobalGameData.dead_counter >= 100:
		if heaven_quest_accepted or hell_quest_accepted:
			print("YOUR LOSER: Accepted an underworld quest but ended up balanced")
		else:
			print("YOUR WINNER: True ending")
		game_over()

	if GlobalGameData.hell_score <= -100:
		if hell_quest_accepted:
			print("YOUR WINNER: Completed hell quest")
		else:
			print("YOUR LOSER: Hell got unbalanced")
		game_over()
	elif GlobalGameData.hell_score >= 0:
		print("YOUR LOSER: Hell got unbalanced")
		game_over()

	if GlobalGameData.heaven_score >= 100:
		if heaven_quest_accepted:
			print("YOUR WINNER: Completed heaven quest")
		else:
			print("YOUR LOSER: Heaven got unbalanced")
			game_over()
	elif GlobalGameData.heaven_score <= 0:
		print("YOUR LOSER: Heaven got unbalanced")
		game_over()

func game_over() -> void:
	SceneTransition.change_scene_to_file("res://game_screens/menu_scene.tscn")

func enable_underworld_quests() -> void:
	hell_quest_button.set_visible(true)
	heaven_quest_button.set_visible(true)

func _on_accept_hell_quest_pressed() -> void:
	hell_quest_accepted = true
	hell_quest_button.set_visible(false)

func _on_accept_heaven_quest_pressed() -> void:
	heaven_quest_accepted = true
	heaven_quest_button.set_visible(false)
