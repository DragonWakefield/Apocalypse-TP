extends Node


var score = 0

func _ready():
	
	score = 0
func tp_collected():
	score += 1
	var LabelNode = get_node("/root/World/Score_Counter/UI/Base/TP_Count")
	LabelNode.text = str(score)
	if score % 8 ==0:
		get_tree().call_group("bg", "more_speed")
	
func get_Score():
	return score
