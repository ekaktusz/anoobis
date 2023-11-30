extends MarginContainer

const PropertyView = preload("res://character/property_view.tscn")

enum PROPERTIES_VIEW_MODE { Cons, Pros }
@export var mode: PROPERTIES_VIEW_MODE

var properties: Array[PropertyData]
var are_property_values_visible : bool = false

func _ready():
	var title_label = $MarginContainer/VBoxContainer/Title
	title_label.text = PROPERTIES_VIEW_MODE.keys()[mode]


func _on_tinder_scene_character_changed(new_character: CharacterData):
	if self.mode == PROPERTIES_VIEW_MODE.Cons:
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
		property.is_value_visible = are_property_values_visible

		current_property_view.initialize(property)
		property_container.add_child(current_property_view)


func set_property_values_visible() -> void:
	self.are_property_values_visible = true
