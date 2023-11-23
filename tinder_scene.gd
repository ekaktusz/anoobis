extends Control

var processed_dead_count : int
static var level : int = 0

@onready var selector_overlay : Node =  $WhereToSelector
@onready var dead_count_label : Node = \
	$MarginContainer/HBoxContainer/MidVboxContainer/RequestGreatPersonButton
@onready var root : Node = $MarginContainer
@onready var rank_display_label : Node = \
	$MarginContainer/HBoxContainer/MidVboxContainer/QuestLog2/MarginContainer/QuestLogVboxContainer/Title

signal character_changed(new_character: CharacterData)
signal character_sent_to_hell(character: CharacterData)
signal character_sent_to_heaven(character: CharacterData)

var current_character: CharacterData

# Called when the node enters the scene tree for the first time.
func _ready():
	processed_dead_count = 0
	dead_count_label.text = "10/0"
	rank_display_label.text = RankDefinitions.get_rank(level)

	get_new_character()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event: InputEvent) -> void:
	if ((event as InputEvent).is_action_pressed("OpenCharacterGenerator")):
		get_tree().change_scene_to_file("res://character_generator.tscn")


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
	self.current_character = CharacterDatabase.get_random_character()
	character_changed.emit(self.current_character)


func increase_processed_dead_counter():
	processed_dead_count += 1
	dead_count_label.text = "10/" + str(processed_dead_count)


func trigger_break_selector() -> void:
	selector_overlay.set_visible(true)


func rank_up() -> void:
	level += 1
	rank_display_label.text = RankDefinitions.get_rank(level)
