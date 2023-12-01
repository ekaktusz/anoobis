extends Node

var heaven_quests: Array[QuestData] = [
	QuestData.new("Send more people to Heaven than Hell in a round", func(): return true, 5, QuestData.QuestType.Heaven),
	QuestData.new("Send 3 souls to Heaven with a +8 or higher score", func(): return true, 5, QuestData.QuestType.Heaven),
	QuestData.new("Send all souls to Heaven in a round", func(): return true, 5, QuestData.QuestType.Heaven),
	QuestData.new("Make Hell's score go above -25", func(): return true, 5, QuestData.QuestType.Heaven),
	QuestData.new("Make Heaven overflow with goodness (+100)", func(): return true, 5, QuestData.QuestType.Heaven)
]

var hell_quests: Array[QuestData] = [
	QuestData.new("Send 1 soul to Heaven who does not belong there", func(): return true, 5, QuestData.QuestType.Heaven),
	QuestData.new("Send a balanced (equal PRO and CON) soul to Hell", func(): return true, 5, QuestData.QuestType.Heaven),
	QuestData.new("Send all souls to Heaven who would belong to Hell in a round", func(): return true, 5, QuestData.QuestType.Heaven),
	QuestData.new("Make Heaven's score go under +25", func(): return true, 5, QuestData.QuestType.Heaven),
	QuestData.new("Make Hell overflow with Evil (-100)", func(): return true, 5, QuestData.QuestType.Heaven)
]
