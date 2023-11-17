extends Label

class_name Scale
@onready var scale_label = %ScaleValue

var score = 0

func _ready():
	_update_score_label(score)

func _update_score_label(score):
	if (score < 0):
		scale_label.text = str(score)
	elif (score > 0):
		scale_label.text =str(score)
	else:
		scale_label.text = "Balance"
