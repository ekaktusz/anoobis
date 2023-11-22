extends Node

var ranks = [
	"intern trainee",
	"junior intern",
	"medior intern",
	"senior intern",
	"senior intern specialist",
	"senior intern manager",
	"intern director",
	"chief operating intern",
	"chief executive intern",
	"junior god of the dead",
]

func get_rank(level : int) -> String:
	return ranks[level]
