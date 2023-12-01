class_name CharacterPortraitView extends AspectRatioContainer

class Hair:
	var hair_back : Resource
	var hair_front : Resource
	var color_number : int

	func _init(hair_back, hair_front, color_number):
		self.hair_back = hair_back
		self.hair_front = hair_front
		self.color_number = color_number

static var hair_A1_back = preload("res://assets/images/face_parts/hair_A1_back.png")
static var hair_A1_front = preload("res://assets/images/face_parts/hair_A1_front.png")

static var hair_A2_back = preload("res://assets/images/face_parts/hair_A2_back.png")
static var hair_A2_front = preload("res://assets/images/face_parts/hair_A2_front.png")

static var hair_A3_back = preload("res://assets/images/face_parts/hair_A3_back.png")
static var hair_A3_front = preload("res://assets/images/face_parts/hair_A3_front.png")

static var hair_A4_back = preload("res://assets/images/face_parts/hair_A4_back.png")
static var hair_A4_front = preload("res://assets/images/face_parts/hair_A4_front.png")

static var hair_B1_back = preload("res://assets/images/face_parts/hair_B1_back.png")
static var hair_B1_front = preload("res://assets/images/face_parts/hair_B1_front.png")

static var hair_B2_back = preload("res://assets/images/face_parts/hair_B2_back.png")
static var hair_B2_front = preload("res://assets/images/face_parts/hair_B2_front.png")

static var hair_B3_back = preload("res://assets/images/face_parts/hair_B3_back.png")
static var hair_B3_front = preload("res://assets/images/face_parts/hair_B3_front.png")

static var hair_C1_front = preload("res://assets/images/face_parts/hair_C1_front.png")
static var hair_C2_front = preload("res://assets/images/face_parts/hair_C2_front.png")
static var hair_C3_front = preload("res://assets/images/face_parts/hair_C3_front.png")
static var hair_C4_front = preload("res://assets/images/face_parts/hair_C4_front.png")

static var hair_D1_front = preload("res://assets/images/face_parts/hair_D1_front.png")
static var hair_D2_front = preload("res://assets/images/face_parts/hair_D2_front.png")
static var hair_D3_front = preload("res://assets/images/face_parts/hair_D3_front.png")
static var hair_D4_front = preload("res://assets/images/face_parts/hair_D4_front.png")


static var hair_E1_back = preload("res://assets/images/face_parts/hair_E1_back.png")
static var hair_E1_front = preload("res://assets/images/face_parts/hair_E1_front.png")

static var hair_E2_back = preload("res://assets/images/face_parts/hair_E2_back.png")
static var hair_E2_front = preload("res://assets/images/face_parts/hair_E2_front.png")

static var hair_E3_back = preload("res://assets/images/face_parts/hair_E3_back.png")
static var hair_E3_front = preload("res://assets/images/face_parts/hair_E3_front.png")

static var hair_E4_back = preload("res://assets/images/face_parts/hair_E4_back.png")
static var hair_E4_front = preload("res://assets/images/face_parts/hair_E4_front.png")

static var hair1 = Hair.new(hair_A1_back, hair_A1_front, 1)
static var hair2 = Hair.new(hair_A2_back, hair_A2_front, 2)
static var hair3 = Hair.new(hair_A3_back, hair_A3_front, 3)
static var hair4 = Hair.new(hair_A4_back, hair_A4_front, 4)

static var hair5 = Hair.new(hair_B1_back, hair_B1_front, 1)
static var hair6 = Hair.new(hair_B2_back, hair_B2_front, 2)
static var hair7 = Hair.new(hair_B3_back, hair_B3_front, 3)

static var hair8 = Hair.new(null, hair_C1_front, 1)
static var hair9 = Hair.new(null, hair_C2_front, 2)
static var hair10 = Hair.new(null, hair_C3_front, 3)
static var hair11 = Hair.new(null, hair_C4_front, 4)

static var hair12 = Hair.new(null, hair_D1_front, 1)
static var hair13 = Hair.new(null, hair_D2_front, 2)
static var hair14 = Hair.new(null, hair_D3_front, 3)
static var hair15 = Hair.new(null, hair_D4_front, 4)

static var hair16 = Hair.new(hair_E1_back, hair_E1_front, 1)
static var hair17 = Hair.new(hair_E2_back, hair_E2_front, 2)
static var hair18 = Hair.new(hair_E3_back, hair_E3_front, 3)
static var hair19 = Hair.new(hair_E4_back, hair_E4_front, 4)

static var hair20 = Hair.new(null, null, 1)


static var hairs = [hair1, hair2, hair3, hair4, hair5, hair6, hair7, hair8, hair9, hair10, hair11, hair12, hair13, hair14, hair15, hair16, hair17, hair18, hair19]

