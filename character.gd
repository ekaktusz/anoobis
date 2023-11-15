extends AspectRatioContainer

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


func _ready() -> void:
	randomize()
	_set_random_parts()


func _set_next_hair() -> void:
	current_hair_front_id = (current_hair_front_id + 1)%hair_fronts.size()
	$FrontHairTexture.texture = hair_fronts[current_hair_front_id]

	current_hair_back_id = (current_hair_back_id + 1)%hair_backs.size()
	$BackHairTexture.texture = hair_backs[current_hair_back_id]


func _set_next_eye() -> void:
	current_eye_id = (current_eye_id + 1)%eyes.size()
	$EyesTexture.texture = eyes[current_eye_id]


func _set_next_nose() -> void:
	current_nose_id = (current_nose_id + 1)%noses.size()
	$NoseTexture.texture = noses[current_nose_id]


func _set_next_mouth() -> void:
	current_mouth_id = (current_mouth_id + 1)%mouths.size()
	$MouthTexture.texture = mouths[current_mouth_id]


func _set_next_skin() -> void:
	current_skin_id = (current_skin_id + 1)%skins.size()
	$SkinTexture.texture = skins[current_skin_id]


func _set_random_parts() -> void:
	var rand_hair = randi()%hair_fronts.size()
	current_hair_front_id = rand_hair
	current_hair_back_id = rand_hair
	$FrontHairTexture.texture = hair_fronts[current_hair_front_id]
	$BackHairTexture.texture = hair_backs[current_hair_back_id]

	current_eye_id = randi()%eyes.size()
	$EyesTexture.texture = eyes[current_eye_id]

	current_skin_id = randi()%skins.size()
	$SkinTexture.texture = skins[current_skin_id]

	current_nose_id = randi()%noses.size()
	$NoseTexture.texture = noses[current_nose_id]

	current_mouth_id = randi()%mouths.size()
	$MouthTexture.texture = mouths[current_mouth_id]
