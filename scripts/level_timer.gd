extends Timer

@export var start_time_in_seconds : int = 3
var time_in_seconds : int


func _ready():
	start_counter()


func _on_timeout():
	print(time_in_seconds)
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
	
	
