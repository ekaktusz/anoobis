extends AudioStreamPlayer

var heaven_music = preload("res://assets/music/HEAVEN.wav")
var anubis_music = preload("res://assets/music/ANUBIS.wav")
var hell_music = preload("res://assets/music/HELL.wav")

# Called when the node enters the scene tree for the first time.
func _ready():
	print("wtf")
	#self.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func play_heaven_music():
	self.playing = false
	self.stream = heaven_music
	self.play()

func play_hell_music():
	self.playing = false
	self.stream = hell_music
	self.play()
	
func play_anubis_music():
	self.playing = false
	self.stream = anubis_music
	self.play(5)
