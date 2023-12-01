class_name QuestData extends Node

enum QuestType {
	Heaven, Hell
}

var text: String
var condition: Callable
var reward: int
var type: QuestType

func _init(text: String,
		   condition: Callable,
		   reward: int,
		   type: QuestType):
	self.text = text
	self.condition = condition
	self.reward = reward
	self.type = type
	
func is_completed() -> bool:
	return self.condition.call()
