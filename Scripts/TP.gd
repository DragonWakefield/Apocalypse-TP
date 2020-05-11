extends Area2D



func _on_TP_body_shape_entered(body_id, body, body_shape, area_shape):
	if !body.is_in_group("bnd"):
		if body.is_in_group("bg"):
			queue_free()
		else:
			var player_score = get_node("/root/ScoreCounter")
			player_score.tp_collected()
			queue_free()
	else: 
		if self.get_position().x < 144:
			self.translate(Vector2(10,0))
		else:
			self.translate(Vector2(-10,0))
		
		
