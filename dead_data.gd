class_name DeadData extends Node

var deadName : String # name of the dead guy 
var deadScore : int   # sum score of the dead: either good or bad
var listProProperties # the list of all the PRO properties of this dead person
var listConProperties # the list of all the CON properties of this dead person
var deadImage : String # the picture of the dead 

func _init(name, score, proProperties, conProperties, imagePath):
	self.deadName = name
	self.deadScore = score
	self.listProProperties = proProperties
	self.listConProperties = conProperties
	self.deadImage = imagePath
	pass

func get_dead_score():
	return deadScore 
