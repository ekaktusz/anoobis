extends Control

var hell_score : int = -50
var heaven_score : int = 50
var dead_counter : int = 0

@onready var heaven = $Heaven
@onready var hell = $Hell
@onready var underworld_selector = $UnderworldSelector
@onready var heaven_score_label = $Heaven/HeavenBackgroundPanel/ScoreLabel
@onready var hell_score_label = $Hell/HellBackgroundPanel/ScoreLabel
@onready var heaven_quest = $Heaven/HeavenBackgroundPanel/HeavenActions/Quest
@onready var hell_quest = $Hell/HellBackgroundPanel/HellActions/Quest

signal underworld_left()
signal open_hell_dialog(level)
signal open_heaven_dialog(level)


func evaluate_quest_completion() -> void:
	hell_quest.evaluate_hell_quests()
	heaven_quest.evaluate_heaven_quests()


func _on_to_hell_button_pressed() -> void:
	underworld_selector.set_visible(false)
	hell.set_visible(true)
	open_hell_dialog.emit(floor(dead_counter / 10))


func _on_to_heaven_button_pressed() -> void:
	underworld_selector.set_visible(false)
	heaven.set_visible(true)
	open_heaven_dialog.emit(floor(dead_counter / 10))


func reset_quest_state() -> void:
	heaven_quest.reset_heaven_quest_progress()
	hell_quest.reset_hell_quest_progress()


func _on_back_pressed() -> void:
	underworld_selector.set_visible(true)
	heaven.set_visible(false)
	hell.set_visible(false)
	reset_quest_state()

	underworld_left.emit()


func _on_tinder_scene_character_sent_to_heaven(character : CharacterData) -> void:
	heaven_quest.update_quest_on_soul_sent_to_heaven(character.get_soul_value_sum())
	hell_quest.update_quest_on_soul_sent_to_heaven(character.get_soul_value_sum())

	heaven_score += character.get_soul_value_sum()
	hell_quest.update_heaven_score(heaven_score)
	dead_counter += 1

	heaven_score_label.text = "Heaven score is: " + str(heaven_score)


func _on_tinder_scene_character_sent_to_hell(character) -> void:
	heaven_quest.update_quest_on_soul_sent_to_hell()
	hell_quest.update_quest_on_soul_sent_to_hell(character.get_soul_value_sum())

	hell_score += character.get_soul_value_sum()
	heaven_quest.update_hell_score(hell_score)
	dead_counter += 1

	hell_score_label.text = "Hell score is: " + str(hell_score)


func evaluate_end_of_turn() -> void:
	evaluate_win_condition()
	evaluate_quest_completion()


func evaluate_win_condition() -> void:
	if dead_counter >= 100:
		if heaven_quest.is_secret_quest_accepted() or hell_quest.is_secret_quest_accepted():
			print("YOUR LOSER: Accepted an underworld quest but ended up balanced")
		else:
			print("YOUR WINNER: True ending")
		game_over()

	if hell_score <= -100:
		if hell_quest.is_secret_quest_accepted():
			print("YOUR WINNER: Completed hell quest")
		else:
			print("YOUR LOSER: Hell got unbalanced")
		game_over()
	elif hell_score >= 0:
		print("YOUR LOSER: Hell got unbalanced")
		game_over()

	if heaven_score >= 100:
		if heaven_quest.is_secret_quest_accepted():
			print("YOUR WINNER: Completed heaven quest")
		else:
			print("YOUR LOSER: Heaven got unbalanced")
			game_over()
	elif heaven_score <= 0:
		print("YOUR LOSER: Heaven got unbalanced")
		game_over()


func game_over() -> void:
	SceneTransition.change_scene_to_file("res://menu_scene.tscn")


func enable_underworld_quests() -> void:
	hell_quest.enable_hell_quests()
	heaven_quest.enable_heaven_quests()

func _on_accept_hell_quest_pressed() -> void:
	hell_quest.accept_next_quest()


# TODO: Reconnect signals to quest
func _on_accept_heaven_quest_pressed() -> void:
	heaven_quest.accept_next_quest()


func _on_decline_hell_quest_pressed() -> void:
	pass # Replace with function body.


func _on_decline_heaven_quest_pressed() -> void:
	pass # Replace with function body.


func get_current_heaven_quest_description() -> String:
	return heaven_quest.get_current_heaven_quest_description()


func get_current_hell_quest_description() -> String:
	return hell_quest.get_current_hell_quest_description()



func _on_quest_hell_quest_completed(reward_score) -> void:
	hell_score += reward_score


func _on_quest_heaven_quest_completed(reward_score) -> void:
	heaven_score += reward_score
