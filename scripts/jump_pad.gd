extends Area2D

@export var extra_jump_force : float = 1.3 

func _on_body_entered(body):
	if body is Player:
		$AnimatedSprite2D.play("jump")
		body.jump(extra_jump_force)
