extends TextureRect

@onready var scale_picture_node = %ScalePicture


func set_current_rotation(rotation_value):
	scale_picture_node.rotation = rotation_value
	
	#TODO delete me
	if (scale_picture_node.rotation >= rad_to_deg(180)):
		print("HEAVEN WON")
	elif (scale_picture_node.rotation <= rad_to_deg(-180)):
		print("HELL WON")
