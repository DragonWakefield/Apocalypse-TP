extends Node


export var delay = 3
export (PackedScene) var tp


var timer = 0


func _ready():
	print("Hello world")
	set_process(true)

func _process(delta):

	timer += delta
	if (timer >= delay):
		timer = 0
		if get_tree().get_nodes_in_group("tps").size() < 10:
			create_tp()
		
func create_tp():
	
	var t = tp.instance()
	t.add_to_group("tps")
	add_child(t)
	randomize()
	t.position = (Vector2(rand_range(16, 584), rand_range(-152, 168)))
