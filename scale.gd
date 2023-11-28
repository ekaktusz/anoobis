extends Control

@onready var scale_picture_node = $Container/ScalePicture
@onready var scale_plate_right = %ScalePlateRight
@onready var scale_plate_left = %ScalePlateLeft

var heaven_score = 50
var hell_score = -50
var plate_left_default_x_position =-960
var plate_left_default_y_position =-541
var plate_right_default_x_position =-964
var plate_right_default_y_position =-540


func _on_tinder_scene_character_sent_to_heaven(character):
	print("heaven button pressed")
		#TODO changeme to input parameter character_soul_value
	var soul_value = character.get_soul_value_sum()
	print (soul_value)
	heaven_score = heaven_score + soul_value
	scale_picture_node.set_current_rotation(calculate_rotation())

func _on_tinder_scene_character_sent_to_hell(character):
	print("hell button pressed")
	#changeme to input parameter character_soul_value
	var soul_value = character.get_soul_value_sum()
	print (soul_value)
	hell_score = hell_score + soul_value
	scale_picture_node.set_current_rotation(calculate_rotation())

func calculate_rotation():
	#so the scale doesn't lift to 180 degrees just 60
	var scaled_hell_score = hell_score / 3
	var scaled_heaven_score = heaven_score / 3
	print(deg_to_rad(scaled_hell_score + scaled_heaven_score))
	print("heaven current score: ", heaven_score )
	print("hell current score: ", hell_score )
	move_plates(heaven_score, hell_score)
	return deg_to_rad(scaled_hell_score + scaled_heaven_score)

func move_plates(heaven_score:int, hell_score:int):
	
	print(scale_plate_right.position.x)
	print(scale_plate_right.position.y)
	scale_plate_right.set_position(Vector2(get_right_plate_x(), plate_right_default_y_position+(hell_score+heaven_score)))
	scale_plate_left.set_position(Vector2(get_left_plate_x(), plate_left_default_y_position-(hell_score+heaven_score)))

func get_left_plate_x():
	var x_coord = scale_plate_left.position.x
	if (heaven_score+hell_score < -50):
		x_coord = plate_left_default_x_position + 5	
	elif (heaven_score+hell_score < -80):
		x_coord = plate_left_default_x_position + 8	
	return x_coord
		
func get_right_plate_x():
	var x_coord = scale_plate_right.position.x
	if (heaven_score+hell_score < -50):
		x_coord = plate_right_default_x_position - 5
	elif(heaven_score+hell_score < -80):
		x_coord = plate_right_default_x_position - 8
	return x_coord
