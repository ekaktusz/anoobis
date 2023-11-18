extends MarginContainer

const PropertyView = preload("res://property_view.tscn")

enum PROPERTIES_VIEW_MODE { con, pro }
@export var mode: PROPERTIES_VIEW_MODE

var properties: Array[PropertyData]

func _on_tinder_scene_character_changed(new_character: CharaterData):
	if self.mode == PROPERTIES_VIEW_MODE.con:
		self.properties = new_character.negative_properties
	else:
		self.properties = new_character.positive_properties
	_update_gui()
	
func _update_gui():
	var property_container = $MarginContainer/VBoxContainer/VBoxContainer
	
	# clean property list
	for child in property_container.get_children():
		child.queue_free()
		
	for property in self.properties:
		var current_property_view = PropertyView.instantiate()
		current_property_view.initialize(property)
		property_container.add_child(current_property_view)
		
