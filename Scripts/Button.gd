extends Button

func _ready():
	set_text("Play Again?")
	set_text_align(1)



func _on_Button_pressed():
	get_node("/root/ScoreCounter").score = 0
	get_tree().change_scene("res://scenes/Main.tscn")
