extends Control

signal character_changed(new_character : CharaterData)

const CharaterData = preload("res://data_classes/character_data.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	get_new_character()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event: InputEvent) -> void:
	if ((event as InputEvent).is_action_pressed("OpenCharacterGenerator")):
		get_tree().change_scene_to_file("res://character_generator.tscn")


func _on_button_pressed():
	print("asd")
	pass # Replace with function body.


func _on_heaven_button_pressed() -> void:
	get_new_character()


func _on_hell_button_pressed() -> void:
	get_new_character()


func get_new_character() -> void:
	#var new_character : CharaterData = CharaterData.new()
	var new_character : CharaterData = CharacterDatabase.get_random_character()
	if new_character == null:
		print("FING")
	#new_character.initalize_random()
	character_changed.emit(new_character)
