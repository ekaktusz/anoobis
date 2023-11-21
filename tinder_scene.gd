extends Control

signal character_changed(new_character: CharacterData)
signal character_sent_to_hell(character: CharacterData)
signal character_sent_to_heaven(character: CharacterData)

var current_character: CharacterData

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
	character_sent_to_heaven.emit(self.current_character)
	get_new_character()


func _on_hell_button_pressed() -> void:
	character_sent_to_hell.emit(self.current_character)
	get_new_character()


func get_new_character() -> void:
	self.current_character = CharacterDatabase.get_random_character()
	$NameLabel.text = self.current_character.character_name
	character_changed.emit(self.current_character)
