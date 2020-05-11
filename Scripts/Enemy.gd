extends KinematicBody2D

var speed = 16
var velocity = Vector2()
onready var player = get_node("/root/World/player") # fix this path, get the bg to walk 
onready var p_score = get_node("/root/World/Score_Counter").get_Score()

	
func _physics_process(delta):


	var direction = (player.position - position).normalized()
	if direction.x == 0 && direction.y == -1:
		$AnimationPlayer.play("up")
	elif direction.x == 0 && direction.y == 1:
		$AnimationPlayer.play("down")
	elif (direction.x > 0 && direction.y == 0) || (direction.x > 0 && direction.y > 0) || (direction.x > 0 && direction.y < 0):
		$AnimationPlayer.play("right")
		$Sprite.flip_h = false
	elif (direction.x < 0 && direction.y == 0) || (direction.x < 0 && direction.y > 0) || (direction.x < 0 && direction.y < 0):
		$AnimationPlayer.play("right") # create a left walk
		$Sprite.flip_h = true

	var motion = direction * speed * delta
	position += motion
#
	var collide = move_and_collide(velocity * delta)
	if collide:
		velocity = Vector2.ZERO
		if collide.collider.has_method("destroy"):
			collide.collider.destroy()
	

func more_speed():
	if speed < 72:
		speed += 8
