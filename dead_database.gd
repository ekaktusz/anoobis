extends Node

var passedDead = []

var deadPool = [
	DeadData.new(
		"Ashur", 
		-3,
		[
			"loves his mother",
			"doesn't have a slave"
		],
		[
			"a bloody worm",
			"killed his friend's hamster"
		],
		"res://images/characters/ashur.png",
	),
	DeadData.new(
		"Cleopatra", 
		4,
		[
			"bathes in milk",
			"she is the pharaoh",
			"loves kitten"
		],
		[
			"she is the paharaoh",
			"lover of a Roman",
			"that's probably a wig"
		],
		"res://images/characters/cleopartra.jpg",
	),
	DeadData.new(
		"Nefertiti", 
		-1,
		[
			"beautiful",
			"she is a queen"
		],
		[
			"does not like kitten",
			"disappeared"
		],
		"res://images/characters/nefertiti.jpg",
	)
]

var currentDead: int = 0



