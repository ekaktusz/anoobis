class_name PropertyData extends Node

var value: int
var description: String
var is_secret: bool
var is_value_visible : bool

func _init(value: int, description: String,
		is_secret: bool, is_value_visible : bool = false):
	self.value = value
	self.description = description
	self.is_secret = is_secret
	self.is_value_visible = is_value_visible
