extends Area2D


@export var next_stage : PackedScene


func _on_body_entered(body):
	if body is Player:
		body.stop()
		$Happy.play()
		get_parent().stop_song()
		$AnimatedSprite2D.play("end")


func _on_happy_finished():
	$AnimatedSprite2D.play("idle")
	next_scene()


func next_scene():
	get_tree().change_scene_to_packed(next_stage)
	print(next_stage)
