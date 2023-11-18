extends HBoxContainer

var property_data: PropertyData

func initialize(property_data: PropertyData) -> void:
	self.property_data = property_data
	$PropertyDescription.text = property_data.description
