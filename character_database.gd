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
		PortraitView.instantiate() # will be random
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
		PortraitView.instantiate() # will be random
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
		PortraitView.instantiate() # will be random
	)
]

var in_heaven_characters: Array[CharacterData]
var in_hell_characters: Array[CharacterData]

# currently no remove from database
func get_random_character() -> CharacterData:
	if self.characters.size() == 0:
		return null
		
	var rand_index: int = randi() % self.characters.size()
	
	return self.characters[rand_index]
