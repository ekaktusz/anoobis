extends VBoxContainer

var heaven_quest_descriptions : Array[String] = [
	"Send more people to Heaven than Hell in a round",
	"Send 3 souls to Heaven with a +8 or higher score",
	"Send all souls to Heaven in a round",
	"Make Hell's score go above -25",
	"Make Heaven overflow with goodness (+100)",
]

@onready var quest_description =  get_tree().get_root().get_node("tinder_scene/HeavenQuest")

signal heaven_quest_completed(reward_score)

func get_current_heaven_quest_description() -> String:
	var description = ""

	if QuestGlobalGameData.accepted_heaven_quest_index >= 0 :
		description = heaven_quest_descriptions[QuestGlobalGameData.accepted_heaven_quest_index]
	elif QuestGlobalGameData.sent_to_heaven_counter < 5 :
		description = "Send 5 souls to Heaven"

	return description


func set_next_heaven_quest() -> void:
	#if QuestGlobalGameData.heaven_quest_completed_in_current_turn:
	#	return
	#QuestGlobalGameData.heaven_quest_completed_in_current_turn = true
	QuestGlobalGameData.heaven_quest_completed_in_current_turn = true
	print("heaven quest no. " + str(QuestGlobalGameData.next_heaven_quest_index) + " completed.")
	QuestGlobalGameData.next_heaven_quest_index += 1
	quest_description.set_text("")

func update_hell_score(score : int) -> void:
	QuestGlobalGameData.hell_score += score


func evaluate_heaven_quests() -> void:
	if QuestGlobalGameData.heaven_quest_completed_in_current_turn:
		return
	if QuestGlobalGameData.accepted_heaven_quest_index == -1:
		if GlobalGameData.in_heaven_characters.size() > 4:
			heaven_quest_completed.emit(5)
			set_next_heaven_quest()
	elif QuestGlobalGameData.accepted_heaven_quest_index == 0:
		if QuestGlobalGameData.people_sent_to_hell_and_heaven_balance > 0:
			heaven_quest_completed.emit(5)
			set_next_heaven_quest()
	elif QuestGlobalGameData.accepted_heaven_quest_index == 1:
		if QuestGlobalGameData.people_sent_to_heaven_with_8_plus_score >= 3:
			heaven_quest_completed.emit(5)
			set_next_heaven_quest()
	elif QuestGlobalGameData.accepted_heaven_quest_index == 2:
		if QuestGlobalGameData.all_souls_sent_to_heaven_in_round:
			heaven_quest_completed.emit(5)
			set_next_heaven_quest()
	elif QuestGlobalGameData.accepted_heaven_quest_index == 3:
		if QuestGlobalGameData.hell_score > -25:
			heaven_quest_completed.emit(10)
			set_next_heaven_quest()
	elif QuestGlobalGameData.accepted_heaven_quest_index == 4:
		# TODO: Maybe secret quests should be evaluated by quests as well
		pass


func enable_heaven_quests() -> void:
	self.set_visible(true)
	quest_description.set_text(heaven_quest_descriptions[QuestGlobalGameData.next_heaven_quest_index])


func reset_heaven_quest_progress() -> void:
	QuestGlobalGameData.people_sent_to_hell_and_heaven_balance = 0
	QuestGlobalGameData.people_sent_to_heaven_with_8_plus_score = 0
	QuestGlobalGameData.all_souls_sent_to_heaven_in_round = true


func update_quest_on_soul_sent_to_heaven(soul_value_sum : int) -> void:
	QuestGlobalGameData.people_sent_to_hell_and_heaven_balance += 1
	QuestGlobalGameData.sent_to_heaven_counter += 1

	if soul_value_sum >= 8:
		QuestGlobalGameData.people_sent_to_heaven_with_8_plus_score += 1


func update_quest_on_soul_sent_to_hell() -> void:
	QuestGlobalGameData.all_souls_sent_to_heaven_in_round = false
	QuestGlobalGameData.people_sent_to_hell_and_heaven_balance -= 1


func is_secret_quest_accepted() -> bool:
	return QuestGlobalGameData.accepted_heaven_quest_index == 4


func accept_next_quest() -> void:
	QuestGlobalGameData.accepted_heaven_quest_index = QuestGlobalGameData.next_heaven_quest_index

