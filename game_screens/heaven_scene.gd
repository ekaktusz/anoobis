extends Control

@onready var back_button = $BackButton
@onready var people = $People
@onready var heaven_value_label = $HeavenValueLabel2

# Y-axis values corresponding to the score range [0, 100]
var minY : float = 600
var maxY : float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	BackgroundMusicPlayer.play_heaven_music()
	heaven_value_label.text = str(GlobalGameData.heaven_score)
	$People.position.y = lerp(minY, maxY, GlobalGameData.heaven_score / 100.0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_button_pressed():
	var tinder_scene = preload("res://game_screens/tinder_scene.tscn").instantiate()
	SceneTransition.change_scene(tinder_scene)
	pass # Replace with function body.


func _on_back_button_mouse_entered():
	back_button.scale = Vector2(2.1, 2.1)


func _on_back_button_mouse_exited():
	back_button.scale = Vector2(2, 2)

