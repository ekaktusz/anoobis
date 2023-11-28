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

var current_hell_quest_index : int = 0
var current_heaven_quest_index : int = 0


@onready var heaven = $Heaven
@onready var hell = $Hell
@onready var underworld_selector = $UnderworldSelector
@onready var heaven_score_label = $Heaven/HeavenBackgroundPanel/ScoreLabel
@onready var hell_score_label = $Hell/HellBackgroundPanel/ScoreLabel
@onready var hell_quest_button = $Hell/HellBackgroundPanel/AcceptHellQuest
@onready var heaven_quest_button = $Heaven/HeavenBackgroundPanel/AcceptHeavenQuest

@onready var heaven_quest = $Heaven/HeavenBackgroundPanel/HeavenActions/Quest
@onready var hell_quest = $Hell/HellBackgroundPanel/HellActions/Quest
@onready var heaven_quest_description = $Heaven/HeavenBackgroundPanel/HeavenActions/Quest/QuestDescription
@onready var hell_quest_description = $Hell/HellBackgroundPanel/HellActions/Quest/QuestDescription


signal underworld_left()


func _on_to_hell_button_pressed() -> void:
	underworld_selector.set_visible(false)
	hell.set_visible(true)


func _on_to_heaven_button_pressed() -> void:
	underworld_selector.set_visible(false)
	heaven.set_visible(true)


func _on_back_pressed() -> void:
	underworld_selector.set_visible(true)
	heaven.set_visible(false)
	hell.set_visible(false)

	underworld_left.emit()


func _on_tinder_scene_character_sent_to_heaven(character : CharacterData) -> void:
	heaven_score += character.get_soul_value_sum()
	dead_counter += 1

	heaven_score_label.text = "Heaven score is: " + str(heaven_score)


func _on_tinder_scene_character_sent_to_hell(character) -> void:
	hell_score += character.get_soul_value_sum()
	dead_counter += 1

	hell_score_label.text = "Hell score is: " + str(hell_score)


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
	hell_quest_description.set_text(hell_quest_descriptions[current_hell_quest_index])

	heaven_quest.set_visible(true)
	heaven_quest_description.set_text(heaven_quest_descriptions[current_heaven_quest_index])


func _on_accept_hell_quest_pressed() -> void:
	hell_quest_accepted = true
	hell_quest_button.set_visible(false)


func _on_accept_heaven_quest_pressed() -> void:
	heaven_quest_accepted = true
	heaven_quest_button.set_visible(false)
