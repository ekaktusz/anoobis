extends Control

var processed_dead_count : int = 0

@onready var dead_count_label : Node = \
	$MarginContainer/HBoxContainer/MidVboxContainer/RequestGreatPersonButton

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
	increase_processed_dead_counter()


func _on_hell_button_pressed() -> void:
	get_new_character()
	increase_processed_dead_counter()


func get_new_character() -> void:
	var character_scene : PackedScene = preload("res://character.tscn")
	var character_node : Node = character_scene.instantiate()
	var portrait_containter : Node = $MarginContainer/HBoxContainer/MidVboxContainer/CharacterViewScene/MarginContainer

#	TODO: Here we can send the portrait to the afterlife instead of deleting
	portrait_containter.get_child(0).queue_free()
	portrait_containter.add_child(character_node)


func increase_processed_dead_counter():
	processed_dead_count += 1
	dead_count_label.text = str(processed_dead_count) + "/10"
