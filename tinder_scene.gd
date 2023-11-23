extends Control

var processed_dead_count : int
static var level : int = 0
var selector_scene : PackedScene = preload("res://where_to_selector.tscn")

@onready var dead_count_label : Node = \
	$MarginContainer/HBoxContainer/MidVboxContainer/RequestGreatPersonButton
@onready var root : Node = $MarginContainer
@onready var rank_display_label : Node = \
	$MarginContainer/HBoxContainer/MidVboxContainer/QuestLog2/MarginContainer/QuestLogVboxContainer/Title

signal character_changed(new_character: CharacterData)
signal character_sent_to_hell(character: CharacterData)
signal character_sent_to_heaven(character: CharacterData)

const PortraitView = preload("res://portrait_view.tscn")

var current_level_10_characters:Array[CharacterData] = []
var current_character: CharacterData

# Called when the node enters the scene tree for the first time.
func _ready():
	current_level_10_characters = CharacterDatabase.get_characters(10)
	processed_dead_count = 0
	dead_count_label.text = "0/10"
	rank_display_label.text = RankDefinitions.get_rank(level)
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
	swipe_character()


func _on_hell_button_pressed() -> void:
	character_sent_to_hell.emit(self.current_character)
	swipe_character()


func swipe_character() -> void:
	increase_processed_dead_counter()
	if processed_dead_count >= 10:
		trigger_break_selector()
		rank_up()
	else:
		get_new_character()


func get_new_character() -> void:
	self.current_character = current_level_10_characters[processed_dead_count]
	self.current_character.portrait_view = PortraitView.instantiate()
	character_changed.emit(self.current_character)


func increase_processed_dead_counter():
	processed_dead_count += 1
	dead_count_label.text =  str(processed_dead_count) +"/10"


func trigger_break_selector() -> void:
	var selector_node : Node = selector_scene.instantiate()
	root.add_child(selector_node)


func rank_up() -> void:
	level += 1
	rank_display_label.text = RankDefinitions.get_rank(level)
