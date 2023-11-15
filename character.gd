extends AspectRatioContainer


class Hair:
	var hair_back : Resource
	var hair_front : Resource

var eyes : Array[Resource]
var skins : Array[Resource]
var noses : Array[Resource]
var mouths : Array[Resource]
var hairs : Array[Hair]

var current_hair_id : int
var current_eye_id : int
var current_skin_id : int
var current_nose_id : int
var current_mouth_id : int

func _ready() -> void:
	var face_parts_folder = "res://images/face_parts/"
	var dir = DirAccess.open(face_parts_folder)

	dir.list_dir_begin()
	var file_name = dir.get_next()
	while (file_name != ""):
		if file_name.ends_with("png"):
			if file_name.begins_with("eyes"):
				eyes.push_back(load(face_parts_folder+file_name))
			elif file_name.begins_with("mouth"):
				mouths.push_back(load(face_parts_folder+file_name))
			elif file_name.begins_with("nose"):
				noses.push_back(load(face_parts_folder+file_name))
			elif file_name.begins_with("skin"):
				skins.push_back(load(face_parts_folder+file_name))
			elif file_name.begins_with("hair"):
				if file_name.ends_with("_front.png"):
					var hair = Hair.new()
					hair.hair_front = load(face_parts_folder+file_name)
					var filename_parts = file_name.split('_')
					var back_variant = filename_parts[0] + "_" + filename_parts[1] + "_back.png"
					print(back_variant)
					if dir.file_exists(back_variant):
						hair.hair_back =  load(face_parts_folder+back_variant)
					else:
						hair.hair_back = null

					hairs.push_back(hair)
				elif file_name.ends_with("_end.png"):
					pass
		file_name = dir.get_next()

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


func _set_random_parts() -> void:
	var rand_hair = randi()%hairs.size()

	$FrontHairTexture.texture = hairs[rand_hair].hair_front
	$BackHairTexture.texture = hairs[rand_hair].hair_back

	current_eye_id = randi()%eyes.size()
	$EyesTexture.texture = eyes[current_eye_id]

	current_skin_id = randi()%skins.size()
	$SkinTexture.texture = skins[current_skin_id]

	current_nose_id = randi()%noses.size()
	$NoseTexture.texture = noses[current_nose_id]

	current_mouth_id = randi()%mouths.size()
	$MouthTexture.texture = mouths[current_mouth_id]
