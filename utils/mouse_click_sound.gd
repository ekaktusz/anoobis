extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	print("wtf")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("left_mouse"):
		self.play()
