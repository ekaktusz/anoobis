class_name PortraitView extends AspectRatioContainer

static var FACE_PARTS_PATH : String = "res://assets/images/face_parts/"

class Hair:
	var hair_back : Resource
	var hair_front : Resource
	var color_number : int

static var eyes : Array[Resource]
static var skins : Array[Resource]
static var noses : Array[Resource]
static var mouths : Array[Resource]
static var hairs : Array[Hair]

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
	load_assets()

static func load_assets() -> void:
	var dir := DirAccess.open(FACE_PARTS_PATH)

	dir.list_dir_begin()
	var file_name : String = dir.get_next()
	while (file_name != ""):
		if file_name.ends_with("png"):
			if file_name.begins_with("eyes"):
				eyes.push_back(load(FACE_PARTS_PATH+file_name))
			elif file_name.begins_with("mouth"):
				mouths.push_back(load(FACE_PARTS_PATH+file_name))
			elif file_name.begins_with("nose"):
				noses.push_back(load(FACE_PARTS_PATH+file_name))
			elif file_name.begins_with("skin"):
				skins.push_back(load(FACE_PARTS_PATH+file_name))
			elif (file_name.begins_with("hair") and file_name.ends_with("_front.png")):
				hairs.push_back(get_hair_from_asset(dir, file_name))

		file_name = dir.get_next()

	# Add bold hair
	hairs.append(Hair.new())


static func get_hair_from_asset(dir : DirAccess, file_name : String) -> Hair:
	var hair := Hair.new()
	var filename_parts := file_name.split('_')
	var back_variant : String = filename_parts[0] + '_' + \
								filename_parts[1] + '_back.png'

	hair.hair_front = load(FACE_PARTS_PATH+file_name)

	if dir.file_exists(back_variant):
		hair.hair_back =  load(FACE_PARTS_PATH+back_variant)
	else:
		hair.hair_back = null

	hair.color_number = int(filename_parts[1][1])-1
	return hair

func _ready() -> void:
	load_assets()
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
		$BeardTexture.texture = beards[randi() % beards.size()][random_hair.color_number]
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
