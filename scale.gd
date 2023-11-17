extends Control

@onready var scale_vale_node = $Container/ScaleValue
@onready var scale_picture_node = $Container/ScalePicture

var heaven_score = 50
var hell_score = -50

func _on_hell_button_pressed():
	print("hell button pressed")
	#changeme to input parameter character_soul_value
	var tmp_soul_value = tmp_get_random_soul_value()
	hell_score = hell_score + tmp_soul_value
	#TODO deleteme	
	scale_vale_node._update_score_label(hell_score+heaven_score)
	scale_picture_node.set_current_rotation(calculate_rotation())
	

func _on_heaven_button_pressed():
	print("heaven button pressed")
		#TODO changeme to input parameter character_soul_value
	var tmp_soul_value = tmp_get_random_soul_value()
	heaven_score = heaven_score + tmp_soul_value
	#TODO deleteme
	scale_vale_node._update_score_label(hell_score+heaven_score)
	scale_picture_node.set_current_rotation(calculate_rotation())

func tmp_get_random_soul_value():
	var next_soul_value = randi_range(-20,20)
	print("next_soul_value ",next_soul_value)
	return next_soul_value
	
		
func calculate_rotation():
	#so the scale doesn't lift to 180 degrees just 60 
	var scaled_hell_score = hell_score / 3
	var scaled_heaven_score = heaven_score / 3
	print(deg_to_rad(scaled_hell_score + scaled_heaven_score))
	return deg_to_rad(scaled_hell_score + scaled_heaven_score)
	
