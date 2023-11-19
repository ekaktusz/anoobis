class_name PropertyData extends Node

var value: int
var description: String
var is_secret: bool

func _init(value: int, description: String, is_secret: bool):
	self.value = value
	self.description = description
	self.is_secret = is_secret
