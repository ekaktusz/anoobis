extends Node

const PortraitView = preload("res://portrait_view.tscn")
const CharacterData = preload("res://data_classes/character_data.gd")

var characters: Array[CharacterData] = [
	CharacterData.new(
		"Anoobis", # name
		[ # positive traits
			PropertyData.new(3, "loves his mother", true),
			PropertyData.new(3, "loves his mother", false),
			PropertyData.new(3, "loves his mother", true)
		], 
		[ # negative traits
			PropertyData.new(-3, "hates his mother", true),
			PropertyData.new(-3, "hates his mother", false),
			PropertyData.new(-3, "hates his mother", true)
		], 
		PortraitView.instantiate() # will be random
	),
	CharacterData.new(
		"Anoobis", # name
		[ # positive traits
			PropertyData.new(3, "loves his mother", true),
			PropertyData.new(3, "loves his mother", false),
			PropertyData.new(3, "loves his mother", true)
		], 
		[ # negative traits
			PropertyData.new(-3, "hates his mother", true),
			PropertyData.new(-3, "hates his mother", false),
			PropertyData.new(-3, "hates his mother", true)
		], 
		PortraitView.instantiate() # will be random
	),
	CharacterData.new(
		"Anoobis", # name
		[ # positive traits
			PropertyData.new(3, "loves his mother", true),
			PropertyData.new(3, "loves his mother", false),
			PropertyData.new(3, "loves his mother", true)
		], 
		[ # negative traits
			PropertyData.new(-3, "hates his mother", true),
			PropertyData.new(-3, "hates his mother", false),
			PropertyData.new(-3, "hates his mother", true)
		], 
		PortraitView.instantiate() # will be random
	)
]

# removes as well!
func get_random_character() -> CharacterData:
	var rand_index: int = randi() % self.characters.size()
	print(self.characters[rand_index].name)
	return self.characters[rand_index]
