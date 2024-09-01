extends Control

func _on_button_pressed():
	var next_stage = get_parent().get_parent().get_node("Finish").next_stage
	get_tree().change_scene_to_packed(next_stage)
