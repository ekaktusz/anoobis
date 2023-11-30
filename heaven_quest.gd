extends VBoxContainer

var heaven_quest_descriptions : Array[String] = [
	"Send more people to Heaven than Hell in a round",
	"Send 3 souls to Heaven with a +8 or higher score",
	"Send all souls to Heaven in a round",
	"Make Hell's score go above -25",
	"Make Heaven overflow with goodness (+100)",
]
var hell_score : int = 0
var next_heaven_quest_index : int = 0
var accepted_heaven_quest_index : int = -1

# heaven  lvl0
var sent_to_heaven_counter : int = 0
# heaven lvl1
var people_sent_to_hell_and_heaven_balance : int = 0
# heaven lvl2
var people_sent_to_heaven_with_8_plus_score : int = 0
# heaven lvl3
var all_souls_sent_to_heaven_in_round : bool = true

@onready var quest_description = $QuestDescription

signal heaven_quest_completed(reward_score)


func get_current_heaven_quest_description() -> String:
	var description = ""

	if accepted_heaven_quest_index >= 0 :
		description = heaven_quest_descriptions[accepted_heaven_quest_index]
	elif sent_to_heaven_counter < 5 :
		description = "Send 5 souls to Heaven"

	return description


func set_next_heaven_quest() -> void:
	print("heaven quest no. " + str(next_heaven_quest_index) + " completed.")
	next_heaven_quest_index += 1
	quest_description.set_text(heaven_quest_descriptions[next_heaven_quest_index])


func update_hell_score(score : int) -> void:
	hell_score += score


func evaluate_heaven_quests() -> void:
	if accepted_heaven_quest_index == 0:
		if people_sent_to_hell_and_heaven_balance > 0:
			heaven_quest_completed.emit(5)
			set_next_heaven_quest()
	elif accepted_heaven_quest_index == 1:
		if people_sent_to_heaven_with_8_plus_score >= 3:
			heaven_quest_completed.emit(5)
			set_next_heaven_quest()
	elif accepted_heaven_quest_index == 2:
		if all_souls_sent_to_heaven_in_round:
			heaven_quest_completed.emit(5)
			set_next_heaven_quest()
	elif accepted_heaven_quest_index == 3:
		if hell_score > -25:
			heaven_quest_completed.emit(10)
			set_next_heaven_quest()
	elif accepted_heaven_quest_index == 4:
		# TODO: Maybe secret quests should be evaluated by quests as well
		pass


func enable_heaven_quests() -> void:
	self.set_visible(true)
	quest_description.set_text(heaven_quest_descriptions[next_heaven_quest_index])


func reset_heaven_quest_progress() -> void:
	people_sent_to_hell_and_heaven_balance = 0
	people_sent_to_heaven_with_8_plus_score = 0
	all_souls_sent_to_heaven_in_round = true


func update_quest_on_soul_sent_to_heaven(soul_value_sum : int) -> void:
	people_sent_to_hell_and_heaven_balance += 1
	sent_to_heaven_counter += 1

	if soul_value_sum >= 8:
		people_sent_to_heaven_with_8_plus_score += 1


func update_quest_on_soul_sent_to_hell() -> void:
	all_souls_sent_to_heaven_in_round = false
	people_sent_to_hell_and_heaven_balance -= 1


func is_secret_quest_accepted() -> bool:
	return accepted_heaven_quest_index == 4


func accept_next_quest() -> void:
	accepted_heaven_quest_index = next_heaven_quest_index

