extends VBoxContainer

var hell_quest_descriptions : Array[String] = [
	"Send 1 soul to Heaven who does not belong there",
	"Send a balanced (equal PRO and CON) soul to Hell",
	"Send all souls to Heaven who would belong to Hell in a round",
	"Make Heaven's score go under +25",
	"Make Hell overflow with Evil (-100)",
]

@onready var quest_description =  get_tree().get_root().get_node("tinder_scene/HellQuest")


signal hell_quest_completed(reward_score)
# TODO: emit reward


func get_current_hell_quest_description() -> String:
	var description = ""

	if QuestGlobalGameData.accepted_hell_quest_index >= 0 :
		description = hell_quest_descriptions[QuestGlobalGameData.accepted_hell_quest_index]
	elif QuestGlobalGameData.sent_to_hell_counter < 5 :
		description = "Send 5 souls to Hell"

	return description


func set_next_hell_quest() -> void:
	quest_description.set_text("")
	QuestGlobalGameData.hell_quest_completed_in_current_turn = true
	print("hell quest no. " + str(QuestGlobalGameData.next_hell_quest_index) + " completed.")
	QuestGlobalGameData.next_hell_quest_index += 1


func update_heaven_score(score : int) -> void:
	QuestGlobalGameData.heaven_score += score


func evaluate_hell_quests() -> void:
	if QuestGlobalGameData.hell_quest_completed_in_current_turn:
		return
		
	if QuestGlobalGameData.accepted_hell_quest_index == -1:
		if GlobalGameData.in_hell_characters.size() > 4:
			hell_quest_completed.emit(5)
			set_next_hell_quest()
	elif QuestGlobalGameData.accepted_hell_quest_index == 0:
		if QuestGlobalGameData.soul_sent_where_it_doesnt_belong:
			hell_quest_completed.emit(-5)
			set_next_hell_quest()
	elif QuestGlobalGameData.accepted_hell_quest_index == 1:
		if QuestGlobalGameData.balanced_sent_to_hell:
			hell_quest_completed.emit(-5)
			set_next_hell_quest()
	elif QuestGlobalGameData.accepted_hell_quest_index == 2:
		if QuestGlobalGameData.all_negative_soul_in_heaven:
			hell_quest_completed.emit(-5)
			set_next_hell_quest()
	elif QuestGlobalGameData.accepted_hell_quest_index == 3:
		if QuestGlobalGameData.heaven_score < 25:
			hell_quest_completed.emit(-10)
			set_next_hell_quest()
	elif QuestGlobalGameData.accepted_hell_quest_index == 4:
		pass

func enable_hell_quests() -> void:
	self.set_visible(true)
	quest_description.set_text(hell_quest_descriptions[QuestGlobalGameData.next_hell_quest_index])


func reset_hell_quest_progress() -> void:
	QuestGlobalGameData.soul_sent_where_it_doesnt_belong = false
	QuestGlobalGameData.balanced_sent_to_hell = false
	QuestGlobalGameData.all_negative_soul_in_heaven = true


func update_quest_on_soul_sent_to_heaven(soul_value_sum : int) -> void:
	if soul_value_sum < 0:
		QuestGlobalGameData.soul_sent_where_it_doesnt_belong = true


func update_quest_on_soul_sent_to_hell(soul_value_sum : int) -> void:
	QuestGlobalGameData.sent_to_hell_counter += 1

	if soul_value_sum > 0:
		QuestGlobalGameData.soul_sent_where_it_doesnt_belong = true
	elif soul_value_sum == 0:
		QuestGlobalGameData.balanced_sent_to_hell = true
	else:
		QuestGlobalGameData.all_negative_soul_in_heaven = false


func is_secret_quest_accepted() -> bool:
	return QuestGlobalGameData.accepted_hell_quest_index == 4


func accept_next_quest() -> void:
	QuestGlobalGameData.accepted_hell_quest_index = QuestGlobalGameData.next_hell_quest_index
