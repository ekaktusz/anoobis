extends Control

@onready var Heaven = $Heaven
@onready var Hell = $Hell
@onready var UnderworldSelector = $UnderworldSelector

signal underworld_left()

func _on_to_hell_button_pressed() -> void:
	UnderworldSelector.set_visible(false)
	Hell.set_visible(true)


func _on_to_heaven_button_pressed() -> void:
	UnderworldSelector.set_visible(false)
	Heaven.set_visible(true)


func _on_back_pressed() -> void:
	UnderworldSelector.set_visible(true)
	$Heaven.set_visible(false)
	$Hell.set_visible(false)

	underworld_left.emit()