static var eyes = [
	preload("res://assets/images/face_parts/eyes_A1.png"),
	preload("res://assets/images/face_parts/eyes_A2.png"),
	preload("res://assets/images/face_parts/eyes_A3.png"),
	preload("res://assets/images/face_parts/eyes_A4.png"),
	preload("res://assets/images/face_parts/eyes_A5.png"),
	preload("res://assets/images/face_parts/eyes_B1.png"),
	preload("res://assets/images/face_parts/eyes_B2.png"),
	preload("res://assets/images/face_parts/eyes_B3.png"),
	preload("res://assets/images/face_parts/eyes_B4.png"),
	preload("res://assets/images/face_parts/eyes_B5.png"),
	preload("res://assets/images/face_parts/eyes_C1.png"),
	preload("res://assets/images/face_parts/eyes_C2.png"),
	preload("res://assets/images/face_parts/eyes_C3.png"),
	preload("res://assets/images/face_parts/eyes_C4.png"),
	preload("res://assets/images/face_parts/eyes_C5.png"),
	preload("res://assets/images/face_parts/eyes_D1.png"),
	preload("res://assets/images/face_parts/eyes_D2.png"),
	preload("res://assets/images/face_parts/eyes_D3.png"),
]

static var skins = [
	preload("res://assets/images/face_parts/skin_A1.png"),
	preload("res://assets/images/face_parts/skin_A2.png"),
	preload("res://assets/images/face_parts/skin_A3.png"),
	preload("res://assets/images/face_parts/skin_B1.png"),
	preload("res://assets/images/face_parts/skin_B2.png"),
	preload("res://assets/images/face_parts/skin_B3.png"),
	preload("res://assets/images/face_parts/skin_C1.png"),
	preload("res://assets/images/face_parts/skin_C2.png"),
	preload("res://assets/images/face_parts/skin_C3.png"),
	preload("res://assets/images/face_parts/skin_D1.png"),
	preload("res://assets/images/face_parts/skin_D2.png"),
	preload("res://assets/images/face_parts/skin_D3.png"),
	preload("res://assets/images/face_parts/skin_E1.png"),
	preload("res://assets/images/face_parts/skin_E2.png"),
	preload("res://assets/images/face_parts/skin_E3.png"),
	preload("res://assets/images/face_parts/skin_F1.png"),
	preload("res://assets/images/face_parts/skin_F2.png"),
	preload("res://assets/images/face_parts/skin_F3.png"),
]

static var noses = [
	preload("res://assets/images/face_parts/nose_A.png"),
	preload("res://assets/images/face_parts/nose_B.png"),
	preload("res://assets/images/face_parts/nose_C.png"),
	preload("res://assets/images/face_parts/nose_D.png"),
	preload("res://assets/images/face_parts/nose_E.png"),
	preload("res://assets/images/face_parts/nose_F.png"),
]

static var mouths = [
	preload("res://assets/images/face_parts/mouth_A.png"),
	preload("res://assets/images/face_parts/mouth_B.png"),
	preload("res://assets/images/face_parts/mouth_C.png"),
	preload("res://assets/images/face_parts/mouth_D.png"),
	preload("res://assets/images/face_parts/mouth_E.png"),
	preload("res://assets/images/face_parts/mouth_F.png"),
]

static var beards = [
	[
		preload("res://assets/images/face_parts/beard_A1.png"),
		preload("res://assets/images/face_parts/beard_A2.png"),
		preload("res://assets/images/face_parts/beard_A3.png"),
	],
	[
		preload("res://assets/images/face_parts/beard_B1.png"),
		preload("res://assets/images/face_parts/beard_B2.png"),
		preload("res://assets/images/face_parts/beard_B3.png"),
	],
	[
		preload("res://assets/images/face_parts/beard_C1.png"),
		preload("res://assets/images/face_parts/beard_C2.png"),
		preload("res://assets/images/face_parts/beard_C3.png"),
	],
]


var current_hair_id : int
var current_eye_id : int
var current_skin_id : int
var current_nose_id : int
var current_mouth_id : int
var current_beard_id : int

# Static constructor for loading assets only once
static func _static_init():
	pass


func _ready() -> void:
	randomize()
	_set_random_parts()

func _set_next_hair() -> void:
	current_hair_id = (current_hair_id + 1)%hairs.size()
	$FrontHairTexture.texture = hairs[current_hair_id].hair_front
	$BackHairTexture.texture = hairs[current_hair_id].hair_back


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


func _set_next_beard() -> void:
	current_beard_id = (current_beard_id + 1)%beards.size()
	var color_variant = hairs[current_hair_id].color_number
	if color_variant < beards[0].size():
		$BeardTexture.texture = beards[current_beard_id][color_variant]
	else:
		$BeardTexture.texture = null


func _set_random_parts() -> void:
	var rand_hair : int = randi()%hairs.size()

	var random_hair = hairs[rand_hair]
	$FrontHairTexture.texture = random_hair.hair_front
	$BackHairTexture.texture = random_hair.hair_back
	if(randi_range(1,4) > 3) and (random_hair.color_number < beards[0].size()):
		$BeardTexture.texture = beards[randi() % beards.size()][random_hair.color_number-1]
	else:
		$BeardTexture.texture = null

	current_eye_id = randi()%eyes.size()
	$EyesTexture.texture = eyes[current_eye_id]

	current_skin_id = randi()%skins.size()
	$SkinTexture.texture = skins[current_skin_id]

	current_nose_id = randi()%noses.size()
	$NoseTexture.texture = noses[current_nose_id]

	current_mouth_id = randi()%mouths.size()
	$MouthTexture.texture = mouths[current_mouth_id]
