extends Control

signal character_changed(new_character: CharacterData)
signal character_sent_to_hell(character: CharacterData)
signal character_sent_to_heaven(character: CharacterData)

var current_level_10_characters:Array[CharacterData] = []
var current_character: CharacterData
var tmp_char_counter = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	current_level_10_characters = CharacterDatabase.get_characters(10)
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
	#TODO connect this with current 1/10 character counter
	if (tmp_char_counter == 10):
		print('NEXT LEVEL')
		tmp_char_counter = 0
	self.current_character = current_level_10_characters[tmp_char_counter]
	tmp_char_counter+=1
	character_changed.emit(self.current_character)
