extends Control

signal character_changed(new_character: CharacterData)
signal character_sent_to_hell(character: CharacterData)
signal character_sent_to_heaven(character: CharacterData)
signal open_tinder_dialog(level)

static var level: int
var processed_dead_count: int
var current_character: CharacterData

@onready var dead_count_label: Node = $TurnNumberLabel
@onready var rank_display_label: Node = $LevelLabel
@onready var character_name: Node = $NameLabel
@onready var underworld: Node = $Underworld
@onready var const_properties_view: Node = $ConsPropertiesView
@onready var pros_properties_view: Node = $ProsPropertiesView


# Called when the node enters the scene tree for the first time.
func _ready():
	reset_dead_count()
	self.level = 0
	rank_display_label.text = RankDefinitions.get_rank(level)
	get_new_character()
	open_tinder_dialog.emit(level)
	#print(NpcDialogs.anubis_speak(level))


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
	if processed_dead_count >= 10:
		underworld.evaluate_win_condition()
		trigger_break_selector()
		rank_up()

	get_new_character()


func get_new_character() -> void:
	self.current_character = CharacterDatabase.get_random_character()

	character_name.text = self.current_character.character_name
	character_changed.emit(self.current_character)


func reset_dead_count() -> void:
	processed_dead_count = 0
	dead_count_label.text = "0/10"


func increase_processed_dead_counter():
	processed_dead_count += 1
	dead_count_label.text = str(processed_dead_count) + "/10"


func trigger_break_selector() -> void:
	underworld.set_visible(true)


func rank_up() -> void:
	level += 1
	if level == 3:
		underworld.enable_underworld_quests()
	elif level == 5:
		const_properties_view.set_property_values_visible()
		pros_properties_view.set_property_values_visible()


func update_rank_title() -> void:
	rank_display_label.text = RankDefinitions.get_rank(level)


func _on_where_to_selector_underworld_left() -> void:
	underworld.set_visible(false)
	update_rank_title()
	reset_dead_count()
	open_tinder_dialog.emit(level)
#	print(NpcDialogs.anubis_speak(level))
