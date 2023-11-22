extends Node

const PortraitView = preload("res://portrait_view.tscn")

var characters: Array[CharacterData] = [
	CharacterData.new(
		"Tibi", # name
		[ # positive traits
			PropertyData.new(randi_range(0,20), "loves his mother", true),
			PropertyData.new(randi_range(0,20), "loves his mother", false),
			PropertyData.new(randi_range(0,20), "loves his mother", true)
		],
		[ # negative traits
			PropertyData.new(randi_range(-20,0), "hates his mother", true),
			PropertyData.new(randi_range(-20,0), "hates his mother", false),
			PropertyData.new(randi_range(-20,0), "hates his mother", true)
		],
		null
	),
	CharacterData.new(
		"Jozsef", # name
		[ # positive traits
			PropertyData.new(randi_range(0,20), "loves his mother", true),
			PropertyData.new(randi_range(0,20), "loves his mother", false),
			PropertyData.new(randi_range(0,20), "loves his mother", true)
		],
		[ # negative traits
			PropertyData.new(randi_range(-20,0), "hates his mother", true),
			PropertyData.new(randi_range(-20,0), "hates his mother", false),
			PropertyData.new(randi_range(-20,0), "hates his mother", true)
		],
		null
	),
	CharacterData.new(
		"Sanya", # name
		[ # positive traits
			PropertyData.new(randi_range(0,20), "loves his mother", true),
			PropertyData.new(randi_range(0,20), "loves his mother", false),
			PropertyData.new(randi_range(0,20), "loves his mother", true)
		],
		[ # negative traits
			PropertyData.new(randi_range(-20,0), "hates his mother", true),
			PropertyData.new(randi_range(-20,0), "hates his mother", false),
			PropertyData.new(randi_range(-20,0), "hates his mother", true)
		],
		null
	)
]

# currently no remove from database
func get_random_character() -> CharacterData:
	var rand_index: int = randi() % self.characters.size()
	if rand_index == self.characters.size():
		return null

	var random_character = self.characters[rand_index]
	random_character.portrait_view = PortraitView.instantiate()

	return random_character
