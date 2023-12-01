extends Node

var current_hell_quest_idx: int = 0
var current_heaven_quest_idx: int = 0

var current_hell_quest: QuestData
var current_heaven_quest: QuestData

func on_new_turn() -> void:
	current_hell_quest = QuestDatabase.hell_quests[self.current_hell_quest_idx]
	current_hell_quest = QuestDatabase.heaven_quests[self.current_heaven_quest_idx]

func get_current_hell_quest() -> QuestData:
	return current_hell_quest
	
func get_current_heaven_quest() -> QuestData:
	return current_heaven_quest
	
func evaluate_current_heaven_quest() -> void:
	if current_heaven_quest.is_completed():
		GlobalGameData.heaven_score += current_heaven_quest.reward
		current_heaven_quest = null
		
func evaluate_current_hell_quest() -> void:
	if current_hell_quest.is_completed():
		GlobalGameData.heaven_score += current_hell_quest.reward
		current_hell_quest = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
