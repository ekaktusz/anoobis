extends VBoxContainer

var hell_quest_descriptions : Array[String] = [
	"Send 1 soul to Heaven who does not belong there",
	"Send a balanced (equal PRO and CON) soul to Hell",
	"Send all souls to Heaven who would belong to Hell in a round",
	"Make Heaven's score go under +25",
	"Make Hell overflow with Evil (-100)",
]

@onready var quest_description = $QuestDescription

var next_hell_quest_index : int = 0
var accepted_hell_quest_index : int = -1
var heaven_score : int = 0


# hell  lvl0
var sent_to_hell_counter : int = 0
# hell lvl1
var soul_sent_where_it_doesnt_belong : bool = false
# hell lvl2
var balanced_sent_to_hell : bool = false
# hell lvl3
var all_negative_soul_in_heaven : bool = true

signal hell_quest_completed(reward_score)
# TODO: emit reward


func get_current_hell_quest_description() -> String:
	var description = ""

	if accepted_hell_quest_index >= 0 :
		description = hell_quest_descriptions[accepted_hell_quest_index]
	elif sent_to_hell_counter < 5 :
		description = "Send 5 souls to Hell"

	return description


func set_next_hell_quest() -> void:
	print("hell quest no. " + str(next_hell_quest_index) + " completed.")
	next_hell_quest_index += 1
	quest_description.set_text(hell_quest_descriptions[next_hell_quest_index])


func update_heaven_score(score : int) -> void:
	heaven_score += score


func evaluate_hell_quests() -> void:
	if accepted_hell_quest_index == 0:
		if soul_sent_where_it_doesnt_belong:
			hell_quest_completed.emit(-5)
			set_next_hell_quest()
	elif accepted_hell_quest_index == 1:
		if balanced_sent_to_hell:
			hell_quest_completed.emit(-5)
			set_next_hell_quest()
	elif accepted_hell_quest_index == 2:
		if all_negative_soul_in_heaven:
			hell_quest_completed.emit(-5)
			set_next_hell_quest()
	elif accepted_hell_quest_index == 3:
		if heaven_score < 25:
			hell_quest_completed.emit(-10)
			set_next_hell_quest()
	elif accepted_hell_quest_index == 4:
		pass

func enable_hell_quests() -> void:
	self.set_visible(true)
	quest_description.set_text(hell_quest_descriptions[next_hell_quest_index])


func reset_hell_quest_progress() -> void:
	soul_sent_where_it_doesnt_belong = false
	balanced_sent_to_hell = false
	all_negative_soul_in_heaven = true


func update_quest_on_soul_sent_to_heaven(soul_value_sum : int) -> void:
	if soul_value_sum < 0:
		soul_sent_where_it_doesnt_belong = true


func update_quest_on_soul_sent_to_hell(soul_value_sum : int) -> void:
	sent_to_hell_counter += 1

	if soul_value_sum > 0:
		soul_sent_where_it_doesnt_belong = true
	elif soul_value_sum == 0:
		balanced_sent_to_hell = true
	else:
		all_negative_soul_in_heaven = false


func is_secret_quest_accepted() -> bool:
	return accepted_hell_quest_index == 4


func accept_next_quest() -> void:
	accepted_hell_quest_index = next_hell_quest_index
