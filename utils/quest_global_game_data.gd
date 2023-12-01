extends Node

var next_hell_quest_index : int = 0
var accepted_hell_quest_index : int = -1
var heaven_score : int = 0


# hell  lvl0
var sent_to_hell_counter : int = 0
# hell lvl1
var soul_sent_where_it_doesnt_belong : bool = false
# hell lvl2
var balanced_sent_to_hell : bool = false
# hell lvl3
var all_negative_soul_in_heaven : bool = true

var hell_score : int = 0
var next_heaven_quest_index : int = 0
var accepted_heaven_quest_index : int = -1

# heaven  lvl0
var sent_to_heaven_counter : int = 0
# heaven lvl1
var people_sent_to_hell_and_heaven_balance : int = 0
# heaven lvl2
var people_sent_to_heaven_with_8_plus_score : int = 0
# heaven lvl3
var all_souls_sent_to_heaven_in_round : bool = true
