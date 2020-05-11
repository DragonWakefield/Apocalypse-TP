extends KinematicBody2D


# Godot uses "tabing" instead of brackets. Python > java
# up is negative in the 2D grid
# Called when the node enters the scene tree for the first time.
var velocity = Vector2.ZERO
const MAX_SPEED = 100
const ACCELERATE = 500
const FRICTION = 500

#var score = 0


var last_pos = 1 # Global Var
var known_pos = Vector2.ZERO
onready var kp = get_node("/root/Global")



func _physics_process(delta): # runs every single physics step per tick
	# delta = time that the last frame took (usually 1/60th)

	var input_vector  = Vector2.ZERO
	var in_left = 0
	var in_right = 0
	var in_down = 0
	var in_up = 0
	
	if Input.is_key_pressed(KEY_A):
		in_left = 1
	if Input.is_key_pressed(KEY_D):
		in_right = 1
	if Input.is_key_pressed(KEY_S):
		in_down = 1
	if Input.is_key_pressed(KEY_W):
		in_up = 1
	if Input.is_key_pressed(KEY_UP):
		in_up = 1
	if Input.is_key_pressed(KEY_DOWN):
		in_down = 1
	if Input.is_key_pressed(KEY_LEFT):
		in_left = 1
	if Input.is_key_pressed(KEY_RIGHT):
		in_right = 1
	
	
	input_vector.x = in_right - in_left
	input_vector.y = in_down - in_up
	input_vector = input_vector.normalized()
	# input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	# input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	
	if (input_vector.x > 0 && input_vector.y == 0) || (input_vector.x > 0 && input_vector.y > 0) || (input_vector.x > 0 && input_vector.y < 0):
		$AnimationPlayer.play("rwalk")
		$Sprite.flip_h = false
		last_pos = 1

	elif (input_vector.x < 0 && input_vector.y == 0) || (input_vector.x < 0 && input_vector.y > 0) || (input_vector.x < 0 && input_vector.y < 0):
		$AnimationPlayer.play("rwalk") # create a left walk
		$Sprite.flip_h = true
		last_pos = 2
	elif input_vector.x == 0 && input_vector.y > 0:
		$AnimationPlayer.play("down_walk")
		last_pos = 3
	elif input_vector.x == 0 && input_vector.y < 0:
		$AnimationPlayer.play("upwalk")
		last_pos = 4
	
	else:
		if last_pos == 1:
			$AnimationPlayer.play("idle")
		elif last_pos == 2:
			$AnimationPlayer.play("idle")
		elif last_pos == 3:
			$AnimationPlayer.play("down_idle")
		elif last_pos == 4:
			$AnimationPlayer.play("up_idle")
		
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATE*delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION *delta)

	velocity = move_and_slide(velocity)  # velocity is relative to framerate
	
	known_pos = self.position
	
	kp.playerPos(known_pos.x, known_pos.y)
	
		
	
func destroy():
	queue_free()
	get_tree().change_scene("res://scenes/End.tscn")


