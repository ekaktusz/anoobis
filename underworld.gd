extends Control

var hell_score : int = -50
var heaven_score : int = 50
var dead_counter : int = 0
var heaven_quest_accepted : bool = false
var hell_quest_accepted : bool = false

var hell_quest_descriptions : Array[String] = [
	"Send 1 soul to Heaven who does not belong there",
	"Send a balanced (equal PRO and CON) soul to Hell",
	"Send all souls to Heaven who would belong to Hell in a round",
	"Make Heaven's score go under +25",
	"Make Hell overflow with Evil (-100)",
]

var heaven_quest_descriptions : Array[String] = [
	"Send more people to Heaven than Hell in a round",
	"Send 3 souls to Heaven with a +8 or higher score",
	"Send all souls to Heaven in a round",
	"Make Hell's score go above -25",
	"Make Heaven overflow with goodness (+100)",
]

var next_hell_quest_index : int = 0
var next_heaven_quest_index : int = 0
var accepted_hell_quest_index : int = -1
var accepted_heaven_quest_index : int = -1

@onready var heaven = $Heaven
@onready var hell = $Hell
@onready var underworld_selector = $UnderworldSelector
@onready var heaven_score_label = $Heaven/HeavenBackgroundPanel/ScoreLabel
@onready var hell_score_label = $Hell/HellBackgroundPanel/ScoreLabel

@onready var heaven_quest = $Heaven/HeavenBackgroundPanel/HeavenActions/Quest
@onready var hell_quest = $Hell/HellBackgroundPanel/HellActions/Quest
@onready var heaven_quest_description = $Heaven/HeavenBackgroundPanel/HeavenActions/Quest/QuestDescription
@onready var hell_quest_description = $Hell/HellBackgroundPanel/HellActions/Quest/QuestDescription


signal underworld_left()

# heaven lvl1
var people_sent_to_hell_and_heaven_balance : int = 0
# heaven lvl2
var people_sent_to_heaven_with_8_plus_score : int = 0
# heaven lvl3
var all_souls_sent_to_heaven_in_round : bool = true

# hell lvl1
var soul_sent_where_it_doesnt_belong : bool = false
# hell lvl2
var balanced_sent_to_hell : bool = false
# hell lvl3
var all_negative_soul_in_heaven : bool = true


func evaluate_quest_completion() -> void:
	if accepted_hell_quest_index == 0:
		if soul_sent_where_it_doesnt_belong:
			set_next_hell_quest()
	elif accepted_hell_quest_index == 1:
		if balanced_sent_to_hell:
			set_next_hell_quest()
	elif accepted_hell_quest_index == 2:
		if all_negative_soul_in_heaven:
			set_next_hell_quest()
	elif accepted_hell_quest_index == 3:
		if heaven_score < 25:
			set_next_hell_quest()
	elif accepted_hell_quest_index == 4:
		pass

	if accepted_heaven_quest_index == 0:
		if people_sent_to_hell_and_heaven_balance > 0:
			set_next_heaven_quest()
	elif accepted_heaven_quest_index == 1:
		if people_sent_to_heaven_with_8_plus_score >= 3:
			set_next_heaven_quest()
	elif accepted_heaven_quest_index == 2:
		if all_souls_sent_to_heaven_in_round:
			set_next_heaven_quest()
	elif accepted_heaven_quest_index == 3:
		if hell_score > -25:
			set_next_heaven_quest()
	elif accepted_heaven_quest_index == 4:
		pass


func set_next_heaven_quest() -> void:
	print("heaven quest no. " + str(next_heaven_quest_index) + " completed.")
	next_heaven_quest_index += 1
	heaven_quest_description.set_text(heaven_quest_descriptions[next_heaven_quest_index])


func set_next_hell_quest() -> void:
	print("hell quest no. " + str(next_hell_quest_index) + " completed.")
	next_hell_quest_index += 1
	hell_quest_description.set_text(hell_quest_descriptions[next_hell_quest_index])


func _on_to_hell_button_pressed() -> void:
	underworld_selector.set_visible(false)
	hell.set_visible(true)


func _on_to_heaven_button_pressed() -> void:
	underworld_selector.set_visible(false)
	heaven.set_visible(true)


func reset_quest_state() -> void:
	people_sent_to_hell_and_heaven_balance = 0
	people_sent_to_heaven_with_8_plus_score = 0
	all_souls_sent_to_heaven_in_round = true
	soul_sent_where_it_doesnt_belong = false
	balanced_sent_to_hell = false
	all_negative_soul_in_heaven = true


func _on_back_pressed() -> void:
	underworld_selector.set_visible(true)
	heaven.set_visible(false)
	hell.set_visible(false)
	reset_quest_state()

	underworld_left.emit()


func _on_tinder_scene_character_sent_to_heaven(character : CharacterData) -> void:
	people_sent_to_hell_and_heaven_balance += 1
	if character.get_soul_value_sum() >= 8:
		people_sent_to_heaven_with_8_plus_score += 1
	if character.get_soul_value_sum() < 0:
		soul_sent_where_it_doesnt_belong = true
	heaven_score += character.get_soul_value_sum()
	dead_counter += 1

	heaven_score_label.text = "Heaven score is: " + str(heaven_score)


func _on_tinder_scene_character_sent_to_hell(character) -> void:
	all_souls_sent_to_heaven_in_round = false
	people_sent_to_hell_and_heaven_balance -= 1

	if character.get_soul_value_sum() > 0:
		soul_sent_where_it_doesnt_belong = true
	elif character.get_soul_value_sum() == 0:
		balanced_sent_to_hell = true
	else:
		all_negative_soul_in_heaven = false

	hell_score += character.get_soul_value_sum()
	dead_counter += 1

	hell_score_label.text = "Hell score is: " + str(hell_score)


func evaluate_end_of_turn() -> void:
	evaluate_win_condition()
	evaluate_quest_completion()


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


func enable_underworld_quests() -> void:
	hell_quest.set_visible(true)
	hell_quest_description.set_text(hell_quest_descriptions[next_hell_quest_index])

	heaven_quest.set_visible(true)
	heaven_quest_description.set_text(heaven_quest_descriptions[next_heaven_quest_index])
# TODO: a generic quest acceptor button is needed
# TODO: this should be reconnected to the functionality after completing the last quest.
func _on_accept_hell_quest_pressed() -> void:
	accepted_hell_quest_index = next_hell_quest_index

# TODO: this should be reconnected to the functionality after completing the last quest.
func _on_accept_heaven_quest_pressed() -> void:
	accepted_heaven_quest_index = next_heaven_quest_index


func _on_decline_hell_quest_pressed() -> void:
	pass # Replace with function body.


func _on_decline_heaven_quest_pressed() -> void:
	pass # Replace with function body.


func get_current_heaven_quest_description() -> String:
	return heaven_quest_descriptions[accepted_heaven_quest_index]


func get_current_hell_quest_description() -> String:
	return hell_quest_descriptions[accepted_hell_quest_index]
