extends Node2D

var hairs : Array = [
	preload ("res://images/dummy_face_parts/hair1.png"),
	preload ("res://images/dummy_face_parts/hair2.png"),
	preload ("res://images/dummy_face_parts/hair3.png"),
]

var eyes : Array = [
	preload ("res://images/dummy_face_parts/eyes1.png"),
	preload ("res://images/dummy_face_parts/eyes2.png"),
]

var current_hair_id : int = 0
var current_eye_id : int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_hair_button_pressed() -> void:
	current_hair_id += 1
	$VBoxContainer/PortraitContainer/HairLayer/HairSprite.texture = hairs[current_hair_id]


func _on_eyes_button_pressed() -> void:
	current_eye_id += 1
	$VBoxContainer/PortraitContainer/EyesLayer/EyesSprite.texture = eyes[current_eye_id]


func _on_ears_button_pressed() -> void:
	pass # Replace with function body.


func _on_nose_button_pressed() -> void:
	pass # Replace with function body.


func _on_mouth_button_pressed() -> void:
	pass # Replace with function body.
