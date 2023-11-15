@tool

extends Control

var hair_fronts : Array = [
	null,
	preload ("res://images/face_parts/hair_A_front.png"),
	preload ("res://images/face_parts/hair_B_front.png"),
	preload ("res://images/face_parts/hair_C_front.png"),
	preload ("res://images/face_parts/hair_D_front.png"),
]

#TODO: the size should match worked around by padding with null
var hair_backs : Array = [
	null,
	preload ("res://images/face_parts/hair_A_back.png"),
	preload ("res://images/face_parts/hair_B_back.png"),
	null,
	null,
]

var eyes : Array = [
	preload ("res://images/face_parts/eyes_A.png"),
	preload ("res://images/face_parts/eyes_B.png"),
	preload ("res://images/face_parts/eyes_C.png"),
	preload ("res://images/face_parts/eyes_D.png"),
]

#TODO: Skin tones are mashed together with skin shapes
var skins : Array = [
	preload ("res://images/face_parts/skin_A1.png"),
	preload ("res://images/face_parts/skin_A2.png"),
	preload ("res://images/face_parts/skin_B1.png"),
	preload ("res://images/face_parts/skin_B2.png"),
	preload ("res://images/face_parts/skin_C1.png"),
	preload ("res://images/face_parts/skin_C2.png"),
	preload ("res://images/face_parts/skin_D1.png"),
	preload ("res://images/face_parts/skin_D2.png"),
]

var noses : Array = [
	preload ("res://images/face_parts/nose_A.png"),
	preload ("res://images/face_parts/nose_B.png"),
	preload ("res://images/face_parts/nose_C.png"),
	preload ("res://images/face_parts/nose_D.png"),
]

var mouths : Array = [
	preload ("res://images/face_parts/mouth_A.png"),
	preload ("res://images/face_parts/mouth_B.png"),
	preload ("res://images/face_parts/mouth_C.png"),
	preload ("res://images/face_parts/mouth_D.png"),
]

var current_hair_front_id : int
var current_hair_back_id : int
var current_eye_id : int
var current_skin_id : int
var current_nose_id : int
var current_mouth_id : int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_hair_front_id = 0
	current_hair_back_id = 0
	current_eye_id = 0
	current_skin_id = 0
	current_nose_id = 0
	current_mouth_id = 0

	$VBoxContainer/PortraitContainer/FrontHairLayer/FrontHairTexture.texture = hair_fronts[current_hair_front_id]
	$VBoxContainer/PortraitContainer/BackHairLayer/BackHairTexture.texture = hair_backs[current_hair_back_id]
	$VBoxContainer/PortraitContainer/EyesLayer/EyesTexture.texture = eyes[current_eye_id]
	$VBoxContainer/PortraitContainer/SkinLayer/SkinTexture.texture = skins[current_skin_id]
	$VBoxContainer/PortraitContainer/NoseLayer/NoseTexture.texture = noses[current_nose_id]
	$VBoxContainer/PortraitContainer/MouthLayer/MouthTexture.texture = mouths[current_mouth_id]

	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_hair_button_pressed() -> void:
	current_hair_front_id = (current_hair_front_id + 1)%hair_fronts.size()
	$VBoxContainer/PortraitContainer/FrontHairLayer/FrontHairTexture.texture = hair_fronts[current_hair_front_id]

	current_hair_back_id = (current_hair_back_id + 1)%hair_backs.size()
	$VBoxContainer/PortraitContainer/BackHairLayer/BackHairTexture.texture = hair_backs[current_hair_back_id]


func _on_eyes_button_pressed() -> void:
	current_eye_id = (current_eye_id + 1)%eyes.size()
	$VBoxContainer/PortraitContainer/EyesLayer/EyesTexture.texture = eyes[current_eye_id]


func _on_nose_button_pressed() -> void:
	current_nose_id = (current_nose_id + 1)%noses.size()
	$VBoxContainer/PortraitContainer/NoseLayer/NoseTexture.texture = noses[current_nose_id]


func _on_mouth_button_pressed() -> void:
	current_mouth_id = (current_mouth_id + 1)%mouths.size()
	$VBoxContainer/PortraitContainer/MouthLayer/MouthTexture.texture = mouths[current_mouth_id]


func _on_skin_button_pressed() -> void:
	current_skin_id = (current_skin_id + 1)%skins.size()
	$VBoxContainer/PortraitContainer/SkinLayer/SkinTexture.texture = skins[current_skin_id]


func _on_generate_button_pressed() -> void:
	var rand_hair = randi()%hair_fronts.size()
	current_hair_front_id = rand_hair
	current_hair_back_id = rand_hair
	$VBoxContainer/PortraitContainer/FrontHairLayer/FrontHairTexture.texture = hair_fronts[current_hair_front_id]
	$VBoxContainer/PortraitContainer/BackHairLayer/BackHairTexture.texture = hair_backs[current_hair_back_id]

	current_eye_id = randi()%eyes.size()
	$VBoxContainer/PortraitContainer/EyesLayer/EyesTexture.texture = eyes[current_eye_id]

	current_skin_id = randi()%skins.size()
	$VBoxContainer/PortraitContainer/SkinLayer/SkinTexture.texture = skins[current_skin_id]

	current_nose_id = randi()%noses.size()
	$VBoxContainer/PortraitContainer/NoseLayer/NoseTexture.texture = noses[current_nose_id]

	current_mouth_id = randi()%mouths.size()
	$VBoxContainer/PortraitContainer/MouthLayer/MouthTexture.texture = mouths[current_mouth_id]
