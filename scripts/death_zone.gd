extends Area2D


func _on_body_entered(body):
	if body is Player:
		body.back_to_start_position()
