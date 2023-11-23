extends Node

var negative_properties_normal: Array[PropertyData] = [
	PropertyData.new(-1, "Used cheat codes in video games", false),
	PropertyData.new(-1, "Did not wash their teeth after a fish-dinner", false),
	PropertyData.new(-1, "Shared a controversial meme", false),
	PropertyData.new(-1, "Peed in the Nile", false),
	PropertyData.new(-1, "Shared a boomer meme", false),
	PropertyData.new(-1, "Only played with AAA games", false),
	PropertyData.new(-1, "Lied about his favourite film to make themselves cooler", false),
	PropertyData.new(-2, "Threw the trash into their neighbor's bin", false),
	PropertyData.new(-2, "Ate all of the fancy nuts out of the trail mix, leaving none for others", false),
	PropertyData.new(-2, "Stole a mushroom", false),
	PropertyData.new(-2, "Picked up salary raise for their colleague's work", false),
	PropertyData.new(-2, "Bragged about doing yoga every day", false),
	PropertyData.new(-2, "Torrented indie games", false),
	PropertyData.new(-3, "Lied about their drinking habits on a date", false),
	PropertyData.new(-3, "Threw trash in the Nile", false),
	PropertyData.new(-3, "Urged children to lie to their parents", false),
	PropertyData.new(-3, "Owned several crocodiles, never cleaned their tanks", false),
	PropertyData.new(-3, "Ate the birthday cake of Susan, the librarian", false),
	PropertyData.new(-3, "Forgot to water the crops", false),
	PropertyData.new(-4, "Didn't respect queues", false),
	PropertyData.new(-4, "Wrote a sarcastic poem about death & jackals", false),
	PropertyData.new(-4, "Threw out the last bite from every meal they had", false),
	PropertyData.new(-4, "Generated more work with their questions", false),
	PropertyData.new(-4, "Kicked a dog", false),
	PropertyData.new(-4, "Laughed at the problem of their daughter", false),
	PropertyData.new(-5, "Cheated at Monopoly", false),
	PropertyData.new(-5, "Let their pet snake stretch its legs out on the streets of Luxor", false),
	PropertyData.new(-5, "Believed the earth is flat", false),
	PropertyData.new(-5, "Hunted crocs in the Nile", false),
	PropertyData.new(-5, "Killed a dung beetle", false),
	PropertyData.new(-5, "Did not rate the game 5 stars", false),
	PropertyData.new(-5, "Took a selfie with Napoleon", false),
	PropertyData.new(-5, "Was OK with slavery", false),
	PropertyData.new(-6, "Gave children raisins on Halloween", false),
	PropertyData.new(-6, "Stole Cleopatra's underwear", false),
	PropertyData.new(-6, "Sprayed graffiti inside the pyramid", false),
	PropertyData.new(-6, "Stole Tutankhamen's underwear", false),
	PropertyData.new(-6, "Pissed on the graves of slaves", false),
	PropertyData.new(-6, "Had racist friends", false),
	PropertyData.new(-6, "Named their kids after their favorite TV show character", false),
	PropertyData.new(-7, "Took a dump inside the pharaoh's pyramid", false),
	PropertyData.new(-7, "Got drunk. Puked in a canopy jar", false),
	PropertyData.new(-7, "Robbed pharaoh graves", false),
	PropertyData.new(-7, "Sold Ramses some canned piss", false),
	PropertyData.new(-7, "Did not mummify their mommy", false),
	PropertyData.new(-7, "Betrayed their friend at the time of need", false),
	PropertyData.new(-8, "Lied to a date that they are the pharaoh", false),
	PropertyData.new(-8, "Disposed a body in the Nile", false),
	PropertyData.new(-8, "Used child labour", false),
	PropertyData.new(-8, "Murdered a priest and blamed it on their pet rock", false),
	PropertyData.new(-8, "Killed an elephant for sport", false),
	PropertyData.new(-8, "Sold ground up mummies as drugs", false),
	PropertyData.new(-8, "Cheated on their significant other", false),
	PropertyData.new(-9, "Farted and blamed it on their spouse", false),
	PropertyData.new(-9, "Fed their spouse to the crocodiles", false),
	PropertyData.new(-9, "Had slaves", false),
	PropertyData.new(-9, "Was married to their sibling, even though they were not ascendants of the gods", false),
	PropertyData.new(-9, "Told people the eclipse is the start of the Apocalypse", false),
	PropertyData.new(-9, "Had an intimate relationship with their goat", false),
	PropertyData.new(-9, "Poisoned the only well in the city", false),
	PropertyData.new(-10, "Helped the Greek invaders to conquer Egypt", false),
	PropertyData.new(-10, "Burnt down the Great Library of Alexandria", false),
	PropertyData.new(-10, "Told to their kids they are going to Memphis to buy cigarettes never to return", false),
	PropertyData.new(-10, "Turned the water of the Nile red with the blood of innocents", false),
	PropertyData.new(-10, "Used pre-existing assets at game jams", false),
	PropertyData.new(-10, "Killed a cat", false),
	PropertyData.new(-10, "Released a swarm of locusts to Cairo", false),
]

