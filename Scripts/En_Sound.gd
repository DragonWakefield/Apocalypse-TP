extends AudioStreamPlayer2D


func _ready():
	randomize()
	var choices = [0,3,5,7,11,14,18]
	play(choices[randi() % choices.size()])


func _on_Timer_timeout():
	stop()
