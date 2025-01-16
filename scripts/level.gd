extends Node2D

var timer_node = null


func _process(delta):
	if Input.is_action_just_pressed("select"):
		print('Quit')
		get_tree().quit()
	if Input.is_action_just_pressed("start"):
		print('Reload')
		get_tree().reload_current_scene()
	
	$ParallaxBackground/BackCloudsLayer/Sprite2D.position.x -= 10 * delta
		
func stop_song() -> void:
	$BGSong.stop()
	
