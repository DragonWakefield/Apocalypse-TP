extends Control


func _ready():
	var score_show = get_node("/root/End/score")
	var score = get_node("/root/ScoreCounter").get_Score()
	score_show.text = str(score)
