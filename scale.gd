extends Control

@onready var scale_vale_node = $Container/ScaleValue
@onready var scale_picture_node = $Container/ScalePicture

var heaven_score = 50
var hell_score = -50

func _on_tinder_scene_character_sent_to_heaven(character):
	print("heaven button pressed")
		#TODO changeme to input parameter character_soul_value
	var soul_value = character.get_soul_value_sum()
	print (soul_value)
	heaven_score = heaven_score + soul_value
	#TODO deleteme
	scale_vale_node._update_score_label(hell_score+heaven_score)
	scale_picture_node.set_current_rotation(calculate_rotation())
	print("heaven current score: ", heaven_score )
	print("hell current score: ", hell_score )

func _on_tinder_scene_character_sent_to_hell(character):
	print("hell button pressed")
	#changeme to input parameter character_soul_value
	var soul_value = character.get_soul_value_sum()
	print (soul_value)
	hell_score = hell_score + soul_value
	#TODO deleteme
	scale_vale_node._update_score_label(hell_score+heaven_score)
	scale_picture_node.set_current_rotation(calculate_rotation())
	print("heaven current score: ", heaven_score )
	print("hell current score: ", hell_score )

func calculate_rotation():
	#so the scale doesn't lift to 180 degrees just 60
	var scaled_hell_score = hell_score / 3
	var scaled_heaven_score = heaven_score / 3
	print(deg_to_rad(scaled_hell_score + scaled_heaven_score))
	return deg_to_rad(scaled_hell_score + scaled_heaven_score)




