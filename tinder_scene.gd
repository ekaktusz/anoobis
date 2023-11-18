extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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


const CharaterData = preload("res://data_classes/character_data.gd")

func get_new_character() -> void:
	var portrait_containter : Node = $MarginContainer/HBoxContainer/MidVboxContainer/CharacterViewScene/MarginContainer
	
	var new_character : CharaterData = CharaterData.new()
	new_character.initalize_random()

#	TODO: Here we can send the portrait to the afterlife instead of deleting
	portrait_containter.get_child(0).queue_free()
	portrait_containter.add_child(new_character.portrait_view)
