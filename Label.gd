extends Label

class_name Scale
@onready var scale_label = %ScaleValue

var score = 0

func _ready():
	_update_score_label(score)

func _update_score_label(score):
	print("score:", score)
	if (score < deg_to_rad(0)):
		scale_label.text = str(score)
	elif (score > deg_to_rad(0)):
		scale_label.text =str(score)
	else:
		scale_label.text = "Balance"
