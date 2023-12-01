extends Node

var in_heaven_characters: Array[CharacterData]
var in_hell_characters: Array[CharacterData]
var processed_dead_count: int
var level: int = 0
var hell_score : int = -50
var heaven_score : int = 50
var dead_counter : int = 0
var current_turn: int = 0

func reset_global_data():
	processed_dead_count = 0
	level = 0
	hell_score = -50
	heaven_score = 50
	dead_counter = 0
	current_turn = 0
