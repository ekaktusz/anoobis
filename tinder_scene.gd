extends Control

var processed_dead_count : int
static var level : int = 0

@onready var dead_count_label : Node = $TurnNumberLabel
@onready var rank_display_label : Node = $LevelLabel
@onready var character_name : Node = $NameLabel
@onready var underworld : Node =  $Underworld


signal character_changed(new_character: CharacterData)
signal character_sent_to_hell(character: CharacterData)
signal character_sent_to_heaven(character: CharacterData)

const PortraitView = preload("res://portrait_view.tscn")

var current_level_10_characters:Array[CharacterData] = []
var current_character: CharacterData

# Called when the node enters the scene tree for the first time.
func _ready():
	reset_dead_count()
	current_level_10_characters = CharacterDatabase.get_characters(10)
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
		underworld.evaluate_win_condition()
		trigger_break_selector()
	get_new_character()


func get_new_character() -> void:
	self.current_character = current_level_10_characters[processed_dead_count]
	self.current_character.portrait_view = PortraitView.instantiate()
	character_name.text = current_character.character_name
	character_changed.emit(self.current_character)


func reset_dead_count() -> void:
	processed_dead_count = 0
	dead_count_label.text = "0/10"


func increase_processed_dead_counter():
	processed_dead_count += 1
	dead_count_label.text =  str(processed_dead_count) +"/10"


func trigger_break_selector() -> void:
	underworld.set_visible(true)


func rank_up() -> void:
	level += 1
	rank_display_label.text = RankDefinitions.get_rank(level)


func _on_where_to_selector_underworld_left() -> void:
	underworld.set_visible(false)
	rank_up()
	reset_dead_count()
