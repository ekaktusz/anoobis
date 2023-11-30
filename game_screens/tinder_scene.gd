extends Control

var current_character: CharacterData

signal character_changed(new_character: CharacterData)
signal character_sent_to_hell(character: CharacterData)
signal character_sent_to_heaven(character: CharacterData)

@onready var dead_count_label : Node = $TurnNumberLabel
@onready var rank_display_label : Node = $LevelLabel
@onready var character_name : Node = $NameLabel
@onready var underworld : Node =  $Underworld
@onready var const_properties_view : Node = $ConsPropertiesView
@onready var pros_properties_view : Node = $ProsPropertiesView
@onready var hell_quest : Node = $HellQuest
@onready var heaven_quest : Node = $HeavenQuest


# Called when the node enters the scene tree for the first time.
func _ready():
	BackgroundMusicPlayer.play_anubis_music()
	reset_dead_count()
	rank_display_label.text = RankDefinitions.get_rank(GlobalGameData.level)
	get_new_character()
	update_quest_descriptions()


func _input(event: InputEvent) -> void:
	if (event as InputEvent).is_action_pressed("OpenCharacterGenerator"):
		get_tree().change_scene_to_file("res://character/character_generator.tscn")


func _on_heaven_button_pressed() -> void:
	character_sent_to_heaven.emit(self.current_character)
	swipe_character()


func _on_hell_button_pressed() -> void:
	character_sent_to_hell.emit(self.current_character)
	swipe_character()


func swipe_character() -> void:
	increase_processed_dead_counter()
	if GlobalGameData.processed_dead_count >= 10:
		underworld.evaluate_end_of_turn()
		trigger_break_selector()
		rank_up()

	get_new_character()


func get_new_character() -> void:
	self.current_character = CharacterDatabase.get_random_character()

	character_name.text = self.current_character.character_name
	character_changed.emit(self.current_character)


func reset_dead_count() -> void:
	GlobalGameData.processed_dead_count = 0
	dead_count_label.text = "0/10"


func increase_processed_dead_counter():
	GlobalGameData.processed_dead_count += 1
	dead_count_label.text = str(GlobalGameData.processed_dead_count) + "/10"


func trigger_break_selector() -> void:
	underworld.set_visible(true)


func rank_up() -> void:
	GlobalGameData.level += 1
	if GlobalGameData.level == 2:
		underworld.enable_underworld_quests()
	elif GlobalGameData.level == 4:
		const_properties_view.set_property_values_visible()
		pros_properties_view.set_property_values_visible()


func update_quest_descriptions() -> void:
	hell_quest.text = underworld.get_current_hell_quest_description()
	heaven_quest.text = underworld.get_current_heaven_quest_description()
