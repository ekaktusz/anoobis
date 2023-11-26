class_name CharacterData extends Node

var character_name: String
var negative_properties: Array[PropertyData]
var positive_properties: Array[PropertyData]
var portrait_view: PortraitView

func _init(character_name: String = "asd",
		   positive_properties: Array[PropertyData] = [],
		   negative_properties: Array[PropertyData] = [],
		   portrait_view: PortraitView = null):
	self.character_name = character_name
	self.positive_properties = positive_properties
	self.negative_properties = negative_properties
	self.portrait_view = portrait_view

func get_soul_value_sum() -> int:
	var sum: int = 0

	for property in self.positive_properties:
		sum += property.value

	for property in self.negative_properties:
		sum += property.value

	return sum

func get_secret_negative_properties() -> Array[PropertyData]:
	var secret_negative_properties : Array[PropertyData]
	for negative_property in self.negative_properties:
		if negative_property.is_secret:
			secret_negative_properties.append(negative_property)
	return secret_negative_properties


func get_secret_positive_properties() -> Array[PropertyData]:
	var secret_positive_properties : Array[PropertyData]
	for positive_property in self.positive_properties:
		if positive_property.is_secret:
			secret_positive_properties.append(positive_property)
	return secret_positive_properties
