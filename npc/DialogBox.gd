extends ColorRect

signal dialog_closed()

var text_speed = 0.05
var phrase_num = 0
var finished = false
var anubis_picture_path ="res://assets/images/npcs/anubis.png"
var croc_picture_path ="res://assets/images/npcs/croc_bro.png"
var goddess_picture_path ="res://assets/images/npcs/goddess.png"

	
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		text_speed = 0.01
	if Input.is_action_just_pressed("ui_cancel"):
		close_dialog()
		
func _on_dialog_open_tinder_dialog(level):
	finished = false
	$Timer.wait_time = text_speed
	$Anubis.texture = load(anubis_picture_path)	
	$Anubis.set_visible(true)
	next_phrase("Anubis", NpcDialogs.anubis_speak(level))

func _on_dialog_open_hell_dialog(level):
	finished = false
	$Timer.wait_time = text_speed
	$CrocBro.texture = load(croc_picture_path)
	$CrocBro.set_visible(true)
	next_phrase("Croc Bro", NpcDialogs.croc_speak(level))
		
func _on_dialog_open_heaven_dialog(level):
	finished = false
	$Timer.wait_time = text_speed
	$Goddess.texture = load(goddess_picture_path)
	$Goddess.set_visible(true)
	next_phrase("Cat Goddess", NpcDialogs.goddess_speak(level))
		
func next_phrase(name: String, text: String):
	if (finished):
		queue_free()
		return
	finished = false
	
	$Name.bbcode_text = name
	$Text.bbcode_text = text
	$Text.visible_characters = 0
	
	while $Text.visible_characters < len($Text.text):
		$Text.visible_characters += 1
		await get_tree().create_timer(text_speed).timeout
		
	finished = true
	phrase_num += 1
	return
	
func close_dialog():
	$Anubis.set_visible(false)
	$CrocBro.set_visible(false)
	$Goddess.set_visible(false)
	dialog_closed.emit()
