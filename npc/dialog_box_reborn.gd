extends Node2D

var text_speed = 0.05
var phrase_num = 0
var finished = false

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
		dialog_label.bbcode_text = NpcDialogs.anubis_speak(GlobalGameData.level)
		god_sprite.texture = anubis_picture
	elif dialog_box_mode == DIALOG_BOX_MODE.Hell:
		name_label.text = "Croc Bro"
		dialog_label.bbcode_text = NpcDialogs.croc_speak(GlobalGameData.level)
		god_sprite.texture = croc_picture
	elif dialog_box_mode == DIALOG_BOX_MODE.Heaven:
		name_label.text = "Goddess"
		dialog_label.bbcode_text = NpcDialogs.goddess_speak(GlobalGameData.level)
		god_sprite.texture = goddess_picture
	
	dialog_label.visible_characters = 0
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		text_speed = 0.01
	if Input.is_action_just_pressed("ui_cancel"):
		visible = false
	
	if not self.finished and dialog_label.visible_characters < len(dialog_label.text):
		dialog_label.visible_characters += 1
		await get_tree().create_timer(text_speed).timeout
	else:
		self.finished = true
	pass