var positive_properties_normal: Array[PropertyData] = [	
	PropertyData.new(1, "Fed their pet every day", false),
	PropertyData.new(1, "Knitted a sweater for their brother Kevin", false),
	PropertyData.new(1, "Brought snacks for board game night", false),
	PropertyData.new(1, "Worked at the temple of Osiris", false),
	PropertyData.new(1, "Shared a funny meme", false),
	PropertyData.new(1, "Helped blind strangers cross the road", false),
	PropertyData.new(1, "Bought their child video games", false),
	PropertyData.new(2, "Did not spoil the ending of Titanic", false),
	PropertyData.new(2, "Did the dishes for the whole family", false),
	PropertyData.new(2, "Can make tasty muffins", false),
	PropertyData.new(2, "Helped their neighbor's kid, Greg build a pyramid out of sand", false),
	PropertyData.new(2, "Did yoga every day", false),
	PropertyData.new(2, "Was a decent fella", false),
	PropertyData.new(3, "Made a snowman out of sand with the village orphans", false),
	PropertyData.new(3, "Wrote a star-chart", false),
	PropertyData.new(3, "Ate broccoli without bragging about it", false),
	PropertyData.new(3, "Gave Cleopatra nose massages", false),
	PropertyData.new(3, "Baked a birthday cake for their friend Billy", false),
	PropertyData.new(3, "Went to therapy and learned about themself", false),
	PropertyData.new(3, "Knew there is more to life than work", false),
	PropertyData.new(4, "Washed their teeth twice every week", false),
	PropertyData.new(4, "Won employee of the month for six consecutive years", false),
	PropertyData.new(4, "Did the laundry for their roommate", false),
	PropertyData.new(4, "Was a great parent", false),
	PropertyData.new(4, "Let their friend Becca win in Mario Kart", false),
	PropertyData.new(4, "Had a jackal t-shirt", false),
	PropertyData.new(4, "Helped Cleopatra film makeup tutorial videos", false),
	PropertyData.new(4, "Didn't show up in the office when felt sick", false),
	PropertyData.new(5, "Cleaned the toilet in their shared flat", false),
	PropertyData.new(5, "Helped their neighbor, Maurice replant crops after a big flood", false),
	PropertyData.new(5, "Was well respected in their community", false),
	PropertyData.new(5, "Didn't let their friendships die", false),
	PropertyData.new(5, "Was kind to their most annoying colleague as well", false),
	PropertyData.new(5, "Supported their child to be themselves", false),
	PropertyData.new(6, "Loved their children", false),
	PropertyData.new(6, "Visited their mom at their retirement home every week", false),
	PropertyData.new(6, "Scored the winner for their national team", false),
	PropertyData.new(6, "Was driven by principles", false),
	PropertyData.new(6, "Acted in good faith towards others", false),
	PropertyData.new(6, "Was brave enough to chase their dreams", false),
	PropertyData.new(7, "Walked 30 miles to bring clean water to the community", false),
	PropertyData.new(7, "Built a migration route for frogs", false),
	PropertyData.new(7, "Built a public toilet", false),
	PropertyData.new(7, "Held a cookie sale for the lepers", false),
	PropertyData.new(7, "Scribed down the famous broccoli and cheese soup recipe of Ramses II", false),
	PropertyData.new(7, "Respected intellectual property rights", false),
	PropertyData.new(8, "Gave away free scrolls", false),
	PropertyData.new(8, "Was very good at listening to others", false),
	PropertyData.new(8, "Helped out at a homeless shelter", false),
	PropertyData.new(8, "Donated their kidney", false),
	PropertyData.new(8, "Raised their sister's kids when she left", false),
	PropertyData.new(9, "Organized a union in the papyrus manufactory", false),
	PropertyData.new(9, "Freed all of their slaves", false),
	PropertyData.new(9, "Built a public library", false),
	PropertyData.new(9, "Built their pyramid without forced labor", false),
	PropertyData.new(9, "Never used pre-made assets in game jams", false),
	PropertyData.new(10, "Spent their whole life praising Ra", false),
	PropertyData.new(10, "Was unable to tell lies", false),
	PropertyData.new(10, "Inventor of the hieroglyphs", false),
	PropertyData.new(10, "Cured the plague", false),
	PropertyData.new(10, "Abolished slavery", false)
]

