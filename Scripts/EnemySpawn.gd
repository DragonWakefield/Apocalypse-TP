extends Node2D


var e_scene = preload("res://scenes/En.tscn")
var e_speed = 20
var count = 0
var delay = 5
var spawn = 0
var x = 0
var y = 0


func _on_EnemyTimer_timeout():
	var enemy = e_scene.instance()
	randomize()
	add_child(enemy)
	enemy.add_to_group("bg")
	
	spawn = rand_range(1,4)
	if spawn == 1:
		x = -5
		y = rand_range(-165,185)
	elif spawn == 2:
		x = 600
		y = rand_range(-165, 185)
	elif spawn == 3:
		x = rand_range(-5, 600)
		y = -165
	elif spawn == 4:
		x = rand_range(-5, 600)
		y = 185
		
	enemy.position.x = x
	enemy.position.y = y
	$EnemyTimer.wait_time = max(1, $EnemyTimer.wait_time-0.01)
