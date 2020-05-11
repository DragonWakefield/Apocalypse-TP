extends Node

export (PackedScene) var wall


func _ready():


	
#vert
	var w = wall.instance()
	w.add_to_group("bnd")
	add_child(w)
	randomize()
	w.position = (Vector2(rand_range(32, 192), rand_range(-125, 128)))
#hor
	var w2 = wall.instance()
	w2.add_to_group("bnd")
	add_child(w2)
	randomize()
	w2.position = (Vector2(rand_range(220, 370), rand_range(-125, 128)))
	w2.rotate(3.14/2)
	if (w2.position.x > 296 && w2.position.x < 340):
		while(w2.position.x > 296 && w2.position.x < 340):
			randomize()
			w2.position = (Vector2(rand_range(220, 370), rand_range(-125, 128)))
#vert
	var w3 = wall.instance()
	w3.add_to_group("bnd")
	add_child(w3)
	randomize()
	w3.position = (Vector2(rand_range(32, 192), rand_range(-125, 128)))
#hor
	var w4 = wall.instance()
	w4.add_to_group("bnd")
	add_child(w4)
	randomize()
	w4.position = (Vector2(rand_range(220, 370), rand_range(-125, 128)))
	w4.rotate(3.14/2)
	if (w4.position.x > 296 && w4.position.x < 340):
		while(w4.position.x > 296 && w4.position.x < 340):
			randomize()
			w4.position = (Vector2(rand_range(220, 370), rand_range(-125, 128)))
#vert
	var w5 = wall.instance()
	w5.add_to_group("bnd")
	add_child(w5)
	randomize()
	w5.position = (Vector2(rand_range(400, 550), rand_range(-125, 128)))
#hor
	var w6 = wall.instance()
	w6.add_to_group("bnd")
	add_child(w6)
	randomize()
	w6.position = (Vector2(rand_range(220, 370), rand_range(-125, 128)))
	w6.rotate(3.14/2)
	if (w6.position.x > 296 && w6.position.x < 340):
		while(w6.position.x > 296 && w6.position.x < 340):
			randomize()
			w6.position = (Vector2(rand_range(220, 370), rand_range(-125, 128)))
#vert
	var w7 = wall.instance()
	w7.add_to_group("bnd")
	add_child(w7)
	randomize()
	w7.position = (Vector2(rand_range(400, 550), rand_range(-125, 128)))

