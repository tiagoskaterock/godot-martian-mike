extends Area2D


@export var next_stage : PackedScene


func _on_body_entered(body):
	if body is Player:
		get_parent().get_node('LevelTimer').stop()
		body.stop()
		$Happy.play()
		get_parent().stop_song()
		$AnimatedSprite2D.play("end")
		show_win_screen()


func _on_happy_finished() -> void:
	$AnimatedSprite2D.play("idle")


func next_scene() -> void:
	get_tree().change_scene_to_packed(next_stage)
	
	
func show_win_screen() -> void:
	get_parent().get_node("UILayer").show_win_screen()
