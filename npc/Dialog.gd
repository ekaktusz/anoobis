extends Control

signal open_hell_dialog(level)
signal open_heaven_dialog(level)
signal open_tinder_dialog(level)

func _on_dialog_box_dialog_closed():
	self.set_visible(false)


func _on_underworld_open_hell_dialog(level):
	open_hell_dialog.emit(level)
	self.set_visible(true)


func _on_underworld_open_heaven_dialog(level):
	open_heaven_dialog.emit(level)
	self.set_visible(true)


func _on_tinder_scene_open_tinder_dialog(level):
	open_tinder_dialog.emit(level)
	self.set_visible(true)
