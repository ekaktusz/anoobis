extends MarginContainer

const PropertyView = preload("res://property_view.tscn")

enum PROPERTIES_VIEW_MODE { Cons, Pros }
@export var mode: PROPERTIES_VIEW_MODE

var properties: Array[PropertyData]

func _ready():
	var title_label = $MarginContainer/VBoxContainer/Title
	title_label.text = PROPERTIES_VIEW_MODE.keys()[mode]
	

func _on_tinder_scene_character_changed(new_character: CharacterData):
	if self.mode == PROPERTIES_VIEW_MODE.Cons:
		self.properties = new_character.negative_properties
	else:
		self.properties = new_character.positive_properties

	_update_gui()
	
func get_secret_properties() -> Array[PropertyData]:
	var secret_properties : Array[PropertyData]
	for property in self.properties:
		if property.is_secret:
			secret_properties.append(property)
	return secret_properties
	
func get_public_properties() -> Array[PropertyData]:
	var public_properties : Array[PropertyData]
	for property in self.properties:
		if not property.is_secret:
			public_properties.append(property)
	return public_properties
	
func _update_gui():
	var property_container = $MarginContainer/VBoxContainer/VBoxContainer
	
	# clean property list
	for child in property_container.get_children():
		child.queue_free()
		
	var public_properties : Array[PropertyData] = self.get_public_properties()
	var secret_properties : Array[PropertyData] = self.get_secret_properties()
		
	for property in public_properties:
		var current_property_view = PropertyView.instantiate()
		current_property_view.initialize(property)
		property_container.add_child(current_property_view)
		
	for property in secret_properties:
		var current_property_view = PropertyView.instantiate()
		current_property_view.initialize(property)
		property_container.add_child(current_property_view)
		
