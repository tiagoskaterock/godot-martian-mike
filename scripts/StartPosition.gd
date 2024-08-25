extends Marker2D

func _ready():	
	position = get_parent().get_node("Player").position
	
