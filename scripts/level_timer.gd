extends Timer

@export var start_time_in_seconds : int = 3
var time_in_seconds : int


func _ready():	
	start_counter()
	update_time_on_hud()


func _on_timeout():
	update_time_on_hud()
	decrement_second()
	if is_there_time():
		kill_player()
		start_counter()
		

func start_counter() -> void:
	time_in_seconds = start_time_in_seconds
	
	
func is_there_time() -> bool :
	return time_in_seconds < 1
	
	
func decrement_second() -> void:
	time_in_seconds -= 1
	
	
func kill_player() -> void:
	get_parent().get_node('Player').die()
	
	
func update_time_on_hud() -> void:
	var hud = get_parent().get_node("UILayer").get_node("Hud")
	hud.set_time_label(time_in_seconds)
	
