extends Area2D


func _on_body_entered(body):
	if body is Player:
		$Happy.play()
		get_parent().stop_song()
		$AnimatedSprite2D.play("end")


func _on_happy_finished():
	$AnimatedSprite2D.play("idle")
