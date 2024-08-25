extends Node


func _ready():
	$Area2D/AnimatedSprite2D.play_backwards()


func _on_area_2d_body_entered(body):
	if body is Player:
		body.die()
