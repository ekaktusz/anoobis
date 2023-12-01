extends Node2D

var text_speed = 0.05
var phrase_num = 0
var finished = false
var dialogs = []

var anubis_picture = preload("res://assets/images/npcs/anubis.png")
var croc_picture = preload("res://assets/images/npcs/kroki.png")
var goddess_picture = preload("res://assets/images/npcs/bastet.png")

enum DIALOG_BOX_MODE { Anoobis, Hell, Heaven }
@export var dialog_box_mode: DIALOG_BOX_MODE

@onready var name_label = $NamePanel/NameLabel
@onready var dialog_label = $DialogPanel/DialogLabel
@onready var god_sprite = $GodSprite
# Called when the node enters the scene tree for the first time.
func _ready():
	visible = true
	
	if dialog_box_mode == DIALOG_BOX_MODE.Anoobis:
		name_label.text = "Anoobis"
		dialogs.push_back(NpcDialogs.anubis_speak(GlobalGameData.level))
		var hell_score_text = NpcDialogs.anubis_speak_score_hell()
		if (hell_score_text != null):
			dialogs.push_back(hell_score_text)
		var heaven_score_text = NpcDialogs.anubis_speak_score_heaven()
		if (heaven_score_text != null):
			dialogs.push_back(heaven_score_text)
		god_sprite.texture = anubis_picture
	
	elif dialog_box_mode == DIALOG_BOX_MODE.Hell:
		name_label.text = "Croc Bro"
		var hell_score_text = NpcDialogs.croc_speak_score_hell()
		if (hell_score_text != null):
			dialogs.push_back(hell_score_text)
		var heaven_score_text = NpcDialogs.croc_speak_score_heaven()
		if (heaven_score_text != null):
			dialogs.push_back(heaven_score_text)
		if (len(dialogs)== 0): 
			print("GlobalGameData.level", GlobalGameData.level)
			dialogs.push_back(NpcDialogs.croc_speak(GlobalGameData.level))
		god_sprite.texture = croc_picture
	
	elif dialog_box_mode == DIALOG_BOX_MODE.Heaven:
		name_label.text = "Goddess"
		var hell_score_text = NpcDialogs.goddess_speak_score_hell()
		if (hell_score_text != null):
			dialogs.push_back(hell_score_text)
		var heaven_score_text = NpcDialogs.goddess_speak_score_heaven()
		if (heaven_score_text != null):
			dialogs.push_back(heaven_score_text)
		if (len(dialogs)== 0): 
			print("GlobalGameData.level", GlobalGameData.level)
			dialogs.push_back(NpcDialogs.goddess_speak(GlobalGameData.level))
		god_sprite.texture = goddess_picture
	
	dialog_label.visible_characters = 0
	next_phrase()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if (finished):
			next_phrase()
		if (text_speed == 0.01):
			dialog_label.visible_characters = len(dialog_label.text)
		text_speed = 0.01

func next_phrase():
	if (phrase_num >= len(dialogs)):
		queue_free()
		return
	finished = false

	dialog_label.bbcode_text = dialogs[phrase_num]
	dialog_label.visible_characters = 0
#
	while dialog_label.visible_characters < len(dialog_label.text):
		dialog_label.visible_characters += 1
		await get_tree().create_timer(text_speed).timeout

	finished = true

	phrase_num += 1
	return