var negative_properties_secret: Array[PropertyData] = [
	PropertyData.new(-1, "Had intimate relations with the Sphinx", true),
	PropertyData.new(-1, "Called their girlfriend's period the 'Red Sea'", true),
	PropertyData.new(-3, "Was actually three kids in a trenchcoat", true),
	PropertyData.new(-4, "Was quite an infamous graffiti artist", true),
	PropertyData.new(-6, "Was part of an organized crime family", true),
	PropertyData.new(-7, "Was a vampire", true),
]
var positive_properties_secret: Array[PropertyData] = [
	PropertyData.new(1, "Their Secret Osiris gifts were always on point", true),
	PropertyData.new(2, "Never bragged about his great-uncle who invented the wheel", true),
	PropertyData.new(4, "Had a tattoo on their waist saying 'Anubis rulez'", true),
	PropertyData.new(6, "Wrote the original script of the Lion King", true),
	PropertyData.new(9, "They were Batman", true)
]
var firstnames = ["Ashur", "Tarmek", "Shumak", "Abasi", "Abubakar", "Akiiki", "Amenhotep", "Ba", "Baahir", "Baal",
				  "Bab", "Babita", "Badi", "Bebti", "Bomani", "Bastet", "Chatuluka", "Chigaru", "Chione", "Dalila",
				  "Dakarai", "Dendera", "Donkor", "Ebo", "Echidna", "Edjo", "Fenuku", "Femi", "Eshe", "Hanbal",
				  "Hapi", "Hapu", "Hathor", "Hatshepsut", "Hu", "Issa", "Jafari", "Jamila", "Kamilah", "Kakra",
				  "Kafele", "Kamuzu", "Kanika", "Kek", "Kissa", "Lapis", "Lateef", "Layla", "Lotus", "Luzige",
				  "Lisimba", "Maat", "Madu", "Maibe", "Mafuane", "Menkaura", "Moshe", "Msamaki", "Mukamutara",
				  "Naeem", "Nassor", "Nathifa", "Neema", "Niu", "Niut", "Nkuku", "Nun", "Nuru", "Oba", "Olabisi",
				  "Omorose", "Onuris", "Osahar", "Paki", "Ptolemy", "Pili", "Radames", "Rashida", "Runihura", "Sabah",
				  "Sabola", "Sagira", "Sanura", "Sebak", "Sefu", "Selma", "Sekhet", "Shukura", "Siti", "Sutekh",
				  "Tabia", "Tahirah", "Tau", "Tarik", "Thabit", "Thutmose", "Uadjit", "Ufa", "Ur", "Urbi", "Usi",
				  "Ur Atum", "Wamukota", "Walidah", "Yafeu", "Zahra", "Zahur", "Zalika", "Zaid"
				]

var lastnames = ["the Unworthy", "the Worst", "the Meh", "the Neutral", "the Underachiever", "the Robust",
					  "the Coward", "the Keg", "the Vulture", "the Radiant", "the Ambitious", "the Valiant",
					  "the Bright", "the Dull", "the Bland", "the Forgotten", "the Hardcore", "the Rigid",
					  "the Fierce", "the Tenacious", "the Amiable", "the Fearless", "the Real", "the Vivacious",
					  "the Flexible", "the Shrewd", "the Cunning", "the Brave", "the Two-Faced", "the Relentless",
					  "the Reckless", "the Lone Wolf", "the Great", "the Awesome", "the Tall", "the Fearsome",
					  "the Shy", "the Handsome", "the Short", "the Unlikely", "the Wholesome", "the Destined One",
					  "the Unfortunate", "the Lucky", "the Amateur", "the Inappropriate", "the Cringe", "the Awkward",
					  "the Morbid"
					]

var characters: Array[CharacterData] = get_characters(10)

func get_characters(number_of_characters: int):
	var characters :Array[CharacterData] = []
	while characters.size() < number_of_characters:
		characters.append((CharacterData.new(
		get_random_fullname(),
		get_random_properties(positive_properties_normal,3),
		get_random_properties(negative_properties_normal,3), 
		null
		)))
	return characters
	
func get_random_properties(properties_array: Array[PropertyData], number_of_properties)-> Array[PropertyData]:
	var result_array : Array[PropertyData] = []
	while result_array.size() < number_of_properties:
		var random_element = properties_array.pick_random();
		if (result_array.find(random_element) == -1):
			result_array.append(random_element)
	return result_array
	
func get_random_fullname() -> String:
	return firstnames.pick_random() + lastnames.pick_random()
	
func get_random_character() -> CharacterData:
	var rand_index: int = randi() % self.characters.size()
	if rand_index == self.characters.size():
		return null

	var random_character = self.characters[rand_index]
	return random_character
