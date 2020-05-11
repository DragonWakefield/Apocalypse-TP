extends Node


func _ready():
	var node1 = get_node("/root/World/StaticBody2D/CollisionShape2D")
	var node2 = get_node("/root/World/StaticBody2D/CollisionShape2D2")
	var node3 = get_node("/root/World/StaticBody2D/CollisionShape2D3")
	var node4 = get_node("/root/World/StaticBody2D/CollisionShape2D4")
	var node5 = get_node("/root/World/StaticBody2D")
	node1.add_to_group("bnd")
	node2.add_to_group("bnd")
	node3.add_to_group("bnd")
	node4.add_to_group("bnd")
	node5.add_to_group("bnd")
	
onready var pVec = Vector2.ZERO
	

func playerPos(lpx, lpy):
	var pVec = Vector2.ZERO
	pVec.x = lpx
	pVec.y = lpy
	
func get_player():
	return pVec
	


	
