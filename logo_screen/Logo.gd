extends VideoStreamPlayer


func _ready():
	play()
	paused = true

func _on_timer_timeout() -> void:
	paused = false
