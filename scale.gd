extends Control

@onready var scale_vale_node = $Container/ScaleValue

var tmp_character_soul_value = tmp_get_random_soul_value()
var heaven_score = 50
var hell_score = -50

func _on_hell_button_pressed():
	print("hell button pressed")
	hell_score = hell_score + tmp_character_soul_value
	scale_vale_node._update_score_label(hell_score+heaven_score)
	tmp_character_soul_value = tmp_get_random_soul_value()


func _on_heaven_button_pressed():
	print("heaven button pressed")
	heaven_score = heaven_score + tmp_character_soul_value
	scale_vale_node._update_score_label(hell_score+heaven_score)
	tmp_character_soul_value = tmp_get_random_soul_value()

func tmp_get_random_soul_value():
	return randi_range(-10,10)
	
